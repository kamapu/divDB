#' @name compare_df
<<<<<<< HEAD
#'
#' @title Compare database tables with data frames
#'
#' @description
#' Database tables may be exported for editing as data frames. This method
#' allows for comparing editions done in data frame.
#'
#' @param x A [PostgreSQLConnection-class] connecting to a database.
#' @param y A data frame including the reviewed version of the table.
#' @param key A character value indicating the name of the primary key in the
#'     tables.
#' @param name A character vector with the name of the schema and table in the
#'     database. This function tests the existence of the table in the database
#'     and returns an error message if not present.
#' @param ... Further arguments passed among methods. No yet in use.
#'
#' @aliases compare_df,PostgreSQLConnection,data.frame,character-method
#' @exportMethod compare_df
setMethod(
  "compare_df", signature(
    x = "PostgreSQLConnection", y = "data.frame",
    key = "character"
  ),
  function(x, y, key, name, ...) {
    if (!dbExistsTable(x, name)) {
      stop("The reference table does not exist in the database.")
    }
    x <- dbReadTable(conn = x, name = name)
    return(compare_df(x = x, y = y, key = key, ...))
=======
#' @rdname compare_df
#'
#' @title Compare database tables with data frames
#'
#' @description
#' Database tables may be exported for editing as data frames. This method
#' allows for comparing editions done in data frame.
#'
#' @param x A [PostgreSQLConnection-class] connecting to a database.
#' @param y A data frame including the reviewed version of the table.
#' @param key A character value indicating the name of the primary key in the
#'     tables.
#' @param name A character vector with the name of the schema and table in the
#'     database. This function tests the existence of the table in the database
#'     and returns an error message if not present.
#' @param ... Further arguments passed among methods. No yet in use.
#'
#' @return
#' Either a [comp_df-class] or a [comp_list-class] object, depending on the
#' used method.
#'
#' @aliases compare_df,PostgreSQLConnection,data.frame,character-method
#' @exportMethod compare_df
setMethod(
  "compare_df", signature(
    x = "PostgreSQLConnection", y = "data.frame",
    key = "character"
  ),
  function(x, y, key, name, ...) {
    if (!dbExistsTable(x, name)) {
      stop("The reference table does not exist in the database.")
    }
    x <- dbReadTable(conn = x, name = name)
    return(compare_df(x = x, y = y, key = key, ...))
  }
)

#' @rdname compare_df
#' @aliases compare_df,list,list,list-method
setMethod(
  "compare_df", signature(
    x = "list", y = "list",
    key = "list"
  ),
  function(x, y, key, ...) {
    name <- intersect(names(key), intersect(names(x), names(y)))
    message(paste0(
      "Following tables will be compared: '",
      paste0(name, collapse = "', '"), "'"
    ))
    OUT <- list()
    for (i in name) {
      if (!key[[i]] %in% intersect(names(x[[i]]), names(y[[i]]))) {
        stop(paste0(
          "The primary key '", key[[i]],
          "' is missing in one or both versions of the table '", i,
          "'"
        ))
      } else {
        OUT[[i]] <- compare_df(x = x[[i]], y = y[[i]], key = key[[i]])
      }
    }
    class(OUT) <- c("comp_list", "list")
    return(OUT)
>>>>>>> refs/remotes/origin/devel
  }
)
