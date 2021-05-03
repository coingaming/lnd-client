{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
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
import qualified LndClient.Data.GetInfo as Lnd (GetInfoResponse (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (ListChannelsRequest (..))
import qualified LndClient.Data.NewAddress as Lnd
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
import qualified LndClient.RPC.Katip as Lnd
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

uniquePairs :: (Enum a, Bounded a) => [(a, a)]
uniquePairs = [(x0, x1) | x0 <- enumerate, x1 <- enumerate, x0 < x1]

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

class
  ( KatipContext m,
    MonadUnliftIO m,
    Enum owner,
    Bounded owner,
    Show owner
  ) =>
  LndTest m owner where
  getBtcClient :: owner -> m BTC.Client
  getTestEnv :: owner -> m TestEnv
  getLndEnv :: owner -> m LndEnv
  getLndEnv = (testLndEnv <$>) . getTestEnv
  getNodeLocation :: owner -> m NodeLocation
  getNodeLocation = (testNodeLocation <$>) . getTestEnv
  getChannelTChan :: owner -> m (TChan ((), ChannelEventUpdate))
  getChannelTChan =
    (Watcher.dupLndTChan =<<)
      . (testChannelWatcher <$>)
      . getTestEnv
  getInvoiceTChan :: owner -> m (TChan (SubscribeInvoicesRequest, Invoice))
  getInvoiceTChan =
    (Watcher.dupLndTChan =<<)
      . (testInvoiceWatcher <$>)
      . getTestEnv

walletAddress :: LndTest m owner => owner -> m Text
walletAddress owner = do
  lnd <- getLndEnv owner
  Lnd.NewAddressResponse x <-
    liftLndResult
      =<< Lnd.newAddress
        lnd
        GRPC.AddressTypeWITNESS_PUBKEY_HASH
  pure x

lazyMineInitialCoins :: LndTest m owner => Proxy owner -> m ()
lazyMineInitialCoins = const $ do
  let numOwners = length enumerate
  mapM_ (liftLndResult <=< Lnd.lazyInitWallet <=< getLndEnv) enumerate
  bc <- getBtcClient Proxy
  h <- liftIO $ BTC.getBlockCount bc
  -- reward coins are spendable only after 100 blocks
  when (h < 101 + numOwners) $ do
    mapM_ (mine 1) enumerate
    mine 101 minBound

lazyConnectNodes :: LndTest m owner => Proxy owner -> m ()
lazyConnectNodes = do
  aliceTestEnv <- getTestEnv Alice
  Lnd.GetInfoResponse alicePubKey _ _ <-
    liftLndResult =<< Lnd.getInfo (testLndEnv aliceTestEnv)
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
  liftLndResult =<< Lnd.lazyConnectPeer bob req

watchDefaults :: LndTest m owner => Proxy owner -> m ()
watchDefaults = const $ mapM_ this enumerate
  where
    this owner = do
      testEnv <- getTestEnv owner
      Watcher.watchUnit $ testChannelWatcher testEnv
      Watcher.watch (testInvoiceWatcher testEnv) iReq
    iReq =
      --
      -- TODO : this is related to LND bug
      -- https://github.com/lightningnetwork/lnd/issues/2469
      --
      SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing

mine :: forall m owner. LndTest m owner => Int -> owner -> m ()
mine blocks owner = do
  btcAddr <- walletAddress owner
  bc <- getBtcClient owner
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
  liftLndResult =<< syncWallets (Proxy :: Proxy owner)

mine1 :: LndTest m owner => Proxy owner -> m ()
mine1 = mine 1 minBound

liftLndResult :: (MonadIO m) => Either LndError a -> m a
liftLndResult (Right x) =
  pure x
liftLndResult (Left x) =
  liftIO $ fail $ "LiftLndResult failed " <> show x

syncWallets ::
  forall m owner.
  LndTest m owner =>
  Proxy owner ->
  m (Either LndError ())
syncWallets = const $ this 0
  where
    this 30 = do
      let msg = "SyncWallets attempt limit exceeded"
      $(logTM) ErrorS $ logStr msg
      pure . Left $ LndError msg
    this (attempt :: Int) = do
      $(logTM) InfoS "SyncWallets is running"
      rs <- mapM (Lnd.getInfo <=< getLndEnv) (enumerate :: [owner])
      if all isInSync rs
        then pure $ Right ()
        else liftIO (delay 1000000) >> this (attempt + 1)
    isInSync = \case
      Left {} -> False
      Right x -> Lnd.syncedToChain x

syncPendingChannels :: forall m owner. LndTest m owner => Proxy owner -> m ()
syncPendingChannels =
  const $ mapM_ (liftLndResult <=< syncPendingChannelsFor) (enumerate :: [owner])

syncPendingChannelsFor ::
  forall m owner.
  LndTest m owner =>
  owner ->
  m (Either LndError ())
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
      res <- Lnd.pendingChannels =<< getLndEnv owner
      case res of
        Left {} -> this (attempt + 1)
        Right (PendingChannelsResponse _ x0 x1 x2 x3) ->
          if null x0
            && null x1
            && null x2
            && null x3
            then pure $ Right ()
            else mine1 (Proxy :: Proxy owner) >> this (attempt + 1)

receiveClosedChannels ::
  LndTest m owner =>
  Proxy owner ->
  [ChannelPoint] ->
  TChan ((), ChannelEventUpdate) ->
  m (Either LndError ())
receiveClosedChannels po = this 0
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
            cps -> mine1 po >> this (attempt + 1) cps cq
        _ ->
          mine1 po >> this (attempt + 1) cps0 cq

closeAllChannels :: forall m owner. LndTest m owner => Proxy owner -> m ()
closeAllChannels po =
  mapM_ this uniquePairs
  where
    this :: (owner, owner) -> m ()
    this (owner0, owner1) = do
      $(logTM) InfoS "CloseAllChannels - closing channels"
      lnd0 <- getLndEnv owner0
      cs <-
        liftLndResult
          =<< Lnd.listChannels
            lnd0
            (ListChannelsRequest True False False False Nothing)
      let cps = Channel.channelPoint <$> cs
      mapM_
        ( \cp ->
            Util.spawnLink $
              Lnd.closeChannel
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
                lnd0
                (CloseChannelRequest cp False Nothing Nothing Nothing)
        )
        cps
      chan0 <- getChannelTChan owner0
      chan1 <- getChannelTChan owner1
      liftLndResult =<< receiveClosedChannels po cps chan0
      liftLndResult =<< receiveClosedChannels po cps chan1

receiveActiveChannel ::
  LndTest m owner =>
  Proxy owner ->
  ChannelPoint ->
  TChan ((), ChannelEventUpdate) ->
  m (Either LndError ())
receiveActiveChannel po = this 0
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
                else mine1 po >> this (attempt + 1) cp cq
            _ ->
              mine1 po >> this (attempt + 1) cp cq

setupZeroChannels :: LndTest m owner => Proxy owner -> m ()
setupZeroChannels x = do
  lazyMineInitialCoins x
  lazyConnectNodes x
  watchDefaults x
  closeAllChannels x
  syncPendingChannels x

setupOneChannel ::
  forall m owner.
  LndTest m owner =>
  owner ->
  owner ->
  m ChannelPoint
setupOneChannel ownerFrom ownerTo = do
  lndFrom <- getLndEnv ownerFrom
  lndTo <- getLndEnv ownerTo
  mq <- getChannelTChan ownerTo
  cq <- getChannelTChan ownerFrom
  --
  -- Open channel from Customer to Merchant
  --
  $(logTM) InfoS "SetupOneChannel - opening channel"
  GetInfoResponse merchantPubKey _ _ <-
    liftLndResult =<< Lnd.getInfo lndTo
  let openChannelRequest =
        OpenChannel.OpenChannelRequest
          { OpenChannel.nodePubkey = merchantPubKey,
            OpenChannel.localFundingAmount = MSat 200000000,
            OpenChannel.pushSat = Just $ MSat 10000000,
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
      =<< Lnd.openChannelSync lndFrom openChannelRequest
  let po = Proxy :: Proxy owner
  liftLndResult =<< receiveActiveChannel po cp mq
  liftLndResult =<< receiveActiveChannel po cp cq
  --
  -- TODO : these invoices are added and settled to
  -- raise invoice index to 1 to be able to receive
  -- notifications about all next invoices
  -- remove when LND bug will be fixed
  -- https://github.com/lightningnetwork/lnd/issues/2469
  --
  sendTestPayment (MSat 1000000) ownerFrom ownerTo
  sendTestPayment (MSat 1000000) ownerTo ownerFrom
  $(logTM) InfoS "SetupOneChannel - finished"
  pure cp

sendTestPayment :: LndTest m owner => MSat -> owner -> owner -> m ()
sendTestPayment amt0 sender0 recepient0 = do
  sender <- getLndEnv sender0
  recepient <- getLndEnv recepient0
  let addInvoiceRequest =
        AddInvoice.AddInvoiceRequest
          { AddInvoice.memo = Just "HELLO",
            AddInvoice.valueMsat = amt0,
            AddInvoice.expiry = Just $ Seconds 1000
          }
  invoice <-
    liftLndResult =<< Lnd.addInvoice recepient addInvoiceRequest
  let payReq =
        SendPayment.SendPaymentRequest
          { SendPayment.paymentRequest =
              AddInvoice.paymentRequest invoice,
            SendPayment.amt = amt0
          }
  void . liftLndResult =<< Lnd.sendPayment sender payReq

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
    Lnd.subscribeChannelEventsChan
    $ \_ _ -> pure ()

spawnLinkInvoiceWatcher ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (Watcher SubscribeInvoicesRequest Invoice)
spawnLinkInvoiceWatcher lnd =
  Watcher.spawnLink
    lnd
    Lnd.subscribeInvoicesChan
    $ \_ _ _ -> pure ()
