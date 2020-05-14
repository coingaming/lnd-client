let nixpkgs = import ./nixpkgs.nix;
in
{
  pkgs ? null,
  hexOrganization ? null, # organization account name on hex.pm
  hexApiKey ? null,       # plain text account API key on hex.pm
  robotSshKey ? null      # base64-encoded private id_rsa (for private git)
}:
let overlays = [
      (import ./overlay.nix {inherit hexOrganization hexApiKey robotSshKey;})
    ];
    pkgs' = if pkgs == null
            then import nixpkgs {inherit overlays;}
            else pkgs;
in
with pkgs';

let haskell-ide = import (
      fetchTarball "https://github.com/tim2CF/ultimate-haskell-ide/tarball/master"
    ) {};
    proto3-suite-src = fetchTarball "https://github.com/awakesecurity/proto3-suite/tarball/ca03aa9d846d88b0762e40f9588b4927de22f798";
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
  HEX_ORGANIZATION=hexOrganization;
  HEX_API_KEY=hexApiKey;
  ROBOT_SSH_KEY=robotSshKey;
  shellHook = ''
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
  '';
}
