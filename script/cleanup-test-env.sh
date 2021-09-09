#!/bin/sh

set -e

source ./script/export-test-envs.sh
bitcoin_pid=`cat $BTCD_DIR/regtest/bitcoind.pid`
merchant_lnd_pid=`cat $LND_MERCHANT_DIR/lnd.pid`
customer_lnd_pid=`cat $LND_CUSTOMER_DIR/lnd.pid`

lncli-merchant stop && true
lncli-customer stop && true
bitcoin-cli stop && true

kill -9 "$merchant_lnd_pid" && true
kill -9 "$customer_lnd_pid" && true
kill -9 "$bitcoin_pid" && true
