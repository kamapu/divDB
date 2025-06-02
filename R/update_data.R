#' @name reshape_updated
#' @title Reshape Updated Tables
#'
#' @description
#' Ease the update of modified tables usind SQL and loops
#'
#' @param comp A object of class [biblio::comp_df-class] resulted from
#'     [compare_df()].
#'
#' @keywords internal
reshape_updated <- function(comp, key) {
  if (nrow(comp$updated) > 0) {
    Ref <- data.frame(
      idx = rep(rownames(comp$new_vals), ncol(comp$new_vals)),
      vars = rep(names(comp$new_vals),
        each = nrow(comp$new_vals)
      ),
      new_vals = unlist(comp$new_vals),
      updated = unlist(as.data.frame(comp$updated))
    )
    rownames(Ref) <- NULL
    names(Ref)[names(Ref) == "idx"] <- key
    Ref <- Ref[Ref$updated, c(key, "vars", "new_vals")]
  } else {
    Ref <- data.frame(
      idx = character(0),
      vars = character(0),
      new_vals = character(0)
    )
    names(Ref)[names(Ref) == "idx"] <- key
  }
  return(Ref)
}

#' @name update_data
#'
#' @title Update database data by comparing with a reviewed data frame
#'
#' @description
#' Edition can be done in a data frame imported from a database table. Those
#' editions can be then inserted in the original database table.
#'
#' Note that you need to set the arguments `add`, `delete`, and `update` as
#' `TRUE` to carry out the respective actions.
#' If all `FALSE` as in the default, only a comparison will be done.
#'
#' @param object A connection as [RPostgreSQL::PostgreSQLConnection-class].
#' @param revision A data frame with the editions for 'object'.
#' @param key A character value indicating the name of the column used as
#'     identifier for references.
#' @param name Character vector with two values indicating the name of the
#'     schema and the name of the table in Postgres, respectively.
#' @param eval A logical value, whether the resulting SQL commands should be
#'     executed or not. This may be usefull if the target is retrieving SQL
#'     scripts for further execution.
#' @param add,delete,update Logical value indicating whether the respective
#'     edition should be carried out in the database.
#' @param ... Further arguments passed among methods. Not yet used.
#'
#' @rdname update_data
#' @aliases update_data,PostgreSQLConnection,data.frame,character-method
#'
#' @return
#' If all of add, delete and update are FALSE, this function returns an object
#' of class [biblio::comp_df-class].
#' Otherwise, it returns an invisible [sql-class] object.
#'
#' @exportMethod update_data
setMethod(
  "update_data",
  signature(
    object = "PostgreSQLConnection", revision = "data.frame",
    key = "character"
  ),
  function(object, revision, key, name, eval = TRUE, add = FALSE,
           delete = FALSE, update = FALSE, ...) {
    # First check existing schema and existing table
    if (!dbExistsTable(object, name)) {
      stop("The reference table does not exist in the database.")
    }
    Comp_obj <- compare_df(object, revision, key, name)
    if (length(Comp_obj$added_vars)) {
      warning(
        paste0(
          "Following added variables ",
          "will not be handled by this method: '",
          paste0(Comp_obj$added_vars, collapse = "', '"), "'."
        )
      )
    }
    if (length(Comp_obj$deleted_vars)) {
      warning(
        paste0(
          "Following deleted variables ",
          "will not be handled by this method: '",
          paste0(Comp_obj$deleted_vars, collapse = "', '"), "'."
        )
      )
    }
    if (all(!c(add, delete, update))) {
      return(Comp_obj)
    } else {
      query <- new_sql()
      # Use insert rows
      if (add & length(Comp_obj$added)) {
        query <- c(query, insert_rows(object,
          revision[revision[[key]] %in% Comp_obj$added, ], name,
          eval = FALSE
        ))
      }
      if (delete & length(Comp_obj$deleted) > 0) {
        query <- c(query, delete_rows_sql(Comp_obj$deleted, name, key))
      }
      if (update & nrow(Comp_obj$updated) > 0) {
        ref_tab <- reshape_updated(Comp_obj, key)
        ref_tab$new_vals <- do_character(ref_tab$new_vals)
        for (i in 1:nrow(ref_tab)) {
          query <- c(query, paste(
            paste0(
              "update \"",
              paste0(name, collapse = "\".\""), "\""
            ),
            paste0(
              "set \"", ref_tab$vars[i], "\" = ",
              ref_tab$new_vals[i]
            ),
            paste0("where \"", key, "\" = ", ref_tab[[key]][i])
          ))
        }
      }
      query <- as(query, "sql")
      if (eval) {
        dbSendQuery(object, query)
        message("DONE!")
      }
      invisible(query)
    }
  }
)
