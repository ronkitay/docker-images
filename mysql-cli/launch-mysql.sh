#!/bin/bash

export NORMAL=$(tput sgr0)
export BRIGHT=$(tput bold)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export BLUE=$(tput setaf 4)
export CYAN=$(tput setaf 6)
export WHITE=$(tput setaf 7)

echo "${BRIGHT}${BLUE}Connecting to [${WHITE}${MYSQL_DB}@${MYSQL_HOSTNAME}${BLUE}]${NORMAL}"

COMMAND="mysql -h ${MYSQL_HOSTNAME} -P ${MYSQL_PORT} --database ${MYSQL_DB} --user=${MYSQL_USERNAME} --password=${MYSQL_PASSWORD}"

echo "${BRIGHT}${YELLOW}Running Command [${WHITE}${COMMAND}${YELLOW}]${NORMAL}"
eval ${COMMAND}

exit
