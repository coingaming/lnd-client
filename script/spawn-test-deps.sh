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

echo "starting lnd-alice..."
cp $THIS_DIR/.lnd/tls* "$LND_ALICE_DIR/"
mkdir -p "$LND_ALICE_DIR/data/chain/bitcoin/regtest/"
cp $THIS_DIR/.lnd/*macaroon* "$LND_ALICE_DIR/data/chain/bitcoin/regtest/"
lnd --listen=127.0.0.1:9735 --debuglevel="RPCS=trace" --lnddir=$LND_ALICE_DIR > $THIS_DIR/.lnd-alice/stdout.log & echo $! > "$LND_ALICE_DIR/lnd.pid"
echo "lnd-alice has been started!"

echo "starting lnd-bob..."
cp $THIS_DIR/.lnd/tls* "$LND_BOB_DIR/"
mkdir -p "$LND_BOB_DIR/data/chain/bitcoin/regtest/"
cp $THIS_DIR/.lnd/*macaroon* "$LND_BOB_DIR/data/chain/bitcoin/regtest/"
lnd --listen=127.0.0.1:9734 --debuglevel="RPCS=trace" --lnddir=$LND_BOB_DIR > $THIS_DIR/.lnd-bob/stdout.log & echo $! > "$LND_BOB_DIR/lnd.pid"
echo "lnd-bob has been started!"

echo "starting lnd-nick..."
cp $THIS_DIR/.lnd/tls* "$LND_NICK_DIR/"
mkdir -p "$LND_NICK_DIR/data/chain/bitcoin/regtest/"
cp $THIS_DIR/.lnd/*macaroon* "$LND_NICK_DIR/data/chain/bitcoin/regtest/"
lnd --listen=127.0.0.1:9736 --debuglevel="RPCS=trace" --lnddir=$LND_NICK_DIR > $THIS_DIR/.lnd-nick/stdout.log & echo $! > "$LND_NICK_DIR/lnd.pid"
echo "lnd-nick has been started!"

echo "spawn-test-deps executed"

onShellExit() {
  echo "Exit hook canceling stuff"
  #./script/cleanup-test-env.sh
}


trap onShellExit EXIT
