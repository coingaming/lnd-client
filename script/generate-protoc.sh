#!/bin/sh
protoc --plugin=protoc-gen-haskell-protolens=`which proto-lens-protoc` \
    --haskell-protolens_out=./src \
    --proto_path=proto \
	./proto/invoice_grpc.proto  \
    ./proto/router_grpc.proto \
    ./proto/wallet_unlocker_grpc.proto \
	./proto/lnd_grpc.proto \
    ./proto/google/api/annotations.proto \
    ./proto/google/api/http.proto \
    ./proto/google/protobuf/descriptor.proto
