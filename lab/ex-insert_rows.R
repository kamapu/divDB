# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(divDB)

# Input data
iris_df <- iris
names(iris_df) <- taxlist::replace_x(x = names(iris_df),
    old = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width",
        "Species"),
    new = c("sepal_length", "sepal_width", "petal_length", "petal_width",
        "species"))

# Insert rows (only queries)
insert_rows_sql(iris_df[1:5, ], c("data_frames", "iris3"))

# Create data frame for database
table_def <- data.frame(
        name = c("sepal_length", "sepal_width", "petal_length", "petal_width",
                "species", "id"),
        type = c(rep("double precision", 4), "text", "serial primary key"),
        comment = paste("comment", 1:6))

# Connect data frame and create empty table
conn <- connect_db("test-db")

dbSendQuery(conn, "create schema if not exists data_frames")
dbSendQuery(conn, "create table if not exists data_frames.iris3 ()")

# Add columns without content
add_columns(conn, table_def, c("data_frames", "iris3"))

# add rows (only queries)
query <- insert_rows(conn, iris_df[1:5, ], c("data_frames", "iris3"),
        eval = FALSE)
query

# Add rows into database
insert_rows(conn, iris_df, c("data_frames", "iris3"))

# Error message if table not existing
insert_rows(conn, iris_df, c("data_frames", "iris4"))

# Message for columns not included in database
iris_df$remarks <- "Some remarks."
insert_rows(conn, iris_df[1:5, ], c("data_frames", "iris3"))

# Disconnect database
disconnect_db(conn)
