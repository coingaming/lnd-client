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
- run `./script/generate-protoc.sh`
