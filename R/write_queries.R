#' @name write_queries
#' @rdname write_queries
#'
#' @description
#' A set of functions writing plain queries without requiring a database
#' connection.
#'
#' @param df A data frame including at least the columns **name** and **type**,
#'     with the columns' names and respective types in the database.
#'     An optional column **comment** may be included to comment the respective
#'     columns.
#'
#' @return A [sql-class] object including the respective query commands.
#'
#' @export
add_columns_sql <- function(df) {
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
