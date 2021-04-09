{ mkDerivation, asn1-encoding, asn1-parse, asn1-types, base
, bytestring, containers, cryptonite, hourglass, memory, mtl, pem
, stdenv, tasty, tasty-quickcheck
}:
mkDerivation {
  pname = "x509";
  version = "1.7.5";
  sha256 = "b1b0fcbb4aa0d749ed2b54710c2ebd6d900cb932108ad14f97640cf4ca60c7c8";
  revision = "1";
  editedCabalFile = "1z98llpggldy4yb7afcsn3r3q4vklvx2pqyrhy9fir5y2yd5l601";
  libraryHaskellDepends = [
    asn1-encoding asn1-parse asn1-types base bytestring containers
    cryptonite hourglass memory mtl pem
  ];
  testHaskellDepends = [
    asn1-types base bytestring cryptonite hourglass mtl tasty
    tasty-quickcheck
  ];
  homepage = "http://github.com/vincenthz/hs-certificate";
  description = "X509 reader and writer";
  license = stdenv.lib.licenses.bsd3;
}
