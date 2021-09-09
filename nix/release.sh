#!/bin/sh

set -e

./nix/bootstrap.sh

nix-build \
  -I ssh-config-file=/tmp/.ssh/config \
  --option sandbox false \
  -v --show-trace
