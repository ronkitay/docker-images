#!/bin/bash
export REPO_ROOT=$(git rev-parse --show-toplevel)
export DOCKERHUB_USERNAME=$(cat ${REPO_ROOT}/.dockerhub_username)
export DOCKERHUB_TOKEN_FILE=${REPO_ROOT}/.dockerhub_password
export ARCHITECTURE=$(docker version --format '{{.Server.Arch}}')

docker login --username ${DOCKERHUB_USERNAME} --password-stdin < ${DOCKERHUB_TOKEN_FILE}