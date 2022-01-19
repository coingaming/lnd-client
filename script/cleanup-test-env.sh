#!/bin/sh

. ./script/export-test-envs.sh

lncli-alice stop || kill -9 `cat $LND_ALICE_DIR/lnd.pid` || true
lncli-bob stop || kill -9 `cat $LND_BOB_DIR/lnd.pid` || true
lncli-nick stop || kill -9 `cat $LND_NICK_DIR/lnd.pid` || true
bitcoin-cli stop || kill -9 `cat $BTCD_DIR/regtest/bitcoind.pid` || true
