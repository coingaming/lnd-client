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
import Control.Monad.Reader (MonadReader, ReaderT, asks, join, local, runReaderT)
import Control.Monad.Trans.Class (lift)
import Crypto.Hash.SHA256 (hash)
import Data.Aeson (Result (..), fromJSON, toJSON)
import Data.Aeson.QQ
import Data.ByteString (ByteString)
import Data.ByteString.Base16 (decode)
import Data.ByteString.Base64 (encode)
import Data.Maybe
import Data.Text as Text (Text, pack)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
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
import LndClient
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
    hashifyAddInvoiceRequest,
  )
import LndClient.Data.BtcEnv
import LndClient.Data.GetInfo (GetInfoResponse (..))
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.LndEnv
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.Newtypes
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..), Peer (..), PeerList (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..), SendPaymentResponse (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.QRCode
import LndClient.RPC
  ( RPCResponse (..),
    addInvoice,
    coerceRPCResponse,
    getInfo,
    getPeers,
    initWallet,
    newAddress,
    openChannel,
    sendPayment,
    subscribeInvoices,
    unlockWallet,
  )
import LndClient.Utils
import Network.Bitcoin (Client, getClient)
import Network.Bitcoin.Mining (generateToAddress)
import Network.HTTP.Client (responseStatus)
import Network.HTTP.Types.Status (status404)
import System.IO (stdout)
import Test.Hspec
import UnliftIO (MonadUnliftIO (..), UnliftIO (..))

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
  env
    { envLnd =
        lndEnv
          { envLndUrl = LndUrl "https://localhost:8003"
          }
    }

btcClient :: IO Client
btcClient = do
  env <- btcEnv
  let user = btcRpcUser env
  let pass = btcRpcPassword env
  let url = btcRpcUrl env
  getClient url user pass

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
    it "rpc-succeeds-customer" $ \env -> shouldBeOk (flip initWallet initWalletRequestCust) (custEnv env)
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
      Success
        ( AddInvoiceResponse
            (RHash "hello")
            (PaymentRequest "world")
            (AddIndex 123)
        )
        `shouldBe` fromJSON
          [aesonQQ|
             {
               r_hash: "hello",
               payment_request: "world",
               add_index: "123"
             }
           |]
    it "rpc-succeeds" $ shouldBeOk $ flip addInvoice addInvoiceRequest
    it "generate-qrcode" $ \env -> do
      res <-
        runApp env $
          coerceRPCResponse =<< addInvoice (envLnd env) addInvoiceRequest
      let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
      isJust qr `shouldBe` True
  describe "NewAddress" $ do
    it "response-jsonify" $ \_ ->
      Success (NewAddressResponse "HELLO")
        `shouldBe` fromJSON [aesonQQ|{address: "HELLO"}|]
    it "rpc-succeeds" $ shouldBeOk newAddress
  describe "Peers" $ do
    it "rpc-succeeds" $ shouldBeOk getPeers
  describe "ConnectPeer" $ do
    it "rpc-succeeds" $ \env -> do
      _ <- runApp env $ initWallet (envLnd env) initWalletRequest
      _ <- runApp (custEnv env) $ initWallet (envLnd $ custEnv env) initWalletRequestCust
      GetInfoResponse nodePubKey <- runApp env $ coerceRPCResponse =<< getInfo (envLnd $ custEnv env)
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
  describe "OpenChannel" $ do
    it "response-jsonify" $ \_ ->
      Success
        ( OpenChannelRequest
            { nodePubkey = "key",
              localFundingAmount = MoneyAmount 1000,
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
        )
        `shouldBe` fromJSON
          [aesonQQ|{
          node_pubkey: "key",
          local_funding_amount: "1000",
          push_sat: "1000"
                   }|]
    it "rpc-succeeds" $ \env -> do
      NewAddressResponse btcAddress <- runApp env $ coerceRPCResponse =<< newAddress (envLnd env)
      client <- btcClient
      GetInfoResponse custPubKey <- runApp env $ coerceRPCResponse =<< getInfo (envLnd $ custEnv env)
      let connectPeerRequest =
            ConnectPeerRequest
              { addr =
                  LightningAddress
                    { pubkey = custPubKey,
                      host = "localhost:9734"
                    },
                perm = False
              }
      _ <- runApp env $ connectPeer (envLnd env) connectPeerRequest
      _ <- generateToAddress client 100 btcAddress Nothing
      _ <- delay 3000000
      req <- openChannelRequest env
      shouldBeOk (flip openChannel req) env
  describe "SubscribeInvoices" $ do
    it "invoice-jsonify" $ \_ ->
      Success
        ( Invoice
            { rHash = RHash "hello",
              amtPaidSat = Nothing,
              creationDate = Nothing,
              settleDate = Nothing,
              value = MoneyAmount 1000,
              expiry = Nothing,
              settled = Nothing,
              settleIndex = Nothing,
              descriptionHash = Nothing,
              memo = Nothing,
              paymentRequest = Just "req",
              fallbackAddr = Nothing,
              cltvExpiry = Nothing,
              private = Nothing,
              addIndex = "8",
              state = Nothing
            }
        )
        `shouldBe` fromJSON
          [aesonQQ|{
                    r_hash: "hello",
                    value: "1000",
                    payment_request: "req",
                    add_index: "8"
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
      subResult <- race subscribeInv runTest
      --
      --TODO Optimize handling LndResult(LndSuccess, LndFail, LndHttpException)
      --
      case subResult of
        Left f -> case f of
          LndSuccess _ -> fail "HTTP success"
          LndFail lndFail -> fail (show lndFail)
          LndHttpException e -> fail (show e)
        Right (res, i) ->
          i
            `shouldSatisfy` ( \this ->
                                AddInvoice.rHash res == Invoice.rHash this
                            )
    it "rpc-succeeds-send-payment" $ \env -> do
      invoice <- runApp env $ coerceRPCResponse =<< addInvoice (envLnd env) addInvoiceRequest
      x <- newEmptyMVar
      let sendPaymentRequest =
            SendPaymentRequest $ AddInvoice.paymentRequest invoice
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
                coerceRPCResponse =<< sendPayment (envLnd $ custEnv env) sendPaymentRequest
            i <- takeMVar x
            return (res, i)
      subResult <- race subscribeInv runTest
      --
      --TODO Optimize handling LndResult(LndSuccess, LndFail, LndHttpException)
      --
      case subResult of
        Left f -> case f of
          LndSuccess _ -> fail "HTTP success"
          LndFail lndFail -> fail (show lndFail)
          LndHttpException e -> fail (show e)
        Right (res, i) ->
          i
            `shouldSatisfy` ( \this ->
                                SendPaymentResponse.state res == "settled"
                            )
  describe "GetInfo" $ it "rpc-succeeds" $ \env -> do
    shouldBeOk getInfo (custEnv env)
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
      let (pubKeyHex, _) = decode (encodeUtf8 x)
      let req =
            OpenChannelRequest
              { nodePubkey = decodeUtf8 (encode pubKeyHex),
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
      print req
      return req
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
    initWalletSeedCust =
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
      res <- runApp env $ coerceRPCResponse =<< getPeers (envLnd env)
      let peersList = head $ peers res
      return $ pubKey peersList
    initWalletRequest =
      InitWalletRequest
        { walletPassword = "ZGV2ZWxvcGVy",
          aezeedPassphrase = Nothing,
          cipherSeedMnemonic = initWalletSeed
        }
    initWalletRequestCust =
      InitWalletRequest
        { walletPassword = "ZGV2ZWxvcGVy",
          aezeedPassphrase = Just "ZGV2ZWxvcGVy",
          cipherSeedMnemonic = initWalletSeedCust
        }
    shouldBeOk this env = do
      res <- runApp env $ this $ envLnd env
      res
        `shouldSatisfy` ( \case
                            LndSuccess _ -> True
                            _ -> False
                        )
