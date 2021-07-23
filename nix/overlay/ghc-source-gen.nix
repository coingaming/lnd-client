{ mkDerivation, base, ghc, ghc-paths, QuickCheck, stdenv, tasty
, tasty-hunit, tasty-quickcheck
}:
mkDerivation {
  pname = "ghc-source-gen";
  version = "0.4.1.0";
  sha256 = "9ea009d00640d818d589a33220af7a89c6c261024940d8964db2e6bbd0352d27";
  libraryHaskellDepends = [ base ghc ];
  testHaskellDepends = [
    base ghc ghc-paths QuickCheck tasty tasty-hunit tasty-quickcheck
  ];
  homepage = "https://github.com/google/ghc-source-gen#readme";
  description = "Constructs Haskell syntax trees for the GHC API";
  license = stdenv.lib.licenses.bsd3;
}
