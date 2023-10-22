# BizkaimovesApi
The backend that support Bizkaimoves application.

## Generate a SQLite database from GTFS
We use https://github.com/blinktaginc/node-gtfs to parse GTFS files into a SQLite database:

- Create a gtfs_config file, it should looks something like this:

```
{
  "sqlitePath": "/Users/david/dev/gtfs/bizkaibus.db",
  "agencies": [
    {
      "path": "/Users/david/dev/gtfs/gtfs_bizkaibus.zip",
      "exclude": ["levels", "shapes"]
    }
  ]
}
```

- Execute the script to generate the database:
```
gtfs-import --configPath /path/to/your/custom-config.json
```

- Convert the generated SQLite database to Postgres:

  1.- Create a new postgree database:
  ```
  createdb my_postgres_db
  ```
  2.- Use pgloader to perform the migration:
  ```
  pgloader sqlite:///path_to_your_sqlite.db postgresql:///my_postgres_db
  ```
