{ mkDerivation, base, bytestring, conduit, containers, exceptions
, fetchgit, fgl, hpack, monad-logger, mtl, persistent
, persistent-postgresql, persistent-template, process, QuickCheck
, resource-pool, stdenv, tasty, tasty-golden, tasty-quickcheck
, temporary, text, time, unordered-containers, yaml
}:
mkDerivation {
  pname = "persistent-migration";
  version = "0.1.0";
  src = fetchgit {
    url = "https://github.com/coingaming/persistent-migration.git";
    sha256 = "1zs4457q76xxpx1br1xjnh65xcl6bm2zkxjadi92vng7qm7p5z6n";
    rev = "fea2e971b5102f5068021937dbf4ee3bcb42dd1e";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [
    base containers fgl mtl persistent text time unordered-containers
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base bytestring conduit containers exceptions monad-logger mtl
    persistent persistent-postgresql persistent-template process
    QuickCheck resource-pool tasty tasty-golden tasty-quickcheck
    temporary text time yaml
  ];
  prePatch = "hpack";
  homepage = "https://github.com/brandonchinn178/persistent-migration#readme";
  description = "Manual migrations for the persistent library";
  license = stdenv.lib.licenses.bsd3;
}
