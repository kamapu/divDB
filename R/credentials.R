#' @name credentials
#' @rdname credentials
#'
#' @title Prompt for credentials
#'
#' @details
#' A wizard that asks for credentials (database name, username and password).
#' This is to avoid writing passwords in the scripts.
#'
#' Credentials can be retrieved by [keyring::key_get()] or deleted using
#' [delete_credentials()].
#'
#' @param dbname A character value with the name of the database to be
#'     connected. This will be used as 'service' by
#'     [keyring::key_set_with_value()].
#' @param user A character value with the name of the user. It is optional to
#'     add it straight in the call of the function.
#' @param password A character value with the password. It is recommended to set
#'     it in the prompt and not in the script.
#'
#' @return
#' A named vector with two elements, **user** and **password**.
#'
#' @author Miguel Alvarez
#'
#' @export
credentials <- function(dbname = "", user = "", password = "") {
  # Top level
  tt <- tktoplevel()
  tkwm.title(tt, "Log in")
  # Preset values
  DB <- tclVar(dbname)
  User <- tclVar(user)
  Password <- tclVar(password)
  # Labels
  label_DB <- tklabel(tt, text = "DB-Name:")
  label_User <- tklabel(tt, text = "User-ID:")
  label_Password <- tklabel(tt, text = "Password:")
  # Boxes
  entry_DB <- tkentry(tt, width = "20", textvariable = DB)
  entry_User <- tkentry(tt, width = "20", textvariable = User)
  entry_Password <- tkentry(tt,
    width = "20", show = "*",
    textvariable = Password
  )
  # The grid
  tkgrid(label_DB, entry_DB)
  tkgrid(label_User, entry_User)
  tkgrid(label_Password, entry_Password)
  # Nicier arrangements
  tkgrid.configure(entry_DB, entry_User, entry_Password, sticky = "w")
  tkgrid.configure(label_DB, label_User, label_Password, sticky = "e")
  # Actions
  OnOK <- function() {
    tkdestroy(tt)
  }
  OK_but <- tkbutton(tt, text = " OK ", command = OnOK)
  tkbind(entry_Password, "<Return>", OnOK)
  tkgrid(OK_but)
  tkfocus(tt)
  tkwait.window(tt)
  # Set the values with keyring
  keyring::key_set_with_value(
    service = tclvalue(DB), username = tclvalue(User),
    password = tclvalue(Password)
  )
}

#' @rdname credentials
#' @aliases delete_credentials
#' @export
delete_credentials <- function(dbname, user) {
  keyring::key_delete(service = dbname, username = user)
}
