# Etherpad

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-ops/etherpad/status.svg)](https://drone.owncloud.com/owncloud-ops/etherpad)

These are docker images for [Etherpad](http://etherpad.org/) running on an [Nodejs container](https://registry.hub.docker.com/u/webhippie/nodejs/).


## Volumes

* /var/lib/etherpad


## Ports

* 9001


## Available environment variables

```bash
ETHERPAD_TITLE Etherpad
ETHERPAD_FAVICON favicon.ico
ETHERPAD_SHOW_SETTING_IN_ADMIN true
ETHERPAD_DEFAULT_PAD_TEXT Welcome to Etherpad! This pad text is synchronized as you type, so that everyone viewing this page sees the same text. This allows you to collaborate seamlessly on documents!
ETHERPAD_PAD_OPTIONS_NO_COLORS false
ETHERPAD_PAD_OPTIONS_SHOW_CONTROLS true
ETHERPAD_PAD_OPTIONS_SHOW_CHAT true
ETHERPAD_PAD_OPTIONS_SHOW_LINE_NUMBERS true
ETHERPAD_PAD_OPTIONS_USE_MONOSPACE_FONT false
ETHERPAD_PAD_OPTIONS_USERNAME false
ETHERPAD_PAD_OPTIONS_USERCOLOR false
ETHERPAD_PAD_OPTIONS_RTL false
ETHERPAD_PAD_OPTIONS_ALWAYS_SHOW_CHAT false
ETHERPAD_PAD_OPTIONS_CHAT_AND_USERS false
ETHERPAD_PAD_OPTIONS_LANG en-gb
ETHERPAD_SUPPRESS_ERRORS_IN_PAD_TEXT false
ETHERPAD_REQUIRE_SESSION false
ETHERPAD_EDIT_ONLY false
ETHERPAD_SESSION_NO_PASSWORD false
ETHERPAD_MINIFY true
ETHERPAD_MAX_AGE 21600
ETHERPAD_ALLOW_UNKNOWN_FILE_ENDS true
ETHERPAD_REQUIRE_AUTHENTICATION false
ETHERPAD_REQUIRE_AUTHORIZATION false
ETHERPAD_TRUST_PROXY false
ETHERPAD_DISABLE_IP_LOGGING false
ETHERPAD_SOCKET_TRANSPORT_PROTOCOLS xhr-polling,jsonp-polling,htmlfile
ETHERPAD_LOAD_TEST false
ETHERPAD_INDENTATION_ON_NEW_LINE true
ETHERPAD_LOG_LEVEL INFO
ETHERPAD_SSL_ENABLED false
ETHERPAD_SSL_KEY
ETHERPAD_SSL_CERT
ETHERPAD_SSL_CA
ETHERPAD_DB_TYPE mysql
ETHERPAD_DB_USERNAME
ETHERPAD_DB_PASSWORD
ETHERPAD_DB_HOST
ETHERPAD_DB_DATABASE
ETHERPAD_DB_CHARSET utf8mb4
ETHERPAD_DB_FILENAME
ETHERPAD_ADMIN_NAME admin
ETHERPAD_ADMIN_PASSWORD
ETHERPAD_USER_NAME user
ETHERPAD_USER_PASSWORD
ETHERPAD_USERS_JSON
ETHERPAD_GITHUB_ENABLED false
ETHERPAD_GITHUB_APP_ID
ETHERPAD_GITHUB_APP_SECRET
ETHERPAD_GITHUB_ORGANIZATION
ETHERPAD_GITHUB_TEAM
ETHERPAD_GITHUB_USERS
```


## Inherited environment variables

* [webhippie/nodejs](https://github.com/dockhippie/nodejs#available-environment-variables)
* [webhippie/alpine](https://github.com/dockhippie/alpine#available-environment-variables)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [ownCloud DevOps](https://github.com/orgs/owncloud-ops/people)


## License

This project is licensed under the Apache 2.0 License - see the LICENSE file for details.

## Copyright

```
Copyright (c) 2015-2017 ownCloud
```
