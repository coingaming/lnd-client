#!/bin/sh

set -e

./nix/bootstrap.sh

NIXPKGS_ALLOW_BROKEN=1 nix-build ./nix/default.nix \
  -I ssh-config-file=/tmp/.ssh/config \
  --option sandbox false \
  -v --show-trace
