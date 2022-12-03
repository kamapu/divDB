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
#' @param end Symbol set at the end of a statement (semicolon by default).
#' @param comment Symbol used to start a comment in script (two dashes by
#'     default).
#' @param ... Further arguments passed to [readLines()].
#'
#' @return A [sql-class] object.
#'
#' @author Miguel Alvarez
#'
#' @export
read_sql <- function(file, end = ";", comment = "--", ...) {
  Query <- readLines(file, ...)
  Query <- Query[!(nchar(Query) == 0 | grepl(comment, Query, fixed = TRUE))]
  Query <- paste0(Query, "\n")
  idx <- grepl(end, Query, fixed = TRUE)
  idx <- c(0, cumsum(idx[-length(idx)]))
  Query <- split(Query, idx)
  names(Query) <- NULL
  Query <- sapply(Query, function(x) paste0(x, collapse = ""))
  Query <- structure(Query, class = c("sql", "character"))
  return(Query)
}

#' @rdname read_sql
#' @export
write_sql <- function(sql, file, ...) {
  file <- paste0(file_path_sans_ext(file), ".sql")
  suffix <- c("\n\n", ";\n\n")[match(
    grepl(";", sql, fixed = TRUE),
    c(TRUE, FALSE)
  )]
  con <- file(file, "wb")
  writeBin(charToRaw(paste0(paste0(sql, suffix), collapse = "")), con)
  close(con)
}
