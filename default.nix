let
  pkgs = (import ./nix/header.nix).pkgs;
  lnd = import ./nix/lnd.nix { inherit pkgs; };
in pkgs.haskell-nix.project {
  projectFileName = "stack.yaml";
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "lnd-client";
    src = ./.;
  };
  compiler-nix-name = "ghc865";
  modules = [{
    packages.lnd-client.components.tests.lnd-client-test.preCheck = ''
      env
      ls -la
      ./script/unstack.sh prepare
    '';
    packages.lnd-client.components.tests.lnd-client-test.build-tools = [
      pkgs.haskellPackages.hspec-discover
      pkgs.bitcoin
      pkgs.openssl
      pkgs.expect
      lnd
    ];
    packages.lnd-client.components.tests.lnd-client-test.postCheck = ''
      ./script/unstack.sh clean
    '';
  }];
}
