#!/bin/sh

set -m

export PATH=$PATH:/bin/
export PGDATA=$PWD/postgres
export PGHOST=/tmp/postgres
export PGLOG=$PWD/postgres/LOG
export PGDATABASE=postgres
export DATABASE_URL="postgresql:///postgres?host=$PGHOST"

#
# Postgres
#

if [[ $EUID -ne 0 ]]; then
    alias postgres-sh="sh"
else
    alias postgres-sh="su -m nixbld1"
fi

echo "shutdown postgres..."
postgres-sh -c 'pg_ctl stop -o "-c unix_socket_directories=$PGHOST"'
echo "shutdown hook executed"
