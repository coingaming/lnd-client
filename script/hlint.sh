#!/bin/sh

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"
BASE_DIR="$THIS_DIR/.."

ormolu --mode inplace $( find . \( \
       -type f \
       -not -path './src/Proto/*' \
       -path './src/*' \
       -o -path './test/*' \
       -name '*.hs' \))

hlint "$BASE_DIR" --ignore-glob="$BASE_DIR/src/Proto"
