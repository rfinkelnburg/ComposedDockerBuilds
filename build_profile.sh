#!/bin/bash

BUILD_HOME="/root/build"
DOCKER_SOCK="/var/run/docker.sock"
COMPOSE_HOME="$BUILD_HOME/docker-compose"

if [ "$#" -ne 1 ]; then
    echo "$0 <profile>"
    echo "profiles:"
    echo "         php_v1"
    exit 1
fi

if [ $(uname -s) = 'Darwin' ] ; then
  SUDO=""
else
  SUDO="sudo"
fi

$SUDO docker run -v $PWD:$BUILD_HOME --env COMPOSE_PROFILE=$1 -v $DOCKER_SOCK:$DOCKER_SOCK --env DOCKER_SOCK=$DOCKER_SOCK --workdir=$COMPOSE_HOME --entrypoint="./docker-compose.sh" -ti --rm test/base
$SUDO docker tag dockercompose_$1 test/$1 
$SUDO docker rmi dockercompose_$1
