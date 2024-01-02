# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(divDB)

# Credentials prompted
conn <- connect_db(dbname = "test-db", user = "miguel")

# Credentials not prompted (and error retrieved)
conn <- connect_db(dbname = "test-db", user = "miguel2", password = "pw")

# The same for package Rpostgres
conn <- connect_db(dbname = "test-db", user = "miguel", pkg = "RPostgres")
conn <- connect_db(dbname = "test-db", user = "miguel2", password = "pw",
    pkg = "RPostgres")
