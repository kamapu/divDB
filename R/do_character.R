#' @name do_character
#' @rdname do_character
#'
#' @title Convert vectors to characters for building queries
#'
#' @description
#' To make it easier to build queries, variables and data frames are converted
#' to character values.
#'
#' @param x A vector or data frame to be converted.
#' @param ... Further arguments passed among methods.
#'
#' @example examples/do_character.R
#'
#' @export
do_character <- function(x, ...) {
  UseMethod("do_character", x)
}

#' @rdname do_character
#' @aliases do_character,character-method
#' @method do_character character
#' @export
do_character.character <- function(x, ...) {
  idx <- is.na(x)
  x <- paste0("\'", x, "\'")
  x[idx] <- "null"
  return(x)
}

#' @rdname do_character
#' @aliases do_character,numeric-method
#' @method do_character numeric
#' @export
do_character.numeric <- function(x, ...) {
  x <- as.character(x)
  x[is.na(x)] <- "null"
  return(x)
}

#' @rdname do_character
#' @aliases do_character,factor-method
#' @method do_character factor
#' @export
do_character.factor <- function(x, ...) {
  x <- as.character(x)
  x <- do_character(x)
  return(x)
}

#' @rdname do_character
#' @aliases do_character,logical-method
#' @method do_character logical
#' @export
do_character.logical <- function(x, ...) {
  x <- as.character(x)
  x[is.na(x)] <- "null"
  x <- tolower(x)
  return(x)
}

#' @rdname do_character
#' @aliases do_character,Date-method
#' @method do_character Date
#' @export
do_character.Date <- function(x, ...) {
  x <- as.character(x)
  x <- do_character(x)
  return(x)
}

# TODO: Further classes (e.g. geometries)

#' @rdname do_character
#' @aliases do_character,data.frame-method
#' @method do_character data.frame
#' @export
do_character.data.frame <- function(x, ...) {
  for (i in names(x)) {
    x[[i]] <- do_character(x[[i]])
  }
  return(x)
}
