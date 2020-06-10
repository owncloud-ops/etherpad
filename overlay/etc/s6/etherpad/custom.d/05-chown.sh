#!/bin/bash

echo "> chown etherpad home"
find /var/lib/etherpad \( \! -user etherpad -o \! -group etherpad \) -print0 | xargs -0 -r chown etherpad:etherpad
