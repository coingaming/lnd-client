{ mkDerivation, aeson, base, bytestring, conduit, containers
, exceptions, fast-logger, hspec, HUnit, microlens-th, monad-logger
, persistent, persistent-template, persistent-test, QuickCheck
, resource-pool, resourcet, sqlite, stdenv, system-fileio
, system-filepath, temporary, text, time, transformers
, unliftio-core, unordered-containers
}:
mkDerivation {
  pname = "persistent-sqlite";
  version = "2.11.0.0";
  sha256 = "db6943f662f7c3465f95261b038d4d3910cceb3246a9eb05a9382f00ac96d1cd";
  configureFlags = [ "-fsystemlib" ];
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base bytestring conduit containers microlens-th monad-logger
    persistent resource-pool resourcet text time transformers
    unliftio-core unordered-containers
  ];
  librarySystemDepends = [ sqlite ];
  testHaskellDepends = [
    base bytestring containers exceptions fast-logger hspec HUnit
    monad-logger persistent persistent-template persistent-test
    QuickCheck resourcet system-fileio system-filepath temporary text
    time transformers unliftio-core
  ];
  homepage = "http://www.yesodweb.com/book/persistent";
  description = "Backend for the persistent library using sqlite3";
  license = stdenv.lib.licenses.mit;
}
