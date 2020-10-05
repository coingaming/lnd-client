let nixpkgs20 = import ./nixpkgs20.nix;
    pkgs20 = import nixpkgs20 {};
in
self: super:
  let
    callPackage = self.lib.callPackageWith self.haskellPackages;
    dontCheck = self.haskell.lib.dontCheck;
    doJailbreak = self.haskell.lib.doJailbreak;
  in
    {
      lnd = (import ./lnd.nix {
        buildGoModule = pkgs20.buildGoModule;
        fetchFromGitHub = pkgs20.fetchFromGitHub;
        lib = pkgs20.lib;
      });
      haskellPackages = super.haskell.packages.ghc865.extend(
        self': super': {
          parameterized = dontCheck super'.parameterized;
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
          asn1-encoding = callPackage ./asn1-encoding.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          };
        }
      );
    }
