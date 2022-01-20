#!/bin/sh
set -e
. ./script/export-test-envs.sh

echo "resetting dev data..."
rm -rf $LND_ALICE_DIR/data
rm -rf $LND_BOB_DIR/data
rm -rf $LND_NICK_DIR/data
rm -rf $BTCD_DIR/regtest
echo "dev data has been reset!"
