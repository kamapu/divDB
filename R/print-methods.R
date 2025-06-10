#' @name print-methods
#' @docType methods
#' @rdname print
#'
#' @title Print methods
#'
#' @description
#' Printing outputs in diverse object classes.
#'
#' @param x An object of class [comp_list-class].
#' @param ... Further arguments passed among methods.
#'
#' @aliases print,comp_list-method
#' @method print comp_list
#' @export
print.comp_list <- function(x, ...) {
  for (i in names(x)) {
    lab_i <- paste0("# Changes in '", i, "' #")
    bar_i <- paste0(rep("#", times = nchar(lab_i)), collapse = "")
    cat(paste0(bar_i, "\n", lab_i, "\n", bar_i, "\n\n"))
    print(x[[i]])
  }
  cat("\n")
}

#' @rdname print
#' @aliases print,sql-method
#' @method print sql
#' @export
print.sql <- function(x, ...) {
  suffix <- c("\n\n", ";\n\n")[match(
    grepl(";$", x),
    c(TRUE, FALSE)
  )]
  for (i in seq_along(x)) {
    cat(paste0(x[i], suffix[i]))
  }
}
