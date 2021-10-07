#!/bin/sh
#
# Bitcoind
#

set -e

. ./script/export-test-envs.sh

echo "starting bitcoind..."
bitcoind -datadir=$BTCD_DIR > "$BTCD_DIR/stdout.log" 2>&1 &
alias bitcoin-cli="bitcoin-cli -rpcwait -datadir=$BTCD_DIR -rpcport=18443"
bitcoin-cli getblockchaininfo && true
echo "bitcoind has been started!"

#
# LND
#

THIS_DIR="$(pwd)"

echo "starting lnd-merchant..."
cp $THIS_DIR/.lnd/tls* "$LND_MERCHANT_DIR/"
mkdir -p "$LND_MERCHANT_DIR/data/chain/bitcoin/regtest/"
cp $THIS_DIR/.lnd/*macaroon* "$LND_MERCHANT_DIR/data/chain/bitcoin/regtest/"
lnd --listen=127.0.0.1:9735 --debuglevel="RPCS=trace" --lnddir=$LND_MERCHANT_DIR > $THIS_DIR/.lnd-merchant/stdout.log & echo $! > "$LND_MERCHANT_DIR/lnd.pid"
echo "lnd-merchant has been started!"

echo "starting lnd-customer..."
cp $THIS_DIR/.lnd/tls* "$LND_CUSTOMER_DIR/"
mkdir -p "$LND_CUSTOMER_DIR/data/chain/bitcoin/regtest/"
cp $THIS_DIR/.lnd/*macaroon* "$LND_CUSTOMER_DIR/data/chain/bitcoin/regtest/"
lnd --listen=127.0.0.1:9734 --debuglevel="RPCS=trace" --lnddir=$LND_CUSTOMER_DIR > $THIS_DIR/.lnd-customer/stdout.log & echo $! > "$LND_CUSTOMER_DIR/lnd.pid"
echo "lnd-customer has been started!"

echo "spawn-test-deps executed"

onShellExit() {
  echo "Exit hook canceling stuff"
  #./script/cleanup-test-env.sh
}


trap onShellExit EXIT
