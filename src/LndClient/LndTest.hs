{-# LANGUAGE TemplateHaskell #-}

module LndClient.LndTest
  ( BtcUrl (..),
    BtcLogin (..),
    BtcPassword (..),
    BtcEnv (..),
    Owner (..),
    LndTest (..),
    TestEnv (..),
    newBtcClient,
    newTestEnv,
    lazyMineInitialCoins,
    lazyConnectNodes,
    mine,
    mine1,
    liftLndResult,
    syncWallets,
    spawnLinkChannelWatcher,
    spawnLinkInvoiceWatcher,
    watchDefaults,
  )
where

import qualified LndClient.Data.GetInfo as LND (GetInfoResponse (..))
import LndClient.Data.Invoice as LND (Invoice (..))
import qualified LndClient.Data.NewAddress as LND
  ( NewAddressResponse (..),
  )
import LndClient.Data.Peer
  ( ConnectPeerRequest (..),
    LightningAddress (..),
  )
import LndClient.Data.SubscribeChannelEvents
import LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import LndClient.Import
import qualified LndClient.RPC.Katip as LND
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
  btcClient :: m BTC.Client
  getTestEnv :: Owner -> m TestEnv
  getLndEnv :: Owner -> m LndEnv
  getLndEnv = (testLndEnv <$>) . getTestEnv
  getNodeLocation :: Owner -> m NodeLocation
  getNodeLocation = (testNodeLocation <$>) . getTestEnv
  dupChannelTChan :: Owner -> m (TChan ((), ChannelEventUpdate))
  dupChannelTChan =
    (Watcher.dupLndTChan =<<)
      . (testChannelWatcher <$>)
      . getTestEnv
  dupInvoiceTChan ::
    Owner -> m (TChan (SubscribeInvoicesRequest, Invoice))
  dupInvoiceTChan =
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
  bc <- btcClient
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
  bobLndEnv <- getLndEnv Bob
  liftLndResult =<< LND.lazyConnectPeer bobLndEnv req

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
  bc <- btcClient
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
