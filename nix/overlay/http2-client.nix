{ mkDerivation, async, base, bytestring, containers, deepseq, http2
, lifted-async, lifted-base, mtl, network, stdenv, stm, time, tls
, transformers-base
}:
mkDerivation {
  pname = "http2-client";
  version = "0.10.0.0";
  sha256 = "fedd1d789e8ee696081fc78bbecbd25692a903bddfaa2acc3292f3c592c2644f";
  libraryHaskellDepends = [
    async base bytestring containers deepseq http2 lifted-async
    lifted-base mtl network stm time tls transformers-base
  ];
  testHaskellDepends = [ base ];
  homepage = "https://github.com/lucasdicioccio/http2-client";
  description = "A native HTTP2 client library";
  license = stdenv.lib.licenses.bsd3;
}
