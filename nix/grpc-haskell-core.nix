{ mkDerivation, async, base, bytestring, c2hs, clock, containers
, fetchgit, grpc, managed, pipes, proto3-suite, QuickCheck
, safe, sorted-list, stdenv, stm, tasty, tasty-hunit
, tasty-quickcheck, text, time, transformers, turtle, unix
}:
mkDerivation {
  pname = "grpc-haskell-core";
  version = "0.0.0.0";
  src = fetchgit {
    url = "https://github.com/awakesecurity/gRPC-haskell.git";
    sha256 = "1iwcsqdcgvwi2gmm7kbd1ychz0wrx8f9r1qz0ywf0csdh75asxsa";
    rev = "595cb6a3bfbc50348af44d4bbd981ba0c02e45dd";
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
