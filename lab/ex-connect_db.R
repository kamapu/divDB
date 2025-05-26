library(divDB)

# Credentials prompted
conn <- connect_db(dbname = "test-db", user = "miguel")
disconnect_db(conn)

# Credentials not prompted (and error retrieved)
conn <- connect_db(dbname = "test-db", user = "miguel2", password = "pw")

# The same for package Rpostgres
conn <- connect_db(dbname = "test-db", user = "miguel", pkg = "RPostgres")
disconnect_db(conn)

conn <- connect_db(dbname = "test-db", user = "miguel2", password = "pw",
    pkg = "RPostgres")
