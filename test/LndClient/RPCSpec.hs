{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralisedNewtypeDeriving #-}
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
import Data.ByteString.Base16 (decode)
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
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..), Peer (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.QRCode
import qualified LndGrpc as GRPC
import Network.Bitcoin as BTC (Client, getClient)
import Network.Bitcoin.Mining (generateToAddress)
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel.Client as GC
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
          initWallet (envLnd env) initWalletRequest
      res `shouldSatisfy` successOrUnimplemented
    it "rpc-succeeds-customer" $ \env -> do
      res <-
        runApp env $
          initWallet (envLnd $ custEnv env) initWalletRequestCust
      res `shouldSatisfy` successOrUnimplemented
  describe "UnlockWallet" $ do
    it "rpc-succeeds" $ \env -> do
      res <- runApp env $ unlockWallet (envLnd env)
      res `shouldSatisfy` successOrUnimplemented
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
      _ <- runApp env $ initWallet (envLnd env) initWalletRequest
      _ <- runApp (custEnv env) $ initWallet (envLnd $ custEnv env) initWalletRequestCust
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
  describe "OpenChannel" $ do
    it "rpc-succeeds" $ \env -> do
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
      res <- runApp env $ coerceLndResult =<< listPeers (envLnd env)
      let mPeer = safeHead res
      case mPeer of
        Just peer -> return $ pubKey peer
        Nothing -> fail "no any peers connected"
    initWalletRequest =
      InitWalletRequest
        { walletPassword = "developer",
          aezeedPassphrase = Nothing,
          cipherSeedMnemonic = initWalletSeed
        }
    initWalletRequestCust =
      InitWalletRequest
        { walletPassword = "developer",
          aezeedPassphrase = Just "developer",
          cipherSeedMnemonic = initWalletSeedCust
        }
    shouldBeOk this env = do
      res <- runApp env $ this $ envLnd env
      res `shouldSatisfy` isRight
    successOrUnimplemented =
      \case
        Right _ ->
          True
        Left
          ( GrpcError
              ( ClientIOError
                  (GRPCIOBadStatusCode StatusUnimplemented _)
                )
            ) -> True
        Left _ ->
          False
