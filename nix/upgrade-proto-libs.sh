#/bin/sh

set -e

cabal2nix https://github.com/coingaming/proto3-wire > ./nix/proto3-wire.nix
cabal2nix https://github.com/coingaming/proto3-suite > ./nix/proto3-suite.nix
cabal2nix https://github.com/coingaming/gRPC-haskell > ./nix/grpc-haskell.nix
cabal2nix --subpath core https://github.com/coingaming/gRPC-haskell > ./nix/grpc-haskell-core.nix
