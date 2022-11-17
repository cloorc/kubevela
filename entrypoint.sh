#!/bin/sh
set -x

if [ "${1#-}" != "$1" ]; then
    set -- dlv --listen=:2345 --headless=true --log=true --log-output=debugger,debuglineerr,gdbwire,lldbout,rpc --accept-multiclient --api-version=2 exec /usr/local/bin/manager --continue -- "$@"
fi

if [ "$1" = "apiserver" ]; then
    shift # "apiserver"
    set -- dlv --listen=:2345 --headless=true --log=true --log-output=debugger,debuglineerr,gdbwire,lldbout,rpc --accept-multiclient --api-version=2 exec /usr/local/bin/apiserver --continue -- "$@"
fi

exec "$@"
