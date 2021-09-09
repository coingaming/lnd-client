let
  project = import ./default.nix;
  header = import ./nix/header.nix;
  haskellPackages = header.haskellPackages;
  pkgs = header.pkgs;
  lnd = import ./nix/lnd.nix { inherit pkgs; };
in
project.shellFor {
  withHoogle = true;
  buildInputs = [
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
}
