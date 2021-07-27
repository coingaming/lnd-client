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
    url = "https://github.com/coingaming/persistent-migration";
    sha256 = "1dk9b9h9c3c5krzdq4l8qrly5b2hlpkkwp95vjdg6618xwhsazry";
    rev = "500865d3da6fce520555294d452a6ced94ccf119";
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
