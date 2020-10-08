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

module LndClient.TestApp
  ( Env (..),
    runApp,
    runApp_,
    liftLndResult,
    customerNodeLocation,
    merchantNodeLocation,
    spawnLinkDelayed_,
    syncWallets,
    mine6_,
    mine101_,
    newEnv,
    deleteEnv,
    setupEnv,
    receiveInvoice,
  )
where

import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.ChannelPoint as ChannelPoint (ChannelPoint (..))
import LndClient.Data.CloseChannel (CloseChannelRequest (..))
import LndClient.Data.GetInfo (GetInfoResponse (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (Channel (..), ListChannelsRequest (..))
import LndClient.Data.LndEnv
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeChannelEvents (ChannelEventUpdate (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Import
import LndClient.RPC.Silent
import LndClient.TestOrphan ()
import qualified LndGrpc as GRPC
import Network.Bitcoin as BTC (Client, getClient)
import Network.Bitcoin.Mining (generateToAddress)
import Network.GRPC.HighLevel.Generated

liftLndResult :: (MonadIO m) => Either LndError a -> m a
liftLndResult (Right x) = return x
liftLndResult (Left x) = liftIO $ fail $ "liftLndResult failed " <> show x

customerNodeLocation :: NodeLocation
customerNodeLocation = NodeLocation "localhost:9734"

merchantNodeLocation :: NodeLocation
merchantNodeLocation = NodeLocation "localhost:9735"

data Env
  = Env
      { envLndMerchant :: LndEnv,
        envLndCustomer :: LndEnv,
        envBtcClient :: BTC.Client,
        envKatipNS :: Namespace,
        envKatipCTX :: LogContexts,
        envKatipLE :: LogEnv,
        envMerchantCQ :: TChan ChannelEventUpdate,
        envCustomerCQ :: TChan ChannelEventUpdate,
        envMerchantIQ :: TChan Invoice
      }

custEnv :: LndEnv -> LndEnv
custEnv x =
  x
    { envLndGrpcConfig =
        (envLndGrpcConfig x)
          { clientServerPort = 11009
          },
      envLndCipherSeedMnemonic =
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
          ],
      envLndAezeedPassphrase = Nothing
    }

readEnv :: KatipContextT IO Env
readEnv = do
  le <- getLogEnv
  ctx <- getKatipContext
  ns <- getKatipNamespace
  lndEnv <- liftIO readLndEnv
  bc <- liftIO newBtcClient
  mcq <- atomically newBroadcastTChan
  ccq <- atomically newBroadcastTChan
  miq <- atomically newBroadcastTChan
  return
    Env
      { envLndMerchant = lndEnv,
        envLndCustomer = custEnv lndEnv,
        envBtcClient = bc,
        envKatipLE = le,
        envKatipCTX = ctx,
        envKatipNS = ns,
        envMerchantCQ = mcq,
        envCustomerCQ = ccq,
        envMerchantIQ = miq
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

newEnv :: IO Env
newEnv = do
  env <- runKatip readEnv
  let merchantEnv = envLndMerchant env
  let customerEnv = envLndCustomer env
  let merchantCQ = envMerchantCQ env
  let customerCQ = envCustomerCQ env
  runApp env $ do
    --
    -- Init wallets
    --
    void $ liftLndResult =<< lazyInitWallet merchantEnv
    void $ liftLndResult =<< lazyInitWallet customerEnv
    liftIO $ mine101_ env
    --
    -- Connect Customer to Merchant
    --
    GetInfoResponse merchantPubKeyHex _ _ <-
      liftLndResult =<< getInfo merchantEnv
    let connectPeerRequest =
          ConnectPeerRequest
            { addr =
                LightningAddress
                  { pubkey = merchantPubKeyHex,
                    host = merchantNodeLocation
                  },
              perm = False
            }
    void $ liftLndResult =<< lazyConnectPeer customerEnv connectPeerRequest
    --
    -- Subscribe to events
    --
    void . spawnLink $
      liftLndResult =<< subscribeChannelEventsQ (pure merchantCQ) merchantEnv
    void . spawnLink $
      liftLndResult =<< subscribeChannelEventsQ (pure customerCQ) customerEnv
    void . spawnLink $
      liftLndResult
        =<< subscribeInvoicesQ
          (pure $ envMerchantIQ env)
          merchantEnv
          --
          -- TODO : this is related to LND bug
          -- https://github.com/lightningnetwork/lnd/issues/2469
          --
          (SubscribeInvoicesRequest (Just $ AddIndex 1) (Just $ SettleIndex 1))
  delay 3000000
  return env

deleteEnv :: Env -> IO ()
deleteEnv = void . closeScribes . envKatipLE

newBtcClient :: IO BTC.Client
newBtcClient =
  getClient
    "http://localhost:18443"
    "developer"
    "developer"

mine_ :: Int -> Env -> IO ()
mine_ x env = do
  NewAddressResponse btcAddress <-
    runApp env $
      liftLndResult
        =<< newAddress
          (envLndCustomer env)
          GRPC.AddressTypeWITNESS_PUBKEY_HASH
  void $ generateToAddress (envBtcClient env) x (toStrict btcAddress) Nothing
  runApp_ env $ liftLndResult =<< syncWallets env
  return ()

mine6_ :: Env -> IO ()
mine6_ = mine_ 6

mine101_ :: Env -> IO ()
mine101_ = mine_ 101

setupEnv :: Env -> IO ()
setupEnv env = runApp env $ do
  --
  -- Initialize closing channels procedure
  --
  $(logTM) InfoS "setupEnv - closing channels ..."
  cs <-
    liftLndResult
      =<< listChannels
        customerEnv
        (ListChannelsRequest False False False False Nothing)
  let cps = LC.channelPoint <$> cs
  cpxs <-
    mapM
      ( \cp -> do
          x <- newEmptyMVar
          return (cp, x)
      )
      cps
  liftIO $
    mapM_
      ( \(cp, x) ->
          spawnLink $ runApp env $
            closeChannel
              --
              -- TODO : investigate why it throws empty gRPC
              -- response error and as consequence
              -- probably it's how subscription terminates
              -- when channel is completely closed
              --
              --(const $ return ())
              (liftIO . putMVar x)
              (envLndMerchant env)
              (CloseChannelRequest cp True Nothing Nothing Nothing)
      )
      cpxs
  --
  -- Give some time for closeChannel processes to be spawned
  -- Give Customer some money to operate
  -- And wait for every channel to be closed
  --
  liftIO $ do
    delay 3000000
    mine6_ env
    mapM_ (\(_, x) -> takeMVar x) cpxs
  --
  -- Open channel from Customer to Merchant
  --
  $(logTM) InfoS "setupEnv - opening channel ..."
  GetInfoResponse merchantPubKeyHex _ _ <-
    liftLndResult =<< getInfo merchantEnv
  merchantPubKey <-
    liftMaybe "Can't decode hex pub key" $ unHexPubKey merchantPubKeyHex
  let openChannelRequest =
        OpenChannelRequest
          { nodePubkey = merchantPubKey,
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
  runApp env $ do
    cp <- liftLndResult =<< openChannelSync (envLndCustomer env) openChannelRequest
    cq <- atomically $ dupTChan $ envCustomerCQ env
    liftIO $ mine6_ env
    liftLndResult =<< receiveActiveChannel cp cq
    --
    -- TODO : this invoice is added and settled to
    -- raise invoice index to 1 to be able to receive
    -- notifications about all next invoices
    -- remove when LND bug will be fixed
    -- https://github.com/lightningnetwork/lnd/issues/2469
    --
    let addInvoiceRequest =
          AddInvoiceRequest
            { memo = Just "HELLO",
              value = MoneyAmount 1000,
              expiry = Just $ Seconds 1000
            }
    invoice <- liftLndResult =<< addInvoice merchantEnv addInvoiceRequest
    let sendPaymentRequest =
          SendPaymentRequest
            { paymentRequest = AddInvoice.paymentRequest invoice,
              amt = MoneyAmount 1000
            }
    void $ liftLndResult =<< sendPayment customerEnv sendPaymentRequest
  $(logTM) InfoS "setupEnv - finished"
  where
    merchantEnv = envLndMerchant env
    customerEnv = envLndCustomer env

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

runApp_ :: (Functor m) => Env -> AppM m a -> m ()
runApp_ env app = void $ runApp env app

liftMaybe :: MonadIO m => String -> Maybe a -> m a
liftMaybe msg mx =
  case mx of
    Just x -> return x
    Nothing -> liftIO $ fail msg

spawnLinkDelayed_ :: (MonadUnliftIO m) => m a -> m ()
spawnLinkDelayed_ x = do
  void $ spawnLink x
  -- give process some time to spawn
  liftIO $ delay 3000000
  return ()

receiveActiveChannel ::
  KatipContext m =>
  ChannelPoint ->
  TChan ChannelEventUpdate ->
  m (Either LndError ())
receiveActiveChannel cp cq = do
  x <- readTChanTimeout (MicroSecondsDelay 30000000) cq
  case channelEvent <$> x of
    Just (GRPC.ChannelEventUpdateChannelActiveChannel gcp) ->
      if Right cp == fromGrpc gcp
        then return $ Right ()
        else receiveActiveChannel cp cq
    Just _ ->
      receiveActiveChannel cp cq
    Nothing ->
      return . Left $ TChanTimeout "receiveActiveChannel"

receiveInvoice ::
  KatipContext m =>
  RHash ->
  GRPC.Invoice_InvoiceState ->
  TChan Invoice ->
  m (Either LndError ())
receiveInvoice rh s q = do
  mx <- readTChanTimeout (MicroSecondsDelay 30000000) q
  $(logTM) InfoS $ logStr $ "Received Invoice: " <> (show mx :: Text)
  case (\x -> Invoice.rHash x == rh && Invoice.state x == s) <$> mx of
    Just True -> return $ Right ()
    Just False -> receiveInvoice rh s q
    Nothing -> return . Left $ TChanTimeout "receiveInvoice"

syncWallets ::
  (KatipContext m) =>
  Env ->
  m (Either LndError ())
syncWallets = this 30
  where
    this (x :: Int) env =
      if x > 0
        then do
          $(logTM) InfoS "Wallet sync ..."
          resMerchant <- getInfo (envLndMerchant env)
          resCustomer <- getInfo (envLndCustomer env)
          case (,) <$> resMerchant <*> resCustomer of
            Left _ ->
              liftIO (delay 1000000) >> this (x - 1) env
            Right (mr, cr) ->
              if syncedToChain mr && syncedToChain cr
                then return $ Right ()
                else liftIO (delay 1000000) >> this (x - 1) env
        else do
          let msg = "syncWallets attempt limit exceeded"
          $(logTM) ErrorS $ logStr msg
          return . Left $ LndError msg
