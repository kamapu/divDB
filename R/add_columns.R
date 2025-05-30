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
  name_cols <- c("name", "type", "comment")
  name_cols <- name_cols[!name_cols %in% names(df)]
  if (length(name_cols) > 0) {
    stop(paste0(
      "Following mandatory columns are missing in 'df': '",
      paste0(name_cols, collapse = "', '"), "'."
    ))
  }
  df$comment <- gsub("'", "''", df$comment, fixed = TRUE)
  query <- with(df, paste0("add column \"", name, "\" ", type))
  query <- paste0(
    paste0("alter table \"", paste0(name, collapse = "\".\""), "\"\n"),
    paste0(query, collapse = ",\n")
  )
  query <- c(
    query,
    paste0(
      "comment on column \"", paste0(name, collapse = "\".\""), "\".\"",
      df$name, "\" is '", df$comment, "'"
    )
  )
  class(query) <- c("sql", "character")
  # Evaluate, if requested
  if (eval) {
    dbSendQuery(conn, query)
    message("DONE!")
  }
  # Return invisible sql
  invisible(query)
}
