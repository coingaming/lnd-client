let
  project = import ./default.nix;
  haskellPackages = (import ./header.nix).haskellPackages;
in
project.shellFor {
  withHoogle = true;
  buildInputs = [ haskellPackages.hspec-discover haskellPackages.stack];
  tools = {
    cabal = "3.2.0.0";
    hlint = "3.2.7";
    haskell-language-server = "latest";
  };
}
