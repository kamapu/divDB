#' @name sql-class
#' @rdname sql-class
#' @title A class for lists of SQL commands
#' @description
#' Multiple SQL commands can be read from a *.sql file by [read_sql()] and
#' stored as a character vector.
#'
#' `new_sql()` can be used either to retrieves an empty object or to coerce
#' a character vector into `sql`.
#' Alternatively you can use `as(x, "sql")`.
#'
#' @param x A character vector to be converted to class `sql`.
#'
#' @example examples/sql-class.R
#'
#' @exportClass sql
setOldClass(c("sql", "character"))

#' @rdname sql-class
#' @aliases new_sql
#' @export
new_sql <- function(x) {
  y <- character(0)
  if (!missing(x)) y <- c(y, x)
  class(y) <- c("sql", "character")
  return(y)
}

#' @name as
#' @rdname sql-class
#' @aliases coerce,character,sql-method
setAs(from = "character", to = "sql", def = function(from) {
  return(new_sql(from))
})
