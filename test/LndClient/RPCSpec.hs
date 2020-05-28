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

module LndClient.RPCSpec
  ( spec,
  )
where

import Control.Concurrent.Async (async, link)
import Control.Concurrent.Thread.Delay (delay)
import Data.Aeson as AE (Result (..), fromJSON)
import Data.Aeson.QQ.Simple
import Data.ByteString as BS (reverse)
import Data.ByteString.Base16 as B16 (decode)
import Data.ByteString.Char8 as C8 (split)
import Data.Maybe (fromMaybe)
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
    hashifyAddInvoiceRequest,
  )
import LndClient.Data.BtcEnv
import LndClient.Data.CloseChannel (ChannelPoint (..), CloseChannelRequest (..))
import LndClient.Data.GetInfo (GetInfoResponse (..))
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels (Channel (..), ListChannelsRequest (..), ListChannelsResponse (..))
import LndClient.Data.LndEnv
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..), Peer (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Import
import LndClient.QRCode
import LndClient.RPC
import qualified LndGrpc as GRPC
import Network.Bitcoin as BTC (Client, getClient)
import Network.Bitcoin.Mining (generateToAddress)
import Network.GRPC.HighLevel.Generated
import Test.Hspec

--
-- TODO : remove me
--
coerceLndResult :: (MonadIO m) => Either LndError a -> m a
coerceLndResult (Right x) = return x
coerceLndResult (Left x) = liftIO $ fail $ "coerceLndResult failed " <> show x

-- Environment of test App
data Env
  = Env
      { envLnd :: LndEnv,
        envKatipNS :: Namespace,
        envKatipCTX :: LogContexts,
        envKatipLE :: LogEnv
      }

custEnv :: Env -> Env
custEnv env = do
  let lndEnv = envLnd env
  let grpcConfig = envLndGrpcConfig lndEnv
  env
    { envLnd =
        lndEnv
          { envLndGrpcConfig =
              grpcConfig
                { clientServerPort = 11009
                }
          }
    }

btcClient :: IO BTC.Client
btcClient = do
  env <- btcEnv
  let user = btcRpcUser env
  let passw = btcRpcPassword env
  let url = btcRpcUrl env
  getClient (unpack url) user passw

readEnv :: KatipContextT IO Env
readEnv = do
  le <- getLogEnv
  ctx <- getKatipContext
  ns <- getKatipNamespace
  lndEnv <- liftIO readLndEnv
  return
    Env
      { envLnd = lndEnv,
        envKatipLE = le,
        envKatipCTX = ctx,
        envKatipNS = ns
      }

runKatip :: KatipContextT IO a -> IO a
runKatip x = do
  handleScribe <-
    mkHandleScribeWithFormatter
      bracketFormat
      --jsonFormat
      ColorIfTerminal
      stdout
      (permitItem DebugS)
      V2
  le <-
    registerScribe "stdout" handleScribe defaultScribeSettings
      =<< initLogEnv "LndClient" "test"
  runKatipContextT le (mempty :: LogContexts) mempty x

withEnv :: (Env -> IO ()) -> IO ()
withEnv = bracket (runKatip readEnv) (closeScribes . envKatipLE)

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
    it "rpc-succeeds-merchant" $ \env -> do
      res <-
        runApp env $
          lazyInitWallet (envLnd env) initWalletRequest
      res `shouldSatisfy` isRight
    it "rpc-succeeds-customer" $ \env -> do
      res <-
        runApp env $
          lazyInitWallet (envLnd $ custEnv env) initWalletRequestCust
      res `shouldSatisfy` isRight
  describe "LazyUnlockWallet"
    $ it "rpc-succeeds"
    $ shouldBeOk lazyUnlockWallet
  describe "AddInvoice" $ do
    it "rpc-succeeds" $ shouldBeOk $ flip addInvoice addInvoiceRequest
    it "generate-qrcode" $ \env -> do
      res <-
        runApp env $
          coerceLndResult =<< addInvoice (envLnd env) addInvoiceRequest
      let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
      isJust qr `shouldBe` True
  describe "NewAddress" $ do
    it "rpc-succeeds"
      $ shouldBeOk
      $ flip newAddress GRPC.AddressTypeWITNESS_PUBKEY_HASH
  describe "Peers" $ do
    it "rpc-succeeds" $ shouldBeOk listPeers
  describe "ConnectPeer" $ do
    it "rpc-succeeds" $ \env -> do
      _ <- runApp env $ lazyInitWallet (envLnd env) initWalletRequest
      _ <- runApp (custEnv env) $ lazyInitWallet (envLnd $ custEnv env) initWalletRequestCust
      GetInfoResponse nodePubKey <- runApp env $ coerceLndResult =<< getInfo (envLnd $ custEnv env)
      let connectPeerRequest =
            ConnectPeerRequest
              { addr =
                  LightningAddress
                    { pubkey = nodePubKey,
                      host = "localhost:9734"
                    },
                perm = False
              }
      shouldBeOk (flip connectPeer connectPeerRequest) env
  describe "OpenChannel"
    $ it "rpc-succeeds"
    $ \env -> do
      NewAddressResponse btcAddress <-
        runApp (custEnv env) $
          coerceLndResult
            =<< newAddress
              (envLnd $ custEnv env)
              GRPC.AddressTypeWITNESS_PUBKEY_HASH
      client <- btcClient
      GetInfoResponse mercPubKey <- runApp env $ coerceLndResult =<< getInfo (envLnd env)
      let connectPeerRequest =
            ConnectPeerRequest
              { addr =
                  LightningAddress
                    { pubkey = mercPubKey,
                      host = "localhost:9735"
                    },
                perm = False
              }
      _ <- runApp (custEnv env) $ connectPeer (envLnd $ custEnv env) connectPeerRequest
      _ <- generateToAddress client 100 (toStrict btcAddress) Nothing
      _ <- delay 3000000
      req <- openChannelRequest (custEnv env)
      shouldBeOk (`openChannelSync` req) (custEnv env)
  describe "ListChannelAndClose"
    $ it "rpc-succeeds"
    $ \env ->
      do
        NewAddressResponse btcAddress <-
          runApp (custEnv env) $
            coerceLndResult
              =<< newAddress
                (envLnd $ custEnv env)
                GRPC.AddressTypeWITNESS_PUBKEY_HASH
        client <- btcClient
        GetInfoResponse mercPubKey <- runApp env $ coerceLndResult =<< getInfo (envLnd env)
        let connectPeerRequest =
              ConnectPeerRequest
                { addr =
                    LightningAddress
                      { pubkey = mercPubKey,
                        host = "localhost:9735"
                      },
                  perm = False
                }
        _ <- runApp (custEnv env) $ connectPeer (envLnd $ custEnv env) connectPeerRequest
        _ <- generateToAddress client 100 (toStrict btcAddress) Nothing
        _ <- delay 3000000
        req <- openChannelRequest (custEnv env)
        _ <- runApp (custEnv env) $ openChannelSync (envLnd $ custEnv env) req
        ListChannelsResponse channelList <- runApp env $ coerceLndResult =<< listChannels (envLnd env) (ListChannelsRequest False False False False Nothing)
        let firstChannel :: Channel = fromMaybe (Channel "" "") $ safeHead channelList
        let channelPointStr :: ByteString = encodeUtf8 $ LndClient.Data.ListChannels.channelPoint firstChannel
        let fundingTxid :: ByteString = fromMaybe "" $ safeHead $ split ':' channelPointStr
        let (fundingTxidHex, _) = B16.decode fundingTxid
        x <- newEmptyMVar
        link
          =<< ( async $ runApp env $
                  closeChannel
                    (liftIO . putMVar x)
                    (envLnd env)
                    (CloseChannelRequest (ChannelPoint (BS.reverse fundingTxidHex) 0) True Nothing Nothing Nothing)
              )
        _ <- delay 3000000
        ListChannelsResponse channelList2 <- runApp env $ coerceLndResult =<< listChannels (envLnd env) (ListChannelsRequest False False False False Nothing)
        _ <- takeMVar x
        channelList2
          `shouldSatisfy` (\list2 -> length channelList - length list2 == 1)
  describe "SubscribeInvoices"
    $ it "rpc-succeeds"
    $ \env -> do
      x <- newEmptyMVar
      -- can't use proper "race" there
      -- because of this
      -- https://github.com/awakesecurity/gRPC-haskell/issues/104
      -- will use low-level async + link for now
      link
        =<< ( async $ runApp env $
                subscribeInvoices
                  (liftIO . putMVar x)
                  (envLnd env)
                  (SubscribeInvoicesRequest Nothing Nothing)
            )
      _ <- delay 3000000
      originalInvoice <-
        runApp env $
          coerceLndResult =<< addInvoice (envLnd env) addInvoiceRequest
      resultingInvoice <- takeMVar x
      print resultingInvoice
      resultingInvoice
        `shouldSatisfy` ( \this ->
                            AddInvoice.rHash originalInvoice == Invoice.rHash this
                        )
  describe "SubscribeInvoicesAndSettleIt"
    $ it "rpc-succeeds"
    $ \env -> do
      NewAddressResponse btcAddress <-
        runApp (custEnv env) $
          coerceLndResult
            =<< newAddress
              (envLnd $ custEnv env)
              GRPC.AddressTypeWITNESS_PUBKEY_HASH
      client <- btcClient
      _ <- generateToAddress client 100 (toStrict btcAddress) Nothing
      invoice <- runApp env $ coerceLndResult =<< addInvoice (envLnd env) addInvoiceRequest
      x <- newEmptyMVar
      let sendPaymentRequest =
            SendPaymentRequest
              { paymentRequest = (AddInvoice.paymentRequest invoice),
                amt = (MoneyAmount 1000)
              }
      link
        =<< ( async $ runApp env $
                subscribeInvoices
                  (liftIO . putMVar x)
                  (envLnd env)
                  (SubscribeInvoicesRequest Nothing Nothing)
            )
      _ <- delay 3000000
      _ <-
        runApp (custEnv env) $
          coerceLndResult =<< sendPayment (envLnd $ custEnv env) sendPaymentRequest
      resultingInvoice <- takeMVar x
      print resultingInvoice
      resultingInvoice
        `shouldSatisfy` ( \this ->
                            AddInvoice.rHash invoice == Invoice.rHash this
                        )
  describe "GetInfo"
    $ it "rpc-succeeds"
    $ \env ->
      shouldBeOk getInfo (custEnv env)
  describe "LoadEnv"
    $ it "request-jsonify"
    $ \_ ->
      case (fromJSON envJsonRequest :: Result RawConfig) of
        Success _ -> True
        _ -> False
  where
    addInvoiceRequest =
      hashifyAddInvoiceRequest $
        AddInvoiceRequest
          { memo = Just "HELLO",
            value = MoneyAmount 1000,
            descriptionHash = Nothing
          }
    openChannelRequest :: Env -> IO OpenChannelRequest
    openChannelRequest env = do
      x <- somePubKey env
      let (pubKeyHex, _) = B16.decode (encodeUtf8 x)
      let req =
            OpenChannelRequest
              { nodePubkey = pubKeyHex,
                localFundingAmount = MoneyAmount 20000,
                pushSat = Just $ MoneyAmount 1000,
                targetConf = Nothing,
                satPerByte = Nothing,
                private = Nothing,
                minHtlcMsat = Nothing,
                remoteCsvDelay = Nothing,
                minConfs = Nothing,
                spendUnconfirmed = Nothing,
                closeAddress = Nothing
              }
      return req
    initWalletSeed =
      CipherSeedMnemonic
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
    initWalletSeedCust =
      CipherSeedMnemonic
        [ "absent",
          "dilemma",
          "mango",
          "firm",
          "hero",
          "green",
          "wide",
          "rebel",
          "pigeon",
          "custom",
          "town",
          "stadium",
          "shock",
          "bind",
          "ocean",
          "seek",
          "enforce",
          "during",
          "bird",
          "honey",
          "enrich",
          "number",
          "wealth",
          "thunder"
        ]
    somePubKey env = do
      res <- runApp env $ coerceLndResult =<< listPeers (envLnd env)
      let mPeer = safeHead res
      case mPeer of
        Just pPeer -> return $ pubKey pPeer
        Nothing -> fail "no any peers connected"
    initWalletRequest =
      InitWalletRequest
        { walletPassword = LndWalletPassword "developer",
          aezeedPassphrase = Nothing,
          cipherSeedMnemonic = initWalletSeed
        }
    initWalletRequestCust =
      InitWalletRequest
        { walletPassword = LndWalletPassword "developer",
          aezeedPassphrase = Just $ AezeedPassphrase "developer",
          cipherSeedMnemonic = initWalletSeedCust
        }
    shouldBeOk this env = do
      res <- runApp env $ this $ envLnd env
      res `shouldSatisfy` isRight
    envJsonRequest =
      [aesonQQ|
            {
                "name":"bitcasino",
                "lnd_wallet_password":"developer",
                "lnd_tls_cert":"-----BEGIN CERTIFICATE-----\nMIIB5TCCAYugAwIBAgIQdO9Ld+VoSDTS6iCH8Q1vOTAKBggqhkjOPQQDAjA4MR8w\nHQYDVQQKExZsbmQgYXV0b2dlbmVyYXRlZCBjZXJ0MRUwEwYDVQQDEww3MmRlNDc0\nNWY0ZmIwHhcNMTkxMTI2MTAxMzE5WhcNMjEwMTIwMTAxMzE5WjA4MR8wHQYDVQQK\nExZsbmQgYXV0b2dlbmVyYXRlZCBjZXJ0MRUwEwYDVQQDEww3MmRlNDc0NWY0ZmIw\nWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQT8jCB5MLjVgZ19RelGVgNiI2AtX9w\nd+k+EPdBn1ETVvtbtB0d21j2JYilKCwfJvTSFyEcrpSNhZPEc06RdoHRo3cwdTAO\nBgNVHQ8BAf8EBAMCAqQwDwYDVR0TAQH/BAUwAwEB/zBSBgNVHREESzBJggw3MmRl\nNDc0NWY0ZmKCCWxvY2FsaG9zdIIEdW5peIIKdW5peHBhY2tldIcEfwAAAYcQAAAA\nAAAAAAAAAAAAAAAAAYcErBEAAjAKBggqhkjOPQQDAgNIADBFAiAcgXfpsWP36e+J\nf9lsNk/4t2cUEhiP/g3zbvxPQCS4DgIhAPNO2hW1X7vyIWWfrOKawB8OzSeP9r2D\n1y1UOaK4Ps1i\n-----END CERTIFICATE-----",
                "lnd_hex_macaroon":"0201036C6E6402CF01030A10634D5C8D3227E9F63529F82690C1898E1201301A160A0761646472657373120472656164120577726974651A130A04696E666F120472656164120577726974651A170A08696E766F69636573120472656164120577726974651A160A076D657373616765120472656164120577726974651A170A086F6666636861696E120472656164120577726974651A160A076F6E636861696E120472656164120577726974651A140A057065657273120472656164120577726974651A120A067369676E6572120867656E657261746500000620EB31C7413A5A44D14705852F8C0CA399104658C40AC866918C1D4B981DF2E71E",
                "lnd_host":"localhost",
                "lnd_port":10009,
                "lnd_cipher_seed_mnemonic":[
                  "absent",
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
                ],
                "lnd_aezeed_passphrase":"developer"
                        }
          |]
