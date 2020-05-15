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
    persistent-migration = callPackage ./persistent-migration.nix {
      stdenv = self.stdenv;
      fetchgit = self.fetchgit;
    };
    hspec-wai = callPackage
      ({ mkDerivation, base, base-compat, bytestring, case-insensitive
       , hspec, hspec-core, hspec-expectations, http-types, QuickCheck
       , text, transformers, wai, wai-extra
       }:
       mkDerivation {
         pname = "hspec-wai";
         version = "0.10.1";
         sha256 = "05jv0cz8r8bf63ma5byjb2gkj9vwgnls4n9mks99qc525n055ckz";
         libraryHaskellDepends = [
           base base-compat bytestring case-insensitive hspec-core
           hspec-expectations http-types QuickCheck text transformers wai
           wai-extra
         ];
         testHaskellDepends = [
           base base-compat bytestring case-insensitive hspec hspec-core
           hspec-expectations http-types QuickCheck text transformers wai
           wai-extra
         ];
         description = "Experimental Hspec support for testing WAI applications";
         license = self.stdenv.lib.licenses.mit;
       }) {};
    hspec-wai-json = callPackage
      ({ mkDerivation, aeson, aeson-qq, base, bytestring
       , case-insensitive, hspec, hspec-wai, template-haskell
       }:
       mkDerivation {
         pname = "hspec-wai-json";
         version = "0.10.1";
         sha256 = "04mpqij446ki5l6xwi3bjmlf3ggjia2nzv8j62mdy6ick96dqwk6";
         libraryHaskellDepends = [
           aeson aeson-qq base bytestring case-insensitive hspec-wai
           template-haskell
         ];
         testHaskellDepends = [ base hspec hspec-wai ];
         description = "Testing JSON APIs with hspec-wai";
         license = self.stdenv.lib.licenses.mit;
       }) {};
    scotty = callPackage
      ({ mkDerivation, aeson, async, base, blaze-builder, bytestring
       , case-insensitive, data-default-class, directory, exceptions, fail
       , hspec, hspec-discover, hspec-wai, http-types, lifted-base
       , monad-control, mtl, nats, network, regex-compat, text
       , transformers, transformers-base, transformers-compat, wai
       , wai-extra, warp
       }:
       mkDerivation {
         pname = "scotty";
         version = "0.11.5";
         sha256 = "1pyj7j3zk80lv1c62ccna7nrsql5wf7pi5jscmypr2zd5xgfffvg";
         libraryHaskellDepends = [
           aeson base blaze-builder bytestring case-insensitive
           data-default-class exceptions fail http-types monad-control mtl
           nats network regex-compat text transformers transformers-base
           transformers-compat wai wai-extra warp
         ];
         testHaskellDepends = [
           async base bytestring data-default-class directory hspec hspec-wai
           http-types lifted-base network text wai
         ];
         testToolDepends = [ hspec-discover ];
         description = "Haskell web framework inspired by Ruby's Sinatra, using WAI and Warp";
         license = self.stdenv.lib.licenses.bsd3;
       }) {};
    swagger2 = callPackage
      ({ mkDerivation, aeson, aeson-pretty, base, base-compat-batteries
       , bytestring, Cabal, cabal-doctest, containers, cookie, doctest
       , fetchgit, generics-sop, Glob, hashable, hspec, hspec-discover
       , http-media, HUnit, insert-ordered-containers, lens, mtl, network
       , optics-core, optics-th, QuickCheck, quickcheck-instances
       , scientific, stdenv, template-haskell, text, time, transformers
       , transformers-compat, unordered-containers, utf8-string
       , uuid-types, vector
       }:
       mkDerivation {
         pname = "swagger2";
         version = "2.6";
         src = fetchgit {
           url = "https://github.com/GetShopTV/swagger2";
           sha256 = "0mcinvvqbn7qgf82bn78f4y4a7ahv6z1vdz8mfwa0dxvzfdaxxsr";
           rev = "023e2ac2cb5ba2b08928826c68d6d8d9ca3c4326";
           fetchSubmodules = true;
         };
         setupHaskellDepends = [ base Cabal cabal-doctest ];
         libraryHaskellDepends = [
           aeson aeson-pretty base base-compat-batteries bytestring containers
           cookie generics-sop hashable http-media insert-ordered-containers
           lens mtl network optics-core optics-th QuickCheck scientific
           template-haskell text time transformers transformers-compat
           unordered-containers uuid-types vector
         ];
         testHaskellDepends = [
           aeson base base-compat-batteries bytestring containers doctest Glob
           hashable hspec HUnit insert-ordered-containers lens mtl QuickCheck
           quickcheck-instances template-haskell text time
           unordered-containers utf8-string vector
         ];
         testToolDepends = [ hspec-discover ];
         homepage = "https://github.com/GetShopTV/swagger2";
         description = "Swagger 2.0 data model";
         license = stdenv.lib.licenses.bsd3;
       }){};
    proto3-suite = callPackage
      ({ mkDerivation, aeson, aeson-pretty, attoparsec, base
       , base64-bytestring, binary, bytestring, cereal, containers
       , contravariant, deepseq, doctest, fetchgit, filepath, foldl
       , generic-arbitrary, hashable, haskell-src
       , insert-ordered-containers, lens, mtl, neat-interpolation
       , optparse-applicative, optparse-generic, parsec, parsers, pretty
       , pretty-show, proto3-wire, QuickCheck, quickcheck-instances
       , range-set-list, safe, semigroups, stdenv, swagger2
       , system-filepath, tasty, tasty-hunit, tasty-quickcheck, text
       , transformers, turtle, vector
       }:
       mkDerivation {
         pname = "proto3-suite";
         version = "0.4.0.0";
         src = fetchgit {
           url = "https://github.com/awakesecurity/proto3-suite";
           sha256 = "1is2ikl4hcrqxbfd8c5wv40jvg282lx9w926kh8443wd8sn4zmng";
           rev = "ca03aa9d846d88b0762e40f9588b4927de22f798";
           fetchSubmodules = true;
         };
         isLibrary = true;
         isExecutable = true;
         enableSeparateDataOutput = true;
         libraryHaskellDepends = [
           aeson aeson-pretty attoparsec base base64-bytestring binary
           bytestring cereal containers contravariant deepseq filepath foldl
           hashable haskell-src insert-ordered-containers lens mtl
           neat-interpolation parsec parsers pretty pretty-show proto3-wire
           QuickCheck quickcheck-instances safe semigroups swagger2
           system-filepath text transformers turtle vector
         ];
         executableHaskellDepends = [
           base containers mtl optparse-applicative optparse-generic
           proto3-wire range-set-list system-filepath text turtle
         ];
         testHaskellDepends = [
           aeson attoparsec base base64-bytestring bytestring cereal
           containers deepseq doctest generic-arbitrary mtl pretty-show
           proto3-wire QuickCheck semigroups swagger2 tasty tasty-hunit
           tasty-quickcheck text transformers turtle vector
         ];
         description = "A low level library for writing out data in the Protocol Buffers wire format";
         license = stdenv.lib.licenses.asl20;
       }) {};
     grpc-haskell-core = callPackage
      ({ mkDerivation, async, base, bytestring, c2hs, clock, containers
       , gpr, grpc, managed, pipes, proto3-suite, QuickCheck, safe
       , sorted-list, stdenv, stm, tasty, tasty-hunit, tasty-quickcheck
       , text, time, transformers, turtle, unix
       }:
       mkDerivation {
         pname = "grpc-haskell-core";
         version = "0.0.0.0";
         sha256 = "1pvcdr1jrn94nwhni5992l8mv401150wl8yi519hncs173n2fx88";
         libraryHaskellDepends = [
           base bytestring clock containers managed sorted-list stm
           transformers
         ];
         librarySystemDepends = [ gpr grpc ];
         libraryToolDepends = [ c2hs ];
         testHaskellDepends = [
           async base bytestring clock containers managed pipes proto3-suite
           QuickCheck safe tasty tasty-hunit tasty-quickcheck text time
           transformers turtle unix
         ];
         homepage = "https://github.com/awakenetworks/gRPC-haskell";
         description = "Haskell implementation of gRPC layered on shared C library";
         license = stdenv.lib.licenses.asl20;
       }) {};
    # grpc-haskell = callPackage
    #  ({ mkDerivation, async, base, bytestring, clock, containers
    #   , criterion, fetchgit, grpc-haskell-core, managed, pipes
    #   , proto3-suite, proto3-wire, QuickCheck, random, safe, stdenv
    #   , tasty, tasty-hunit, tasty-quickcheck, text, time, transformers
    #   , turtle, unix
    #   }:
    #   mkDerivation {
    #     pname = "grpc-haskell";
    #     version = "0.0.1.0";
    #     src = fetchgit {
    #       url = "https://github.com/awakenetworks/gRPC-haskell";
    #       sha256 = "1iwcsqdcgvwi2gmm7kbd1ychz0wrx8f9r1qz0ywf0csdh75asxsa";
    #       rev = "595cb6a3bfbc50348af44d4bbd981ba0c02e45dd";
    #       fetchSubmodules = true;
    #     };
    #     isLibrary = true;
    #     isExecutable = true;
    #     libraryHaskellDepends = [
    #       async base bytestring grpc-haskell-core managed proto3-suite
    #       proto3-wire
    #     ];
    #     testHaskellDepends = [
    #       async base bytestring clock containers managed pipes proto3-suite
    #       QuickCheck safe tasty tasty-hunit tasty-quickcheck text time
    #       transformers turtle unix
    #     ];
    #     benchmarkHaskellDepends = [
    #       async base bytestring criterion proto3-suite random
    #     ];
    #     homepage = "https://github.com/awakenetworks/gRPC-haskell";
    #     description = "Haskell implementation of gRPC layered on shared C library";
    #     license = stdenv.lib.licenses.asl20;
    #   }) {};
  in
    {
      lnd = pkgs20.lnd;
      haskellPackages = super.haskell.packages.ghc865.extend(
        self': super': {
          universum = dontCheck super'.universum;
          swagger2 = swagger2;
          proto3-suite = dontCheck super'.proto3-suite;
          hspec-wai = hspec-wai;
          hspec-wai-json = hspec-wai-json;
          scotty = scotty;
          persistent-migration = dontCheck persistent-migration;
          grpc-haskell-core = grpc-haskell-core;
          #grpc-haskell = grpc-haskell;
        }
      );
    }
