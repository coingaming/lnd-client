#!/bin/sh

echo "==============================Coverage================================="
tixdir=$out
hpcdir=$(echo $buildInputs | tr " " "\n" | grep lnd-client-0.1.0.0)
cov=$(hpc report --hpcdir=$hpcdir/share/hpc/vanilla/mix/lnd-client-0.1.0.0 $tixdir/share/hpc/vanilla/tix/lnd-client-test/lnd-client-test.tix \
--exclude=Proto.Autopilotrpc.Autopilot \
--exclude=Proto.Autopilotrpc.Autopilot_Fields \
--exclude=Proto.Chainrpc.Chainnotifier \
--exclude=Proto.Chainrpc.Chainnotifier_Fields \
--exclude=Proto.Invoicesrpc.Invoices \
--exclude=Proto.Invoicesrpc.Invoices_Fields \
--exclude=Proto.Lightning \
--exclude=Proto.Lightning_Fields \
--exclude=Proto.Lnrpc.Ln0 \
--exclude=Proto.Lnrpc.Ln0_Fields \
--exclude=Proto.Lnrpc.Ln1 \
--exclude=Proto.Lnrpc.Ln1_Fields \
--exclude=Proto.Lnclipb.Lncli \
--exclude=Proto.Lnclipb.Lncli_Fields \
--exclude=Proto.Routerrpc.Router \
--exclude=Proto.Routerrpc.Router_Fields \
--exclude=Proto.Signrpc.Signer \
--exclude=Proto.Signrpc.Signer_Fields \
--exclude=Proto.Stateservice \
--exclude=Proto.Stateservice_Fields \
--exclude=Proto.Verrpc.Verrpc \
--exclude=Proto.Verrpc.Verrpc_Fields \
--exclude=Proto.Walletrpc.Walletkit \
--exclude=Proto.Walletrpc.Walletkit_Fields \
--exclude=Proto.Walletunlocker \
--exclude=Proto.Walletunlocker_Fields \
--exclude=Proto.Watchtowerrpc.Watchtower \
--exclude=Proto.Watchtowerrpc.Watchtower_Fields \
--exclude=Proto.Wtclientrpc.Wtclient \
--exclude=Proto.Wtclientrpc.Wtclient_Fields \
| grep "expressions used" | grep -oP '\d+(?=%)')
echo "Test coverage is: $cov%"
if [[ $cov -lt 60 ]]
then
  echo "Coverage is too low, failing..."
  exit 1
fi
echo "Coverage is good."
echo "==============================/Coverage================================="
