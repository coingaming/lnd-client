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

if [ ! -d $PGHOST ]; then
  echo 'initializing postgresql workspace...'
  postgres-sh -c "mkdir -p $PGHOST"
fi
if [ ! -d $PGDATA ]; then
  echo 'initializing postgresql database...'
  postgres-sh -c "mkdir -p $PGDATA"
  postgres-sh -c 'initdb $PGDATA --encoding=UTF8 --auth=trust >/dev/null'
fi

echo "starting postgres..."
postgres-sh -c 'pg_ctl start -o "-c listen_addresses=localhost -c unix_socket_directories=$PGHOST"'

# NOTE : some Postgres bullshit - it crashes if createdb is executed too soon
echo "sleeping for 3s to prevent postgres/createdb race condition..."
sleep 3

postgres-sh -c 'createdb lnd-client'

#
# Bitcoind
#

echo "starting bitcoind..."
bitcoind -datadir=$BTCD_DIR
echo "bitcoind has been started!"

#
# LND
#

# NOTE : some LND bullshit - it crashes if started after bitcoind too soon
echo "sleeping for 3s to prevent bitcoind/lnd race condition..."
sleep 3;

THIS_DIR="$(pwd)"

echo "starting lnd-merchant..."
cp $THIS_DIR/.lnd/tls* "$LND_MERCHANT_DIR/"
mkdir -p "$LND_MERCHANT_DIR/data/chain/bitcoin/regtest/"
cp $THIS_DIR/.lnd/*macaroon* "$LND_MERCHANT_DIR/data/chain/bitcoin/regtest/"
nohup lnd --lnddir=$LND_MERCHANT_DIR > $THIS_DIR/.lnd-merchant/stdout.log &
echo "lnd-merchant has been started!"

echo "starting lnd-customer..."
cp $THIS_DIR/.lnd/tls* "$LND_CUSTOMER_DIR/"
mkdir -p "$LND_CUSTOMER_DIR/data/chain/bitcoin/regtest/"
cp $THIS_DIR/.lnd/*macaroon* "$LND_CUSTOMER_DIR/data/chain/bitcoin/regtest/"
nohup lnd --lnddir=$LND_CUSTOMER_DIR > $THIS_DIR/.lnd-customer/stdout.log &
echo "lnd-customer has been started!"

echo "spawn-test-deps executed"
