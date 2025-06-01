#' @name insert_rows
#'
#' @title Insert new rows in database tables.
#'
#' @description
#' New rows can be inserted from data frames into a Postgres table.
#' This function will first construct the sql commands to do the insert.
#'
#' @param x A [RPostgreSQL::PostgreSQLConnection-class] connecting to a
#'     database.
#' @param y A data frame including the reviewed version of the table.
#' @param name A character vector with the name of the schema and table in the
#'     database. This function tests the existence of the table in the database
#'     and returns an error message if not present.
#' @param eval A logical value, whether the resulting SQL commands should be
#'     executed or not. This may be usefull if the target is retrieving SQL
#'     scripts for further execution.
#' @param ... Further arguments passed among methods. No yet in use.
#'
#' @return
#' An invisible [sql-class] object.
#'
#' @aliases insert_rows,PostgreSQLConnection,data.frame-method
#' @exportMethod insert_rows
setMethod(
  "insert_rows", signature(
    x = "PostgreSQLConnection", y = "data.frame"
  ),
  function(x, y, name, eval = TRUE, ...) {
    if (!dbExistsTable(x, name)) {
      stop("The target table does not exist in the database.")
    }
    # Check for columns in database
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
    query <- insert_rows_sql(y[cols_in_db], name)
    # Run query if required
    if (eval) {
      dbSendQuery(x, query)
      message("DONE!")
    }
    # Return sql invisible
    invisible(query)
  }
)
