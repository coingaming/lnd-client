let nixpkgs20 = import ./nixpkgs20.nix;
    pkgs20 = import nixpkgs20 {};
in
{
  hexOrganization,
  hexApiKey,
  robotSshKey
}:
self: super:
  let
    callPackage = self.lib.callPackageWith self.haskellPackages;
    dontCheck = self.haskell.lib.dontCheck;
    doJailbreak = self.haskell.lib.doJailbreak;
  in
    {
      lnd = pkgs20.lnd;
      haskellPackages = super.haskell.packages.ghc865.extend(
        self': super': {
          universum = dontCheck super'.universum;
          swagger2 = callPackage ./swagger2.nix {
            stdenv = self.stdenv;
          };
          grpc-haskell-core = callPackage ./grpc-haskell-core.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
            grpc = self.grpc;
          };
          grpc-haskell = dontCheck (callPackage ./grpc-haskell.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          });
          proto3-suite = dontCheck (doJailbreak (callPackage ./proto3-suite.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          }));
          proto3-wire = callPackage ./proto3-wire.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          };
        }
      );
    }
