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
    url = "https://github.com/coingaming/gRPC-haskell.git";
    sha256 = "0xzsjyxasp5wwjrnlq0d18ib82dh84q10c2fkzilf4lxk27dpw1c";
    rev = "8eaee520cd1a2ae909d2ef7ce16ce3a17be4418a";
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
