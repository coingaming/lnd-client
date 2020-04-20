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
  in
    {
      haskellPackages = super.haskell.packages.ghc865.extend(
        self': super': {
          proto3-suite = dontCheck (doJailbreak super'.proto3-suite);
          hspec-wai = hspec-wai;
          hspec-wai-json = hspec-wai-json;
          scotty = scotty;
          persistent-migration = dontCheck persistent-migration;
        }
      );
    }
