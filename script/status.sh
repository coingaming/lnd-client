#!/bin/sh

. ./script/export-test-envs.sh
bitcoin_pid=`cat $BTCD_DIR/regtest/bitcoind.pid`
alice_lnd_pid=`cat $LND_ALICE_DIR/lnd.pid`
bob_lnd_pid=`cat $LND_BOB_DIR/lnd.pid`
nick_lnd_pid=`cat $LND_NICK_DIR/lnd.pid`

ps u -p $bitcoin_pid
ps u -p $alice_lnd_pid
ps u -p $bob_lnd_pid
ps u -p $nick_lnd_pid
