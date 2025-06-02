#' @name add_columns_sql
#' @rdname add_columns_sql
#'
#' @title Write plain SQL commands
#'
#' @description
#' A set of functions writing plain queries without requiring a database
#' connection.
#'
#' @param df In `add_columns_sql()`, a data frame including at least the columns
#'     **name** and **type**, with the columns' names and respective types in
#'     the database.
#'     An optional column **comment** may be included to comment the respective
#'     columns.
#'     In `insert_rows_sql()` and `update_rows_sql()` is the data frame
#'     including the values to be inserted in the database table.
#' @param name A character vector including the name of the schema and the name
#'     of the table to which the columns have to be added.
#' @param key A character value indicating the name of the column used to match
#'     updated rows.
#' @param x A vector of values used as indices to delete rows by
#'     `delete_rows_sql()`. These values have to match those of the column 'key'
#'     in the database.
#'
#' @return A [sql-class] object including the respective query commands.
#'
#' @export
add_columns_sql <- function(df, name) {
  # Check for mandatory column names
  name_cols <- c("name", "type")
  name_cols <- name_cols[!name_cols %in% names(df)]
  if (length(name_cols)) {
    stop(paste0(
      "Following mandatory columns are missing in 'df': '",
      paste0(name_cols, collapse = "', '"), "'."
    ))
  }
  # Add columns in query
  query <- with(df, paste0("add column \"", name, "\" ", type))
  query <- paste0(
    paste0("alter table \"", paste0(name, collapse = "\".\""), "\"\n"),
    paste0(query, collapse = ",\n")
  )
  # Add comments (optional)
  if ("comment" %in% names(df)) {
    df$comment <- gsub("'", "''", df$comment, fixed = TRUE)
    query <- c(
      query,
      paste0(
        "comment on column \"", paste0(name, collapse = "\".\""), "\".\"",
        df$name, "\" is '", df$comment, "'"
      )
    )
  }
  return(as(query, "sql"))
}

#' @rdname add_columns_sql
#' @aliases insert_rows_sql
#' @export
insert_rows_sql <- function(df, name) {
  # prepare input
  df <- do_character(df)
  query_values <- paste0(
    "(",
    apply(df, 1, paste, collapse = ","), ")"
  )
  query <- paste0(
    "insert into \"", paste0(name, collapse = "\".\""), "\" (\"",
    paste0(names(df), collapse = "\",\""), "\")\nvalues\n",
    paste0(query_values, collapse = ",\n"), ";"
  )
  return(as(query, "sql"))
}

#' @rdname  add_columns_sql
#' @aliases update_rows_sql
#' @export
update_rows_sql <- function(df, name, key) {
  df <- do_character(df)
  # set values
  for (i in names(df)) {
    df[[i]] <- paste0(paste0("\"", i, "\" = "), df[[i]])
  }
  # Write query
  query <- paste0(
    "update \"", paste0(name, collapse = "\".\""), "\"\n",
    paste0("set ", apply(df[!names(df) %in% key], 1, paste0,
      collapse = ", "
    ), "\n"),
    paste0("where ", apply(df[key], 1, paste, collapse = " and ")), ";"
  )
  # Return query
  return(as(query, "sql"))
}

#' @rdname add_columns_sql
#' @aliases delete_rows_sql
#' @export
delete_rows_sql <- function(x, name, key) {
  x <- do_character(x)
  query <- paste(
    paste0("delete from \"", paste0(name, collapse = "\".\""), "\""),
    paste0("where \"", key, "\" in (", paste0(x,
      collapse = ","
    ), ")")
  )
  return(as(query, "sql"))
}
