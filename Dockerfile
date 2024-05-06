ARG VALKEY_VER

FROM valkey/valkey:${VALKEY_VER}-alpine

ARG TARGETPLATFORM

ENV VALKEY_VER="${VALKEY_VER}"

RUN apk add --update --no-cache -t .wodby-valkey-run-deps \
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
    gotpl_url="https://github.com/wodby/gotpl/releases/download/0.3.3/gotpl-${dockerplatform/\//-}.tar.gz"; \
    wget -qO- "${gotpl_url}" | tar xz --no-same-owner -C /usr/local/bin; \
    \
    apk del .wodby-valkey-build-deps; \
    rm -rf /var/cache/apk/*

COPY templates /etc/gotpl/

COPY docker-entrypoint.sh /
COPY bin /usr/local/bin/

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "valkey-server" , "/etc/valkey.conf" ]
