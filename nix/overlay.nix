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
      lnd = (import ./overlay/lnd.nix {
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
          grpc-haskell-core = callPackage ./overlay/grpc-haskell-core.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
            grpc = self.grpc;
          };
          grpc-haskell = dontCheck (callPackage ./overlay/grpc-haskell.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          });
          proto3-suite = dontCheck (doJailbreak (callPackage ./overlay/proto3-suite.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          }));
          proto3-wire = callPackage ./overlay/proto3-wire.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          };
          asn1-encoding = callPackage ./asn1-encoding.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          };
          esqueleto = dontCheck (callPackage ./overlay/esqueleto.nix {
            stdenv = self.stdenv;
          });
          persistent = callPackage ./overlay/persistent.nix {
            stdenv = self.stdenv;
          };
          persistent-postgresql = dontCheck (callPackage ./overlay/persistent-postgresql.nix {
            stdenv = self.stdenv;
          });
          persistent-mysql = dontCheck (callPackage ./overlay/persistent-mysql.nix {
            stdenv = self.stdenv;
          });
          persistent-sqlite = dontCheck (callPackage ./overlay/persistent-sqlite.nix {
            stdenv = self.stdenv;
            sqlite = self.sqlite;
          });
          persistent-test = callPackage ./overlay/persistent-test.nix {
            stdenv = self.stdenv;
          };
          persistent-template = callPackage ./overlay/persistent-template.nix {
            stdenv = self.stdenv;
          };
          persistent-migration = dontCheck (callPackage ./overlay/persistent-migration.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
          });
        }
      );
    }
