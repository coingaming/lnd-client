{ mkDerivation, base, ghc, ghc-paths, QuickCheck, stdenv, tasty
, tasty-hunit, tasty-quickcheck
}:
mkDerivation {
  pname = "ghc-source-gen";
  version = "0.3.0.0";
  sha256 = "13632a428d8e41c6359c61b3bad9d259722b33470517bd98fc2bb0bb38b735e5";
  libraryHaskellDepends = [ base ghc ];
  testHaskellDepends = [
    base ghc ghc-paths QuickCheck tasty tasty-hunit tasty-quickcheck
  ];
  homepage = "https://github.com/google/ghc-source-gen#readme";
  description = "Constructs Haskell syntax trees for the GHC API";
  license = stdenv.lib.licenses.bsd3;
}

