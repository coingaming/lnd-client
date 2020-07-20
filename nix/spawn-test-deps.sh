#!/bin/sh

set -m

#
# Bitcoind
#

echo "starting bitcoind..."
bitcoind -datadir=$BTCD_DIR
echo "bitcoind has been started!"

#
# LND
#

# NOTE : some LND bullshit - it crashes if started after bitcoind too soon
echo "sleeping for 3s to prevent bitcoind/lnd race condition..."
sleep 3;

THIS_DIR="$(pwd)"

echo "starting lnd-merchant..."
cp $THIS_DIR/.lnd/tls* "$LND_MERCHANT_DIR/"
mkdir -p "$LND_MERCHANT_DIR/data/chain/bitcoin/regtest/"
cp $THIS_DIR/.lnd/*macaroon* "$LND_MERCHANT_DIR/data/chain/bitcoin/regtest/"
nohup lnd --debuglevel="RPCS=trace" --lnddir=$LND_MERCHANT_DIR > $THIS_DIR/.lnd-merchant/stdout.log &
echo "lnd-merchant has been started!"

echo "starting lnd-customer..."
cp $THIS_DIR/.lnd/tls* "$LND_CUSTOMER_DIR/"
mkdir -p "$LND_CUSTOMER_DIR/data/chain/bitcoin/regtest/"
cp $THIS_DIR/.lnd/*macaroon* "$LND_CUSTOMER_DIR/data/chain/bitcoin/regtest/"
nohup lnd --debuglevel="RPCS=trace" --lnddir=$LND_CUSTOMER_DIR > $THIS_DIR/.lnd-customer/stdout.log &
echo "lnd-customer has been started!"

echo "spawn-test-deps executed"
