#!/bin/sh
set -e

# replace master password
if [ "x$MASTER_PASSWORD" != "x" ]
then
    sed -i 's/masterpassword/'"$MASTER_PASSWORD"'/g' /etc/haproxy/haproxy.cfg
else
    sed -i 's/masterpassword/'"$MASTER_DEFAULT_PASSWORD"'/g' /etc/haproxy/haproxy.cfg
fi


# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- haproxy "$@"
fi

if [ "$1" = 'haproxy' ]; then
    # if the user wants "haproxy", let's use "haproxy-systemd-wrapper" instead so we can have proper reloadability implemented by upstream
    shift # "haproxy"
    set -- haproxy-systemd-wrapper -p /run/haproxy.pid "$@"
fi

exec "$@"