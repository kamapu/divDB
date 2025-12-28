# Load package
library(divDB)

# Set credentials
credentials(dbname = "iris-db", user = "miguel")

# Connect database
conn <- connect_db(dbname = "iris-db", user = "miguel")

DBI::dbGetQuery(conn, "select * from data_frames.iris limit 5")

# Disconnect
disconnect_db(conn)

# Connect database (Error for non-existing credentials)
conn <- connect_db(dbname = "iris-db", user = "elzorro")
