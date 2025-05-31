#' @name add_columns
#' @rdname add_columns
#'
#' @title Add columns to an existing table in database
#'
#' @description
#' For convenience new columns can be listed in a data frame including type
#' and comments.
#'
#' @param conn A [RPostgreSQL::PostgreSQLConnection-class] connection to a database.
#' @param df A data frame with definitions for new columns. The mandatory
#'     columns are **name**, **type** (the type of new columns, including
#'     constraints), and **comment** (comments added to the columns).
#' @param name A character vector with the name of the schema and the table,
#'     where the new columns have to be added.
#' @param eval A logical value, whether the resulting SQL commands should be
#'     executed or not. This may be usefull if the target is retrieving SQL
#'     scripts for further execution.
#' @param ... Further arguments passed among methods.
#'
#' @return
#' An invisible [sql-class] object.
#'
#' @export
add_columns <- function(conn, ...) {
  UseMethod("add_columns", conn)
}

#' @rdname add_columns
#' @aliases add_columns,PostgreSQLConnection-method
#' @method add_columns PostgreSQLConnection
#' @export
add_columns.PostgreSQLConnection <- function(conn, df, name, eval = TRUE, ...) {
  # Retieves column names (and check existence of table)
  col_names <- dbGetQuery(conn, paste(
    "select column_name",
    "from information_schema.columns",
    paste0("where table_schema = '", name[1], "'"),
    paste0("and table_name = '", name[2], "'")
  ))$column_name
  if (!length(col_names)) {
    stop("The target relation does not exist in the database.")
  }
  # Check for existing columns
  names_in_df <- names(df)[names(df) %in% col_names]
  if (length(names_in_df)) {
    stop(paste0(
      "Following columns already exists in database:\n\"",
      paste0(names_in_df, collapse = "\", \"."),
      "\""
    ))
  }
  # Write the query
  query <- add_columns_sql(df)
  if (eval) {
    dbSendQuery(conn, query)
    message("DONE!")
  }
  # Return invisible sql
  invisible(query)
}
