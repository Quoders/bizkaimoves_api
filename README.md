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
  3.- TODO...

## Relevant database queries
- Get itinerary of a route at a specific day of the week and time:
```
SELECT s.stop_id, s.stop_name, s.stop_lat, s.stop_lon
FROM stops s
JOIN stop_times st ON s.stop_id = st.stop_id
JOIN (
    SELECT t.trip_id
    FROM trips t
    JOIN calendar c ON t.service_id = c.service_id
    WHERE t.route_id = '2151'
    AND t.direction_id = 0
    AND c.sunday = TRUE
    LIMIT 1
) AS t ON st.trip_id = t.trip_id
WHERE st.departure_time >= '08:00:00'
ORDER BY st.stop_sequence;
```
