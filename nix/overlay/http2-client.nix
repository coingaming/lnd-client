{ mkDerivation, async, base, bytestring, containers, deepseq, http2
, lifted-async, lifted-base, mtl, network, stdenv, stm, time, tls
, transformers-base
}:
mkDerivation {
  pname = "http2-client";
  version = "0.9.0.0";
  sha256 = "b84f8f562c5b11a79ac620f4d23f17711c37f7015e482da156c2bea8895586fc";
  revision = "1";
  editedCabalFile = "00fg9a62qkjwp7rb38j7z7yy6dk3mkh6mgwspd79v2ycmn4mr25q";
  libraryHaskellDepends = [
    async base bytestring containers deepseq http2 lifted-async
    lifted-base mtl network stm time tls transformers-base
  ];
  testHaskellDepends = [ base ];
  homepage = "https://github.com/lucasdicioccio/http2-client";
  description = "A native HTTP2 client library";
  license = stdenv.lib.licenses.bsd3;
}
