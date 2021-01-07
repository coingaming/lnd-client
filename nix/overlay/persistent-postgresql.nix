{ mkDerivation, aeson, attoparsec, base, blaze-builder, bytestring
, conduit, containers, fast-logger, hspec, hspec-expectations
, HUnit, monad-logger, mtl, persistent, persistent-qq
, persistent-template, persistent-test, postgresql-libpq
, postgresql-simple, QuickCheck, quickcheck-instances
, resource-pool, resourcet, stdenv, string-conversions, text, time
, transformers, unliftio-core, unordered-containers, vector
}:
mkDerivation {
  pname = "persistent-postgresql";
  version = "2.11.0.1";
  sha256 = "b3be47745a23d4b8cc2fedb1f8bf2b20aa8109c5026edb08f79f4bec44717521";
  libraryHaskellDepends = [
    aeson attoparsec base blaze-builder bytestring conduit containers
    monad-logger mtl persistent postgresql-libpq postgresql-simple
    resource-pool resourcet string-conversions text time transformers
    unliftio-core
  ];
  testHaskellDepends = [
    aeson base bytestring containers fast-logger hspec
    hspec-expectations HUnit monad-logger persistent persistent-qq
    persistent-template persistent-test QuickCheck quickcheck-instances
    resourcet text time transformers unliftio-core unordered-containers
    vector
  ];
  homepage = "http://www.yesodweb.com/book/persistent";
  description = "Backend for the persistent library using postgresql";
  license = stdenv.lib.licenses.mit;
}
