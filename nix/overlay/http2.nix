{ mkDerivation, aeson, aeson-pretty, array, base, base16-bytestring
, bytestring, case-insensitive, containers, criterion, directory
, doctest, filepath, Glob, heaps, hspec, mwc-random
, network-byte-order, psqueues, stdenv, stm, text
, unordered-containers, vector, word8
}:
mkDerivation {
  pname = "http2";
  version = "1.6.5";
  sha256 = "16ebd1ee766f7a62a2cd2bd6ff98d68dbef85d512a847c8515b49a6b37f295ee";
  revision = "1";
  editedCabalFile = "1csq52vm7zgnbn481c25jimf3ch86z7gpibip382p8gv6iyy1a89";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    array base bytestring case-insensitive containers
    network-byte-order psqueues stm
  ];
  testHaskellDepends = [
    aeson aeson-pretty array base base16-bytestring bytestring
    case-insensitive containers directory doctest filepath Glob hspec
    network-byte-order psqueues stm text unordered-containers vector
    word8
  ];
  benchmarkHaskellDepends = [
    array base bytestring case-insensitive containers criterion heaps
    mwc-random network-byte-order psqueues stm
  ];
  homepage = "https://github.com/kazu-yamamoto/http2";
  description = "HTTP/2 library including frames, priority queues and HPACK";
  license = stdenv.lib.licenses.bsd3;
}
