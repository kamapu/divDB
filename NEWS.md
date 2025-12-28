# divDB 0.2

## New features

- New function `disconnect_db()` to disconnect database connections.
- New funciton `new_sql()` to create empty `sql` objects.
- Coercion of `character` vectors to `sql` using either `new_sql()` or 
  `as(x, "sql")`.
- A series of functions writing sql statements independent of a database
  connection.
- New function `delete_credentials()` to unset stored credentials.

## Improvements

- Function `credentials()` is using package **keyring**.

## Bug fixes

- Function `write_sql()` is now using `writeLines()` instead of `writeBin()`.
- Some issues solved with `print.sql()`.

## Bug fixes

- Error in `update_data()` when using a character vector as key value.

# divDB 0.1.2

## Improvements

- Functions `add_columns()`, `insert_rows()`, `update_data()`, and
  `update_rows()` produce sql scripts and invisible objects.
- Documentation adapted to new check rules.

# divDB 0.1.0

## New features

- First release!
