{ mkDerivation, aeson, base, blaze-html, bytestring, conduit
, containers, exceptions, hspec, hspec-expectations, HUnit
, monad-control, monad-logger, mtl, path-pieces, persistent
, persistent-template, QuickCheck, quickcheck-instances, random
, resourcet, stdenv, text, time, transformers, transformers-base
, unliftio, unliftio-core, unordered-containers
}:
mkDerivation {
  pname = "persistent-test";
  version = "2.0.3.5";
  sha256 = "3b8cb5e4a61c0bece88448297c5a9e0b85a206c47d50971f742b767e2bb5a39a";
  libraryHaskellDepends = [
    aeson base blaze-html bytestring conduit containers exceptions
    hspec hspec-expectations HUnit monad-control monad-logger mtl
    path-pieces persistent persistent-template QuickCheck
    quickcheck-instances random resourcet text time transformers
    transformers-base unliftio unliftio-core unordered-containers
  ];
  homepage = "http://www.yesodweb.com/book/persistent";
  description = "Tests for Persistent";
  license = stdenv.lib.licenses.mit;
}
