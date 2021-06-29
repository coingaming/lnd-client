{ mkDerivation, base, binary, bytestring, case-insensitive, stdenv
, zlib
}:
mkDerivation {
  pname = "http2-grpc-types";
  version = "0.5.0.0";
  sha256 = "cb4e929d82915dd5ad8087b9db04e10f39b0e4f2122c48d84eed5260644e875c";
  libraryHaskellDepends = [
    base binary bytestring case-insensitive zlib
  ];
  homepage = "https://github.com/haskell-grpc-native/http2-grpc-haskell#readme";
  description = "Types for gRPC over HTTP2 common for client and servers";
  license = stdenv.lib.licenses.bsd3;
}
