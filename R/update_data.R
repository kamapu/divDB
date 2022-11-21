#' @name reshape_updated
#' @title Reshape Updated Tables
#'
#' @description
#' Ease the update of modified tables usind SQL and loops
#'
#' @param comp A object of class [comp_df-class] resulted from [compare_df()].
#'
#' @keywords internal
reshape_updated <- function(comp, key) {
  Ref <- data.frame(
    idx = rep(rownames(comp$new_vals), ncol(comp$new_vals)),
    vars = rep(names(comp$new_vals),
      each = nrow(comp$new_vals)
    ),
    new_vals = unlist(comp$new_vals),
    updated = unlist(as.data.frame(comp$updated))
  )
  rownames(Ref) <- NULL
  colnames(Ref)[colnames(Ref) == "idx"] <- key
  return(Ref[Ref$updated, c(key, "vars", "new_vals")])
}

<<<<<<< HEAD
<<<<<<< HEAD
#' @name update_data
#'
#' @title Compare Bibtex-files with Postgres databases and update
#'
#' @description
#' When changes done in the Bibtex duplicated file, they can be briefly
#' displayed before export.
#'
#' In `update_pg` actions 'delete', 'add', and 'update' have to be accordingly
#' set as `TRUE`, otherwise only `print_report()` will be executed.
#'
#' @param object A connection to a reference database established by
#'     [dbConnect()].
#' @param revision A [lib_df-class] object imported by [read_bib()]. This data
#'     set represent an updated version of 'object'.
#' @param key A character value indicating the name of the column used as
#'     identifier for references.
#' @param name Character value indicating the name of the schema in Postgres.
#' @param delete Logical value indicating whether missing entries in 'bib' have
#'     to be deleted in 'db'.
#' @param add Logical value indicating whether new entries in 'bib' have to be
#'     inserted in 'db'.
#' @param update Logical value indicating whether entries modified in 'bib' have
#'     to be updated in 'db'.
#' @param ... Further arguments passed among methods. Not yet used.
#'
#' @rdname update_data
#' @aliases update_data,PostgreSQLConnection,data.frame,character-method
#' @exportMethod update_data
setMethod(
  "update_data",
  signature(
    object = "PostgreSQLConnection", revision = "data.frame",
    key = "character"
  ),
  function(object, revision, name, key, add = FALSE, delete = FALSE,
           update = FALSE, ...) {
    # First check existing schema and existing table
    if (!dbExistsTable(object, name)) {
      stop("The reference table does not exist in the database.")
    }
    Comp_obj <- compare_df(x = object, y = revision, key = key, name = name)
    Comp_obj$added_vars <- Comp_obj$deleted_vars <- character(0)
=======
# TODO: Adapt documentation to comp_list objects
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
#' @param object A connection as [PostgreSQLConnection-class].
#' @param revision A data frame with the editions for 'object'.
#' @param key A character value indicating the name of the column used as
#'     identifier for references.
#' @param name Character value indicating the name of the schema in Postgres.
#' @param add,delete,update Logical value indicating whether the respective
#'     edition should be carried out in the database.
#' @param ... Further arguments passed among methods. Not yet used.
#'
#' @rdname update_data
#' @aliases update_data,PostgreSQLConnection,data.frame,character-method
#' @exportMethod update_data
setMethod(
  "update_data",
  signature(
    object = "PostgreSQLConnection", revision = "data.frame",
    key = "character"
  ),
  function(object, revision, name, key, add = FALSE, delete = FALSE,
           update = FALSE, ...) {
    # First check existing schema and existing table
    if (!dbExistsTable(object, name)) {
      stop("The reference table does not exist in the database.")
    }
    Comp_obj <- compare_df(x = object, y = revision, key = key, name = name)
    if (length(Comp_obj$added_vars) > 0) {
      warning(
          paste0("Following added variables ",
              "will not be handled by this method: '",
              paste0(Comp_obj$added_vars, collapse = "', '"), "'."))
    }
    if (length(Comp_obj$deleted_vars) > 0) {
      warning(
          paste0("Following deleted variables ",
              "will not be handled by this method: '",
              paste0(Comp_obj$deleted_vars, collapse = "', '"), "'."))
    }
>>>>>>> refs/remotes/origin/devel
    if (all(!c(delete, add, update))) {
      print(Comp_obj)
    } else {
      if (add) {
        if (length(Comp_obj$added) > 0) {
          dbWriteTable(
            conn = object, name = name,
            value = revision[revision[[key]] %in% Comp_obj$added, ],
=======
# TODO: Adapt documentation to comp_list objects
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
#' @param object A connection as [PostgreSQLConnection-class].
#' @param revision A data frame with the editions for 'object'.
#' @param key A character value indicating the name of the column used as
#'     identifier for references.
#' @param name Character value indicating the name of the schema in Postgres.
#' @param add,delete,update Logical value indicating whether the respective
#'     edition should be carried out in the database.
#' @param ... Further arguments passed among methods. Not yet used.
#'
#' @rdname update_data
#' @aliases update_data,PostgreSQLConnection,data.frame,character-method
#' @exportMethod update_data
setMethod(
  "update_data",
  signature(
    object = "PostgreSQLConnection", revision = "data.frame",
    key = "character"
  ),
  function(object, revision, key, name, add = FALSE, delete = FALSE,
           update = FALSE, ...) {
    # First check existing schema and existing table
    if (!dbExistsTable(object, name)) {
      stop("The reference table does not exist in the database.")
    }
    Comp_obj <- compare_df(x = object, y = revision, key = key, name = name)
    if (length(Comp_obj$added_vars) > 0) {
      warning(
        paste0(
          "Following added variables ",
          "will not be handled by this method: '",
          paste0(Comp_obj$added_vars, collapse = "', '"), "'."
        )
      )
    }
    if (length(Comp_obj$deleted_vars) > 0) {
      warning(
        paste0(
          "Following deleted variables ",
          "will not be handled by this method: '",
          paste0(Comp_obj$deleted_vars, collapse = "', '"), "'."
        )
      )
    }
    if (all(!c(add, delete, update))) {
      print(Comp_obj)
    } else {
      if (add) {
        if (length(Comp_obj$added) > 0) {
          dbWriteTable(
            conn = object, name = name,
            value = revision[
              revision[[key]] %in% Comp_obj$added,
              names(revision)[!names(revision) %in% Comp_obj$added_vars]
            ],
>>>>>>> refs/remotes/origin/devel
            append = TRUE, row.names = FALSE, overwrite = FALSE
          )
        }
      }
      if (delete) {
        if (length(Comp_obj$deleted) > 0) {
          query <- paste(
            paste0(
              "delete from \"",
              paste0(name, collapse = "\".\""), "\""
            ),
            paste0(
              "where \"", key, "\" in ('",
              paste0(Comp_obj$deleted, collapse = "','"), "')"
            )
          )
        }
        dbSendQuery(object, query)
      }
      if (update) {
        ref_tab <- reshape_updated(Comp_obj, key)
        for (i in 1:nrow(ref_tab)) {
          query <- paste(
            paste0(
              "update \"",
              paste0(name, collapse = "\".\""), "\""
            ),
            paste0(
              "set \"", ref_tab$vars[i], "\" = '",
              ref_tab$new_vals[i], "'"
            ),
            paste0("where \"", key, "\" = '", ref_tab[[key]][i], "'")
          )
          dbSendQuery(object, query)
        }
      }
    }
    if (any(c(add, delete, update))) {
      message("DONE!")
    }
  }
)
