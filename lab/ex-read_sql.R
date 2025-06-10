
file <- "lab/update-references.sql"
end = ";"
comment = "--"

query <- readLines(file)
query <- query[!(nchar(query) == 0 | grepl("^--", query))]
query <- trimws(query, "both")
# Index for commands
idx <- grepl(";$", query)
idx <- c(0, cumsum(idx[-length(idx)])) + 1
# Split by queries
query <- split(query, idx)
query <- sapply(query, function(x) paste0(x, collapse = "\n"))
# Return object
return(as(query, "sql"))

