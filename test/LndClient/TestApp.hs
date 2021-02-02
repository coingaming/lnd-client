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
    syncWallets,
    withEnv,
    setupOneChannel,
    liftMaybe,
    receiveInvoice,
    receiveActiveChannel,
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
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeChannelEvents
  ( ChannelEventUpdate (..),
    ChannelEventUpdateChannel (..),
  )
import LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import LndClient.Import
import LndClient.LndTest
import LndClient.RPC.Katip
import LndClient.Watcher as Watcher (Watcher, dupLndTChan)
import qualified LndGrpc as GRPC
import qualified Network.Bitcoin as BTC (Client)
import Network.GRPC.HighLevel.Generated

data Env
  = Env
      { envLndAlice :: LndEnv,
        envLndBob :: LndEnv,
        envBtcClient :: BTC.Client,
        envKatipNS :: Namespace,
        envKatipCTX :: LogContexts,
        envKatipLE :: LogEnv,
        envAliceChannelWatcher :: Watcher () ChannelEventUpdate,
        envAliceInvoiceWatcher ::
          Watcher SubscribeInvoicesRequest
            Invoice,
        envBobChannelWatcher :: Watcher () ChannelEventUpdate,
        envBobInvoiceWatcher ::
          Watcher SubscribeInvoicesRequest
            Invoice
      }

newBobEnv :: LndEnv -> LndEnv
newBobEnv x =
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
  bc <- newBtcClient btcEnv
  alice <- liftIO readLndEnv
  let bob = newBobEnv alice
  runKatipContextT le (mempty :: LogContexts) mempty $ do
    aliceCW <- spawnLinkChannelWatcher alice
    aliceIW <- spawnLinkInvoiceWatcher alice
    bobCW <- spawnLinkChannelWatcher bob
    bobIW <- spawnLinkInvoiceWatcher bob
    pure
      Env
        { envLndAlice = alice,
          envLndBob = bob,
          envBtcClient = bc,
          envKatipLE = le,
          envKatipCTX = mempty,
          envKatipNS = mempty,
          envAliceChannelWatcher = aliceCW,
          envAliceInvoiceWatcher = aliceIW,
          envBobChannelWatcher = bobCW,
          envBobInvoiceWatcher = bobIW
        }

withEnv :: (Env -> AppM IO ()) -> IO ()
withEnv f = do
  env <- readEnv
  runApp env $ do
    lazyMineInitialCoins
    lazyConnectNodes
    watchDefaults
    closeAllChannels env
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

btcEnv :: BtcEnv
btcEnv =
  BtcEnv
    { btcUrl = BtcUrl "http://localhost:18443",
      btcLogin = BtcLogin "developer",
      btcPassword = BtcPassword "developer"
    }

closeAllChannels :: (LndTest m) => Env -> m ()
closeAllChannels env = do
  cq <- Watcher.dupLndTChan =<< aliceChannelWatcher
  mq <- Watcher.dupLndTChan =<< bobChannelWatcher
  $(logTM) InfoS "CloseAllChannels - closing channels ..."
  cs <-
    liftLndResult
      =<< listChannels
        (envLndBob env)
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
            (envLndAlice env)
            (CloseChannelRequest cp False Nothing Nothing Nothing)
    )
    cps
  liftLndResult =<< receiveClosedChannels cps mq
  liftLndResult =<< receiveClosedChannels cps cq

setupOneChannel :: (LndTest m) => Env -> m ()
setupOneChannel env = do
  mq <- Watcher.dupLndTChan =<< bobChannelWatcher
  cq <- Watcher.dupLndTChan =<< aliceChannelWatcher
  --
  -- Open channel from Customer to Merchant
  --
  $(logTM) InfoS "SetupOneChannel - opening channel ..."
  GetInfoResponse merchantPubKey _ _ <-
    liftLndResult =<< getInfo bob
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
      =<< openChannelSync alice openChannelRequest
  liftLndResult =<< receiveActiveChannel cp mq
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
  invoice <-
    liftLndResult =<< addInvoice bob addInvoiceRequest
  let sendPaymentRequest =
        SendPaymentRequest
          { paymentRequest = AddInvoice.paymentRequest invoice,
            amt = MoneyAmount 1000
          }
  void $
    liftLndResult =<< sendPayment alice sendPaymentRequest
  $(logTM) InfoS "SetupOneChannel - finished"
  where
    alice = envLndAlice env
    bob = envLndBob env

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

instance (MonadUnliftIO m) => LndTest (AppM m) where
  btcClient = asks envBtcClient
  aliceLndEnv = asks envLndAlice
  aliceNodeLocation = pure $ NodeLocation "localhost:9735"
  aliceChannelWatcher = asks envAliceChannelWatcher
  aliceInvoiceWatcher = asks envAliceInvoiceWatcher
  bobLndEnv = asks envLndBob
  bobNodeLocation = pure $ NodeLocation "localhost:9734"
  bobChannelWatcher = asks envBobChannelWatcher
  bobInvoiceWatcher = asks envBobInvoiceWatcher

runApp :: Env -> AppM m a -> m a
runApp env app = runReaderT (unAppM app) env

liftMaybe :: MonadIO m => String -> Maybe a -> m a
liftMaybe msg mx =
  case mx of
    Just x -> pure x
    Nothing -> liftIO $ fail msg

receiveActiveChannel ::
  (LndTest m) =>
  ChannelPoint ->
  TChan ((), ChannelEventUpdate) ->
  m (Either LndError ())
receiveActiveChannel = this 0
  where
    this (attempt :: Integer) cp cq =
      if attempt > 30
        then pure $ Left $ LndError "receiveActiveChannel - exceeded"
        else do
          x <- readTChanTimeout (MicroSecondsDelay 1000000) cq
          case channelEvent . snd <$> x of
            Just (ChannelEventUpdateChannelActiveChannel gcp) ->
              if cp == gcp
                then pure $ Right ()
                else mine1 >> this (attempt + 1) cp cq
            _ ->
              mine1 >> this (attempt + 1) cp cq

receiveClosedChannels ::
  (LndTest m) =>
  [ChannelPoint] ->
  TChan ((), ChannelEventUpdate) ->
  m (Either LndError ())
receiveClosedChannels = this 0
  where
    this _ [] _ =
      pure $ Right ()
    this 30 _ _ =
      pure
        $ Left
        $ LndError "receiveClosedChannels - exceeded"
    this (attempt :: Integer) cps0 cq = do
      x0 <- readTChanTimeout (MicroSecondsDelay 1000000) cq
      let x = channelEvent . snd <$> x0
      $(logTM) InfoS $ logStr $
        "receiveClosedChannels - got " <> (show x :: Text)
      case x of
        Just (ChannelEventUpdateChannelClosedChannel res) ->
          case filter (/= chPoint res) cps0 of
            [] -> pure $ Right ()
            cps -> mine1 >> this (attempt + 1) cps cq
        _ ->
          mine1 >> this (attempt + 1) cps0 cq

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
    "receiveInvoice - " <> (show mx :: Text)
  case (\x -> Invoice.rHash x == rh && Invoice.state x == s) <$> mx of
    Just True -> return $ Right ()
    Just False -> receiveInvoice rh s q
    Nothing -> return . Left $ TChanTimeout "receiveInvoice"
