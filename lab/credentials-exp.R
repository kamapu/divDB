# TODO:   Example for credentials
# 
# Author: Miguel Alvarez
################################################################################

library(keyring)
library(divDB)

# Set credentials
credentials(dbname = "iris-db", user = "miguel")

key_list("iris-db")

# Delete credentials
delete_credentials(dbname = "iris-db")

key_list("iris-db")

# Non-existing credentials
key_list("my-secrets")
