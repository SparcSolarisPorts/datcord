#!/bin/sh
# Native Datcord build entry point for Oracle Solaris 11.4 / SPARC64.
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PYTHON=${PYTHON:-python3}
cd "$ROOT"

if [ ! -f neutron/configurator.py ]; then
    git submodule sync -- neutron
    git submodule update --init --recursive neutron
fi

if [ ! -f neutron/src/mozconfig.solaris-sparc64 ]; then
    echo "The Neutron submodule does not contain the Solaris/SPARC64 port." >&2
    echo "Run install_solaris_sparc_port.py first." >&2
    exit 1
fi

git -C neutron submodule update --init --recursive
cd neutron
exec "$PYTHON" configurator.py \
    --config-file=../resources/config.solaris-sparc64.json \
    -b "$@"
