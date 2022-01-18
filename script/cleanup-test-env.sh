#!/bin/sh

. ./script/export-test-envs.sh

lncli-merchant stop || kill -9 `cat $LND_ALICE_DIR/lnd.pid` || true
lncli-merchant stop || kill -9 `cat $LND_BOB_DIR/lnd.pid` || true
lncli-customer stop || kill -9 `cat $LND_NICK_DIR/lnd.pid` || true
bitcoin-cli stop || kill -9 `cat $BTCD_DIR/regtest/bitcoind.pid` || true
