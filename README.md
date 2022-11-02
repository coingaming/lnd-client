# lnd-client

Lightning Network Daemon (LND) client library for Haskell. Nix is the only thing required to get started. Development environment is packed into [nix-shell](https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html).

## Quickstart

Spawn shell:

```sh
./nix/shell.sh
```

Develop in shell:

```sh
vi .
```

Run all tests with hot code reloading:

```sh
ghcid
```

Run specific tests with hot code reloading:

```sh
ghcid --setup ":set args -m fromJSON"
```

Optional environment variables:

```sh
vi ~/.profile

export VIM_BACKGROUND="light" # or "dark"
export VIM_COLOR_SCHEME="PaperColor" # or "jellybeans"
export NIX_EXTRA_BUILD_INPUTS='[(import (fetchTarball "https://github.com/21it/ultimate-haskell-ide/tarball/ebfcd25eeac74ba813efa0b5929174cd59c4f4d2") {bundle = "haskell"; withGit = false;})]'
export NIX_WITH_SHELL_HOOK="true"
```

## gRPC schema upgrade

- We are using lnd version 0.15.4-beta
- Run `./script/update-protobuf.sh` (This will download latest proto files from github, so make sure that lnd version is consistent with latest protobufs)
- Manually split `lightning.proto` into 3 smaller files, because at the single file is way too big and GHC-8.10.7 requires too much RAM to compile it. The issue might disappear with GHC-9.X.X.
- Run `./script/generate-protoc.sh` (This will generate haskell types and instances for downloaded protos)
