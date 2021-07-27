{ mkDerivation, aeson, base, bytestring, containers, criterion
, deepseq, deepseq-generics, file-embed, hspec, http-api-data
, monad-control, monad-logger, path-pieces, persistent, QuickCheck
, stdenv, template-haskell, text, th-lift-instances, transformers
, unordered-containers
}:
mkDerivation {
  pname = "persistent-template";
  version = "2.9.1.0";
  sha256 = "8aadb78df12ab57ead6fdf5eb1a3934866cb4c039bac1c42f0bc5c93d17f34a6";
  libraryHaskellDepends = [
    aeson base bytestring containers http-api-data monad-control
    monad-logger path-pieces persistent template-haskell text
    th-lift-instances transformers unordered-containers
  ];
  testHaskellDepends = [
    aeson base bytestring hspec persistent QuickCheck text
  ];
  benchmarkHaskellDepends = [
    base criterion deepseq deepseq-generics file-embed persistent
    template-haskell text
  ];
  homepage = "http://www.yesodweb.com/book/persistent";
  description = "Type-safe, non-relational, multi-backend persistence";
  license = stdenv.lib.licenses.mit;
}
