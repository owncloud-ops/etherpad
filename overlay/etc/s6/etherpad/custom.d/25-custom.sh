#!/bin/bash

for CUSTOM in index pad timeslider
do
  if [[ ! -f /srv/www/src/static/custom/${CUSTOM}.js ]]
  then
    echo "> ensure ${CUSTOM} script"
    cp /srv/www/src/static/custom/js.template /srv/www/src/static/custom/${CUSTOM}.js
  fi

  if [[ ! -f /srv/www/src/static/custom/${CUSTOM}.css ]]
  then
    echo "> ensure ${CUSTOM} style"
    cp /srv/www/src/static/custom/css.template /srv/www/src/static/custom/${CUSTOM}.css
  fi
done
