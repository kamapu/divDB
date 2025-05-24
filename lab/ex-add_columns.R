library(divDB)

# Connect Postgres
conn <- connect_db("test-db")

# write iris
query <- read_sql("lab/create-iris.sql")

dbSendQuery(conn, query)

# Add columns
new_cols <- data.frame(name = c("var1", "remarks"), type = c("numeric", "text"),
        comment = c("Fictive variable", "Observations"))

# Source script
source("R/add_columns.R")

query2 <- add_columns(conn, new_cols, c("data_frames", "iris"))
query2
