#!/bin/bash

if [ -z "${ETHERPAD_ADMIN_PASSWORD}" ]
then
  ETHERPAD_ADMIN_PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20 ; echo '')
  echo >&2 "Warning: ETHERPAD_ADMIN_PASSWORD is not defined, set to '${ETHERPAD_ADMIN_PASSWORD}'"
fi

if [ -z "${ETHERPAD_USER_PASSWORD}" ]
then
  ETHERPAD_USER_PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20 ; echo '')
  echo >&2 "Warning: ETHERPAD_USER_PASSWORD is not defined, set to '${ETHERPAD_USER_PASSWORD}'"
fi

case "${ETHERPAD_DB_TYPE}" in
  "sqlite")
    if [ -z "${ETHERPAD_DB_FILENAME}" ]
    then
      echo >&2 "Error: You have to provide ETHERPAD_DB_FILENAME environment variable"
      /bin/s6-svscanctl -t /etc/s6
      exit 1
    fi

    if [ ! -f "${ETHERPAD_DB_FILENAME}" ]
    then
      echo "> creating empty database"
      su-exec etherpad /usr/bin/sqlite3 ${ETHERPAD_DB_FILENAME} ""
    fi
    ;;

  "mysql")
    if [ -z "${ETHERPAD_DB_USERNAME}" ]
    then
      echo >&2 "Error: You have to provide ETHERPAD_DB_USERNAME environment variable"
      /bin/s6-svscanctl -t /etc/s6
      exit 1
    fi

    if [ -z "${ETHERPAD_DB_PASSWORD}" ]
    then
      echo >&2 "Error: You have to provide ETHERPAD_DB_PASSWORD environment variable"
      /bin/s6-svscanctl -t /etc/s6
      exit 1
    fi
    ;;

  "postgres")
    if [ -z "${ETHERPAD_DB_USERNAME}" ]
    then
      echo >&2 "Error: You have to provide ETHERPAD_DB_USERNAME environment variable"
      /bin/s6-svscanctl -t /etc/s6
      exit 1
    fi

    if [ -z "${ETHERPAD_DB_PASSWORD}" ]
    then
      echo >&2 "Error: You have to provide ETHERPAD_DB_PASSWORD environment variable"
      /bin/s6-svscanctl -t /etc/s6
      exit 1
    fi
    ;;
esac
