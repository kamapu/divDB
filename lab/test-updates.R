# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(RPostgreSQL)
library(divDB)

conn <- connect_db("example_db", user = "miguel")

if (dbExistsTable(conn, c("data_frames", "iris_df")))
  dbRemoveTable(conn, c("data_frames", "iris_df"))

iris2 <- iris[1:10, ]
iris2$id <- 1:nrow(iris2)
dbWriteTable(conn, c("data_frames", "iris_df"), iris2, row.names = FALSE)

## dbWriteTable(conn, c("data_frames", "iris_df"), iris[1:10, ])
## dbSendQuery(conn, paste("alter table data_frames.iris_df",
##         "rename column \"row.names\" to id"))

# Test update
iris_new <- dbGetQuery(conn, "select * from data_frames.iris_df")
iris_new[2:4, 5] <- c(200, 300, 400)
iris_new[8, 3] <- 500

compare_df(conn, iris_new, key = "id", name = c("data_frames", "iris_df"))

update_data(conn, iris_new, name = c("data_frames", "iris_df"), key = "id",
    update = TRUE)
compare_df(conn, iris_new, key = "id", name = c("data_frames", "iris_df"))

# Test add
iris_new <- dbGetQuery(conn, "select * from data_frames.iris_df")
iris_new <- rbind(iris_new, iris_new[3, ])
iris_new$id[length(iris_new$id)] <- max(iris_new$id) + 1

compare_df(conn, iris_new, key = "id", name = c("data_frames", "iris_df"))

update_data(conn, iris_new, name = c("data_frames", "iris_df"), key = "id",
    add = TRUE)
compare_df(conn, iris_new, key = "id", name = c("data_frames", "iris_df"))

# Test delete
iris_new <- dbGetQuery(conn, "select * from data_frames.iris_df")
iris_new <- iris_new[-4, ]

compare_df(conn, iris_new, key = "id", name = c("data_frames", "iris_df"))

update_data(conn, iris_new, name = c("data_frames", "iris_df"), key = "id",
    delete = TRUE)
compare_df(conn, iris_new, key = "id", name = c("data_frames", "iris_df"))
