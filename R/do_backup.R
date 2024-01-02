#' @name do_backup
#' @rdname do_backup
#'
#' @title Create a backup by 'pg_dump' and restore database
#'
#' @details
#' The function `do_backup()` is a wrapper for **pg_dump** and is creating
#' writing a dump file named by the backed up database, a time stamp (date of
#' creation) and a suffix (in the case of a further backup done at the same
#' day).
#'
#' The function `do_restore()` can restore the created backup files through
#' **pg_restore**.
#' If several backups have been accumulated in a common folder, this function is
#' able to recognize the newest one.
#'
#' @param dbname Character value indicating the name of the target PostgreSQL
#'     database.
#' @param filename Character value, the name of the backup file. If not provided,
#'     the function guess the database's name and a time stamp, where the newest
#'     backup, if many in the same folder, will be used.
#' @param filepath Character value indicating the path to the folder, where the
#'     backup file will be restored. It have to be a path relative to the
#'     working directory.
#' @param fext Character value indicating the extension used for the backup
#'     file, including the leading dot. The extension ".backup" is used by
#'     default.
#' @param path_psql Character value indicating the system path to PostgreSQL
#'     binaries.
#' @param user Character value indicating the database user in PostgreSQL.
#' @param password Character value, the user's password in PostgreSQL.
#' @param f_timestamp Character value indicating the format of the timestamp
#'     applied to the backup's name (see [strptime()]).
#' @param host Character value, the host name.
#' @param port Integer value, the port applied for database connection.
#' @param backup A character value indicating a specific backup file to be used
#'     for restore.
#' @param opts A character value indicating additional options for "pg_restore",
#'     for instance "--clean" or "--create".
#' @param ... Further arguments passed to [system()].
#'
#' @author Miguel Alvarez
#'
#' @export
do_backup <- function(dbname = "", host = "localhost", port = "5432", user = "",
                      password = "", filepath = ".", filename = dbname,
                      fext = ".backup", path_psql = "/usr/bin",
                      f_timestamp = "%Y%m%d", ...) {
  # Get credentials (only if not provided)
  if (user == "" | password == "") {
    cred <- credentials(user = user, password = password)
    user <- unname(cred["user"])
    password <- unname(cred["password"])
  }
  # Prepare the file
  old_file <- file.path(filepath, sub(fext, "", list.files(
    path = filepath,
    pattern = filename
  )))
  new_file <- file.path(filepath, paste0(filename, "_", format(
    Sys.Date(),
    f_timestamp
  )))
  if (length(old_file) > 0) {
    new_file <- taxlist:::add_suffix(new_file, old_file)
  }
  new_file <- paste0(new_file, fext)
  # Create command
  system(paste(
    paste0(
      "PGPASSWORD=\"", password, "\""
    ),
    file.path(path_psql, "pg_dump"),
    "-U", user,
    "-h", host,
    "-p", port,
    "-F c", dbname, ">", new_file
  ), ...)
  message(paste0("\nDatabase '", dbname, "' backed up in '", new_file, "'"))
}

#' @rdname do_backup
#' @aliases do_restore
#' @export
do_restore <- function(dbname = "", backup, host = "localhost", port = "5432",
                       user = "", password = "", filepath = ".",
                       filename = dbname, fext = ".backup",
                       path_psql = "/usr/bin", f_timestamp = "%Y%m%d",
                       opts = "--clean", ...) {
  # Get credentials (only if not provided)
  if (user == "" | password == "") {
    cred <- credentials(user = user, password = password)
    user <- unname(cred["user"])
    password <- unname(cred["password"])
  }
  # Create command
  if (missing(backup)) {
    backup <- sort_backups(
      name = filename,
      path = filepath,
      date_format = f_timestamp,
      fext = fext
    )
    backup <- backup$filename[nrow(backup)]
  }
  system(paste(
    paste0("PGPASSWORD=\"", password, "\""),
    file.path(path_psql, "pg_restore"),
    "-h", host,
    "-p", port,
    "-U", user,
    opts,
    "-d", dbname,
    "-v", file.path(filepath, backup)
  ), ...)
  message(paste0("\nDatabase '", dbname, "' restored from '", backup, "'"))
}
