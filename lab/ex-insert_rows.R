# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(divDB)
library(RPostgres)

cred <- credentials()
db_name <- "vegetation-db"

conn <- connect_db(db_name, user = cred["user"], password = cred["password"])

# Drop database if exists
dbSendQuery(conn, "drop database if exists iris_test")
dbSendQuery(conn, "create database iris_test")

# reconnect
dbDisconnect(conn)
db_name <- "iris_test"
conn <- connect_db(db_name, user = cred["user"], password = cred["password"])

# Read script
query <- read_sql("lab/create-iris.sql")
query
divDB::dbSendQuery(conn, query)

# Prepare data set
iris_df <- iris
names(iris_df) <- c("sepal_length", "sepal_width", "petal_length",
    "petal_width", "species")

iris_df <- split(iris_df, iris_df$species)

# insert rows
dbGetQuery(conn, "select * from data_frames.iris")

query2 <- insert_rows(conn, iris_df$setosa, c("data_frames", "iris"),
    eval = FALSE)

insert_rows(conn, iris_df$setosa, c("data_frames", "iris"))

dbGetQuery(conn, "select * from data_frames.iris")


