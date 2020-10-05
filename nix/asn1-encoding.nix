{ mkDerivation, asn1-types, base, bytestring, fetchgit, hourglass
, mtl, stdenv, tasty, tasty-quickcheck
}:
mkDerivation {
  pname = "asn1-encoding";
  version = "0.9.6";
  src = fetchgit {
    url = "https://github.com/coingaming/hs-asn1";
    sha256 = "0yswbskxzcmqhjqdlhhfnv9rjvifri8hc2b274nnwq7mrjj53qck";
    rev = "c017c03b0f71a3b45165468a1d1028a0ed7502c0";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/encoding; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [ asn1-types base bytestring hourglass ];
  testHaskellDepends = [
    asn1-types base bytestring hourglass mtl tasty tasty-quickcheck
  ];
  homepage = "https://github.com/vincenthz/hs-asn1";
  description = "ASN1 data reader and writer in RAW, BER and DER forms";
  license = stdenv.lib.licenses.bsd3;
}
