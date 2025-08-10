#!/bin/bash
. ./init-env.sh

EXTRA_BUILD_ARGS="--no-cache" make $1 -B -s