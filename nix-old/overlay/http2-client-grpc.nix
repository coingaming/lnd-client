{ mkDerivation, async, base, binary, bytestring, case-insensitive
, data-default-class, http2, http2-client, http2-grpc-types
, lifted-async, lifted-base, stdenv, text, tls
}:
mkDerivation {
  pname = "http2-client-grpc";
  version = "0.8.0.0";
  sha256 = "22d88bc868270c9f9eef02ed48f41a3d9bfa7e9f9f9364a1dd757bea599bf9b6";
  libraryHaskellDepends = [
    async base binary bytestring case-insensitive data-default-class
    http2 http2-client http2-grpc-types lifted-async lifted-base text
    tls
  ];
  testHaskellDepends = [ base ];
  homepage = "https://github.com/haskell-grpc-native/http2-grpc-haskell/blob/master/http2-client-grpc/README.md";
  description = "Implement gRPC-over-HTTP2 clients";
  license = stdenv.lib.licenses.bsd3;
}
