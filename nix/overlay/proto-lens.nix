{ mkDerivation, base, bytestring, containers, deepseq, ghc-prim
, lens-family, parsec, pretty, primitive, profunctors, QuickCheck
, stdenv, tagged, tasty, tasty-quickcheck, text, transformers
, vector
}:
mkDerivation {
  pname = "proto-lens";
  version = "0.7.0.0";
  sha256 = "3aa3b6aa1a1fa51cc2b7a60dde79112a7d87d6846cc8d65f3c3ad6c4b81ce7b5";
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
