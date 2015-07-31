# Docker container for the database

## Running
```sh
docker run --rm -e POSTGRES_USER=ems -e POSTGRES_PASSWORD=ems -p 5432:5432 kaltsimon/ems-database:latest
```

# Inserting Data
To insert the data into the database, build the project `importer_database` using
```sh
mvn package
```
and then run it using
```sh
java -jar target/importer-database-*.jar [--help]
```

## Building
If you want to manually build this container, run
```sh
docker build .
```
