{ mkDerivation, base, fetchgit, ghc, ghc-paths, hpack, QuickCheck
, stdenv, tasty, tasty-hunit, tasty-quickcheck
}:
mkDerivation {
  pname = "ghc-source-gen";
  version = "0.4.0.0";
  src = fetchgit {
    url = "https://github.com/coingaming/ghc-source-gen";
    sha256 = "09mis9vr5yigvshb6jpcy3a33v0cbvl0x523b34cfyf6f1dm4b5n";
    rev = "8cd230230de4412227f58d59f7beb06f3a35ebc3";
    fetchSubmodules = true;
  };                
  libraryHaskellDepends = [ base ghc ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base ghc ghc-paths QuickCheck tasty tasty-hunit tasty-quickcheck
  ];
  prePatch = "hpack"; 
  homepage = "https://github.com/google/ghc-source-gen#readme";
  description = "Constructs Haskell syntax trees for the GHC API";
  license = stdenv.lib.licenses.bsd3;
}
