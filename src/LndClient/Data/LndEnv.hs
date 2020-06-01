{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}

module LndClient.Data.LndEnv
  ( LndEnv (..),
    RawConfig,
    LndWalletPassword (..),
    LndTlsCert,
    LndHexMacaroon (..),
    LndHost (..),
    LndPort,
    newLndEnv,
    readLndEnv,
    createLndTlsCert,
    createLndPort,
  )
where

import Data.Aeson as A ((.:), (.:?), Value (..), eitherDecodeStrict)
import Data.ByteString.Char8 as C8
import qualified Data.PEM as Pem
import Data.Scientific
import Data.Text.Lazy as LT
import Data.X509
import Env
import LndClient.Class
import LndClient.Data.Newtype
import LndClient.Data.Type
import LndClient.Import.External as Ex
import LndClient.Util as U
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel.Client

newtype LndWalletPassword = LndWalletPassword Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndTlsCert = LndTlsCert ByteString
  deriving (PersistField, PersistFieldSql, Eq)

newtype LndHexMacaroon = LndHexMacaroon Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndHost = LndHost Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndPort = LndPort Int
  deriving (PersistField, PersistFieldSql, Eq)

data RawConfig
  = RawConfig
      { rawConfigLndWalletPassword :: LndWalletPassword,
        rawConfigLndTlsCert :: LndTlsCert,
        rawConfigLndHexMacaroon :: LndHexMacaroon,
        rawConfigLndHost :: LndHost,
        rawConfigLndPort :: LndPort,
        rawConfigLndCipherSeedMnemonic :: CipherSeedMnemonic,
        rawConfigLndAezeedPassphrase :: Maybe AezeedPassphrase
      }
  deriving (Eq)

data LndEnv
  = LndEnv
      { envLndWalletPassword :: LndWalletPassword,
        envLndHexMacaroon :: LndHexMacaroon,
        envLndGrpcConfig :: ClientConfig,
        envLndLogErrors :: Bool,
        envLndCipherSeedMnemonic :: CipherSeedMnemonic,
        envLndAezeedPassphrase :: Maybe AezeedPassphrase
      }

instance ToGrpc LndWalletPassword ByteString where
  toGrpc x = Right $ encodeUtf8 (coerce x :: Text)

--
-- TODO test FromJSON failed
--

instance FromJSON LndTlsCert where
  parseJSON x =
    case x of
      A.String s ->
        case createLndTlsCert $ encodeUtf8 s of
          Right cert -> return cert
          Left e -> failure e
      e -> failure e
    where
      failure err = fail $ "Json certificate parsing error: " <> " " <> show err

instance FromJSON LndPort where
  parseJSON x =
    case x of
      A.Number s -> do
        let ePort = maybeToRight (LndEnvError "Port should be Int") $ toBoundedInteger s
        case ePort >>= createLndPort of
          Right lndPort -> return lndPort
          Left err -> failure err
      err -> failure err
    where
      failure err = fail $ "Json port loading error: " <> " " <> show err

--
--TODO test fromJSON for not an Object input
--
instance FromJSON RawConfig where
  parseJSON (Object v) =
    RawConfig <$> v .: "lnd_wallet_password"
      <*> v .: "lnd_tls_cert"
      <*> v .: "lnd_hex_macaroon"
      <*> v .: "lnd_host"
      <*> v .: "lnd_port"
      <*> v .: "lnd_cipher_seed_mnemonic"
      <*> v .:? "lnd_aezeed_passphrase"
  parseJSON _ = mzero

createLndTlsCert :: ByteString -> Either LndError LndTlsCert
createLndTlsCert bs = do
  pemsM <- first (LndEnvError . LT.pack) $ Pem.pemParseBS bs
  pem <-
    note (LndEnvError $ LT.pack "No pem found") $ safeHead pemsM
  bimap
    (LndEnvError . LT.pack . ("Certificate is not valid: " <>))
    (const $ LndTlsCert bs)
    (decodeSignedCertificate $ Pem.pemContent pem)

createLndPort :: Word32 -> Either LndError LndPort
createLndPort p = do
  let maybePort :: Maybe Int = U.safeFromIntegral p
  maybeToRight (LndEnvError "Wrong port") $ LndPort <$> maybePort

rawConfig :: IO RawConfig
rawConfig = parse (header "LndClient config") $ var (parseRawConfig <=< nonempty) "LND_CLIENT_ENV_DATA" (keep <> help "")
  where
    parseRawConfig :: String -> Either Error RawConfig
    parseRawConfig strConfig = first UnreadError $ eitherDecodeStrict $ C8.pack strConfig

readLndEnv :: IO LndEnv
readLndEnv = do
  rc <- rawConfig
  return $
    newLndEnv
      (rawConfigLndWalletPassword rc)
      (rawConfigLndTlsCert rc)
      (rawConfigLndHexMacaroon rc)
      (rawConfigLndHost rc)
      (rawConfigLndPort rc)
      (rawConfigLndCipherSeedMnemonic rc)
      (rawConfigLndAezeedPassphrase rc)

newLndEnv ::
  LndWalletPassword ->
  LndTlsCert ->
  LndHexMacaroon ->
  LndHost ->
  LndPort ->
  CipherSeedMnemonic ->
  Maybe AezeedPassphrase ->
  LndEnv
newLndEnv pwd cert mac host port seed aezeed =
  LndEnv
    { envLndWalletPassword = pwd,
      envLndHexMacaroon = mac,
      envLndLogErrors = True,
      envLndCipherSeedMnemonic = seed,
      envLndAezeedPassphrase = aezeed,
      envLndGrpcConfig =
        ClientConfig
          { clientServerHost = Host $ encodeUtf8 (coerce host :: Text),
            clientServerPort = Port $ coerce port,
            clientArgs = [],
            clientSSLConfig =
              Just $
                ClientSSLConfig
                  { serverRootCert = Just $ coerce cert,
                    clientSSLKeyCertPair = Nothing,
                    clientMetadataPlugin = Nothing
                  },
            clientAuthority = Nothing
          }
    }
