FROM docker.io/amd64/node:16-alpine@sha256:82bcf77a5de631c6b19f4449ccec82bfbb7d8f6c94d6ae3bdf760ed67e080cb1

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>"
LABEL org.opencontainers.image.authors="ownCloud DevOps <devops@owncloud.com>"
LABEL org.opencontainers.image.title="Etherpad Lite"
LABEL org.opencontainers.image.url="https://github.com/owncloud-ops/etherpad"
LABEL org.opencontainers.image.source="https://github.com/owncloud-ops/etherpad"
LABEL org.opencontainers.image.documentation="https://github.com/owncloud-ops/etherpad"

ARG BUILD_VERSION
ARG ETHERPAD_PLUGINS
ARG GOMPLATE_VERSION
ARG WAIT_FOR_VERSION
ARG CONTAINER_LIBRARY_VERSION

# renovate: datasource=github-releases depName=ether/etherpad-lite
ENV ETHERPAD_VERSION="${BUILD_VERSION:-v1.9.0}"
# renovate: datasource=github-releases depName=hairyhenderson/gomplate
ENV GOMPLATE_VERSION="${GOMPLATE_VERSION:-v3.11.5}"
# renovate: datasource=github-releases depName=thegeeklab/wait-for
ENV WAIT_FOR_VERSION="${WAIT_FOR_VERSION:-v0.4.2}"
# renovate: datasource=github-releases depName=owncloud-ops/container-library
ENV CONTAINER_LIBRARY_VERSION="${CONTAINER_LIBRARY_VERSION:-v0.1.0}"

ENV NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL=silent

ADD overlay /
WORKDIR /opt/app

RUN apk --update --no-cache add libreoffice tidyhtml

RUN addgroup -g 1001 -S app && \
    adduser -S -D -H -u 1001 -h /opt/app -s /sbin/nologin -G app -g app app

RUN apk --update add --virtual .build-deps curl tar git make && \
    curl -SsfL -o /usr/local/bin/gomplate "https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64" && \
    curl -SsfL -o /usr/local/bin/wait-for "https://github.com/thegeeklab/wait-for/releases/download/${WAIT_FOR_VERSION}/wait-for" && \
    curl -SsfL "https://github.com/owncloud-ops/container-library/releases/download/${CONTAINER_LIBRARY_VERSION}/container-library.tar.gz" | tar xz -C / && \
    chmod 755 /usr/local/bin/gomplate && \
    chmod 755 /usr/local/bin/wait-for && \
    mkdir -p /opt/app/node_modules && \
    # workaround to get rid of some startup warnings
    mkdir -p /opt/app/.git && \
    echo "xdocker" > /opt/app/.git/HEAD && \
    touch /opt/app/.git/xdocker && \
    ETHERPAD_VERSION="${ETHERPAD_VERSION##v}" && \
    echo "Installing Etherpad 'v${ETHERPAD_VERSION}'" && \
    curl -SsfL "https://github.com/ether/etherpad-lite/archive/${ETHERPAD_VERSION}.tar.gz" | \
        tar xz -C /opt/app -X /.tarignore --strip-components=1 && \
    cd /opt/app/ && \
    npm i --no-save --legacy-peer-deps ${ETHERPAD_PLUGINS} || exit 1 && \
    cd /opt/app/node_modules && \
    ln -s ../src ep_etherpad-lite && \
    cd /opt/app/src/ && \
    npm ci --no-optional && \
    npm link && \
    chown -R app:app /opt/app && \
    apk del .build-deps && \
    rm -f /opt/app/var/minified* && \
    rm -rf /root/.npm/ && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

EXPOSE 9001

USER app

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD []
