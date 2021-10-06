{
  extraBuildInputs ? [],
}:
let
  project = import ./default.nix;
  header = import ./nix/header.nix;
  haskellPackages = header.haskellPackages;
  pkgs = header.pkgs;
  lnd = import ./nix/lnd.nix { inherit pkgs; };
in
project.shellFor {
  withHoogle = true;
  buildInputs = extraBuildInputs ++ [
    haskellPackages.hspec-discover
    haskellPackages.fswatcher
    haskellPackages.hpack
    haskellPackages.stack
    pkgs.bitcoin
    pkgs.openssl
    pkgs.expect
    pkgs.ps
    lnd
  ];
  tools = {
    ghcid = "latest";
    cabal = "3.2.0.0";
    hlint = "3.2.7";
    haskell-language-server = "latest";
  };
  shellHook = ''
    ./script/prepare-test-env.sh
    . ./script/export-test-envs.sh
    trap "./script/cleanup-test-env.sh 2> /dev/null" EXIT
  '';
  GIT_SSL_CAINFO="${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_SSL_CERT_FILE="${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
}
