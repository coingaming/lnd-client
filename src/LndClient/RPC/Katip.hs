{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE TemplateHaskell #-}

-- | List of functions, used to communicate with LND via gRPC.
-- Method names are corresponding to gRPC method names, see LND gRPC api docs <https://api.lightning.community>.
-- Katip is used for function calls logging.
module LndClient.RPC.Katip
  ( waitForGrpc,
    unlockWallet,
    lazyUnlockWallet,
    lazyInitWallet,
    newAddress,
    addInvoice,
    addHodlInvoice,
    cancelInvoice,
    settleInvoice,
    initWallet,
    openChannelSync,
    openChannel,
    listChannels,
    closeChannel,
    listPeers,
    connectPeer,
    lazyConnectPeer,
    sendPayment,
    getInfo,
    subscribeInvoices,
    subscribeInvoicesChan,
    subscribeChannelEvents,
    subscribeChannelEventsChan,
    subscribeHtlcEvents,
    decodePayReq,
    lookupInvoice,
    ensureHodlInvoice,
    trackPaymentV2,
    trackPaymentV2Chan,
    pendingChannels,
    closedChannels,
    closeChannelSync,
    listInvoices,
    subscribeSingleInvoice,
    subscribeSingleInvoiceChan,
    signMessage,
    verifyMessage,
    trackPaymentSync,
  )
where

import Data.ProtoLens.Message
import LndClient.Data.AddHodlInvoice as AddHodlInvoice (AddHodlInvoiceRequest (..))
import LndClient.Data.AddInvoice as AddInvoice (AddInvoiceResponse (..))
import qualified LndClient.Data.Channel as Channel
import LndClient.Data.CloseChannel as CloseChannel (CloseChannelRequest (..), CloseStatusUpdate (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as ListChannels (ListChannelsRequest (..))
import LndClient.Data.Payment as Payment
import LndClient.Data.Peer (ConnectPeerRequest (..))
import LndClient.Data.TrackPayment as TrackPayment
import LndClient.Import
import LndClient.RPC.Generic
import LndClient.RPC.TH
import LndClient.Util as Util

$(mkRpc RpcKatip)

waitForGrpc ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (Either LndError ())
waitForGrpc env =
  katipAddLndPublic env LndMethodCompose WaitForGrpc $ do
    $(logTM) (newSev env DebugS) rpcRunning
    this 30
  where
    this (x :: Int) =
      if x > 0
        then do
          $(logTM) (newSev env DebugS) "Waiting for GRPC..."
          res <- getInfo $ enforceDebugSev env
          if isRight res
            then return $ Right ()
            else do
              sleep $ MicroSecondsDelay 1000000
              this $ x - 1
        else do
          let msg :: Text = "WaitForGrpc attempt limit exceeded!"
          $(logTM) (newSev env ErrorS) $ logStr msg
          return . Left $ LndError msg

lazyUnlockWallet ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (Either LndError ())
lazyUnlockWallet env =
  katipAddLndPublic env LndMethodCompose LazyUnlockWallet $ do
    $(logTM) (newSev env DebugS) rpcRunning
    unlocked <- isRight <$> getInfo (enforceDebugSev env)
    if unlocked
      then do
        $(logTM) (newSev env DebugS) "Wallet is already unlocked, doing nothing!"
        return $ Right ()
      else unlockWallet env

lazyInitWallet ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (Either LndError ())
lazyInitWallet env =
  katipAddLndPublic env LndMethodCompose LazyInitWallet $ do
    $(logTM) (newSev env DebugS) rpcRunning
    unlockRes <-
      lazyUnlockWallet $ enforceDebugSev env
    if isRight unlockRes
      then do
        $(logTM) (newSev env DebugS) "Wallet is already initialized, doing nothing!"
        return unlockRes
      else initWallet env

ensureHodlInvoice ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  AddHodlInvoiceRequest ->
  m (Either LndError AddInvoiceResponse)
ensureHodlInvoice env req =
  katipAddLndPublic env LndMethodCompose EnsureHodlInvoice $ do
    $(logTM) (newSev env DebugS) rpcRunning
    let rh = AddHodlInvoice.hash req
    void $ addHodlInvoice (enforceDebugSev env) req
    res <- lookupInvoice env rh
    return $ case res of
      Left x -> Left x
      Right x ->
        Right $
          AddInvoice.AddInvoiceResponse
            { AddInvoice.rHash = rh,
              AddInvoice.paymentRequest = Invoice.paymentRequest x,
              AddInvoice.addIndex = Invoice.addIndex x
            }

closeChannelSync ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  Maybe ConnectPeerRequest ->
  CloseChannelRequest ->
  m (Either LndError CloseStatusUpdate)
closeChannelSync env mConn req =
  katipAddLndPublic env LndMethodCompose CloseChannelSync $ do
    $(logTM) (newSev env DebugS) rpcRunning
    cs0 <-
      listChannels
        env
        $ ListChannels.ListChannelsRequest False False False False Nothing
    case cs0 of
      Left err -> pure $ Left err
      Right x ->
        case filter (\ch -> channelPoint req == Channel.channelPoint ch) x of
          [] -> do
            $(logTM) (newSev env WarningS) "Cannot close channel that is not active!"
            return $ Right NothingUpdate
          _ -> do
            mVar <- newEmptyMVar
            closeChannelRecursive mVar 10
  where
    closeChannelRecursive _ (0 :: Int) = do
      $(logTM) (newSev env ErrorS) "Channel couldn't be closed!"
      return . Left $ LndError "Channel couldn't be closed!"
    closeChannelRecursive mVar0 n = do
      whenJust mConn $ void . lazyConnectPeer env
      void $
        Util.spawnLink $
          closeChannel
            (void . tryPutMVar mVar0)
            env
            req
      sleep $ MicroSecondsDelay 1000000
      upd <- tryTakeMVar mVar0
      case upd of
        Just res -> return $ Right res
        Nothing -> closeChannelRecursive mVar0 $ n - 1

trackPaymentSync ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  TrackPaymentRequest ->
  m (Either LndError Payment)
trackPaymentSync env req = do
  mVar <- newEmptyMVar
  void $
    Util.spawnLink $
      trackPaymentV2
        (void . tryPutMVar mVar)
        env
        req
  waitTrackResult mVar 10
  where
    waitTrackResult _ (0 :: Int) = return $ Left $ LndError "Track Payment timeout expired"
    waitTrackResult mVar0 n = do
      sleep $ MicroSecondsDelay 1000000
      upd <- tryTakeMVar mVar0
      case upd of
        Just res -> return $ Right res
        Nothing -> waitTrackResult mVar0 (n -1)
