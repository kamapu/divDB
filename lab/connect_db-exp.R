library(divDB)

# Set credentials
credentials(dbname = "iris-db", user = "miguel")

# Connect database
conn <- connect_db(dbname = "iris-db")

DBI::dbGetQuery(conn, "select * from data_frames.iris limit 5")

# Disconnect and delete credentials
disconnect_db(conn)
delete_credentials(dbname = "iris-db")

# Connect database (Error for non-existing credentials)
conn <- connect_db(dbname = "iris-db")
