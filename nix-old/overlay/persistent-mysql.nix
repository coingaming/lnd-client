{ mkDerivation, aeson, base, blaze-builder, bytestring, conduit
, containers, fast-logger, hspec, HUnit, monad-logger, mysql
, mysql-simple, persistent, persistent-qq, persistent-template
, persistent-test, QuickCheck, quickcheck-instances, resource-pool
, resourcet, stdenv, text, time, transformers, unliftio-core
}:
mkDerivation {
  pname = "persistent-mysql";
  version = "2.10.3.1";
  sha256 = "c745bead4629d3765175ea060d6c36a0cf11a1439d21b2a1c24cf05daa17fa01";
  libraryHaskellDepends = [
    aeson base blaze-builder bytestring conduit containers monad-logger
    mysql mysql-simple persistent resource-pool resourcet text
    transformers unliftio-core
  ];
  testHaskellDepends = [
    base bytestring containers fast-logger hspec HUnit monad-logger
    mysql persistent persistent-qq persistent-template persistent-test
    QuickCheck quickcheck-instances resourcet text time transformers
    unliftio-core
  ];
  homepage = "http://www.yesodweb.com/book/persistent";
  description = "Backend for the persistent library using MySQL database server";
  license = stdenv.lib.licenses.mit;
}
