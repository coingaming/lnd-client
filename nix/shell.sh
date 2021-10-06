#!/bin/sh

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"
export NIX_EXTRA_BUILD_INPUTS="${NIX_EXTRA_BUILD_INPUTS:-[]}"
nix-shell \
  "$THIS_DIR/../shell.nix" \
  --arg extraBuildInputs "$NIX_EXTRA_BUILD_INPUTS" \
  --option extra-substituters "https://cache.nixos.org https://hydra.iohk.io https://all-hies.cachix.org" \
  --option trusted-public-keys "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= all-hies.cachix.org-1:JjrzAOEUsD9ZMt8fdFbzo3jNAyEWlPAwdVuHw4RD43k="
