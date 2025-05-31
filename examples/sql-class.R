## Write a SQL command as text
x <- "create table public.iris"

## Convert to sql class
new_sql(x)
as(x, "sql")
