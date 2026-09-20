# check=skip=InvalidDefaultArgInFrom

# The Makefile supplies the required digest-pinned BASE_IMAGE argument.
ARG VALKEY_VER=9.0.0

ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG TARGETPLATFORM
ARG VALKEY_VER

ENV VALKEY_VER="${VALKEY_VER}"

# Upgrade inherited packages even when their existing versions satisfy dependencies.
RUN set -ex; \
    apk upgrade --no-cache; \
    apk add --update --no-cache -t .wodby-valkey-run-deps \
        bash \
        make \
        tzdata; \
    \
    apk add --update --no-cache -t .wodby-valkey-build-deps \
        ca-certificates \
        tar \
        wget; \
    \
    dockerplatform=${TARGETPLATFORM:-linux\/amd64};\
    gotpl_url="https://github.com/wodby/gotpl/releases/latest/download/gotpl-${dockerplatform/\//-}.tar.gz"; \
    wget -qO- "${gotpl_url}" | tar xz --no-same-owner -C /usr/local/bin; \
    \
    apk del .wodby-valkey-build-deps; \
    rm -rf /var/cache/apk/*

COPY templates /etc/gotpl/

COPY docker-entrypoint.sh /
COPY bin /usr/local/bin/

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "valkey-server" , "/etc/valkey.conf" ]
