{ mkDerivation, aeson, async, base, base16-bytestring
, base64-bytestring, bytestring, chronos, containers
, cryptohash-sha256, deepseq, envparse, extra, grpc-haskell
, grpc-haskell-core, hpack, hspec, JuicyPixels, katip
, network-bitcoin, pem, persistent, proto3-suite, proto3-wire
, qrcode-core, qrcode-juicypixels, scientific, stdenv, text
, unbounded-delays, universum, unliftio, vector, x509
}:
mkDerivation {
  pname = "lnd-client";
  version = "0.1.0.0";
  src = ./..;
  libraryHaskellDepends = [
    aeson async base base16-bytestring base64-bytestring bytestring
    chronos containers cryptohash-sha256 deepseq envparse extra
    grpc-haskell grpc-haskell-core hspec JuicyPixels katip
    network-bitcoin pem persistent proto3-suite proto3-wire qrcode-core
    qrcode-juicypixels scientific text unbounded-delays universum
    unliftio vector x509
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson async base base16-bytestring base64-bytestring bytestring
    chronos containers cryptohash-sha256 deepseq envparse extra
    grpc-haskell grpc-haskell-core hspec JuicyPixels katip
    network-bitcoin pem persistent proto3-suite proto3-wire qrcode-core
    qrcode-juicypixels scientific text unbounded-delays universum
    unliftio vector x509
  ];
  prePatch = "hpack";
  homepage = "https://github.com/githubuser/lnd-client#readme";
  license = stdenv.lib.licenses.bsd3;
}
