#!/bin/sh

cd $(dirname $0)

if [[ -f prepare.sh ]]; 
then
    ./prepare.sh
fi

BUILD_ARGS=$(cat $(git rev-parse --show-toplevel)/versions | awk '{print " --build-arg "$0" "}')

export DOCKER_BUILDKIT=0

docker build ${BUILD_ARGS} -t $(basename $(pwd)):$(cat $(pwd)/release) .
