# BizkaimovesApi

## Learn more

Steps to create a SQLite database from GTFS files:
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