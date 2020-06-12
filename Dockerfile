FROM node:10-alpine

LABEL maintainer="ownCloud GmbH <devops@owncloud.com>" \
    org.label-schema.name="Etherpad" \
    org.label-schema.vendor="ownCloud GmbH" \
    org.label-schema.schema-version="1.0"

ARG BUILD_VERSION=1.8.4
ENV ETHERPAD_VERSION="${BUILD_VERSION:-1.8.4}"
ENV NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL=error

ADD overlay /
WORKDIR /opt/app

RUN apk --update --no-cache add libreoffice tidyhtml

RUN addgroup -g 1001 -S app && \
    adduser -S -D -H -u 1001 -h /opt/app -s /sbin/nologin -G app -g app app

RUN apk --update add --virtual .build-deps curl tar && \
    curl -SsL -o /usr/local/bin/gomplate https://github.com/hairyhenderson/gomplate/releases/download/v3.5.0/gomplate_linux-amd64-slim && \
    chmod 755 /usr/local/bin/gomplate && \
    mkdir -p /opt/app/node_modules && \
    # workaround to get rid of some startup warnings
    mkdir -p /opt/app/.git && \
    echo "xxxxxpseudo" > /opt/app/.git/HEAD && \
    touch /opt/app/.git/pseudo && \
    ETHERPAD_VERSION="${ETHERPAD_VERSION##v}" && \
    echo "Installing Etherpad version '${ETHERPAD_VERSION}' ..." && \
    curl -SsL "https://github.com/ether/etherpad-lite/archive/${ETHERPAD_VERSION}.tar.gz" | \
        tar xz -C /opt/app -X /.tarignore --strip-components=1 && \
    cd /opt/app/node_modules && \
    ln -s ../src ep_etherpad-lite && \
    cd /opt/app/src/ && \
    npm ci --only=production && \
    chown -R app:app /opt/app && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

VOLUME ["/opt/app/node_modules"]

EXPOSE 9001

USER app

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD []
