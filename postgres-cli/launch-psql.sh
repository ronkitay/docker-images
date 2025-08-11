#!/bin/bash

export NORMAL=$(tput sgr0)
export BRIGHT=$(tput bold)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export BLUE=$(tput setaf 4)
export CYAN=$(tput setaf 6)
export WHITE=$(tput setaf 7)

echo "${BRIGHT}${BLUE}Connecting to [${WHITE}${PG_DB}@${PG_HOSTNAME}${BLUE}]${NORMAL}"

export PGPASSWORD=${PG_PASSWORD}
export PGOPTIONS="-c search_path=${PG_SCHEMA}"

COMMAND="psql -h ${PG_HOSTNAME} -p ${PG_PORT} --username=${PG_USERNAME} -d ${PG_DB}"

if [ -z "${FILE_NAME}" ]; then
    echo "${BRIGHT}${YELLOW}Running Command [${WHITE}${COMMAND}${YELLOW}]${NORMAL}"
    eval ${COMMAND}
else
    echo "${BRIGHT}${YELLOW}Running Command [${WHITE}${COMMAND} -f ${FILE_NAME}${YELLOW}]${NORMAL}"
    eval ${COMMAND} -f ${FILE_NAME} | cat
fi

exit
