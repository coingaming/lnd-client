{ mkDerivation, base, bytestring, containers, filepath, ghc
, ghc-paths, ghc-source-gen, lens-family, pretty, proto-lens
, proto-lens-runtime, protobuf, stdenv, text
}:
mkDerivation {
  pname = "proto-lens-protoc";
  version = "0.6.0.0";
  sha256 = "b946740b94c8d300cd8e278ded9045905ef1985824cef6b81af0d79b119927be";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base filepath ];
  libraryToolDepends = [ protobuf ];
  executableHaskellDepends = [
    base bytestring containers filepath ghc ghc-paths ghc-source-gen
    lens-family pretty proto-lens proto-lens-runtime text
  ];
  homepage = "https://github.com/google/proto-lens#readme";
  description = "Protocol buffer compiler for the proto-lens library";
  license = stdenv.lib.licenses.bsd3;
}
