#' @name add_columns
#' @rdname add_columns
#'
#' @title Add columns to an existing table in database
#'
#' @description
#' For convenience new columns can be listed in a data frame including type
#' and comments.
#'
#' @param conn A [RPostgreSQL::PostgreSQLConnection-class] or
#'     a [RPostgres::PqConnection-class] connection to a database. If missing,
#'     the function will call internally [connect_db()].
#' @param df A data frame with definitions for new columns. The mandatory
#'     columns are **name**, **type** (the type of new columns, including
#'     constraints), and **comment** (comments added to the columns).
#' @param name A character vector with the name of the schema and the table,
#'     where the new columns have to be added.
#' @param eval A logical value, whether the resulting SQL commands should be
#'     executed or not. This may be usefull if the target is retrieving SQL
#'     scripts for further execution.
#' @param dbname,user A character value passed to [connect_db()].
#' @param ... Further arguments passed to [connect_db()] or further methods.
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
  # Check existence of tables
  tab_names <- dbGetQuery(conn, paste(
    "select table_name",
    "from information_schema.tables",
    paste0("where table_schema = '", name[1], "'")
  ))$table_name
  if (!name[2] %in% tab_names) {
    stop("The target relation does not exist in the database.")
  }
  # Check for column 'name'
  if (!"name" %in% names(df)) {
    stop("The column 'name' is mandatory in 'df'")
  }
  # Retieves column names
  col_names <- dbGetQuery(conn, paste(
    "select column_name",
    "from information_schema.columns",
    paste0("where table_schema = '", name[1], "'"),
    paste0("and table_name = '", name[2], "'")
  ))$column_name
  # Check for existing columns
  names_in_df <- df$name[df$name %in% col_names]
  if (length(names_in_df)) {
    stop(paste0(
      "Following columns already exists in database:\n\"",
      paste0(names_in_df, collapse = "\", \"."),
      "\""
    ))
  }
  # Write the query
  query <- add_columns_sql(df, name)
  if (eval) {
    dbSendQuery(conn, query)
    message("DONE!")
  }
  # Return invisible sql
  invisible(query)
}

#' @rdname add_columns
#' @aliases add_columns,missing-method
#' @method add_columns missing
#' @export
add_columns.missing <- function(conn, df, name, eval = TRUE,
                                dbname, user, ...) {
  conn <- connect_db(dbname = dbname, user = user, ...)
  on.exit(disconnect_db(conn), add = TRUE)
  add_columns(conn = conn, df = df, name = name, eval = eval, ...)
}
