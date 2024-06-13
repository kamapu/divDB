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

# No rows in database
dbGetQuery(conn, "select * from data_frames.iris")

# Insert rows
query1 <- insert_rows(conn, iris_df$setosa, c("data_frames", "iris"),
    eval = FALSE)
query1

insert_rows(conn, iris_df$setosa, c("data_frames", "iris"))

dbGetQuery(conn, "select * from data_frames.iris")

# Insert rows with additional columns
iris_df$versicolor$source <- "R data iris"
iris_df$versicolor$author <- "Myself"

query2 <- insert_rows(conn, iris_df$versicolor, c("data_frames", "iris"),
    eval = FALSE)
query2

insert_rows(conn, iris_df$versicolor, c("data_frames", "iris"))

dbGetQuery(conn, paste("select *", "from data_frames.iris",
        "where species = 'versicolor'"))

# Insert NA's
iris_df$virginica$sepal_length[sample(1:50, 4)] <- NA
iris_df$virginica$species[sample(1:50, 4)] <- NA

query3 <- insert_rows(conn, iris_df$virginica, c("data_frames", "iris"),
    eval = FALSE)
query3

insert_rows(conn, iris_df$virginica, c("data_frames", "iris"))

dbGetQuery(conn, paste("select *", "from data_frames.iris",
        "where species != 'versicolor'", "and species != 'setosa'"))

dbGetQuery(conn, "select * from data_frames.iris")
