#!/bin/bash

if [ $(uname -s) = 'Darwin' ] ; then
  SUDO=""
else
  SUDO="sudo"
fi

cd docker-compose
$SUDO docker build -t test/base .
