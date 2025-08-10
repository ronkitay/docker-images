#!/bin/bash

export NORMAL=$(tput sgr0)
export BRIGHT=$(tput bold)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export BLUE=$(tput setaf 4)
export CYAN=$(tput setaf 6)
export WHITE=$(tput setaf 7)

if [[ -z "${MONGO_HOSTNAME}" ]]; then
    echo "${BRIGHT}${RED}'MONGO_HOSTNAME'${WHITE} not provided - exiting.${NORMAL}"
    exit 1
fi

if [[ -z "${MONGO_USERNAME}" ]]; then
    echo "${BRIGHT}${RED}'MONGO_USERNAME'${WHITE} not provided - exiting.${NORMAL}"
    exit 1
fi

if [[ -z "${MONGO_PASSWORD}" ]]; then
    echo "${BRIGHT}${RED}'MONGO_PASSWORD'${WHITE} not provided - exiting.${NORMAL}"
    exit 1
fi

if [[ -z "${MONGO_PROTOCOL}" ]]; then
    echo "${BRIGHT}${RED}'MONGO_PROTOCOL'${WHITE} not provided - exiting.${NORMAL}"
    exit 1
fi

if [[ -z "${MONGO_DB}" ]]; then
    MONGO_URL="${MONGO_PROTOCOL}://${MONGO_HOSTNAME}"
    echo "${BRIGHT}${WHITE}Connecting to [${GREEN}${MONGO_HOSTNAME}${WHITE}]${NORMAL}"
else
    MONGO_URL="${MONGO_PROTOCOL}://${MONGO_HOSTNAME}/${MONGO_DB}"
    echo "${BRIGHT}${WHITE}Connecting to [${GREEN}${MONGO_DB}${WHITE}] on [${GREEN}${MONGO_HOSTNAME}${WHITE}]${NORMAL}"
fi

/mongosh/bin/mongosh "${MONGO_URL}" -u ${MONGO_USERNAME} -p ${MONGO_PASSWORD}

exit
