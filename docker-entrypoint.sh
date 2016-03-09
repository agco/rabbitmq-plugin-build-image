#!/bin/bash
set -e

echo "Args = $1"
echo "@ `pwd`"

if [ "$1" != 'bash' ]; then
	set -- make "$@"
fi

if [[ -n "$CLEAN_REPO" ]]; then
	if [ "$(ls -A /data)" ]; then
		cd /data && cp -R * /build
		cd /build
	fi
fi

exec "$@"

if [[ -n "$CLEAN_REPO" ]]; then
	if [ "$(ls -A /build/plugins)" ]; then
	  cp -R /build/plugins /data
	fi
fi
