{ mkDerivation, aeson, async, base, base16-bytestring, bytestring
, chronos, containers, cryptohash-sha256, deepseq, envparse
, grpc-haskell, grpc-haskell-core, hpack, hspec, hspec-wai
, JuicyPixels, katip, network-bitcoin, persistent, proto3-suite
, proto3-wire, qrcode-core, qrcode-juicypixels, stdenv, text
, unbounded-delays, universum, unliftio, vector
}:
mkDerivation {
  pname = "lnd-client";
  version = "0.1.0.0";
  src = ./..;
  libraryHaskellDepends = [
    aeson async base base16-bytestring bytestring chronos containers
    cryptohash-sha256 deepseq envparse grpc-haskell grpc-haskell-core
    hspec hspec-wai JuicyPixels katip network-bitcoin persistent
    proto3-suite proto3-wire qrcode-core qrcode-juicypixels text
    unbounded-delays universum unliftio vector
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson async base base16-bytestring bytestring chronos containers
    cryptohash-sha256 deepseq envparse grpc-haskell grpc-haskell-core
    hspec hspec-wai JuicyPixels katip network-bitcoin persistent
    proto3-suite proto3-wire qrcode-core qrcode-juicypixels text
    unbounded-delays universum unliftio vector
  ];
  prePatch = "hpack";
  homepage = "https://github.com/githubuser/lnd-client#readme";
  license = stdenv.lib.licenses.bsd3;
}
