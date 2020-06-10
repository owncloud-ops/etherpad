#!/bin/bash

declare -x ETHERPAD_SSL_ENABLED
[[ -z "${ETHERPAD_SSL_ENABLED}" ]] && ETHERPAD_SSL_ENABLED="false"

declare -x ETHERPAD_SSL_KEY
[[ -z "${ETHERPAD_SSL_KEY}" ]] && ETHERPAD_SSL_KEY=""

declare -x ETHERPAD_SSL_CERT
[[ -z "${ETHERPAD_SSL_CERT}" ]] && ETHERPAD_SSL_CERT=""

declare -x ETHERPAD_SSL_CA
[[ -z "${ETHERPAD_SSL_CA}" ]] && ETHERPAD_SSL_CA=""
