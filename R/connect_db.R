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
#' @param dbname,user Character values indicating the names of the database and
#'     user.
#' @param password Character value, the password. If not provided, it will
#'     requested by [keyring::key_get()]. If this is the case, you need to set
#'     the respective password using [credentials()].
#' @param host,port Character values passed to [DBI::dbConnect()].
#' @param pkg A character value indicating the alternative package used to
#'     establish the connection. At the moment only `RpostgreSQL` and
#'     `RPostgres` are suitable.
#' @param conn A connection of class [RPostgreSQL::PostgreSQLConnection-class]
#'     or [RPostgres::PqConnection-class].
#' @param ... Further arguments passed to [DBI::dbConnect()].
#'
#' @return
#' A connection as [RPostgreSQL::PostgreSQLConnection-class] or
#' [RPostgres::PqConnection-class], depending on the selected package.
#'
#' @author Miguel Alvarez \email{kamapu@@posteo.com}
#'
#' @export
connect_db <- function(dbname, user, password, host = "localhost", port = "5432",
                       pkg = "RPostgreSQL", ...) {
  # Get credentials or retrieve an error (only if password is not provided)
  if (missing(password)) {
    password <- tryCatch(keyring::key_get(service = dbname, username = user),
      error = function(e) {
        stop(paste0(
          "A password for database '", dbname, "' and user '", user,
          "' is not yet set\n  Use credentials() to set it."
        ))
      }
    )
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
    return(DBI::dbConnect(
      drv = "PostgreSQL", dbname = dbname, host = host,
      port = port, user = user, password = password,
      ...
    ))
  }
  if (pkg == 2) {
    return(DBI::dbConnect(
      drv = Postgres(), dbname = dbname, host = host,
      port = port, user = user, password = password,
      ...
    ))
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
