#!/bin/bash

set -e
shopt -s globstar

rm -fr ./proto
mkdir ./proto

tmp_dir=`mktemp -d`
dest_dir="$(pwd)/proto"

git clone --depth 1 -b "v0.14.0-beta" git@github.com:lightningnetwork/lnd.git "$tmp_dir"

cd "$tmp_dir/lnrpc"
cp --parents -r **/*.proto "$dest_dir"
