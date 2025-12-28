# load libraries
library(DBI)
library(divDB)

# Database created
# Credentials set

# Do the backup
do_backup(dbname = "iris-db", user = "miguel", filepath = "lab",
    f_timestamp = NULL)

# We connect postgres to create a database
# credentials(dbname = "postgres", user = "miguel")

conn <- connect_db(dbname = "postgres", user = "miguel")

# delete database if existing and create anew
dbExecute(conn, "drop database if exists \"tmp\"")
dbSendQuery(conn, "create database \"tmp\"")

disconnect_db(conn)

# Restore iris in tmp
# credentials(dbname = "tmp", user = "miguel")
do_restore(dbname = "tmp", user = "miguel", backup = "lab/iris-db.backup")

# Cross-check
conn <- connect_db(dbname = "tmp", user = "miguel")

dbGetQuery(conn, "select * from data_frames.iris limit 7")

disconnect_db(conn)
