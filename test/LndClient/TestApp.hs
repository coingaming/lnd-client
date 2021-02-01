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
    liftLndResult,
    customerNodeLocation,
    merchantNodeLocation,
    syncWallets,
    mine6,
    withEnv,
    setupOneChannel,
    liftMaybe,
    receiveInvoice,
    receiveClosedChannels,
  )
where

import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.Channel as Channel (Channel (..))
import LndClient.Data.ChannelPoint as ChannelPoint (ChannelPoint (..))
import LndClient.Data.CloseChannel
  ( ChannelCloseSummary (..),
    CloseChannelRequest (..),
  )
import LndClient.Data.GetInfo (GetInfoResponse (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (ListChannelsRequest (..))
import LndClient.Data.LndEnv
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer
  ( ConnectPeerRequest (..),
    LightningAddress (..),
  )
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeChannelEvents
  ( ChannelEventUpdate (..),
    ChannelEventUpdateChannel (..),
  )
import LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import LndClient.Import
import LndClient.RPC.Katip
import qualified LndGrpc as GRPC
import Network.Bitcoin as BTC (Client, getClient)
import Network.Bitcoin.BlockChain (getBlockCount)
import Network.Bitcoin.Mining (generateToAddress)
import Network.GRPC.HighLevel.Generated

liftLndResult :: (MonadIO m) => Either LndError a -> m a
liftLndResult (Right x) =
  pure x
liftLndResult (Left x) =
  liftIO $ fail $ "liftLndResult failed " <> show x

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
        envMerchantCQ :: TChan ((), ChannelEventUpdate),
        envCustomerCQ :: TChan ((), ChannelEventUpdate),
        envMerchantIQ :: TChan (SubscribeInvoicesRequest, Invoice)
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

readEnv :: IO Env
readEnv = do
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
        envKatipCTX = mempty,
        envKatipNS = mempty,
        envMerchantCQ = mcq,
        envCustomerCQ = ccq,
        envMerchantIQ = miq
      }

withEnv :: (Env -> AppM IO ()) -> IO ()
withEnv f = do
  env <- readEnv
  let merchantEnv = envLndMerchant env
  let customerEnv = envLndCustomer env
  let merchantCQ = envMerchantCQ env
  let customerCQ = envCustomerCQ env
  runApp env $
    do
      --
      -- Init wallets
      --
      void $ liftLndResult =<< lazyInitWallet merchantEnv
      void $ liftLndResult =<< lazyInitWallet customerEnv
      lazyMineInitialCoins env
      --
      -- Connect Customer to Merchant
      --
      GetInfoResponse merchantPubKey _ _ <-
        liftLndResult =<< getInfo merchantEnv
      let connectPeerRequest =
            ConnectPeerRequest
              { addr =
                  LightningAddress
                    { pubkey = merchantPubKey,
                      host = merchantNodeLocation
                    },
                perm = False
              }
      void $
        liftLndResult
          =<< lazyConnectPeer customerEnv connectPeerRequest
      --
      -- Subscribe to events
      --
      _ <- spawnLink $ do
        liftLndResult
          =<< subscribeChannelEventsChan (pure merchantCQ) merchantEnv
      _ <- spawnLink $ do
        liftLndResult
          =<< subscribeChannelEventsChan (pure customerCQ) customerEnv
      _ <-
        spawnLink $ do
          $(logTM) InfoS "HELLO_FROM_SPAWN"
          liftLndResult
            =<< subscribeInvoicesChan
              (pure $ envMerchantIQ env)
              merchantEnv
              --
              -- TODO : this is related to LND bug
              -- https://github.com/lightningnetwork/lnd/issues/2469
              --
              (SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing)
      f env
  --
  -- TODO : we can't really use async `cance` or `withAsync`
  -- before this is fixed somehow
  -- https://github.com/awakesecurity/gRPC-haskell/issues/104#issuecomment-769408503
  --
  --withSpawnLink
  --  ( liftLndResult
  --      =<< subscribeInvoicesChan
  --        (pure $ envMerchantIQ env)
  --        merchantEnv
  --        --
  --        -- TODO : this is related to LND bug
  --        -- https://github.com/lightningnetwork/lnd/issues/2469
  --        --
  --        (SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing)
  --  )
  --  ( const $ do
  --      f env
  --      $(logTM) InfoS "GONNA_TO_TERMINATE_SUBSCRIPTION"
  --  )
  void . closeScribes $ envKatipLE env

newBtcClient :: IO BTC.Client
newBtcClient =
  getClient
    "http://localhost:18443"
    "developer"
    "developer"

mine :: KatipContext m => Int -> Text -> Env -> m ()
mine x btcAddr env = do
  $(logTM) InfoS $ logStr $
    "Mining " <> show x <> (" blocks ..." :: Text)
  void . liftIO $
    generateToAddress (envBtcClient env) x (toStrict btcAddr) Nothing
  liftLndResult =<< syncWallets env

mine6 :: KatipContext m => Env -> m ()
mine6 env = do
  btcAddr <- customerAddress env
  mine 6 btcAddr env

mine1 :: KatipContext m => Env -> m ()
mine1 env = do
  btcAddr <- customerAddress env
  mine 1 btcAddr env

setupOneChannel :: (KatipContext m, MonadUnliftIO m) => Env -> m ()
setupOneChannel env = do
  mq <- atomically . dupTChan $ envMerchantCQ env
  cq <- atomically . dupTChan $ envCustomerCQ env
  --
  -- Initialize closing channels procedure
  --
  $(logTM) InfoS "SetupOneChannel - closing channels ..."
  cs <-
    liftLndResult
      =<< listChannels
        customerEnv
        (ListChannelsRequest True False False False Nothing)
  let cps = Channel.channelPoint <$> cs
  mapM_
    ( \cp ->
        spawnLink $
          closeChannel
            --
            -- TODO : investigate why it throws empty gRPC
            -- response error and as consequence
            -- probably it's how subscription terminates
            -- when channel is completely closed
            --
            -- but bad thing is that callback sometimes
            -- is never called, that's why it's not used there
            -- we are getting TChan events instead from
            -- previous opened subscription
            --
            (const $ return ())
            (envLndMerchant env)
            (CloseChannelRequest cp False Nothing Nothing Nothing)
    )
    cps
  liftLndResult =<< receiveClosedChannels env cps mq
  liftLndResult =<< receiveClosedChannels env cps cq
  --
  -- Open channel from Customer to Merchant
  --
  $(logTM) InfoS "SetupOneChannel - opening channel ..."
  GetInfoResponse merchantPubKey _ _ <-
    liftLndResult =<< getInfo merchantEnv
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
  cp <-
    liftLndResult
      =<< openChannelSync (envLndCustomer env) openChannelRequest
  liftLndResult =<< receiveActiveChannel env cp mq
  liftLndResult =<< receiveActiveChannel env cp cq
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
  invoice <-
    liftLndResult =<< addInvoice merchantEnv addInvoiceRequest
  let sendPaymentRequest =
        SendPaymentRequest
          { paymentRequest = AddInvoice.paymentRequest invoice,
            amt = MoneyAmount 1000
          }
  void $
    liftLndResult =<< sendPayment customerEnv sendPaymentRequest
  $(logTM) InfoS "SetupOneChannel - finished"
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

liftMaybe :: MonadIO m => String -> Maybe a -> m a
liftMaybe msg mx =
  case mx of
    Just x -> pure x
    Nothing -> liftIO $ fail msg

receiveActiveChannel ::
  ( MonadUnliftIO m,
    KatipContext m
  ) =>
  Env ->
  ChannelPoint ->
  TChan ((), ChannelEventUpdate) ->
  m (Either LndError ())
receiveActiveChannel = this 0
  where
    this (attempt :: Integer) env cp cq =
      if attempt > 30
        then pure $ Left $ LndError "receiveActiveChannel - exceeded"
        else do
          x <- readTChanTimeout (MicroSecondsDelay 1000000) cq
          case channelEvent . snd <$> x of
            Just (ChannelEventUpdateChannelActiveChannel gcp) ->
              if cp == gcp
                then pure $ Right ()
                else mine1 env >> this (attempt + 1) env cp cq
            _ ->
              mine1 env >> this (attempt + 1) env cp cq

receiveClosedChannels ::
  ( MonadUnliftIO m,
    KatipContext m
  ) =>
  Env ->
  [ChannelPoint] ->
  TChan ((), ChannelEventUpdate) ->
  m (Either LndError ())
receiveClosedChannels = this 0
  where
    this _ _ [] _ =
      pure $ Right ()
    this 30 _ _ _ =
      pure
        $ Left
        $ LndError "receiveClosedChannels - exceeded"
    this (attempt :: Integer) env cps0 cq = do
      x0 <- readTChanTimeout (MicroSecondsDelay 1000000) cq
      let x = channelEvent . snd <$> x0
      $(logTM) InfoS $ logStr $
        "receiveClosedChannels - got " <> (show x :: Text)
      case x of
        Just (ChannelEventUpdateChannelClosedChannel res) ->
          case filter (/= chPoint res) cps0 of
            [] -> pure $ Right ()
            cps -> mine1 env >> this (attempt + 1) env cps cq
        _ ->
          mine1 env >> this (attempt + 1) env cps0 cq

receiveInvoice ::
  ( MonadUnliftIO m,
    KatipContext m
  ) =>
  RHash ->
  GRPC.Invoice_InvoiceState ->
  TChan (SubscribeInvoicesRequest, Invoice) ->
  m (Either LndError ())
receiveInvoice rh s q = do
  mx0 <- readTChanTimeout (MicroSecondsDelay 30000000) q
  let mx = snd <$> mx0
  $(logTM) InfoS $ logStr $
    "receiveInvoice - " <> (show $ mx :: Text)
  case (\x -> Invoice.rHash x == rh && Invoice.state x == s) <$> mx of
    Just True -> return $ Right ()
    Just False -> receiveInvoice rh s q
    Nothing -> return . Left $ TChanTimeout "receiveInvoice"

customerAddress :: KatipContext m => Env -> m Text
customerAddress env = do
  NewAddressResponse btcAddress <-
    liftLndResult
      =<< newAddress
        (envLndCustomer env)
        GRPC.AddressTypeWITNESS_PUBKEY_HASH
  pure btcAddress

merchantAddress :: KatipContext m => Env -> m Text
merchantAddress env = do
  NewAddressResponse btcAddress <-
    liftLndResult
      =<< newAddress
        (envLndMerchant env)
        GRPC.AddressTypeWITNESS_PUBKEY_HASH
  pure btcAddress

lazyMineInitialCoins :: KatipContext m => Env -> m ()
lazyMineInitialCoins env = do
  h <- liftIO . getBlockCount $ envBtcClient env
  when (h < 102) $ do
    mercAddr <- merchantAddress env
    custAddr <- customerAddress env
    mine 1 mercAddr env
    mine 1 custAddr env
    -- reward coins are spendable only after 100 blocks
    mine 100 custAddr env

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
