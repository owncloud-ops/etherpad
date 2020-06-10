#!/bin/bash

echo "> chown etherpad files"
find /srv/www \( \! -user etherpad -o \! -group etherpad \) -print0 | xargs -0 -r chown etherpad:etherpad
