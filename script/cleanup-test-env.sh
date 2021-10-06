#!/bin/sh

. ./script/export-test-envs.sh

lncli-merchant stop || kill -9 `cat $LND_MERCHANT_DIR/lnd.pid` || true
lncli-customer stop || kill -9 `cat $LND_CUSTOMER_DIR/lnd.pid` || true
bitcoin-cli stop || kill -9 `cat $BTCD_DIR/regtest/bitcoind.pid` || true
