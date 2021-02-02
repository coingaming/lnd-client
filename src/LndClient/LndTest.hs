{-# LANGUAGE TemplateHaskell #-}

module LndClient.LndTest
  ( BtcUrl (..),
    BtcLogin (..),
    BtcPassword (..),
    BtcEnv (..),
    LndTest (..),
    newBtcClient,
    aliceWalletAddress,
    bobWalletAddress,
    lazyMineInitialCoins,
    lazyConnectNodes,
    mineAlice,
    mineBob,
    mine1,
    liftLndResult,
    syncWallets,
  )
where

import qualified LndClient.Data.GetInfo as LND (GetInfoResponse (..))
import qualified LndClient.Data.NewAddress as LND
  ( NewAddressResponse (..),
  )
import LndClient.Data.Peer
  ( ConnectPeerRequest (..),
    LightningAddress (..),
  )
import LndClient.Import
import qualified LndClient.RPC.Katip as LND
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

newBtcClient :: MonadIO m => BtcEnv -> m BTC.Client
newBtcClient x =
  liftIO $
    BTC.getClient
      (coerce $ btcUrl x)
      (coerce $ btcLogin x)
      (coerce $ btcPassword x)

class (KatipContext m, MonadUnliftIO m) => LndTest m where
  btcClient :: m BTC.Client
  aliceLndEnv :: m LndEnv
  aliceNodeLocation :: m NodeLocation
  bobLndEnv :: m LndEnv
  bobNodeLocation :: m NodeLocation

walletAddress :: LndTest m => m LndEnv -> m Text
walletAddress env = do
  lnd <- env
  LND.NewAddressResponse x <-
    liftLndResult
      =<< LND.newAddress
        lnd
        GRPC.AddressTypeWITNESS_PUBKEY_HASH
  pure x

aliceWalletAddress :: LndTest m => m Text
aliceWalletAddress = walletAddress aliceLndEnv

bobWalletAddress :: LndTest m => m Text
bobWalletAddress = walletAddress bobLndEnv

lazyMineInitialCoins :: LndTest m => m ()
lazyMineInitialCoins = do
  liftLndResult =<< LND.lazyInitWallet =<< aliceLndEnv
  liftLndResult =<< LND.lazyInitWallet =<< bobLndEnv
  bc <- btcClient
  h <- liftIO $ BTC.getBlockCount bc
  -- reward coins are spendable only after 100 blocks
  when (h < 102) $ do
    mineAlice 1
    mineBob 101

lazyConnectNodes :: LndTest m => m ()
lazyConnectNodes = do
  aliceNodeLocation' <- aliceNodeLocation
  bobLndEnv' <- bobLndEnv
  LND.GetInfoResponse alicePubKey _ _ <-
    liftLndResult =<< LND.getInfo =<< aliceLndEnv
  let req =
        ConnectPeerRequest
          { addr =
              LightningAddress
                { pubkey = alicePubKey,
                  host = aliceNodeLocation'
                },
            perm = False
          }
  liftLndResult =<< LND.lazyConnectPeer bobLndEnv' req

mine :: LndTest m => Int -> Text -> m ()
mine blocks btcAddr = do
  bc <- btcClient
  void . liftIO $
    BTC.generateToAddress
      bc
      blocks
      (toStrict btcAddr)
      Nothing
  liftLndResult =<< syncWallets

mineAlice :: LndTest m => Int -> m ()
mineAlice blocks = do
  btcAddr <- aliceWalletAddress
  $(logTM) InfoS $ logStr $
    "Mining " <> show blocks <> (" blocks to Alice wallet" :: Text)
  mine blocks btcAddr

mineBob :: LndTest m => Int -> m ()
mineBob blocks = do
  btcAddr <- bobWalletAddress
  $(logTM) InfoS $ logStr $
    "Mining " <> show blocks <> (" blocks to Bob wallet" :: Text)
  mine blocks btcAddr

mine1 :: LndTest m => m ()
mine1 = mineBob 1

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
      return . Left $ LndError msg
    this (x :: Int) = do
      $(logTM) InfoS "SyncWallets is running"
      resAlice <- LND.getInfo =<< aliceLndEnv
      resBob <- LND.getInfo =<< bobLndEnv
      case (,) <$> resAlice <*> resBob of
        Left _ ->
          liftIO (delay 1000000) >> this (x + 1)
        Right (mr, cr) ->
          if LND.syncedToChain mr && LND.syncedToChain cr
            then return $ Right ()
            else liftIO (delay 1000000) >> this (x + 1)
