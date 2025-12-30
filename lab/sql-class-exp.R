library(divDB)

y <- x <- ""
class(y) <- class(x) <- c("sql", "character")

class(c("", x))
class(c(y, ""))

class(c(x, y))
