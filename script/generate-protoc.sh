#!/bin/sh

set -e

protoc \
    --plugin=protoc-gen-haskell=`which proto-lens-protoc` \
    --proto_path=proto \
    --haskell_out=./src \
    --haskell_opt='Opt{ imports = ["Text.PrettyPrint.GenericPretty.Instance"], pragmas = ["DeriveGeneric"], stockInstances = ["GHC.Generics.Generic"], defaultInstances = ["Text.PrettyPrint.GenericPretty.Out"] }' \
	./proto/invoice_grpc.proto  \
    ./proto/router_grpc.proto \
    ./proto/wallet_unlocker_grpc.proto \
	./proto/lnd_grpc.proto
