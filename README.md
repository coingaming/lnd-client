# lnd-client

Lightning Network Daemon (LND) client library for Haskell. Docker is the only thing required to get started. Development environment is packed into [nix-shell](https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)

```bash
# start nix-shell
./nix/shell.sh

# run tests in nix-shell
stack test

# develop in nix-shell
vi .
```

Optional nix-shell environment variables

```bash
vi ~/.zshrc

export VIM_BACKGROUND="light" # or "dark"
export VIM_COLOR_SCHEME="PaperColor" # or "jellybeans"
```

# gRPC schema upgrade

- we are using this lnd version https://github.com/coingaming/lnd/
- download fresh grpc files to proto directory, example https://github.com/coingaming/lnd/blob/master/lnrpc/rpc.proto
- remove `google.api.http` options from proto files if needed, they are not supported atm https://github.com/awakesecurity/proto3-suite/issues/118
- remove `lnrpc` namespace from messages if needed, example `lnrpc.RouteHint` -> `RouteHint`
- remove `extend` expressions from file if needed (not supported atm)
- import "google/api/annotations.proto"
- import "lnd_grpc.proto" (instead of rpc.proto if needed)
- run `./script/generate-lnd-grpc-source.sh $PROTO_FILE_NAME`
- manually fix namespace bug in generated file if needed https://github.com/awakesecurity/proto3-suite/issues/112
- manually fix type errors:
  - Remove Hs.Just if compiler found typing error;
- add `{-# OPTIONS_GHC -Wno-missing-export-lists #-}` pragma to file if needed
