#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- haproxy "$@"
    echo "$@"
    echo "11111111111111"
fi

echo "$@"
echo "22222222222222"

exec "$@"