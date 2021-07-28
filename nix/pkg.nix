{ mkDerivation, aeson, asn1-encoding, asn1-types, async, base
, base16-bytestring, base64-bytestring, bytestring, chronos
, containers, cryptohash-sha256, cryptonite, deepseq, envparse
, extra, hpack, hspec, http2, http2-client, http2-client-grpc
, http2-grpc-proto-lens, http2-grpc-types, JuicyPixels, katip
, microlens, network-bitcoin, pem, persistent, proto-lens
, proto-lens-runtime, qrcode-core, qrcode-juicypixels, scientific
, stdenv, stm, template-haskell, text, unbounded-delays, universum
, unliftio, x509
}:
mkDerivation {
  pname = "lnd-client";
  version = "0.1.0.0";
  src = ./..;
  libraryHaskellDepends = [
    aeson asn1-encoding asn1-types async base base16-bytestring
    base64-bytestring bytestring chronos containers cryptohash-sha256
    cryptonite deepseq envparse extra hspec http2 http2-client
    http2-client-grpc http2-grpc-proto-lens http2-grpc-types
    JuicyPixels katip microlens network-bitcoin pem persistent
    proto-lens proto-lens-runtime qrcode-core qrcode-juicypixels
    scientific stm template-haskell text unbounded-delays universum
    unliftio x509
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson asn1-encoding asn1-types async base base16-bytestring
    base64-bytestring bytestring chronos containers cryptohash-sha256
    cryptonite deepseq envparse extra hspec http2 http2-client
    http2-client-grpc http2-grpc-proto-lens http2-grpc-types
    JuicyPixels katip microlens network-bitcoin pem persistent
    proto-lens proto-lens-runtime qrcode-core qrcode-juicypixels
    scientific stm template-haskell text unbounded-delays universum
    unliftio x509
  ];
  prePatch = "hpack";
  homepage = "https://github.com/coingaming/lnd-client#readme";
  description = "Lightning Network Daemon (LND) client library for Haskell";
  license = stdenv.lib.licenses.bsd3;
}
