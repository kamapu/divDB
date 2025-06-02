library(divDB)

# Create data frame for database
df <- data.frame(
        name = c("sepal_length", "sepal_width", "petal_length", "petal_width",
                "species"),
        type = c(rep("double precision", 4), "text"),
        comment = paste("comment", 1:5))

# Write Queries without comment
add_columns_sql(df[ , c("name", "type")], c("data_frames", "iris2"))

# Write queries including comments
add_columns_sql(df, c("data_frames", "iris2"))

# Connect data frame
conn <- connect_db("test-db")

dbSendQuery(conn, "create schema if not exists data_frames")
dbSendQuery(conn, "create table if not exists data_frames.iris2 ()")

# Add 3 columns (only query)
query <- add_columns(conn, df[1:3, ], c("data_frames", "iris2"), eval = FALSE)
query

# Add 3 collumnst to database
add_columns(conn, df[1:3, ], c("data_frames", "iris2"))

# Error if table does not exists
add_columns(conn, df[1:3, ], c("data_frames", "iris20"), eval = FALSE)

# Error if column does exists
add_columns(conn, df[3:5, ], c("data_frames", "iris2"), eval = FALSE)

# Add 3 further columns to database
add_columns(conn, df[4:5, ], c("data_frames", "iris2"))

disconnect_db(conn)
