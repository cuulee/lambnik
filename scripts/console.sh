#!/bin/bash

set -e

function usage() {
    echo -n "Usage: $(basename "${0}") [OPTION]
Login to a running Docker container's shell.
Options:
    database  Database container
    help      Display this help text
"
}

case $1 in
    database)     DATABASE_CONTAINER=1 ;;
    help|*)       usage; exit 1 ;;
esac

if [ -n "$NORMAL_CONTAINER" ]; then
    docker-compose exec "${1}" /bin/bash
fi

if [ -n "$DATABASE_CONTAINER" ]; then
    docker-compose exec database bash -c "psql -U lamb -d lambnik-test"
fi
