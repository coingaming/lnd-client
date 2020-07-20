{ mkDerivation, async, base, bytestring, clock, containers
, criterion, fetchgit, grpc-haskell-core, managed, pipes
, proto3-suite, proto3-wire, QuickCheck, random, safe, stdenv
, tasty, tasty-hunit, tasty-quickcheck, text, time, transformers
, turtle, unix
}:
mkDerivation {
  pname = "grpc-haskell";
  version = "0.0.1.0";
  src = fetchgit {
    url = "https://github.com/coingaming/gRPC-haskell";
    sha256 = "0pj08ka8zj3y8f4pnilppdpcc66h750cl9j2y8imjc9b3ym3yjfg";
    rev = "1e39371d308e6f0ff155dc988f7b6adf1519d7d8";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    async base bytestring grpc-haskell-core managed proto3-suite
    proto3-wire
  ];
  testHaskellDepends = [
    async base bytestring clock containers managed pipes proto3-suite
    QuickCheck safe tasty tasty-hunit tasty-quickcheck text time
    transformers turtle unix
  ];
  benchmarkHaskellDepends = [
    async base bytestring criterion proto3-suite random
  ];
  homepage = "https://github.com/awakenetworks/gRPC-haskell";
  description = "Haskell implementation of gRPC layered on shared C library";
  license = stdenv.lib.licenses.asl20;
}
