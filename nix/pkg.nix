{ mkDerivation, aeson, aeson-casing, aeson-qq, async, base
, base16-bytestring, base64-bytestring, bytestring, conduit
, connection, crypto-pubkey-openssh, crypto-pubkey-types
, cryptohash-sha256, cryptonite, data-default, envparse, hpack
, hspec, hspec-wai, http-client, http-client-tls, http-conduit
, http-types, jose, JuicyPixels, katip, lens, monad-logger
, monad-time, mtl, persistent, qrcode-core, qrcode-juicypixels
, QuickCheck, quickcheck-instances, resource-pool, retry
, scientific, scotty, stdenv, text, time, tls, transformers
, unbounded-delays, unliftio, unordered-containers, wai, warp
}:
mkDerivation {
  pname = "lnd-client";
  version = "0.1.0.0";
  src = ./..;
  libraryHaskellDepends = [
    aeson aeson-casing aeson-qq async base base16-bytestring
    base64-bytestring bytestring conduit connection
    crypto-pubkey-openssh crypto-pubkey-types cryptohash-sha256
    cryptonite data-default envparse hspec hspec-wai http-client
    http-client-tls http-conduit http-types jose JuicyPixels katip lens
    monad-logger monad-time mtl persistent qrcode-core
    qrcode-juicypixels QuickCheck quickcheck-instances resource-pool
    retry scientific scotty text time tls transformers unbounded-delays
    unliftio unordered-containers wai warp
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson aeson-casing aeson-qq async base base16-bytestring
    base64-bytestring bytestring conduit connection
    crypto-pubkey-openssh crypto-pubkey-types cryptohash-sha256
    cryptonite data-default envparse hspec hspec-wai http-client
    http-client-tls http-conduit http-types jose JuicyPixels katip lens
    monad-logger monad-time mtl persistent qrcode-core
    qrcode-juicypixels QuickCheck quickcheck-instances resource-pool
    retry scientific scotty text time tls transformers unbounded-delays
    unliftio unordered-containers wai warp
  ];
  prePatch = "hpack";
  homepage = "https://github.com/githubuser/lnd-client#readme";
  license = stdenv.lib.licenses.bsd3;
}
