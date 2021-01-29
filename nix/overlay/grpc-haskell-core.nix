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
    sha256 = "0f62w3p6hpirnlzpwn9qx1says54ra15k3p0sxijgvh3bdmwswk1";
    rev = "1e5247e9efad3a2e52aca8cf176e885ead308be0";
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
