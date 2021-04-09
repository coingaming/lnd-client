{ mkDerivation, base, base16-bytestring, bytestring, criterion, SHA
, stdenv, tasty, tasty-hunit, tasty-quickcheck
}:
mkDerivation {
  pname = "cryptohash-sha1";
  version = "0.11.100.1";
  sha256 = "3c79af33542512442f8f87f6abb1faef7cd43bbfb2859260a33251d861eb0dab";
  revision = "5";
  editedCabalFile = "1qay4qlvmwpllsqn1yd8gyraifx5ydl4chgg3dj4gzgmi36i9n0l";
  libraryHaskellDepends = [ base bytestring ];
  testHaskellDepends = [
    base base16-bytestring bytestring SHA tasty tasty-hunit
    tasty-quickcheck
  ];
  benchmarkHaskellDepends = [ base bytestring criterion ];
  homepage = "https://github.com/hvr/cryptohash-sha1";
  description = "Fast, pure and practical SHA-1 implementation";
  license = stdenv.lib.licenses.bsd3;
}
