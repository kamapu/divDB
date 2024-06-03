
library(divDB)
library(RPostgres)
library(sf)

# Retrieve credentials
cred <- credentials()

# First connection
conn <- connect_db(dbname = "vegetation-db", user = cred["user"],
    password = cred["password"])

# Create database and disconnect
dbSendQuery(conn, "create database iris")
dbDisconnect(conn)

# reconnect
conn <- connect_db(dbname = "iris", user = cred["user"],
    password = cred["password"])

dbSendQuery(conn, "create schema if not exists examples")
dbSendQuery(conn, "create extension if not exists postgis")

# Write table
survey <- read.csv("lab/data/patagonia-survey.csv")
survey <- subset(survey, !is.na(x.coord) & !is.na(y.coord))

survey <- st_as_sf(survey, coords = c("x.coord", "y.coord"), crs = 4326)

st_write(survey, conn, c("examples", "survey"))

# Set primary key
dbSendQuery(conn, "alter table examples.survey add primary key (\"Nr\")")

# Read and modify table
survey <- read.csv("lab/data/patagonia-survey.csv")
survey <- subset(survey, !is.na(x.coord) & !is.na(y.coord))

for(i in c("x.coord", "y.coord"))
  survey[i] <- survey[i][1]

survey <- st_as_sf(survey, coords = c("x.coord", "y.coord"), crs = 4326)

library(rpostgis)

pgWriteGeom(conn, c("examples", "survey"), survey[c("Nr", "geometry")], "geometry",
    upsert.using = "Nr")





