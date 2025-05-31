library(divDB)

# Connect Postgres
conn <- connect_db("test-db")

dbSendQuery(conn, "create schema if not exists data_frames")

df <- data.frame(
        name = c("sepal_length", "sepal_width", "petal_length", "petal_width",
                "species"),
        type = c(rep("double precision", 4), "text"),
        comment = paste("comment", 1:5)
)

# Write Queries without comment
add_columns_sql(df[ , c("name", "type")])




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


####
x <- DBI::dbGetQuery(conn, paste("select * from",
        "(select table_schema,table_name,column_name",
        "from information_schema.columns)",
        "where table_schema = 'data_frames'"))

DBI::dbGetQuery(conn, paste("select column_name",
        "from information_schema.columns",
        "where table_schema = 'data_frames'",
        "and table_name = 'iris2'"))$column_name
