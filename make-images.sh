#!/usr/bin/env bash

if [[ "mirror"=="$1" ]]; then
    docker build -t $(cat ./IMAGE_NAME.txt) . -f ./build-with-mirror/Dockerfile
else
    docker build -t $(cat ./IMAGE_NAME.txt) .
fi;
