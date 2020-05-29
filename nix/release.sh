#!/bin/sh

set -e

./nix/bootstrap.sh

NIXPKGS_ALLOW_BROKEN=1 nix-build ./nix/default.nix \
  -I ssh-config-file=/tmp/.ssh/config \
  --argstr hexOrganization coingaming \
  --argstr hexApiKey $HEX_API_KEY \
  --argstr robotSshKey $ROBOT_SSH_KEY \
  --option sandbox false \
  -v --show-trace
