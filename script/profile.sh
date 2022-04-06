#!/bin/sh

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"

trap "hp2pretty $THIS_DIR/../lnd-client-prof.hp && firefox $THIS_DIR/../lnd-client-prof.svg" EXIT HUP INT QUIT PIPE TERM

(
  cd "$THIS_DIR/.."
  #sh "$THIS_DIR/unstack.sh" prepare
  . "$THIS_DIR/export-test-envs.sh"
  hpack
  cabal run lnd-client-prof --enable-profiling
)
