#!/bin/bash

# Check for docker-machine
DOCKER_MACHINE="$(which docker-machine)"
# Check for boot2docker, if it exists, use it
boot2docker="$(which boot2docker)"

if [[ ! "$DOCKER_MACHINE" = "" ]]; then
    VM=default
    VBOXMANAGE=/Applications/VirtualBox.app/Contents/MacOS/VBoxManage
    echo "Using docker-machine."
    unset DYLD_LIBRARY_PATH
    unset LD_LIBRARY_PATH

    clear

    if [ ! -f $DOCKER_MACHINE ] || [ ! -f $VBOXMANAGE ]; then
      echo "Either VirtualBox or Docker Machine are not installed. Please re-run the Toolbox Installer and try again."
      exit 1
    fi

    $VBOXMANAGE showvminfo $VM &> /dev/null
    VM_EXISTS_CODE=$?

    if [ $VM_EXISTS_CODE -eq 1 ]; then
      echo "Creating Machine $VM..."
      $DOCKER_MACHINE rm -f $VM &> /dev/null
      rm -rf ~/.docker/machine/machines/$VM
      $DOCKER_MACHINE create -d virtualbox --virtualbox-memory 2048 $VM
    else
      echo "Machine $VM already exists in VirtualBox."
    fi

    $DOCKER_MACHINE start $VM

    eval $($DOCKER_MACHINE env $VM)
elif [[ ! "$boot2docker" = "" ]]; then
    echo "Using boot2docker."
    boot2docker init
    boot2docker up
    eval "$(boot2docker shellinit)"
fi

# TODO: Extract user/pw/port to parameters?!
docker run --rm -e POSTGRES_USER=ems -e POSTGRES_PASSWORD=ems -p 5432:5432 kaltsimon/ems-database:latest
