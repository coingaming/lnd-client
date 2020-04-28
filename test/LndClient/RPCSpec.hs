{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralisedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wno-redundant-constraints #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}

module LndClient.RPCSpec
  ( spec,
  )
where

import Control.Concurrent (forkIO)
import Control.Concurrent.Async (race)
import Control.Concurrent.MVar (newEmptyMVar, putMVar, takeMVar)
import Control.Concurrent.Thread.Delay (delay)
import Control.Exception (bracket)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Control.Monad.Reader (MonadReader, ReaderT, asks, local, runReaderT)
import Control.Monad.Trans.Class (lift)
import Data.Aeson (Result (..), fromJSON, toJSON)
import Data.Aeson.QQ
import Data.ByteString (ByteString)
import Data.Text (Text, pack)
import Env
  ( (<=<),
    auto,
    header,
    help,
    keep,
    nonempty,
    parse,
    str,
    var,
  )
import Katip
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
    hashifyAddInvoiceRequest,
  )
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.LndEnv
  ( LndB64WalletPassword (..),
    LndEnv (..),
    LndHexMacaroon (..),
    LndTlsCert (..),
    LndTlsKey (..),
    LndUrl (..),
    newLndEnv,
  )
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.RPC
  ( RPCResponse (..),
    addInvoice,
    coerceRPCResponse,
    initWallet,
    newAddress,
    subscribeInvoices,
    unlockWallet,
  )
import LndClient.Utils
import Network.HTTP.Client (responseStatus)
import Network.HTTP.Types.Status (status404)
import System.IO (stdout)
import Test.Hspec
import UnliftIO (MonadUnliftIO (..), UnliftIO (..))

-- Katip-related stuff, might be needed to
-- capture and assert expected logs
data LogFormat = Bracket | JSON deriving (Read)

-- Environment of test App
data Env
  = Env
      { envLnd :: LndEnv,
        envEnv :: Text,
        envLogFormat :: LogFormat,
        envKatipNS :: Namespace,
        envKatipCTX :: LogContexts,
        envKatipLE :: LogEnv
      }

-- Will parse system environment variables for simplicity
data RawConfig
  = RawConfig
      -- LndClient
      { rawConfigLndB64WalletPassword :: Text,
        rawConfigLndTlsCert :: ByteString,
        rawConfigLndTlsKey :: ByteString,
        rawConfigLndHexMacaroon :: ByteString,
        rawConfigLndUrl :: String,
        -- katip
        rawConfigEnv :: Text,
        rawConfigLogFormat :: LogFormat
      }

