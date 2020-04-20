#!/bin/sh

echo "resetting dev data..."
rm -rf $LND_CUSTOMER_DIR/data
rm -rf $LND_MERCHANT_DIR/data
rm -rf $BTCD_DIR/regtest
echo "dev data has been reset!"
