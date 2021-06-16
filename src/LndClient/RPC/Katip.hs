{-# LANGUAGE TemplateHaskell #-}

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
  )
where

import LndClient.Data.AddHodlInvoice as AddHodlInvoice (AddHodlInvoiceRequest (..))
import LndClient.Data.AddInvoice as AddInvoice (AddInvoiceResponse (..))
import qualified LndClient.Data.Channel as Channel
import LndClient.Data.CloseChannel as CloseChannel (CloseChannelRequest (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as ListChannels (ListChannelsRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..))
import LndClient.Import
import LndClient.RPC.Generic
import LndClient.RPC.TH
import LndClient.Util as Util

$(mkRpc RpcKatip)

waitForGrpc ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
waitForGrpc env =
  katipAddContext (sl "RpcName" WaitForGrpc) $ this 30
  where
    this (x :: Int) =
      if x > 0
        then do
          $(logTM) (newSev env InfoS) "Waiting for GRPC..."
          res <- getInfo $ env {envLndLogStrategy = logDebug}
          if isRight res
            then return $ Right ()
            else liftIO (delay 1000000) >> this (x - 1)
        else do
          let msg = "waitForGrpc attempt limit exceeded"
          $(logTM) (newSev env ErrorS) $ logStr msg
          return . Left $ LndError msg

lazyUnlockWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
lazyUnlockWallet env =
  katipAddContext (sl "RpcName" LazyUnlockWallet) $ do
    $(logTM) (newSev env InfoS) "RPC is running..."
    unlocked <- isRight <$> getInfo (env {envLndLogStrategy = logDebug})
    if unlocked
      then do
        $(logTM) (newSev env InfoS) "Wallet is already unlocked, doing nothing"
        return $ Right ()
      else unlockWallet env

lazyInitWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
lazyInitWallet env =
  katipAddContext (sl "RpcName" LazyInitWallet) $ do
    $(logTM) (newSev env InfoS) "RPC is running..."
    unlockRes <-
      lazyUnlockWallet $
        env {envLndLogStrategy = logDebug}
    if isRight unlockRes
      then do
        $(logTM) (newSev env InfoS) "Wallet is already initialized, doing nothing"
        return unlockRes
      else initWallet env

ensureHodlInvoice ::
  (KatipContext m) =>
  LndEnv ->
  AddHodlInvoiceRequest ->
  m (Either LndError AddInvoiceResponse)
ensureHodlInvoice env req =
  katipAddContext (sl "RpcName" EnsureHodlInvoice) $ do
    $(logTM) (newSev env InfoS) "RPC is running..."
    let rh = AddHodlInvoice.hash req
    _ <- addHodlInvoice (env {envLndLogStrategy = logDebug}) req
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
  ConnectPeerRequest ->
  CloseChannelRequest ->
  m (Either LndError ())
closeChannelSync env conn req = do
  cs0 <- listChannels env (ListChannels.ListChannelsRequest False False False False Nothing)
  case cs0 of
    Left err -> pure $ Left err
    Right x ->
      case filter (\ch -> channelPoint req == Channel.channelPoint ch) x of
        [] -> do
          $(logTM) (newSev env WarningS) "Cannot close channel that is not active"
          return $ Right ()
        _ -> do
          mVar <- newEmptyMVar
          closeChannelRecursive mVar 10
  where
    closeChannelRecursive _ (0 :: Int) = do
      $(logTM) (newSev env ErrorS) "Channel couldn't be closed."
      return $ Left $ LndError "Cannot close channel"
    closeChannelRecursive mVar0 n = do
      void $ lazyConnectPeer env conn
      void $ Util.spawnLink $
        closeChannel
          (void . tryPutMVar mVar0)
          env
          req
      liftIO $ delay 1000000
      upd <- tryTakeMVar mVar0
      case upd of
        Just _ -> return $ Right ()
        Nothing -> closeChannelRecursive mVar0 (n -1)
