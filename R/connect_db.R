#' @name connect_db
#' @rdname connect_db
#'
#' @title Connect to PostgreSQL database
#'
#' @description
#' It opens a prompt to insert connection details to a PostgreSQL
#' database.
#' Consequently `disconnect_db()` will be used to close the opened connection.
#'
#' @param dbname,host,port Character values passed to [DBI::dbConnect()].
#' @param conn A connection of class [RPostgreSQL::PostgreSQLConnection-class]
#'     or [RPostgres::PqConnection-class].
#' @param user,password Character values. They are passed to [DBI::dbConnect()].
#'     If not provided, they will be prompted by [credentials()].
#' @param pkg A character value indicating the alternative package used to
#'     establish the connection. At the moment only `RpostgreSQL` and
#'     `RPostgres` are suitable.
#' @param ... Further arguments passed to [DBI::dbConnect()].
#'
#' @return
#' A connection as [RPostgreSQL::PostgreSQLConnection-class] or
#' [RPostgres::PqConnection-class], depending on the selected package.
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
  if (user == "" || password == "") {
    cred <- key_list(service = dbname)
    if (!nrow(cred)) {
      stop(paste0(
        "There is no password in '", dbname,
        "'\n  Use credentials() to set it."
      ))
    }
    user <- cred$username
    password <- keyring::key_get(service = dbname, username = user)
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
    DBI::dbConnect(
      drv = "PostgreSQL", dbname = dbname, host = host,
      port = port, user = user, password = password,
      ...
    )
  }
  if (pkg == 2) {
    DBI::dbConnect(
      drv = Postgres(), dbname = dbname, host = host,
      port = port, user = user, password = password,
      ...
    )
  }
}

#' @rdname connect_db
#' @aliases disconnect_db
#' @export
disconnect_db <- function(conn, ...) {
  UseMethod("disconnect_db", conn)
}

#' @rdname connect_db
#' @aliases disconnect_db,PostgreSQLConnection-method
#' @method disconnect_db PostgreSQLConnection
#' @export
disconnect_db.PostgreSQLConnection <- function(conn, ...) {
  DBI::dbDisconnect(conn, ...)
}

#' @rdname connect_db
#' @aliases disconnect_db,PqConnection-method
#' @method disconnect_db PqConnection
#' @export
disconnect_db.PqConnection <- function(conn, ...) {
  DBI::dbDisconnect(conn, ...)
}
