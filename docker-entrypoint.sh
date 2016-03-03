#!/bin/bash
set -e

if [ "$1" != 'bash' ]; then
	set -- make "$@"
fi

cd /data && cp -R * /build
cd /build

exec "$@"

if [ "$(ls -A /build/ebin)" ]; then
  cp -R /build/ebin /data
fi
