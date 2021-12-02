#!/bin/sh

echo "==============================Coverage================================="
tixdir=$out
hpcdir=$(echo $buildInputs | tr " " "\n" | grep lnd-client-0.1.0.0)
cov=$(hpc report --hpcdir=$hpcdir/share/hpc/vanilla/mix/lnd-client-0.1.0.0 $tixdir/share/hpc/vanilla/tix/lnd-client-test/lnd-client-test.tix --exclude=Proto.InvoiceGrpc --exclude=Proto.InvoiceGrpc_Fields --exclude=Proto.LndGrpc --exclude=Proto.LndGrpc_Fields --exclude=Proto.RouterGrpc --exclude=Proto.RouterGrpc_Fields --exclude=Proto.WalletUnlockerGrpc --exclude=Proto.WalletUnlockerGrpc_Fields | grep "expressions used" | grep -oP '\d+(?=%)')
echo "Test coverage is: $cov%"
if [[ $cov -lt 80 ]]
then
  echo "Coverage is too low, failing..."
  exit 1
fi
echo "Coverage is good."
echo "==============================/Coverage================================="
