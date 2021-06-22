{ mkDerivation, aeson, asn1-encoding, asn1-types, async, base
, base16-bytestring, base64-bytestring, bytestring, chronos
, containers, cryptohash-sha256, cryptonite, deepseq, envparse
, extra, grpc-haskell, grpc-haskell-core, hpack, hspec, JuicyPixels
, katip, lib, network-bitcoin, pem, persistent, proto3-suite
, proto3-wire, qrcode-core, qrcode-juicypixels, scientific, stm
, template-haskell, text, unbounded-delays, universum, unliftio
, vector, x509
}:
mkDerivation {
  pname = "lnd-client";
  version = "0.1.0.0";
  src = ./..;
  libraryHaskellDepends = [
    aeson asn1-encoding asn1-types async base base16-bytestring
    base64-bytestring bytestring chronos containers cryptohash-sha256
    cryptonite deepseq envparse extra grpc-haskell grpc-haskell-core
    hspec JuicyPixels katip network-bitcoin pem persistent proto3-suite
    proto3-wire qrcode-core qrcode-juicypixels scientific stm
    template-haskell text unbounded-delays universum unliftio vector
    x509
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson asn1-encoding asn1-types async base base16-bytestring
    base64-bytestring bytestring chronos containers cryptohash-sha256
    cryptonite deepseq envparse extra grpc-haskell grpc-haskell-core
    hspec JuicyPixels katip network-bitcoin pem persistent proto3-suite
    proto3-wire qrcode-core qrcode-juicypixels scientific stm
    template-haskell text unbounded-delays universum unliftio vector
    x509
  ];
  prePatch = "hpack";
  homepage = "https://github.com/githubuser/lnd-client#readme";
  license = lib.licenses.bsd3;
}
