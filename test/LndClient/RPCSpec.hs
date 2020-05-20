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

module LndClient.RPCSpec
  ( spec,
  )
where

import Control.Concurrent.Async (async, link)
import Control.Concurrent.Thread.Delay (delay)
import Data.Aeson.QQ
import Data.ByteString.Base16 (decode)
import Data.ByteString.Base64 as B64 (encode)
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
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..), Peer (..), PeerList (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.QRCode
import Network.Bitcoin as BTC (Client, getClient)
import Network.Bitcoin.Mining (generateToAddress)
import Network.GRPC.LowLevel.Client as GC
import Network.HTTP.Client
import Test.Hspec

--
-- TODO : remove me
--
coerceLndResult :: (Show a, MonadIO m) => Either LndError a -> m a
coerceLndResult (Right x) = return x
coerceLndResult (Left x) = liftIO $ fail $ "got error " <> show x

--
-- TODO : remove me
--
coerceRPCResponse :: (Show a, MonadIO m) => Either LndError (RPCResponse a) -> m a
coerceRPCResponse x = do
  RPCResponse y <- coerceLndResult x
  case responseBody y of
    Left e -> liftIO $ fail e
    Right z -> return z

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
          { envLndUrl = LndUrl "https://localhost:8003",
            envLndGrpcConfig =
              GC.ClientConfig
                { clientServerPort = 11009,
                  clientServerHost = clientServerHost grpcConfig,
                  clientArgs = clientArgs grpcConfig,
                  clientSSLConfig = clientSSLConfig grpcConfig,
                  clientAuthority = clientAuthority grpcConfig
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
                            Right (RPCResponse x) ->
                              responseStatus x `elem` [status404, status200]
                            _ -> False
                        )
    it "rpc-succeeds-customer" $ \env ->
      shouldBeOk (`initWallet` initWalletRequestCust) (custEnv env)
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
    it "rpc-succeeds" $ shouldBeOk $ flip addInvoice addInvoiceRequest
    it "generate-qrcode" $ \env -> do
      res <-
        runApp env $
          coerceLndResult =<< addInvoice (envLnd env) addInvoiceRequest
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
      NewAddressResponse btcAddress <- runApp (custEnv env) $ coerceRPCResponse =<< newAddress (envLnd $ custEnv env)
      client <- btcClient
      GetInfoResponse mercPubKey <- runApp env $ coerceRPCResponse =<< getInfo (envLnd env)
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
      _ <- generateToAddress client 100 btcAddress Nothing
      _ <- delay 3000000
      req <- openChannelRequest (custEnv env)
      shouldBeOk (`openChannel` req) (custEnv env)
  describe "SubscribeInvoices" $ do
    it "rpc-succeeds" $ \env -> do
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
      resultingInvoice
        `shouldSatisfy` ( \this ->
                            AddInvoice.rHash originalInvoice == Invoice.rHash this
                        )
  describe "SubscribeInvoicesAndSettleIt" $
    do
      it "rpc-succeeds" $ \env -> do
        NewAddressResponse btcAddress <- runApp (custEnv env) $ coerceRPCResponse =<< newAddress (envLnd $ custEnv env)
        client <- btcClient
        _ <- generateToAddress client 100 btcAddress Nothing
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
        resultingInvoice
          `shouldSatisfy` ( \this ->
                              AddInvoice.rHash invoice == Invoice.rHash this
                          )
  describe "GetInfo" $ do
    it "rpc-succeeds" $ \env -> do
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
              { nodePubkey = decodeUtf8 (B64.encode pubKeyHex),
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
      let mPeer = safeHead $ peers res
      case mPeer of
        Just peer -> return $ pubKey peer
        Nothing -> return ""
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
      res `shouldSatisfy` isRight
