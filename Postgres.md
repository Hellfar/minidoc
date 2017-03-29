Postgres
========

## Browse through structures

List databases:

```
    # \list
    # \l
```

Connect to a database with its name:

```
    # \connect database_name
    # \c database_name
```

List tables from connected database:

```
    # \dt
```

Describe a table with its name from connected database:

```
    # \d table_name
    # \d+ table_name
```

## Tips

From a rails app:

```
    $ rails db
```

## References

[https://www.postgresql.org/docs/current/static/app-psql.html#APP-PSQL-META-COMMANDS](https://www.postgresql.org/docs/current/static/app-psql.html#APP-PSQL-META-COMMANDS)