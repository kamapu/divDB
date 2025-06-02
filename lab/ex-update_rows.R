# Load packages
library(divDB)

# Input data
iris_df <- iris
names(iris_df) <- taxlist::replace_x(x = names(iris_df),
    old = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width",
        "Species"),
    new = c("sepal_length", "sepal_width", "petal_length", "petal_width",
        "species"))

# Create data frame for table definition
table_def <- data.frame(
        name = c("sepal_length", "sepal_width", "petal_length", "petal_width",
                "species", "id"),
        type = c(rep("double precision", 4), "text", "serial primary key"),
        comment = paste("comment", 1:6))

# Create data frame for table content
iris_df <- iris
names(iris_df) <- taxlist::replace_x(x = names(iris_df),
    old = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width",
        "Species"),
    new = c("sepal_length", "sepal_width", "petal_length", "petal_width",
        "species"))

# Connect data frame and create empty table
conn <- connect_db("test-db")

dbSendQuery(conn, "create schema if not exists data_frames")
dbSendQuery(conn, "create table if not exists data_frames.iris ()")

# Add columns without content
add_columns(conn, table_def, c("data_frames", "iris"))

# insert rows
insert_rows(conn, iris_df[1:5, ], c("data_frames", "iris"))

# Update rows (Only query)
update_df <- data.frame(
    id = c(1:3),
    petal_length = c(1:3)*100
)

# Update rows (only queries)
update_rows_sql(update_df, c("data_frames", "iris"), "id")

# Update rows connecting database (only queries)
query <- update_rows(conn, update_df, c("data_frames", "iris"), "id",
    eval = FALSE)
query

# Update rows in database
update_rows(conn, update_df, c("data_frames", "iris"), "id")

# Test some errors

# NAs in key column
update_df$id[2] <- NA
update_rows(conn, update_df, c("data_frames", "iris"), "id")

# Duplicated values in key
update_df$id[2] <- 1
update_rows(conn, update_df, c("data_frames", "iris"), "id")

# Table missing in database
update_df$id[2] <- 2
update_rows(conn, update_df, c("data_frames", "iris20"), "id")

# Message for columns that not exists in the database
update_df$extra_column <- letters[1:3]
update_rows(conn, update_df, c("data_frames", "iris"), "id")

disconnect_db(conn)
