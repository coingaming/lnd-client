#!/bin/sh

. ./script/export-test-envs.sh
bitcoin_pid=`cat $BTCD_DIR/regtest/bitcoind.pid`
merchant_lnd_pid=`cat $LND_MERCHANT_DIR/lnd.pid`
customer_lnd_pid=`cat $LND_CUSTOMER_DIR/lnd.pid`

ps u -p $bitcoin_pid
ps u -p $merchant_lnd_pid
ps u -p $customer_lnd_pid
