{ mkDerivation, base, bytestring, containers, deepseq, ghc-prim
, lens-family, parsec, pretty, primitive, profunctors, QuickCheck
, stdenv, tagged, tasty, tasty-quickcheck, text, transformers
, vector
}:
mkDerivation {
  pname = "proto-lens";
  version = "0.6.0.0";
  sha256 = "a6b33f04b192e20a011e5ec8a204833162900fbb27172efb135deeded02a524c";
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    base bytestring containers deepseq ghc-prim lens-family parsec
    pretty primitive profunctors tagged text transformers vector
  ];
  testHaskellDepends = [
    base bytestring QuickCheck tasty tasty-quickcheck vector
  ];
  homepage = "https://github.com/google/proto-lens#readme";
  description = "A lens-based implementation of protocol buffers in Haskell";
  license = stdenv.lib.licenses.bsd3;
}
