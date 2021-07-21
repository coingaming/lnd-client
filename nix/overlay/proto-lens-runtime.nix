{ mkDerivation, base, bytestring, containers, deepseq, filepath
, lens-family, proto-lens, stdenv, text, vector
}:
mkDerivation {
  pname = "proto-lens-runtime";
  version = "0.6.0.0";
  sha256 = "96f17141f5927f28388ec5ff5937419c1698a1e1cbdbb4f1272d44843051ae73";
  libraryHaskellDepends = [
    base bytestring containers deepseq filepath lens-family proto-lens
    text vector
  ];
  doHaddock = false;
  homepage = "https://github.com/google/proto-lens#readme";
  license = stdenv.lib.licenses.bsd3;
}
