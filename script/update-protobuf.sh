#!/bin/sh

set -e

rm ./proto/*.proto

curl https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/lightning.proto --output ./proto/lnd_grpc.proto
curl https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/invoicesrpc/invoices.proto --output ./proto/invoice_grpc.proto
curl https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/routerrpc/router.proto --output ./proto/router_grpc.proto
curl https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/walletunlocker.proto --output ./proto/wallet_unlocker_grpc.proto
curl https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/signrpc/signer.proto --output ./proto/signer_grpc.proto

sed -i 's/lightning.proto/lnd_grpc.proto/' ./proto/invoice_grpc.proto
sed -i 's/lightning.proto/lnd_grpc.proto/' ./proto/router_grpc.proto
sed -i 's/lightning.proto/lnd_grpc.proto/' ./proto/wallet_unlocker_grpc.proto
sed -i 's/lightning.proto/lnd_grpc.proto/' ./proto/signer_grpc.proto
