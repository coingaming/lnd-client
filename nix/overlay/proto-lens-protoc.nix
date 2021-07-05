{ mkDerivation, base, bytestring, containers, fetchgit, filepath
, ghc, ghc-paths, ghc-source-gen, hpack, lens-family, pretty
, proto-lens, proto-lens-runtime, protobuf, stdenv, text
}:
mkDerivation {
  pname = "proto-lens-protoc";
  version = "0.7.0.0";
  src = fetchgit {
    url = "https://github.com/coingaming/proto-lens";
    sha256 = "1njkx0sxyghfyzn8bzphz2k5xnd0cfd5laz5cicvinksnq2z6fnl";
    rev = "f1402dad6f14157dbcb64a884cba5bd95ebbfff4";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/proto-lens-protoc; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;  
  libraryHaskellDepends = [ base filepath ];
  libraryToolDepends = [ hpack protobuf ];
  executableHaskellDepends = [
    base bytestring containers filepath ghc ghc-paths ghc-source-gen
    lens-family pretty proto-lens proto-lens-runtime text
  ];
  prePatch = "hpack";
  homepage = "https://github.com/google/proto-lens#readme";
  description = "Protocol buffer compiler for the proto-lens library";
  license = stdenv.lib.licenses.bsd3;
}
