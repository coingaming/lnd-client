let nixpkgs = import ./nixpkgs.nix;
in
{
  pkgs ? null,
  vimBackground ? "light",
  vimColorScheme ? "PaperColor"
}:
let overlays = [(import ./overlay.nix)];
    pkgs' = if pkgs == null
            then import nixpkgs {inherit overlays;}
            else pkgs;
in
with pkgs';

let haskell-ide = import (
      fetchTarball "https://github.com/tim2CF/ultimate-haskell-ide/tarball/44a8b5d7e74381dd40dd437027c483f7c0a6c041"
    ) {inherit vimBackground vimColorScheme;};
    proto3-suite-src = fetchTarball "https://github.com/coingaming/proto3-suite/tarball/19d83b67f90a7be67bc1d062828d84ae68f3efe0";
    proto3-suite = import (proto3-suite-src + "/release.nix") {};
in

stdenv.mkDerivation {
  name = "lnd-client-env";
  buildInputs = [
    /* IDE */
    haskell-ide
    /* Apps */
    bitcoin
    lnd
    /* Utils */
    grpc
    proto3-suite.proto3-suite-linux
    git
    nix-prefetch-scripts
    openssl
    openssh
    cabal2nix
    protobuf
    cacert
    xxd
  ];

  TERM="xterm-256color";
  GIT_SSL_CAINFO="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_PATH="/nix/var/nix/profiles/per-user/root/channels";
  shellHook = ''
    sh ./nix/generate-tls-cert.sh
    source ./nix/export-test-envs.sh
    sh ./nix/reset-test-data.sh
    sh ./nix/spawn-test-deps.sh

    alias bitcoind="bitcoind -datadir=$BTCD_DIR"
    alias bitcoin-cli="bitcoin-cli -datadir=$BTCD_DIR"
    alias lncli-merchant="lncli -n regtest --lnddir=$LND_MERCHANT_DIR"
    alias lncli-customer="lncli -n regtest --lnddir=$LND_CUSTOMER_DIR --rpcserver=localhost:11009"

    export HOOGLEDB=/root/.hoogle
    if [ "$(ls -A $HOOGLEDB)" ]; then
      echo "hoogle database already exists..."
    else
      echo "building hoogle database..."
      stack --stack-yaml=/app/stack.yaml exec hoogle generate
    fi

    if [ "$(ls -A ~/.cabal)" ]; then
      echo "cabal database already exists..."
    else
      echo "building cabal database..."
      cabal v2-update
    fi
  '';
}