rawConfig :: IO RawConfig
rawConfig =
  parse (header "LndClient config") $
    RawConfig
      <$> var
        (str <=< nonempty)
        "LND_CLIENT_LND_B64_WALLET_PASSWORD"
        (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_TLS_CERT" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_TLS_KEY" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_HEX_MACAROON" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_URL" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_ENV" (keep <> help "")
      <*> var (auto <=< nonempty) "LND_CLIENT_LOG_FORMAT" (keep <> help "")

newEnv' :: KatipContextT IO Env
newEnv' = liftIO rawConfig >>= newEnv

newEnv :: RawConfig -> KatipContextT IO Env
newEnv rc = do
  le <- getLogEnv
  ctx <- getKatipContext
  ns <- getKatipNamespace
  case newLndEnv
    (LndB64WalletPassword $ rawConfigLndB64WalletPassword rc)
    (LndTlsCert $ rawConfigLndTlsCert rc)
    (LndTlsKey $ rawConfigLndTlsKey rc)
    (LndHexMacaroon $ rawConfigLndHexMacaroon rc)
    (LndUrl $ rawConfigLndUrl rc) of
    Left x -> fail x
    Right lndEnv ->
      return
        Env
          { envLnd = lndEnv,
            envEnv = rawConfigEnv rc,
            envLogFormat = rawConfigLogFormat rc,
            envKatipLE = le,
            envKatipCTX = ctx,
            envKatipNS = ns
          }

runKatip :: KatipContextT IO a -> IO a
runKatip x = do
  handleScribe <-
    mkHandleScribeWithFormatter
      bracketFormat
      ColorIfTerminal
      stdout
      (permitItem DebugS)
      V2
  le <-
    registerScribe "stdout" handleScribe defaultScribeSettings
      =<< initLogEnv "LndClient" "test"
  runKatipContextT le (mempty :: LogContexts) mempty x

withEnv :: (Env -> IO ()) -> IO ()
withEnv = bracket (runKatip newEnv') (closeScribes . envKatipLE)

newtype AppM m a
  = AppM
      { unAppM :: ReaderT Env m a
      }
  deriving (Functor, Applicative, Monad, MonadIO, MonadReader Env)

instance (MonadUnliftIO m) => MonadUnliftIO (AppM m) where
  askUnliftIO =
    AppM (fmap (\(UnliftIO run) -> UnliftIO (run . unAppM)) askUnliftIO)
  withRunInIO go = AppM (withRunInIO (\k -> go (k . unAppM)))

instance (MonadIO m) => Katip (AppM m) where
  getLogEnv = asks envKatipLE
  localLogEnv f (AppM m) =
    AppM (local (\s -> s {envKatipLE = f (envKatipLE s)}) m)

instance (MonadIO m) => KatipContext (AppM m) where
  getKatipContext = asks envKatipCTX
  localKatipContext f (AppM m) =
    AppM (local (\s -> s {envKatipCTX = f (envKatipCTX s)}) m)
  getKatipNamespace = asks envKatipNS
  localKatipNamespace f (AppM m) =
    AppM (local (\s -> s {envKatipNS = f (envKatipNS s)}) m)

runApp :: Env -> AppM m a -> m a
runApp env app = runReaderT (unAppM app) env

spec :: Spec
spec = around withEnv $ do
  describe "InitWallet" $ do
    it "request-jsonify" $ \_ ->
      toJSON initWalletRequest
        `shouldBe` [aesonQQ|
            {
               wallet_password: "ZGV2ZWxvcGVy",
               cipher_seed_mnemonic: #{initWalletSeed}
            }
          |]
    it "rpc-succeeds" $ \env -> do
      res <-
        runApp env $
          initWallet (envLnd env) initWalletRequest
      res
        `shouldSatisfy` ( \case
                            LndSuccess _ -> True
                            LndFail (RPCResponse x) ->
                              status404 == responseStatus x
                            _ -> False
                        )
  describe "UnlockWallet" $ do
    it "request-jsonify" $ \_ ->
      toJSON (UnlockWalletRequest "FOO" 123)
        `shouldBe` [aesonQQ|
            {
               wallet_password: "FOO",
               recovery_window: 123
            }
          |]
    it "rpc-succeeds" $ shouldBeOk unlockWallet
  describe "AddInvoice" $ do
    it "request-jsonify" $ \_ ->
      toJSON addInvoiceRequest
        `shouldBe` [aesonQQ|
            {
              memo: "HELLO",
              value: 1000,
              description_hash: "NzPNl3/46xi5hzV+Is7Zn0YJfzHssjnoeK5jdg6D5NU="
            }
          |]
    it "response-jsonify" $ \_ ->
      Success (AddInvoiceResponse "hello" "world" "123")
        `shouldBe` fromJSON
          [aesonQQ|
             {
               r_hash: "hello",
               payment_request: "world",
               add_index: "123"
             }
           |]
    it "rpc-succeeds" $ shouldBeOk $ flip addInvoice addInvoiceRequest
  describe "NewAddress" $ do
    it "response-jsonify" $ \_ ->
      Success (NewAddressResponse "HELLO")
        `shouldBe` fromJSON [aesonQQ|{address: "HELLO"}|]
    it "rpc-succeeds" $ shouldBeOk newAddress
  describe "SubscribeInvoices" $ do
    it "invoice-jsonify" $ \_ ->
      Success
        ( Invoice
            { rHash = "hello",
              amtPaidSat = Nothing,
              creationDate = "11.11.2011",
              settleDate = Nothing,
              value = "123",
              expiry = "3600",
              settled = Nothing,
              settleIndex = Nothing,
              descriptionHash = Just "world",
              memo = Just "my invoice",
              paymentRequest = Just "req",
              fallbackAddr = ""
            }
        )
        `shouldBe` fromJSON
          [aesonQQ|{
                    r_hash: "hello",
                    creation_date: "11.11.2011",
                    value: "123",
                    expiry: "3600",
                    description_hash: "world",
                    memo: "my invoice",
                    payment_request: "req",
                    fallback_addr: ""
                   }|]
    it "rpc-succeeds" $ \env -> do
      x <- newEmptyMVar
      let subscribeInv =
            runApp env $
              subscribeInvoices
                (envLnd env)
                (SubscribeInvoicesRequest Nothing Nothing)
                (liftIO . putMVar x)
      let runTest = do
            _ <- delay 3000000
            res <-
              runApp env $
                coerceRPCResponse =<< addInvoice (envLnd env) addInvoiceRequest
            i <- takeMVar x
            return (res, i)
      result <- race subscribeInv runTest
      case result of
        Left f -> case f of
          LndSuccess _ -> fail "HTTP success"
          LndFail lndFail -> fail (show lndFail)
          LndHttpException e -> fail (show e)
        Right (res, i) ->
          i
            `shouldSatisfy` ( \this ->
                                AddInvoice.rHash res
                                  == Invoice.rHash this
                                  && pack (show $ AddInvoice.value addInvoiceRequest)
                                  == Invoice.value this
                            )
  where
    addInvoiceRequest =
      hashifyAddInvoiceRequest $
        AddInvoiceRequest
          { memo = Just "HELLO",
            value = 1000,
            descriptionHash = Nothing
          }
    initWalletSeed =
      [ "absent",
        "betray",
        "direct",
        "scheme",
        "sunset",
        "mechanic",
        "exhaust",
        "suggest",
        "boy",
        "arena",
        "sketch",
        "bone",
        "news",
        "south",
        "way",
        "survey",
        "clip",
        "dutch",
        "depart",
        "green",
        "furnace",
        "wire",
        "wave",
        "fall"
      ]
    initWalletRequest =
      InitWalletRequest
        { walletPassword = "ZGV2ZWxvcGVy",
          cipherSeedMnemonic = initWalletSeed
        }
    shouldBeOk this env = do
      res <- runApp env $ this $ envLnd env
      res
        `shouldSatisfy` ( \case
                            LndSuccess _ -> True
                            _ -> False
                        )
