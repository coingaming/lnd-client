#!/bin/sh

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"
NIX_EXTRA_BUILD_INPUTS="${NIX_EXTRA_BUILD_INPUTS:-[]}"
NIX_WITH_SHELL_HOOK="${NIX_WITH_SHELL_HOOK:-false}"
PROFILE="false"

if [ -z "$*" ]; then
  echo "shell ==> using defaults"
else
  for ARG in "$@"; do
    case $ARG in
      --profile)
        PROFILE="true"
        shift
        ;;
      *)
        echo "shell ==> unrecognized ARG $ARG"
        exit 1
        ;;
    esac
  done
fi

nix-shell \
  "$THIS_DIR/../shell.nix" \
  --arg extraBuildInputs "$NIX_EXTRA_BUILD_INPUTS" \
  --arg withShellHook "$NIX_WITH_SHELL_HOOK" \
  --arg profile "$PROFILE" \
  --option extra-substituters "https://cache.nixos.org https://hydra.iohk.io" \
  --option trusted-public-keys "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
