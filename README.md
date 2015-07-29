# Docker container for the database

## Setup
Run
```sh
docker build .
```

to build the container, you can also use
```sh
docker build -t <user>/<repo>:<tag>
```

to create a tag for the container.

## Running
If you have created a tag, use
```sh
docker run -e POSTGRES_USER=ems -e POSTGRES_PASSWORD=ems -p 5432:5432 --rm <image>
```
where `<image>` is either the tag or the ID of the created image.

# Inserting Data
To insert the data into the database, build the project `importer_database` using
```sh
mvn package
```
and then run it using
```sh
java -jar target/importer_database-*.jar [--help]
```
