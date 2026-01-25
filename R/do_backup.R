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
#' @param dbname,user Character value indicating the name of the target
#'     PostgreSQL database and user.
#' @param password A character value, the password. If not provided, it will
#'     be queried by [keyring::key_get()].
#' @param filename Character value, the name of the backup file. If not provided,
#'     the function guess the database's name and a time stamp, where the newest
#'     backup, if many in the same folder, will be used.
#' @param filepath Character value indicating the path to the folder, where the
#'     backup file will be restored. It have to be a path relative to the
#'     working directory.
#' @param f_timestamp Character value indicating the format of the timestamp
#'     applied to the backup's name (passed as format to [strptime()]). It can
#'     be cancelled by 'f_timestamp = NULL', then backups may be overwritten.
#' @param fext Character value indicating the extension used for the backup
#'     file, including the leading dot. The extension ".backup" is used by
#'     default.
#' @param path_psql Character value indicating the system path to PostgreSQL
#'     binaries.
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
do_backup <- function(dbname, user, password, host = "localhost", port = "5432",
                      filepath = ".", filename = dbname, f_timestamp = "%Y%m%d",
                      fext = ".backup", path_psql = "/usr/bin", ...) {
  # Get credentials or retrieve an error (only if missing)
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
  if (is.null(f_timestamp)) {
    message("Timestamp set to NULL. Previous backups may be overwritten.")
    new_file <- file.path(filepath, paste0(filename, fext))
  } else {
    old_file <- file.path(filepath, sub(fext, "", list.files(
      path = filepath,
      pattern = filename
    )))
    new_file <- file.path(filepath, paste0(filename, "_", format(
      Sys.time(),
      f_timestamp
    )))
    if (length(old_file) > 0) {
      new_file <- taxlist:::add_suffix(new_file, old_file)
    }
    new_file <- paste0(new_file, fext)
  }
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
do_restore <- function(dbname, user, backup, password, host = "localhost",
                       port = "5432", filepath = ".", filename = dbname, fext = ".backup",
                       path_psql = "/usr/bin", f_timestamp = "%Y%m%d", opts = "--clean", ...) {
  # Get credentials or retrieve an error (if password missing)#
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
  # Create command
  if (missing(backup)) {
    backup <- taxlist::sort_backups(
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
