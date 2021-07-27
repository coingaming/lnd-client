let nixpkgs20 = import ./nixpkgs20.nix;
    pkgs20 = import nixpkgs20 {};
    nixpkgs21 = import (import ./nixpkgs21.nix) {};
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
      stack2cabal = doJailbreak nixpkgs21.haskellPackages.stack2cabal;
      haskellPackages = super.haskell.packages.ghc865.extend(
        self': super': {
          parameterized = dontCheck super'.parameterized;
          universum = dontCheck super'.universum;
          swagger2 = callPackage ./overlay/swagger2.nix {
            stdenv = self.stdenv;
          };
          base16-bytestring = callPackage ./overlay/base16-bytestring.nix {
            stdenv = self.stdenv;
          };
          cryptohash-md5 = dontCheck (callPackage ./overlay/cryptohash-md5.nix {
            stdenv = self.stdenv;
          });
          cryptohash-sha1 = dontCheck (callPackage ./overlay/cryptohash-sha1.nix {
            stdenv = self.stdenv;
          });
          cryptonite = callPackage ./overlay/cryptonite.nix {
            stdenv = self.stdenv;
          };
          secp256k1-haskell = dontCheck (callPackage ./overlay/secp256k1-haskell.nix {
            stdenv = self.stdenv;
            libsecp256k1 = self.secp256k1;
          });
          asn1-encoding = callPackage ./overlay/asn1-encoding.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          };
          http2-grpc-proto-lens = doJailbreak (
            callPackage ./overlay/http2-grpc-proto-lens.nix {
              stdenv = self.stdenv;
            }
          );
          http2-client-grpc = doJailbreak (callPackage ./overlay/http2-client-grpc.nix {
            stdenv = self.stdenv;
          });
          http2-client = callPackage ./overlay/http2-client.nix {
            stdenv = self.stdenv;
          };
          http2-grpc-types = callPackage ./overlay/http2-grpc-types.nix {
            stdenv = self.stdenv;
          };
          http2 = callPackage ./overlay/http2.nix {
            stdenv = self.stdenv;
          };
          connection = callPackage ./overlay/connection.nix {
            stdenv = self.stdenv;
          };
          tls = callPackage ./overlay/tls.nix {
            stdenv = self.stdenv;
          };
          proto-lens = callPackage ./overlay/proto-lens.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          };
          ghc-source-gen = callPackage ./overlay/ghc-source-gen.nix {
            stdenv = self.stdenv;
          };
          proto-lens-protoc = callPackage ./overlay/proto-lens-protoc.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          };
          proto-lens-runtime = callPackage ./overlay/proto-lens-runtime.nix {
            stdenv = self.stdenv;
          };
          proto3-wire = callPackage ./overlay/proto3-wire.nix {
            stdenv = self.stdenv;
            fetchgit = self.fetchgit;
          };
          esqueleto = dontCheck (callPackage ./overlay/esqueleto.nix {
            stdenv = self.stdenv;
          });
          persistent = callPackage ./overlay/persistent.nix {
            stdenv = self.stdenv;
          };
          persistent-postgresql = dontCheck (
            callPackage ./overlay/persistent-postgresql.nix {
              stdenv = self.stdenv;
            }
          );
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
          persistent-migration = dontCheck (
            callPackage ./overlay/persistent-migration.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            }
          );
        }
      );
    }