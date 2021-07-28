#!/bin/sh

source ./script/export-test-envs.sh
bitcoin_pid=`cat $BTCD_DIR/regtest/bitcoind.pid`
merchant_lnd_pid=`cat $LND_MERCHANT_DIR/lnd.pid`
customer_lnd_pid=`cat $LND_CUSTOMER_DIR/lnd.pid`

lncli-merchant stop
lncli-customer stop
bitcoin-cli stop
