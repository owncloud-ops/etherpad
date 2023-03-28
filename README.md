# etherpad

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-ops/etherpad/status.svg)](https://drone.owncloud.com/owncloud-ops/etherpad)
[![Docker Hub](https://img.shields.io/badge/docker-latest-blue.svg?logo=docker&logoColor=white)](https://hub.docker.com/r/owncloudops/etherpad)
[![Quay.io](https://img.shields.io/badge/quay-latest-blue.svg?logo=docker&logoColor=white)](https://quay.io/repository/owncloudops/etherpad)

Custom container image for [Etherpad](https://etherpad.org/).

## Ports

- 9001

## Bundled Plugins

- ep_padlist2
- ep_adminpads2
- ep_ldapauth

## Environment Variables

```Shell
ETHERPAD_TITLE="Etherpad"
ETHERPAD_FAVICON="favicon.ico"
ETHERPAD_SKIN_NAME="colibris"
ETHERPAD_SHOW_SETTING_IN_ADMIN="true"
ETHERPAD_DEFAULT_PAD_TEXT=
ETHERPAD_PAD_OPTIONS_NO_COLORS="false"
ETHERPAD_PAD_OPTIONS_SHOW_CONTROLS="true"
ETHERPAD_PAD_OPTIONS_SHOW_CHAT="true"
ETHERPAD_PAD_OPTIONS_SHOW_LINE_NUMBERS="true"
ETHERPAD_PAD_OPTIONS_USE_MONOSPACE_FONT="false"
ETHERPAD_PAD_OPTIONS_USERNAME="false"
ETHERPAD_PAD_OPTIONS_USERCOLOR="false"
ETHERPAD_PAD_OPTIONS_RTL="false"
ETHERPAD_PAD_OPTIONS_ALWAYS_SHOW_CHAT="false"
ETHERPAD_PAD_OPTIONS_CHAT_AND_USERS="false"
ETHERPAD_PAD_OPTIONS_LANG="en-us"
ETHERPAD_SUPPRESS_ERRORS_IN_PAD_TEXT="false"
ETHERPAD_REQUIRE_SESSION="false"
ETHERPAD_EDIT_ONLY="false"
ETHERPAD_MINIFY="true"
ETHERPAD_MAX_AGE="21600"
ETHERPAD_ALLOW_UNKNOWN_FILE_ENDS="true"
ETHERPAD_REQUIRE_AUTHENTICATION="false"
ETHERPAD_REQUIRE_AUTHORIZATION="false"
ETHERPAD_TRUST_PROXY="false"
ETHERPAD_DISABLE_IP_LOGGING="false"
ETHERPAD_SOCKET_TRANSPORT_PROTOCOLS="xhr-polling,jsonp-polling,htmlfile"
ETHERPAD_INDENTATION_ON_NEW_LINE="true"
ETHERPAD_LOG_LEVEL="INFO"
ETHERPAD_SSL_ENABLED="false"
ETHERPAD_SSL_KEY=
ETHERPAD_SSL_CERT=
ETHERPAD_SSL_CA=
ETHERPAD_DB_TYPE="mysql"
ETHERPAD_DB_USERNAME=
ETHERPAD_DB_PASSWORD=
ETHERPAD_DB_HOST=
ETHERPAD_DB_DATABASE=
ETHERPAD_DB_CHARSET="utf8mb4"
ETHERPAD_DB_FILENAME=
ETHERPAD_ADMIN_NAME="admin"
ETHERPAD_ADMIN_PASSWORD=
ETHERPAD_USER_NAME="user"
ETHERPAD_USER_PASSWORD=
ETHERPAD_USER_READONLY="false"
ETHERPAD_USER_CANCREATE="true"

ETHERPAD_LDAP_AUTH_ENABLED="false"
ETHERPAD_LDAP_HOST=
ETHERPAD_LDAP_BASEDN=
ETHERPAD_LDAP_USER_FILTER="(&(objectClass=inetOrgPerson)(uid={{username}}))"
ETHERPAD_LDAP_USER_NAME_ATTR="displayName"
ETHERPAD_LDAP_BINDDN=
ETHERPAD_LDAP_BIND_PASSWORD=
ETHERPAD_LDAP_GROUP_SEARCH_BASE=
ETHERPAD_LDAP_GROUP_ATTR="member"
ETHERPAD_LDAP_GROUP_SEARCH="(&(cn=admin)(objectClass=groupOfNames))"

# Uninstall bundled plugins
ETHERPAD_PLUGINS_REMOVE=
```

## Build

You could use the `BUILD_VERSION` to specify the target version.

```Shell
docker build --build-arg BUILD_VERSION=1.8.4 -f Dockerfile -t etherpad:latest .
```

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](https://github.com/owncloud-ops/etherpad/blob/main/LICENSE) file for details.
