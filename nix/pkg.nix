{ mkDerivation, aeson, aeson-casing, aeson-qq, async, base
, base16-bytestring, base64-bytestring, bytestring, chronos
, conduit, connection, containers, cryptohash-sha256, data-default
, deepseq, envparse, grpc-haskell, grpc-haskell-core, hpack, hspec
, hspec-wai, http-client, http-client-tls, http-conduit, http-types
, JuicyPixels, katip, mtl, network-bitcoin, persistent
, proto3-suite, proto3-wire, qrcode-core, qrcode-juicypixels, retry
, scientific, stdenv, text, tls, transformers, unbounded-delays
, universum, unliftio, vector
}:
mkDerivation {
  pname = "lnd-client";
  version = "0.1.0.0";
  src = ./..;
  libraryHaskellDepends = [
    aeson aeson-casing aeson-qq async base base16-bytestring
    base64-bytestring bytestring chronos conduit connection containers
    cryptohash-sha256 data-default deepseq envparse grpc-haskell
    grpc-haskell-core hspec hspec-wai http-client http-client-tls
    http-conduit http-types JuicyPixels katip mtl network-bitcoin
    persistent proto3-suite proto3-wire qrcode-core qrcode-juicypixels
    retry scientific text tls transformers unbounded-delays universum
    unliftio vector
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson aeson-casing aeson-qq async base base16-bytestring
    base64-bytestring bytestring chronos conduit connection containers
    cryptohash-sha256 data-default deepseq envparse grpc-haskell
    grpc-haskell-core hspec hspec-wai http-client http-client-tls
    http-conduit http-types JuicyPixels katip mtl network-bitcoin
    persistent proto3-suite proto3-wire qrcode-core qrcode-juicypixels
    retry scientific text tls transformers unbounded-delays universum
    unliftio vector
  ];
  prePatch = "hpack";
  homepage = "https://github.com/githubuser/lnd-client#readme";
  license = stdenv.lib.licenses.bsd3;
}
