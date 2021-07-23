{ mkDerivation, base, binary, bytestring, case-insensitive
, http2-grpc-types, proto-lens, stdenv, zlib
}:
mkDerivation {
  pname = "http2-grpc-proto-lens";
  version = "0.1.0.0";
  sha256 = "8e5cd1baa092e76b12da0101125bc6b8c0e2d5ff73e8fab285199f1ff67c1e5a";
  libraryHaskellDepends = [
    base binary bytestring case-insensitive http2-grpc-types proto-lens
    zlib
  ];
  homepage = "https://github.com/haskell-grpc-native/http2-grpc-haskell#readme";
  description = "Encoders based on `proto-lens` for gRPC over HTTP2";
  license = stdenv.lib.licenses.bsd3;
}
