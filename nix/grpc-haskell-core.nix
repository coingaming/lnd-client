{ mkDerivation, async, base, bytestring, c2hs, clock, containers
, fetchgit, grpc, managed, pipes, proto3-suite, QuickCheck
, safe, sorted-list, stdenv, stm, tasty, tasty-hunit
, tasty-quickcheck, text, time, transformers, turtle, unix
}:
mkDerivation {
  pname = "grpc-haskell-core";
  version = "0.0.0.0";
  src = fetchgit {
    url = "https://github.com/coingaming/gRPC-haskell.git";
    sha256 = "0xzsjyxasp5wwjrnlq0d18ib82dh84q10c2fkzilf4lxk27dpw1c";
    rev = "8eaee520cd1a2ae909d2ef7ce16ce3a17be4418a";
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
