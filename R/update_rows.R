#' @name update_rows
#'
#' @title Row-wise update of database tables.
#'
#' @description
#' Updating database tables from data frames using a column as key value.
#' A SQL script will be created running row-wise updates.
#'
#' @param x A [RPostgreSQL::PostgreSQLConnection-class] connecting to a
#'     database.
#' @param y A data frame including identifiers and columns with values to be
#'     updated.
#' @param name A character vector with the name of the schema and table in the
#'     database. This function tests the existence of the table in the database
#'     and returns an error message if not present.
#' @param eval A logical value, whether the resulting SQL commands should be
#'     executed or not. This may be usefull if the target is retrieving SQL
#'     scripts for further execution.
#' @param key A character vector with the columns of 'y' used as identifiers.
#'     The occurrence of values or their combinations (if more then one
#'     column set as key) will be tested for uniqueness and will retrieve an
#'     error message if it fails.
#' @param ... Addicional arguments passed among methods.
#'
#' @return
#' An invisible [sql-class] object.
#'
#' @exportMethod update_rows
setGeneric(
  "update_rows",
  function(x, y, ...) {
    standardGeneric("update_rows")
  }
)

#' @rdname update_rows
#' @aliases update_rows,data.frame,data.frame-method
setMethod(
  "update_rows", signature(x = "PostgreSQLConnection", y = "data.frame"),
  function(x, y, name, key, eval = TRUE, ...) {
    # Check for NAs in key columns
    for (i in key) {
      if (any(is.na(y[[i]]))) {
        stop(paste0(
          "NA values are not allowed in key column '", i,
          "' at 'y'"
        ))
      }
    }
    # Test if the key is unique
    if (any(duplicated(y[key]))) {
      stop("'y' contains duplicated entries for the key values.")
    }
    # Test if the target table exists in database
    if (!dbExistsTable(x, name)) {
      stop("The target table does not exist in the database.")
    }
    # compare with db columns
    db_col_names <- unlist(dbGetQuery(x, paste(
      "select column_name",
      "from information_schema.columns",
      paste0("where table_schema = '", name[1], "'"),
      paste0("and table_name = '", name[2], "'")
    )))
    not_in_db <- names(y)[!names(y) %in% db_col_names]
    if (length(not_in_db)) {
      message(paste0(
        "Following columns in 'y' are not in database ",
        "and will be ignored:\n    ",
        paste0(not_in_db, collapse = ", ")
      ))
    }
    cols_in_db <- names(y)[names(y) %in% db_col_names]
    # Prepare input
    y <- do_character(y[cols_in_db])
    # set values
    for (i in names(y)) {
      y[[i]] <- paste0(paste0("\"", i, "\" = "), y[[i]])
    }
    # Write query
    query <- paste0(
      "update \"", paste0(name, collapse = "\".\""), "\"\n",
      paste0("set ", apply(y[!names(y) %in% key], 1, paste0,
        collapse = ", "
      ), "\n"),
      paste0("where ", apply(y[key], 1, paste, collapse = " and ")), ";"
    )
    class(query) <- c("sql", "character")
    # Run query, if requested
    if (eval) {
      dbSendQuery(x, query)
      message("DONE!")
    }
    # Return sql invisible
    invisible(query)
  }
)
