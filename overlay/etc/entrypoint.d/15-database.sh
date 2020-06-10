#!/bin/bash

declare -x ETHERPAD_DB_TYPE
[[ -z "${ETHERPAD_DB_TYPE}" ]] && ETHERPAD_DB_TYPE="mysql"

declare -x ETHERPAD_DB_USERNAME
[[ -z "${ETHERPAD_DB_USERNAME}" ]] && ETHERPAD_DB_USERNAME=""

declare -x ETHERPAD_DB_PASSWORD
[[ -z "${ETHERPAD_DB_PASSWORD}" ]] && ETHERPAD_DB_PASSWORD=""

declare -x ETHERPAD_DB_HOST
[[ -z "${ETHERPAD_DB_HOST}" ]] && ETHERPAD_DB_HOST=""

declare -x ETHERPAD_DB_DATABASE
[[ -z "${ETHERPAD_DB_DATABASE}" ]] && ETHERPAD_DB_DATABASE=""

declare -x ETHERPAD_DB_CHARSET
[[ -z "${ETHERPAD_DB_CHARSET}" ]] && ETHERPAD_DB_CHARSET="utf8mb4"

declare -x ETHERPAD_DB_FILENAME
[[ -z "${ETHERPAD_DB_FILENAME}" ]] && ETHERPAD_DB_FILENAME=""

case "${ETHERPAD_DB_TYPE}" in
  "sqlite")
    declare -x ETHERPAD_DB_FILENAME
    [[ -z "${ETHERPAD_DB_FILENAME}" ]] && ETHERPAD_DB_FILENAME="/var/lib/etherpad/database.sqlite3"
    ;;

  "mysql")
    declare -x ETHERPAD_DB_HOST
    [[ -z "${ETHERPAD_DB_HOST}" ]] && ETHERPAD_DB_HOST="mysql"

    declare -x ETHERPAD_DB_DATABASE
    [[ -z "${ETHERPAD_DB_DATABASE}" ]] && ETHERPAD_DB_DATABASE="etherpad"

    declare -x ETHERPAD_DB_USERNAME
    [[ -z "${ETHERPAD_DB_USERNAME}" ]] && ETHERPAD_DB_USERNAME="root"

    declare -x ETHERPAD_DB_PASSWORD
    [[ -z "${ETHERPAD_DB_PASSWORD}" ]] && ETHERPAD_DB_PASSWORD="root"
    ;;

  "postgres")
    declare -x ETHERPAD_DB_HOST
    [[ -z "${ETHERPAD_DB_HOST}" ]] && ETHERPAD_DB_HOST="postgres"

    declare -x ETHERPAD_DB_DATABASE
    [[ -z "${ETHERPAD_DB_DATABASE}" ]] && ETHERPAD_DB_DATABASE="etherpad"

    declare -x ETHERPAD_DB_USERNAME
    [[ -z "${ETHERPAD_DB_USERNAME}" ]] && ETHERPAD_DB_USERNAME="postgres"

    declare -x ETHERPAD_DB_PASSWORD
    [[ -z "${ETHERPAD_DB_PASSWORD}" ]] && ETHERPAD_DB_PASSWORD="postgres"
    ;;
esac
