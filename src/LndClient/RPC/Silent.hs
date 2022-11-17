{-# LANGUAGE TemplateHaskell #-}

-- | List of functions, used to communicate with LND via gRPC.
-- Method names are corresponding to gRPC method names, see LND gRPC api docs <https://api.lightning.community>.
module LndClient.RPC.Silent
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
    sendCoins,
    fundPsbt,
    finalizePsbt,
    publishTransaction,
    listUnspent,
    listLeases,
    leaseOutput,
    releaseOutput,
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
    fundingStateStep,
    trackPaymentSync,
    grpcCatchWalletLockSilent,
    exportAllChannelBackups,
    exportChannelBackup,
    restoreChannelBackups,
    walletBalance,
    channelBalance,
  )
where

import Data.ProtoLens.Message
import LndClient.Data.AddHodlInvoice as AddHodlInvoice (AddHodlInvoiceRequest (..))
import LndClient.Data.AddInvoice as AddInvoice (AddInvoiceResponse (..))
import qualified LndClient.Data.Channel as Channel
import LndClient.Data.CloseChannel as CloseChannel
  ( CloseChannelRequest (..),
    CloseStatusUpdate (..),
  )
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as ListChannels (ListChannelsRequest (..))
import LndClient.Data.Payment as Payment
import LndClient.Data.Peer (ConnectPeerRequest (..))
import LndClient.Data.TrackPayment as TrackPayment
import LndClient.Import
import LndClient.RPC.TH
import LndClient.Util as Util

$(mkRpc RpcSilent)

waitForGrpc ::
  (MonadUnliftIO m) =>
  LndEnv ->
  m (Either LndError ())
waitForGrpc env = this 30
  where
    this (x :: Int) =
      if x > 0
        then do
          res <- getInfoNoUnlock env
          if isRight res
            then return $ Right ()
            else do
              sleep $ MicroSecondsDelay 1000000
              this $ x - 1
        else do
          return . Left $
            LndError "waitForGrpc attempt limit exceeded"

lazyUnlockWallet ::
  (MonadUnliftIO m) =>
  LndEnv ->
  m (Either LndError ())
lazyUnlockWallet env = do
  unlocked <- isRight <$> getInfoNoUnlock env
  if unlocked
    then return $ Right ()
    else unlockWallet env

lazyInitWallet ::
  (MonadUnliftIO m) =>
  LndEnv ->
  m (Either LndError ())
lazyInitWallet env = do
  unlockRes <- lazyUnlockWallet env
  if isRight unlockRes
    then return unlockRes
    else initWallet env

ensureHodlInvoice ::
  (MonadUnliftIO m) =>
  LndEnv ->
  AddHodlInvoiceRequest ->
  m (Either LndError AddInvoiceResponse)
ensureHodlInvoice env req = do
  let rh = AddHodlInvoice.hash req
  _ <- addHodlInvoice env req
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
  (MonadUnliftIO m) =>
  LndEnv ->
  ConnectPeerRequest ->
  CloseChannelRequest ->
  m (Either LndError CloseStatusUpdate)
closeChannelSync env conn req = do
  cs0 <- listChannels env (ListChannels.ListChannelsRequest False False False False Nothing)
  case cs0 of
    Left err -> pure $ Left err
    Right x ->
      case filter (\ch -> channelPoint req == Channel.channelPoint ch) x of
        [] -> return $ Right NothingUpdate
        _ -> do
          mVar <- newEmptyMVar
          closeChannelRecursive mVar 10
  where
    closeChannelRecursive _ (0 :: Int) = return $ Left $ LndError "Cannot close channel"
    closeChannelRecursive mVar0 n = do
      void $ lazyConnectPeer env conn
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
        Nothing -> closeChannelRecursive mVar0 (n - 1)

trackPaymentSync ::
  (MonadUnliftIO m) =>
  LndEnv ->
  TrackPaymentRequest ->
  m (Either LndError Payment)
trackPaymentSync env req = do
  mVar <- newEmptyMVar
  withSpawnLink
    ( trackPaymentV2
        (void . tryPutMVar mVar)
        env
        req
    )
    (const $ waitTrackResult mVar 10)
  where
    waitTrackResult _ (0 :: Int) = return $ Left $ LndError "Track Payment timeout expired"
    waitTrackResult mVar0 n = do
      sleep $ MicroSecondsDelay 100000
      upd <- tryTakeMVar mVar0
      case upd of
        Just res -> return $ Right res
        Nothing -> waitTrackResult mVar0 (n - 1)

grpcCatchWalletLockSilent ::
  forall m a.
  MonadUnliftIO m =>
  LndEnv ->
  m (Either LndError a) ->
  m (Either LndError a)
grpcCatchWalletLockSilent env x = do
  x0 <- x
  case x0 of
    Left LndWalletLocked -> do
      _ <- lazyUnlockWallet env
      pure x0
    _ -> pure x0
