# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(divDB)
library(RPostgres)

cred <- credentials()
db_name <- "postgres"

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

# Insert only data from Iris setosa
query <- insert_rows(conn, subset(iris_df, species == "setosa"),
    c("data_frames", "iris"))






# Retrieve the data from database
iris_db <- dbGetQuery(conn, "select * from data_frames.iris")
iris_db

# Select and modify entries
iris_mod <- iris_db[sample(1:nrow(iris_db), 5),
    c("id", "sepal_length", "petal_length")]
iris_mod$sepal_length <- 100
iris_mod$petal_length <- 100

# update database
query <- update_rows(conn, iris_mod, c("data_frames", "iris"),
    key = "id", eval = FALSE)
query

update_rows(conn, iris_mod, c("data_frames", "iris"), key = "id")

# cross-check
dbGetQuery(conn, "select * from data_frames.iris")
