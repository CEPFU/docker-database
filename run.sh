#!/bin/bash

# Check for boot2docker, if it exists, use it
boot2docker="$(which boot2docker)"

if [[ ! "$boot2docker" = "" ]]; then
    echo "Using boot2docker."
    boot2docker init
    boot2docker up
    eval "$(boot2docker shellinit)"
fi

# TODO: Extract user/pw/port to parameters?!
docker run --rm -e POSTGRES_USER=ems -e POSTGRES_PASSWORD=ems -p 5432:5432 kaltsimon/ems-database:latest
