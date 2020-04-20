#!/bin/sh

echo "resetting dev data..."
rm -rf $LND_CUSTOMER_DIR/data
rm -rf $LND_MERCHANT_DIR/data
rm -rf $BTCD_DIR/regtest
rm -rf $PGDATA
echo "dev data has been reset!"
