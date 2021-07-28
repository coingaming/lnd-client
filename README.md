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
- we are using lnd version 0.13.1-beta.rc2
- download fresh grpc files to proto directory
- run `./script/generate-protoc.sh`
