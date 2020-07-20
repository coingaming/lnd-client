{ mkDerivation, async, base, bytestring, c2hs, clock, containers
, fetchgit, grpc, managed, pipes, proto3-suite, QuickCheck
, safe, sorted-list, stdenv, stm, tasty, tasty-hunit
, tasty-quickcheck, text, time, transformers, turtle, unix
}:
mkDerivation {
  pname = "grpc-haskell-core";
  version = "0.0.0.0";
  src = fetchgit {
    url = "https://github.com/coingaming/gRPC-haskell";
    sha256 = "0pj08ka8zj3y8f4pnilppdpcc66h750cl9j2y8imjc9b3ym3yjfg";
    rev = "1e39371d308e6f0ff155dc988f7b6adf1519d7d8";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/core; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring clock containers managed sorted-list stm
    transformers
  ];
  librarySystemDepends = [ grpc ];
  libraryToolDepends = [ c2hs ];
  testHaskellDepends = [
    async base bytestring clock containers managed pipes proto3-suite
    QuickCheck safe tasty tasty-hunit tasty-quickcheck text time
    transformers turtle unix
  ];
  homepage = "https://github.com/awakenetworks/gRPC-haskell";
  description = "Haskell implementation of gRPC layered on shared C library";
  license = stdenv.lib.licenses.asl20;
}
