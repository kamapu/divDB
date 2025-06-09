#' @name read_sql
#' @rdname read_sql
#'
#' @title Read SQL scripts and split it in SQL statements
#'
#' @details
#' SQL scripts may mix SQL statements with comments. This function extract the
#' respective statements and split them into a list, where each element is a
#' statement.
#'
#' @param file A character value indicating the path to the sql file.
#' @param sql A [sql-class] object containing queries.
#' @param ... Further arguments passed to [readLines()].
#'
#' @return A [sql-class] object.
#'
#' @author Miguel Alvarez
#'
#' @export
read_sql <- function(file, ...) {
  query <- readLines(file, ...)
  query <- query[!(nchar(query) == 0 | grepl("^--", query))]
  query <- trimws(query, "both")
  # Index for commands
  idx <- grepl(";$", query)
  idx <- c(0, cumsum(idx[-length(idx)])) + 1
  # Split by queries
  query <- split(query, idx)
  query <- sapply(query, function(x) paste0(x, collapse = "\n"))
  # Return object
  return(as(query, "sql"))
}

#' @rdname read_sql
#' @aliases write_sql
#' @export
write_sql <- function(sql, ...) {
  UseMethod("write_sql", sql)
}

#' @rdname read_sql
#' @aliases write_sql,sql-method
#' @method write_sql sql
#' @export
write_sql.sql <- function(sql, file, ...) {
  file <- paste0(file_path_sans_ext(file), ".sql")
  writeLines(paste0(c(as(sql, "character"), ""), collapse = ";\n"), ...)
}
