#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

cid="$(docker run -d -e DEBUG --name "${NAME}" "${IMAGE}")"
trap "docker rm -vf $cid > /dev/null" EXIT

valkey() {
	docker run --rm -i -e DEBUG --link "${NAME}" "${IMAGE}" "${@}"
}

valkey make check-ready max_try=10 host="${NAME}"

echo -n "Checking Valkey version... "
valkey valkey-server -v | grep -q "v=${VALKEY_VER}"
echo "OK"

echo -n "Flushing Valkey cache... "
valkey make flushall host="${NAME}"
echo "OK"
