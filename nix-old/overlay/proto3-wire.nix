{ mkDerivation, base, bytestring, cereal, containers, deepseq
, doctest, fetchgit, ghc-prim, hashable, parameterized, primitive
, QuickCheck, safe, stdenv, tasty, tasty-hunit, tasty-quickcheck
, text, transformers, unordered-containers, vector
}:
mkDerivation {
  pname = "proto3-wire";
  version = "1.2.0";
  src = fetchgit {
    url = "https://github.com/coingaming/proto3-wire";
    sha256 = "0ip7r1c84c4af70cm26p046cd9zik0mq1y0qa2x56plv1r39w3nw";
    rev = "3672ded8b16baa9a9fdf4e4fa5109e2a6cf8a809";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [
    base bytestring cereal containers deepseq ghc-prim hashable
    parameterized primitive QuickCheck safe text transformers
    unordered-containers vector
  ];
  testHaskellDepends = [
    base bytestring cereal doctest QuickCheck tasty tasty-hunit
    tasty-quickcheck text transformers vector
  ];
  description = "A low-level implementation of the Protocol Buffers (version 3) wire format";
  license = stdenv.lib.licenses.asl20;
}
