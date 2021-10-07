{
  extraBuildInputs ? [],
  withShellHook ? false
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
  shellHook =
    if withShellHook
    then ''
      echo "Spawning nix-shell with shellHook"
      . ./script/export-test-envs.sh
      trap "./script/cleanup-test-env.sh 2> /dev/null" EXIT
    ''
    else ''
      echo "Spawning nix-shell without shellHook"
    '';
}
