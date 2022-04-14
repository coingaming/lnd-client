#!/bin/bash

set -e
shopt -s globstar

protoc \
    --plugin=protoc-gen-haskell=`which proto-lens-protoc` \
    --proto_path=proto \
    --haskell_out=./src \
    --haskell_opt='Opt{ imports = ["Text.PrettyPrint.GenericPretty.Instance"], pragmas = ["DeriveGeneric"], stockInstances = ["GHC.Generics.Generic"], defaultInstances = ["Text.PrettyPrint.GenericPretty.Out"] }' \
	./proto/**/*.proto
