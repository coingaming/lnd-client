{-# LANGUAGE TemplateHaskell #-}

module LndClient.LndTest
  ( -- * BTC
    BtcUrl (..),
    BtcLogin (..),
    BtcPassword (..),
    BtcEnv (..),
    newBtcClient,

    -- * TestEnv
    Owner (..),
    TestEnv,
    newTestEnv,
    spawnLinkChannelWatcher,
    spawnLinkInvoiceWatcher,

    -- * Class
    LndTest (..),

    -- * TestUtils
    mine,
    mine1,
    syncWallets,
    syncPendingChannels,
    syncPendingChannelsFor,
    sendTestPayment,
    receiveClosedChannels,
    receiveActiveChannel,
    receiveInvoice,

    -- * LowLevel setup
    lazyMineInitialCoins,
    lazyConnectNodes,
    watchDefaults,
    closeAllChannels,

    -- * HighLevel setip
    setupZeroChannels,
    setupOneChannel,

    -- * Misc
    liftLndResult,
    liftMaybe,
    purgeChan,
    ignore2,
    ignore3,
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
import qualified LndClient.Data.GetInfo as LND (GetInfoResponse (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (ListChannelsRequest (..))
import qualified LndClient.Data.NewAddress as LND
  ( NewAddressResponse (..),
  )
import LndClient.Data.OpenChannel as OpenChannel
  ( OpenChannelRequest (..),
  )
import LndClient.Data.Peer
  ( ConnectPeerRequest (..),
    LightningAddress (..),
  )
import LndClient.Data.PendingChannels (PendingChannelsResponse (..))
import LndClient.Data.SendPayment as SendPayment
  ( SendPaymentRequest (..),
  )
import LndClient.Data.SubscribeChannelEvents
import LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import LndClient.Import
import qualified LndClient.RPC.Katip as LND
import LndClient.Util as Util
import LndClient.Watcher as Watcher
import qualified LndGrpc as GRPC
import qualified Network.Bitcoin as BTC (Client, getClient)
import qualified Network.Bitcoin.BlockChain as BTC (getBlockCount)
import qualified Network.Bitcoin.Mining as BTC (generateToAddress)

newtype BtcUrl = BtcUrl String

newtype BtcLogin = BtcLogin ByteString

newtype BtcPassword = BtcPassword ByteString

data BtcEnv
  = BtcEnv
      { btcUrl :: BtcUrl,
        btcLogin :: BtcLogin,
        btcPassword :: BtcPassword
      }

--
-- TODO : Accept abstract owner as parameter
-- in all functions. Might be useful for complex
-- > 2 node test setups.
--
data Owner = Alice | Bob deriving (Eq, Ord, Show)

data TestEnv
  = TestEnv
      { testLndEnv :: LndEnv,
        testNodeLocation :: NodeLocation,
        testChannelWatcher :: Watcher () ChannelEventUpdate,
        testInvoiceWatcher ::
          Watcher SubscribeInvoicesRequest
            Invoice
      }

newBtcClient :: MonadIO m => BtcEnv -> m BTC.Client
newBtcClient x =
  liftIO $
    BTC.getClient
      (coerce $ btcUrl x)
      (coerce $ btcLogin x)
      (coerce $ btcPassword x)

newTestEnv ::
  ( KatipContext m,
    MonadUnliftIO m
  ) =>
  LndEnv ->
  NodeLocation ->
  m TestEnv
newTestEnv lnd loc = do
  cw <- spawnLinkChannelWatcher lnd
  iw <- spawnLinkInvoiceWatcher lnd
  pure $
    TestEnv
      { testLndEnv = lnd,
        testNodeLocation = loc,
        testChannelWatcher = cw,
        testInvoiceWatcher = iw
      }

class (KatipContext m, MonadUnliftIO m) => LndTest m where
  getBtcClient :: m BTC.Client
  getTestEnv :: Owner -> m TestEnv
  getLndEnv :: Owner -> m LndEnv
  getLndEnv = (testLndEnv <$>) . getTestEnv
  getNodeLocation :: Owner -> m NodeLocation
  getNodeLocation = (testNodeLocation <$>) . getTestEnv
  getChannelTChan :: Owner -> m (TChan ((), ChannelEventUpdate))
  getChannelTChan =
    (Watcher.dupLndTChan =<<)
      . (testChannelWatcher <$>)
      . getTestEnv
  getInvoiceTChan ::
    Owner -> m (TChan (SubscribeInvoicesRequest, Invoice))
  getInvoiceTChan =
    (Watcher.dupLndTChan =<<)
      . (testInvoiceWatcher <$>)
      . getTestEnv

walletAddress :: LndTest m => Owner -> m Text
walletAddress owner = do
  lnd <- getLndEnv owner
  LND.NewAddressResponse x <-
    liftLndResult
      =<< LND.newAddress
        lnd
        GRPC.AddressTypeWITNESS_PUBKEY_HASH
  pure x

lazyMineInitialCoins :: LndTest m => m ()
lazyMineInitialCoins = do
  liftLndResult =<< LND.lazyInitWallet =<< getLndEnv Alice
  liftLndResult =<< LND.lazyInitWallet =<< getLndEnv Bob
  bc <- getBtcClient
  h <- liftIO $ BTC.getBlockCount bc
  -- reward coins are spendable only after 100 blocks
  when (h < 102) $ do
    mine 1 Bob
    mine 101 Alice

lazyConnectNodes :: LndTest m => m ()
lazyConnectNodes = do
  aliceTestEnv <- getTestEnv Alice
  LND.GetInfoResponse alicePubKey _ _ <-
    liftLndResult =<< LND.getInfo (testLndEnv aliceTestEnv)
  let req =
        ConnectPeerRequest
          { addr =
              LightningAddress
                { pubkey = alicePubKey,
                  host = testNodeLocation aliceTestEnv
                },
            perm = False
          }
  bob <- getLndEnv Bob
  liftLndResult =<< LND.lazyConnectPeer bob req

watchDefaults :: LndTest m => m ()
watchDefaults = do
  aliceTestEnv <- getTestEnv Alice
  Watcher.watchUnit $ testChannelWatcher aliceTestEnv
  Watcher.watch (testInvoiceWatcher aliceTestEnv) iReq
  bobTestEnv <- getTestEnv Bob
  Watcher.watchUnit $ testChannelWatcher bobTestEnv
  Watcher.watch (testInvoiceWatcher bobTestEnv) iReq
  where
    iReq =
      --
      -- TODO : this is related to LND bug
      -- https://github.com/lightningnetwork/lnd/issues/2469
      --
      SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing

mine :: LndTest m => Int -> Owner -> m ()
mine blocks owner = do
  btcAddr <- walletAddress owner
  bc <- getBtcClient
  $(logTM) InfoS $ logStr $
    ("Mining " :: Text)
      <> show blocks
      <> " blocks to "
      <> show owner
      <> " wallet"
  void . liftIO $
    BTC.generateToAddress
      bc
      blocks
      (toStrict btcAddr)
      Nothing
  liftLndResult =<< syncWallets

mine1 :: LndTest m => m ()
mine1 = mine 1 Alice

liftLndResult :: (MonadIO m) => Either LndError a -> m a
liftLndResult (Right x) =
  pure x
liftLndResult (Left x) =
  liftIO $ fail $ "LiftLndResult failed " <> show x

syncWallets :: (LndTest m) => m (Either LndError ())
syncWallets = this 0
  where
    this 30 = do
      let msg = "SyncWallets attempt limit exceeded"
      $(logTM) ErrorS $ logStr msg
      pure . Left $ LndError msg
    this (attempt :: Int) = do
      $(logTM) InfoS "SyncWallets is running"
      resAlice <- LND.getInfo =<< getLndEnv Alice
      resBob <- LND.getInfo =<< getLndEnv Bob
      case (,) <$> resAlice <*> resBob of
        Left _ ->
          liftIO (delay 1000000) >> this (attempt + 1)
        Right (x0, x1) ->
          if LND.syncedToChain x0 && LND.syncedToChain x1
            then pure $ Right ()
            else liftIO (delay 1000000) >> this (attempt + 1)

syncPendingChannels :: (LndTest m) => m ()
syncPendingChannels = do
  liftLndResult =<< syncPendingChannelsFor Alice
  liftLndResult =<< syncPendingChannelsFor Bob

syncPendingChannelsFor ::
  (LndTest m) => Owner -> m (Either LndError ())
syncPendingChannelsFor owner = this 0
  where
    this 30 = do
      let msg =
            "SyncPendingChannelsFor "
              <> show owner
              <> " attempt limit exceeded"
      $(logTM) ErrorS $ logStr msg
      pure . Left $ LndError msg
    this (attempt :: Int) = do
      $(logTM) InfoS $ logStr $
        "SyncPendingChannelsFor "
          <> (show owner :: Text)
          <> " is running"
      res <- LND.pendingChannels =<< getLndEnv owner
      case res of
        Left _ -> this (attempt + 1)
        Right (PendingChannelsResponse _ x0 x1 x2 x3) ->
          if null x0
            && null x1
            && null x2
            && null x3
            then pure $ Right ()
            else mine1 >> this (attempt + 1)

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

closeAllChannels :: (LndTest m) => m ()
closeAllChannels = do
  $(logTM) InfoS "CloseAllChannels - closing channels"
  alice <- getLndEnv Alice
  cs <-
    liftLndResult
      =<< LND.listChannels
        alice
        (ListChannelsRequest True False False False Nothing)
  let cps = Channel.channelPoint <$> cs
  mapM_
    ( \cp ->
        Util.spawnLink $
          LND.closeChannel
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
            alice
            (CloseChannelRequest cp False Nothing Nothing Nothing)
    )
    cps
  aliceChan <- getChannelTChan Alice
  bobChan <- getChannelTChan Bob
  liftLndResult =<< receiveClosedChannels cps aliceChan
  liftLndResult =<< receiveClosedChannels cps bobChan

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

setupZeroChannels :: LndTest m => m ()
setupZeroChannels = do
  lazyMineInitialCoins
  lazyConnectNodes
  watchDefaults
  closeAllChannels
  syncPendingChannels

setupOneChannel :: (LndTest m) => m ChannelPoint
setupOneChannel = do
  alice <- getLndEnv Alice
  bob <- getLndEnv Bob
  mq <- getChannelTChan Bob
  cq <- getChannelTChan Alice
  --
  -- Open channel from Customer to Merchant
  --
  $(logTM) InfoS "SetupOneChannel - opening channel"
  GetInfoResponse merchantPubKey _ _ <-
    liftLndResult =<< LND.getInfo bob
  let openChannelRequest =
        OpenChannel.OpenChannelRequest
          { OpenChannel.nodePubkey = merchantPubKey,
            OpenChannel.localFundingAmount = MoneyAmount 200000,
            OpenChannel.pushSat = Just $ MoneyAmount 100000,
            OpenChannel.targetConf = Nothing,
            OpenChannel.satPerByte = Nothing,
            OpenChannel.private = Nothing,
            OpenChannel.minHtlcMsat = Nothing,
            OpenChannel.remoteCsvDelay = Nothing,
            OpenChannel.minConfs = Nothing,
            OpenChannel.spendUnconfirmed = Nothing,
            OpenChannel.closeAddress = Nothing
          }
  cp <-
    liftLndResult
      =<< LND.openChannelSync alice openChannelRequest
  liftLndResult =<< receiveActiveChannel cp mq
  liftLndResult =<< receiveActiveChannel cp cq
  --
  -- TODO : these invoices are added and settled to
  -- raise invoice index to 1 to be able to receive
  -- notifications about all next invoices
  -- remove when LND bug will be fixed
  -- https://github.com/lightningnetwork/lnd/issues/2469
  --
  sendTestPayment (MoneyAmount 1000) Alice Bob
  sendTestPayment (MoneyAmount 1000) Bob Alice
  $(logTM) InfoS "SetupOneChannel - finished"
  pure cp

sendTestPayment ::
  (LndTest m) =>
  MoneyAmount ->
  Owner ->
  Owner ->
  m ()
sendTestPayment amt0 sender0 recepient0 = do
  sender <- getLndEnv sender0
  recepient <- getLndEnv recepient0
  let addInvoiceRequest =
        AddInvoice.AddInvoiceRequest
          { AddInvoice.memo = Just "HELLO",
            AddInvoice.value = amt0,
            AddInvoice.expiry = Just $ Seconds 1000
          }
  invoice <-
    liftLndResult =<< LND.addInvoice recepient addInvoiceRequest
  let payReq =
        SendPayment.SendPaymentRequest
          { SendPayment.paymentRequest =
              AddInvoice.paymentRequest invoice,
            SendPayment.amt = amt0
          }
  void . liftLndResult =<< LND.sendPayment sender payReq

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

liftMaybe :: MonadIO m => String -> Maybe a -> m a
liftMaybe msg mx =
  case mx of
    Just x -> pure x
    Nothing -> liftIO $ fail msg

purgeChan :: MonadUnliftIO m => TChan a -> m ()
purgeChan chan = do
  x <- readTChanTimeout (MicroSecondsDelay 500000) chan
  when (isJust x) $ purgeChan chan

ignore2 :: Monad m => a -> b -> m ()
ignore2 _ _ = pure ()

ignore3 :: Monad m => a -> b -> c -> m ()
ignore3 _ _ _ = pure ()

spawnLinkChannelWatcher ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (Watcher () ChannelEventUpdate)
spawnLinkChannelWatcher lnd =
  Watcher.spawnLinkUnit
    lnd
    LND.subscribeChannelEventsChan
    $ \_ _ -> pure ()

spawnLinkInvoiceWatcher ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (Watcher SubscribeInvoicesRequest Invoice)
spawnLinkInvoiceWatcher lnd =
  Watcher.spawnLink
    lnd
    LND.subscribeInvoicesChan
    $ \_ _ _ -> pure ()
