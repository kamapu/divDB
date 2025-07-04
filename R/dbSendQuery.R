#' @name dbSendQuery
#'
#' @title Send multiple queries to a database
#'
#' @description
#' A wrapper of [DBI::dbSendQuery()] for convenience to send SQL commands read
#' by [read_sql()].
#' Each statement will be executed in a loop.
#'
#' @param conn A connection as [RPostgreSQL::PostgreSQLConnection-class] object.
#' @param statement A sql object.
#' @param ... Further arguments passed among methods.
#'
#' @author Miguel Alvarez \email{kamapu78@@gmail.com}
#'
#' @aliases dbSendQuery,PostgreSQLConnection,sql-method
#' @exportMethod dbSendQuery
setMethod(
  "dbSendQuery", signature(
    conn = "PostgreSQLConnection",
    statement = "sql"
  ),
  function(conn, statement, ...) {
    for (i in seq_along(statement)) {
      x <- dbSendQuery(conn, statement[i])
    }
    return(x)
  }
)
