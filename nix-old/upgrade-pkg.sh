#!/bin/sh

set -e

(cd ./nix/ && cabal2nix ./.. > ./pkg.nix)

