# Load packages to session
library(keyring)
library(divDB)

# Set credentials
credentials(dbname = "iris-db", user = "miguel")
credentials(dbname = "iris-db", user = "guest")

key_list("iris-db")

# Delete credentials
delete_credentials(dbname = "iris-db", user = "guest")

key_list("iris-db")

# Non-existing credentials
key_list("my-secrets")
delete_credentials(dbname = "my-secrets", user = "myself")
