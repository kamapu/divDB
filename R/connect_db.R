#' @name connect_db
#'
#' @title Connect to PostgreSQL database
#'
#' @description
#' This function opens a prompt to insert connection details to a PostgreSQL
#' database.
#'
#' @param dbname,host,port Character values passed to [dbConnect()].
#' @param user,password Character values. They are passed to [dbConnect()].
#'     If not provided, they will be prompted by [credentials()].
#' @param pkg A character value indicating the alternative package used to
#'     establish the connection. At the moment only `RpostgreSQL` and
#'     `RPostgres` are suitable.
#' @param ... Further arguments passed to [dbConnect()].
#'
#' @return
#' A connection as [PostgreSQLConnection-class].
#'
#' @references
#' http://r.789695.n4.nabble.com/tkentry-that-exits-after-RETURN-tt854721.html#none
#'
#' https://gist.github.com/mages/2aed2a053e355e3bfe7c#file-getlogindetails-r
#'
#' Dalgaard (2001).
#'
#' @author Miguel Alvarez \email{kamapu@@posteo.com}
#'
#' @export
connect_db <- function(dbname = "", host = "localhost", port = "5432",
                       user = "", password = "", pkg = "RPostgreSQL", ...) {
  # Get credentials (only if not provided)
  if (user == "" | password == "") {
    cred <- credentials(user = user, password = password)
    user <- unname(cred["user"])
    password <- unname(cred["password"])
  }
  # Connection
  pkg_opts <- c("RPostgreSQL", "RPostgres")
  pkg <- pmatch(pkg, pkg_opts)
  if (is.na(pkg)) {
    stop(paste0(
      "Wrong argument in parameter 'pkg'. ",
      "Try one of these alternatives:\n  '",
      paste0(pkg_opts, collapse = "', '"), "'"
    ))
  }
  if (pkg == 1) {
    return(dbConnect(
      drv = "PostgreSQL", dbname = dbname, host = host,
      port = port, user = user, password = password,
      ...
    ))
  }
  if (pkg == 2) {
    return(dbConnect(
      drv = Postgres(), dbname = dbname, host = host,
      port = port, user = user, password = password,
      ...
    ))
  }
}
