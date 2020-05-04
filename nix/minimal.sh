#!/bin/sh

docker run -it --rm \
  -v "$(pwd):/app" \
  -v "nix:/nix" \
  -w "/app" nixos/nix:2.3
