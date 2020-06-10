FROM webhippie/nodejs:latest

LABEL maintainer="ownCloud GmbH <devops@owncloud.com>" \
    org.label-schema.name="Etherpad" \
    org.label-schema.vendor="ownCloud GmbH" \
    org.label-schema.schema-version="1.0"

ARG BUILD_VERSION=1.8.4
ENV ETHERPAD_VERSION="${BUILD_VERSION:-1.8.4}"

VOLUME ["/var/lib/etherpad"]

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/bin/s6-svscan", "/etc/s6"]
EXPOSE 9001
WORKDIR /srv/www

RUN apk update \
  && apk add libreoffice tidyhtml sqlite \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /var/lib/etherpad \
  && groupadd -g 1000 etherpad \
  && useradd -u 1000 -d /var/lib/etherpad -g etherpad -s /bin/bash -m etherpad

RUN ETHERPAD_VERSION="${ETHERPAD_VERSION##v}" && \
    echo "Installing Etherpad version '${ETHERPAD_VERSION}' ..." && \
    curl -SsL "https://github.com/ether/etherpad-lite/archive/${ETHERPAD_VERSION}.tar.gz" | \
        tar xz -C /srv/www --strip-components=1 && \
  && cd /srv/www/src \
  && npm install sqlite3 --save --loglevel warn \
  && npm install --loglevel warn \
  && chown -R etherpad:etherpad /srv/www

ADD overlay /
