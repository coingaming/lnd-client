{ mkDerivation, aeson, asn1-encoding, asn1-types, async, base
, base16-bytestring, base64-bytestring, bytestring, chronos
, containers, cryptohash-sha256, cryptonite, data-default-class
, deepseq, envparse, extra, grpc-haskell, grpc-haskell-core, hpack
, hspec, http2, http2-client, http2-client-grpc
, http2-grpc-proto-lens, http2-grpc-proto3-wire, http2-grpc-types
, JuicyPixels, katip, lens, lifted-async, lifted-base, microlens
, network, network-bitcoin, pem, persistent, process-extras
, proto-lens, proto-lens-runtime, proto3-suite, proto3-wire
, qrcode-core, qrcode-juicypixels, scientific, stdenv, stm
, template-haskell, text, tls, unbounded-delays, universum
, unliftio, vector, warp-grpc, warp-tls, x509
}:
mkDerivation {
  pname = "lnd-client";
  version = "0.1.0.0";
  src = ./..;
  libraryHaskellDepends = [
    aeson asn1-encoding asn1-types async base base16-bytestring
    base64-bytestring bytestring chronos containers cryptohash-sha256
    cryptonite data-default-class deepseq envparse extra grpc-haskell
    grpc-haskell-core hspec http2 http2-client http2-client-grpc
    http2-grpc-proto-lens http2-grpc-proto3-wire http2-grpc-types
    JuicyPixels katip lens lifted-async lifted-base microlens network
    network-bitcoin pem persistent process-extras proto-lens
    proto-lens-runtime proto3-suite proto3-wire qrcode-core
    qrcode-juicypixels scientific stm template-haskell text tls
    unbounded-delays universum unliftio vector warp-grpc warp-tls x509
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson asn1-encoding asn1-types async base base16-bytestring
    base64-bytestring bytestring chronos containers cryptohash-sha256
    cryptonite data-default-class deepseq envparse extra grpc-haskell
    grpc-haskell-core hspec http2 http2-client http2-client-grpc
    http2-grpc-proto-lens http2-grpc-proto3-wire http2-grpc-types
    JuicyPixels katip lens lifted-async lifted-base microlens network
    network-bitcoin pem persistent process-extras proto-lens
    proto-lens-runtime proto3-suite proto3-wire qrcode-core
    qrcode-juicypixels scientific stm template-haskell text tls
    unbounded-delays universum unliftio vector warp-grpc warp-tls x509
  ];
  prePatch = "hpack";
  homepage = "https://github.com/githubuser/lnd-client#readme";
  license = stdenv.lib.licenses.bsd3;
}
