# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(divDB)

cred <- credentials()
db_name <- "postgres"

conn <- connect_db(db_name, user = cred["user"], password = cred["password"])

# Drop database if exists
RPostgres::dbSendQuery(conn, "drop database if exists iris_test")
RPostgres::dbSendQuery(conn, "create database iris_test")

# reconnect
DBI::dbDisconnect(conn)
db_name <- "iris_test"
conn <- connect_db(db_name, user = cred["user"], password = cred["password"])

# Read script
query <- read_sql("lab/create-iris.sql")
query
dbSendQuery(conn, query)

# Prepare data set
iris_df <- iris
names(iris_df) <- c("sepal_length", "sepal_width", "petal_length",
    "petal_width", "species")

# Insert only a part of the data frame
query <- insert_rows(conn, iris_df[1:5, ], c("data_frames", "iris"))

# New table
new_tab <- iris_df[3:7, ]
new_tab$id <- 3:7

new_tab[2, 1] <- new_tab[3, 2] <- 7

compare_df(conn, new_tab, "id", c("data_frames", "iris"))

query <- update_data(conn, new_tab, "id", c("data_frames", "iris"),
    eval = FALSE, add = TRUE, update = TRUE, delete = TRUE)
query

update_data(conn, new_tab, "id", c("data_frames", "iris"),
    eval = TRUE, add = TRUE, update = TRUE, delete = TRUE)

DBI::dbDisconnect(conn)
