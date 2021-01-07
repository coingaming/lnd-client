{ mkDerivation, aeson, attoparsec, base, blaze-html, bytestring
, conduit, containers, exceptions, hspec, monad-logger, mtl, mysql
, mysql-simple, persistent, persistent-mysql, persistent-postgresql
, persistent-sqlite, persistent-template, postgresql-libpq
, postgresql-simple, resourcet, stdenv, tagged, text, time
, transformers, unliftio, unordered-containers, vector
}:
mkDerivation {
  pname = "esqueleto";
  version = "3.4.0.1";
  sha256 = "ac96da8c456148f7f2d203c7e56590bc7e416ccacf6d6e1ed217bf1eb3f308ef";
  libraryHaskellDepends = [
    aeson attoparsec base blaze-html bytestring conduit containers
    monad-logger persistent resourcet tagged text time transformers
    unliftio unordered-containers
  ];
  testHaskellDepends = [
    aeson attoparsec base blaze-html bytestring conduit containers
    exceptions hspec monad-logger mtl mysql mysql-simple persistent
    persistent-mysql persistent-postgresql persistent-sqlite
    persistent-template postgresql-libpq postgresql-simple resourcet
    tagged text time transformers unliftio unordered-containers vector
  ];
  homepage = "https://github.com/bitemyapp/esqueleto";
  description = "Type-safe EDSL for SQL queries on persistent backends";
  license = stdenv.lib.licenses.bsd3;
}
