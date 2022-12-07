{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}

module LndClient.LndTest
  ( -- * Btc
    BtcUrl (..),
    BtcLogin (..),
    BtcPassword (..),
    BtcEnv (..),
    newBtcClient,

    -- * TestEnv
    TestEnv (..),
    withTestEnv,
    withChannelWatcher,
    withInvoiceWatcher,
    withSingleInvoiceWatcher,

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
    confirmedBalance,

    -- * LowLevel setup
    lazyMineInitialCoins,
    lazyConnectNodes,
    watchDefaults,
    cancelAllInvoices,
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
import LndClient.Data.ClosedChannels as ClosedChannels
import LndClient.Data.GetInfo (GetInfoResponse (..))
import qualified LndClient.Data.GetInfo as Lnd (GetInfoResponse (..))
import LndClient.Data.Invoice as Invoice (Invoice (..), InvoiceState (..))
import LndClient.Data.ListChannels as LC (ListChannelsRequest (..))
import qualified LndClient.Data.ListInvoices as ListInvoices
import qualified LndClient.Data.NewAddress as Lnd
  ( AddressType (..),
    NewAddressRequest (..),
    NewAddressResponse (..),
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
import qualified LndClient.Data.WalletBalance as Wallet
import LndClient.Import
import qualified LndClient.RPC.Katip as Lnd
import LndClient.Watcher as Watcher
import qualified Network.Bitcoin as Btc (Client, getClient)
import qualified Network.Bitcoin.BlockChain as Btc (getBlockCount)
import qualified Network.Bitcoin.Mining as Btc (generateToAddress)

newtype BtcUrl = BtcUrl {unBtcUrl :: String}

newtype BtcLogin = BtcLogin {unBtcLogin :: ByteString}

newtype BtcPassword = BtcPassword {unBtcPassword :: ByteString}

data BtcEnv = BtcEnv
  { btcUrl :: BtcUrl,
    btcLogin :: BtcLogin,
    btcPassword :: BtcPassword
  }

data TestEnv = TestEnv
  { testLndEnv :: LndEnv,
    testNodeLocation :: NodeLocation,
    testChannelWatcher :: Watcher () ChannelEventUpdate,
    testInvoiceWatcher :: Watcher SubscribeInvoicesRequest Invoice,
    testSingleInvoiceWatcher :: Watcher RHash Invoice
  }

uniquePairs :: (Ord a, Enum a, Bounded a) => [(a, a)]
uniquePairs = [(x0, x1) | x0 <- enumerate, x1 <- enumerate, x0 < x1]

newBtcClient :: MonadIO m => BtcEnv -> m Btc.Client
newBtcClient x =
  liftIO $
    Btc.getClient
      (unBtcUrl $ btcUrl x)
      (unBtcLogin $ btcLogin x)
      (unBtcPassword $ btcPassword x)

withTestEnv ::
  ( MonadUnliftIO m
  ) =>
  LndEnv ->
  NodeLocation ->
  (TestEnv -> KatipContextT m a) ->
  KatipContextT m a
withTestEnv lnd loc action =
  withChannelWatcher lnd $ \cw ->
    withInvoiceWatcher lnd $ \iw ->
      withSingleInvoiceWatcher lnd id $ \siw ->
        action
          TestEnv
            { testLndEnv = lnd,
              testNodeLocation = loc,
              testChannelWatcher = cw,
              testInvoiceWatcher = iw,
              testSingleInvoiceWatcher = siw
            }

class
  ( KatipContext m,
    MonadUnliftIO m,
    Ord owner,
    Enum owner,
    Bounded owner,
    Out owner
  ) =>
  LndTest m owner
  where
  getBtcClient :: owner -> m Btc.Client
  getTestEnv :: owner -> m TestEnv
  getLndEnv :: owner -> m LndEnv
  getLndEnv = (testLndEnv <$>) . getTestEnv
  getSev :: owner -> Severity -> m Severity
  getSev owner sev = do
    env <- testLndEnv <$> getTestEnv owner
    pure $ newSev env sev
  getNodeLocation :: owner -> m NodeLocation
  getNodeLocation = (testNodeLocation <$>) . getTestEnv
  getChannelTChan :: owner -> m (TChan ((), ChannelEventUpdate))
  getChannelTChan =
    (Watcher.dupLndTChan . testChannelWatcher) <=< getTestEnv
  getInvoiceTChan :: owner -> m (TChan (SubscribeInvoicesRequest, Invoice))
  getInvoiceTChan =
    (Watcher.dupLndTChan . testInvoiceWatcher) <=< getTestEnv
  getSingleInvoiceTChan :: owner -> m (TChan (RHash, Invoice))
  getSingleInvoiceTChan =
    (Watcher.dupLndTChan . testSingleInvoiceWatcher) <=< getTestEnv

  --
  -- TODO : embed getSingleInvoiceTChan here
  -- because it's really not used separately
  --
  watchSingleInvoice :: owner -> RHash -> m ()
  watchSingleInvoice owner rh = do
    env <- getTestEnv owner
    Watcher.watch (testSingleInvoiceWatcher env) rh

walletAddress :: LndTest m owner => owner -> m Text
walletAddress owner = do
  lnd <- getLndEnv owner
  Lnd.NewAddressResponse x <-
    liftLndResult
      =<< Lnd.newAddress
        lnd
        (Lnd.NewAddressRequest Lnd.WITNESS_PUBKEY_HASH Nothing)
  pure x

confirmedBalance :: LndTest m owner => owner -> m Msat
confirmedBalance owner = do
  lnd <- getLndEnv owner
  bal <- liftLndResult =<< Lnd.walletBalance lnd
  pure $ Wallet.confirmedBalance bal

lazyMineInitialCoins :: forall m owner. LndTest m owner => Proxy owner -> m ()
lazyMineInitialCoins = const $ do
  mapM_ (liftLndResult <=< Lnd.lazyInitWallet <=< getLndEnv) owners
  bc <- getBtcClient (minBound :: owner)
  h <- liftIO $ Btc.getBlockCount bc
  -- Reward coins are spendable only after 100 blocks,
  -- mine additional 100 blocks per owner to ensure everybody
  -- has coins to spend.
  when (h < from (length owners * blocksPerOwner)) $ do
    mapM_ mineBlocks owners
  where
    owners :: [owner]
    owners = enumerate
    blocksPerOwner :: Int
    blocksPerOwner = 200
    mineBlocks :: owner -> m ()
    mineBlocks owner = do
      confirmedBal <- confirmedBalance owner
      when (unMsat confirmedBal < 100000000000) $ do
        mine blocksPerOwner owner

lazyConnectNodes :: forall m owner. LndTest m owner => Proxy owner -> m ()
lazyConnectNodes = const $ mapM_ this uniquePairs
  where
    this :: (owner, owner) -> m ()
    this (owner0, owner1) = do
      testEnvOwner0 <- getTestEnv owner0
      Lnd.GetInfoResponse pubKeyOwner0 _ _ <-
        liftLndResult =<< Lnd.getInfo (testLndEnv testEnvOwner0)
      let req =
            ConnectPeerRequest
              { addr =
                  LightningAddress
                    { pubkey = pubKeyOwner0,
                      host = testNodeLocation testEnvOwner0
                    },
                perm = False
              }
      lndEnvOwner1 <- getLndEnv owner1
      liftLndResult =<< Lnd.lazyConnectPeer lndEnvOwner1 req

watchDefaults :: forall m owner. LndTest m owner => Proxy owner -> m ()
watchDefaults = const $ mapM_ this (enumerate :: [owner])
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
  sev <- getSev owner DebugS
  $(logTM) sev $
    logStr $
      "Mining "
        <> inspectPlain @Text blocks
        <> " blocks to "
        <> inspectPlain owner
        <> " wallet"
  void . liftIO $
    Btc.generateToAddress
      bc
      blocks
      btcAddr
      Nothing
  liftLndResult =<< syncWallets (Proxy :: Proxy owner)

mine1 :: forall m owner. LndTest m owner => Proxy owner -> m ()
mine1 = const $ mine 1 (minBound :: owner)

liftLndResult :: MonadIO m => Either LndError a -> m a
liftLndResult (Right x) =
  pure x
liftLndResult (Left x) =
  liftIO . fail $
    "LiftLndResult failed " <> inspectPlain @String x

syncWallets ::
  forall m owner.
  LndTest m owner =>
  Proxy owner ->
  m (Either LndError ())
syncWallets = const $ this 0
  where
    this 30 = do
      let msg :: Text = "SyncWallets attempt limit exceeded"
      sev <- getSev (minBound :: owner) ErrorS
      $(logTM) sev $ logStr msg
      pure . Left $ LndError msg
    this (attempt :: Int) = do
      sev <- getSev (minBound :: owner) DebugS
      $(logTM) sev "SyncWallets is running"
      rs <- mapM (Lnd.getInfo <=< getLndEnv) (enumerate :: [owner])
      if all isInSync rs
        then pure $ Right ()
        else do
          sleep $ MicroSecondsDelay 1000000
          this $ attempt + 1
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
              <> inspectPlain @Text owner
              <> " attempt limit exceeded"
      sev <- getSev owner ErrorS
      $(logTM) sev $ logStr msg
      pure . Left $ LndError msg
    this (attempt :: Int) = do
      sev <- getSev owner DebugS
      $(logTM) sev $
        logStr $
          "SyncPendingChannelsFor "
            <> inspectPlain @Text owner
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
  forall m owner.
  LndTest m owner =>
  Proxy owner ->
  [ChannelPoint] ->
  m (Either LndError ())
receiveClosedChannels po = this 0
  where
    this _ [] =
      pure $ Right ()
    this 30 _ =
      pure $
        Left $
          LndError "receiveClosedChannels - exceeded"
    this (attempt :: Integer) cps = do
      let owners = enumerate :: [owner]
      xs <- rights <$> mapM getOwnersCloseCPs owners
      let filteredCps = filter (checkTwiceCP $ concat xs) cps
      if null filteredCps
        then pure $ Right ()
        else do
          mine1 po
          sleep $ MicroSecondsDelay 1000000
          this (attempt + 1) filteredCps
    checkTwiceCP :: [ChannelPoint] -> ChannelPoint -> Bool
    checkTwiceCP cps cp = length (filter (cp ==) cps) < 2
    getOwnersCloseCPs :: owner -> m (Either LndError [ChannelPoint])
    getOwnersCloseCPs o = do
      lnd <- getLndEnv o
      ccs <- liftLndResult =<< Lnd.closedChannels lnd ClosedChannels.defReq
      pure $ Right $ chPoint <$> ccs

cancelAllInvoices ::
  forall m owner.
  LndTest m owner =>
  Proxy owner ->
  m ()
cancelAllInvoices =
  const $ mapM_ (this 0) (enumerate :: [owner])
  where
    listReq =
      ListInvoices.ListInvoiceRequest
        { ListInvoices.pendingOnly = True,
          ListInvoices.indexOffset = AddIndex 0,
          ListInvoices.numMaxInvoices = 0,
          ListInvoices.reversed = False
        }
    this :: Int -> owner -> m ()
    this 30 owner =
      error $
        "CancelAllInvoices attempt limit exceeded for " <> inspectPlain owner
    this attempt owner = do
      lnd <- getLndEnv owner
      let getInvoices :: m [Invoice] =
            ListInvoices.invoices
              <$> (liftLndResult =<< Lnd.listInvoices lnd listReq)
      is0 <- getInvoices
      res <- mapM (Lnd.cancelInvoice lnd) (Invoice.rHash <$> is0)
      is1 <- getInvoices
      if all isRight res && null is1
        then pure ()
        else do
          sleep $ MicroSecondsDelay 1000000
          this (attempt + 1) owner

closeAllChannels :: forall m owner. LndTest m owner => Proxy owner -> m ()
closeAllChannels po = do
  cancelAllInvoices po
  mapM_ (this 0) uniquePairs
  where
    this :: Int -> (owner, owner) -> m ()
    this 30 owners =
      error $
        "CloseAllChannels - limit exceeded for " <> inspectPlain owners
    this attempt (owner0, owner1) = do
      sev <- getSev owner0 DebugS
      $(logTM) sev "CloseAllChannels - closing channels"
      lnd0 <- getLndEnv owner0
      peerLocation <- getNodeLocation owner1
      GetInfoResponse peerPubKey _ _ <-
        liftLndResult =<< Lnd.getInfo =<< getLndEnv owner1
      let getChannels :: m [Channel] =
            liftLndResult
              =<< Lnd.listChannels
                lnd0
                (ListChannelsRequest False False False False (Just peerPubKey))
      cs0 <- getChannels
      let cps = Channel.channelPoint <$> cs0
      res <-
        mapM
          ( \cp ->
              Lnd.closeChannelSync
                lnd0
                ( Just $
                    ConnectPeerRequest (LightningAddress peerPubKey peerLocation) False
                )
                (CloseChannelRequest cp False Nothing Nothing Nothing)
          )
          cps
      cs1 <- getChannels
      if all isRight res && null cs1
        then liftLndResult =<< receiveClosedChannels po cps
        else do
          sleep $ MicroSecondsDelay 1000000
          this (attempt + 1) (owner0, owner1)

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
  sev <- getSev ownerFrom DebugS
  $(logTM) sev "SetupOneChannel - opening channel"
  GetInfoResponse merchantPubKey _ _ <-
    liftLndResult =<< Lnd.getInfo lndTo
  let openChannelRequest =
        OpenChannel.OpenChannelRequest
          { OpenChannel.nodePubkey = merchantPubKey,
            OpenChannel.localFundingAmount = Msat 200000000,
            OpenChannel.pushMSat = Just $ Msat 10000000,
            OpenChannel.targetConf = Nothing,
            OpenChannel.mSatPerByte = Nothing,
            OpenChannel.private = Nothing,
            OpenChannel.minHtlcMsat = Nothing,
            OpenChannel.remoteCsvDelay = Nothing,
            OpenChannel.minConfs = Nothing,
            OpenChannel.spendUnconfirmed = Nothing,
            OpenChannel.closeAddress = Nothing,
            OpenChannel.fundingShim = Nothing
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
  () <- sendTestPayment (Msat 1000000) ownerFrom ownerTo
  () <- sendTestPayment (Msat 1000000) ownerTo ownerFrom
  $(logTM) sev "SetupOneChannel - finished"
  pure cp

sendTestPayment :: LndTest m owner => Msat -> owner -> owner -> m ()
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
            SendPayment.amt =
              Just amt0,
            SendPayment.outgoingChanId =
              Nothing
          }
  void . liftLndResult =<< Lnd.sendPayment sender payReq

receiveInvoice ::
  ( MonadUnliftIO m,
    KatipContext m
  ) =>
  LndEnv ->
  RHash ->
  Invoice.InvoiceState ->
  TChan (a, Invoice) ->
  m (Either LndError ())
receiveInvoice env rh s q = do
  mx0 <- readTChanTimeout (MicroSecondsDelay 30000000) q
  let mx = snd <$> mx0
  katipAddLndPublic env LndTestReceiveInvoice mx $
    $(logTM) DebugS rpcSucceeded
  case (\x -> Invoice.rHash x == rh && Invoice.state x == s) <$> mx of
    Just True -> return $ Right ()
    Just False -> receiveInvoice env rh s q
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

withChannelWatcher ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  (Watcher () ChannelEventUpdate -> m a) ->
  m a
withChannelWatcher lnd =
  Watcher.withWatcherUnit
    lnd
    Lnd.subscribeChannelEventsChan
    ignore2

withInvoiceWatcher ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  (Watcher SubscribeInvoicesRequest Invoice -> m a) ->
  m a
withInvoiceWatcher lnd =
  Watcher.withWatcher
    lnd
    Lnd.subscribeInvoicesChan
    ignore3

withSingleInvoiceWatcher ::
  (Ord req, KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  (req -> RHash) ->
  (Watcher req Invoice -> m a) ->
  m a
withSingleInvoiceWatcher lnd accessor =
  Watcher.withWatcher
    lnd
    (Lnd.subscribeSingleInvoiceChan accessor)
    ignore3
