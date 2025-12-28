# Load package
library(divDB)

# Only queries
delete_rows_sql(letters[1:5], c("data_frames", "iris"), "id")
delete_rows_sql(1:5, c("data_frames", "iris"), "id")

# Create data frame for table definition
table_def <- data.frame(
        name = c("sepal_length", "sepal_width", "petal_length", "petal_width",
                "species", "id"),
        type = c(rep("double precision", 4), "text", "integer primary key"),
        comment = paste("comment", 1:6))

# Create data frame for table content
iris_df <- iris
names(iris_df) <- taxlist::replace_x(x = names(iris_df),
    old = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width",
        "Species"),
    new = c("sepal_length", "sepal_width", "petal_length", "petal_width",
        "species"))
iris_df$id <- seq_len(nrow(iris_df))

# Connect data frame and create empty table
conn <- connect_db("test-db")

dbSendQuery(conn, "create schema if not exists data_frames")
dbSendQuery(conn, "drop table if exists data_frames.iris cascade")
dbSendQuery(conn, "create table if not exists data_frames.iris ()")

# Add columns without content
add_columns(conn, table_def, c("data_frames", "iris"))

# insert rows
insert_rows(conn, iris_df, c("data_frames", "iris"))

# Data frame for comparison
set.seed(42)
reviewed_df <- iris_df[sample(seq_len(nrow(iris_df)), 15), ]

reviewed_df$sepal_length[1] <- 100
reviewed_df$petal_width[3] <- 100
reviewed_df$id[5:7] <- 200:202

# Compare reviewed version
compare_df(conn, reviewed_df, "id", c("data_frames", "iris"))

# Update (only query)
query <- update_data(conn, reviewed_df, "id", c("data_frames", "iris"),
        eval = FALSE,
        add = TRUE,
        delete = TRUE,
        update = TRUE)
query

# Do update
update_data(conn, reviewed_df, "id", c("data_frames", "iris"),
        add = TRUE,
        delete = TRUE,
        update = TRUE)

disconnect_db(conn)
