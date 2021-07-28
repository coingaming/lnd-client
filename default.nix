let
  pkgs = (import ./nix/header.nix).pkgs;
in pkgs.haskell-nix.project {
  # 'cleanGit' cleans a source directory based on the files known by git
  projectFileName = "stack.yaml";
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "lnd-client";
    src = ./.;
  };
  # Specify the GHC version to use.
  compiler-nix-name = "ghc865"; # Not required for `stack.yaml` based projects.
}
