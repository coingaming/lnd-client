{-# LANGUAGE TemplateHaskell #-}

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
import LndClient.Import
import LndClient.RPC.TH
import LndClient.Util as Util

$(mkRpc RpcSilent)

waitForGrpc ::
  (MonadIO m) =>
  LndEnv ->
  m (Either LndError ())
waitForGrpc env0 = this 30 $ env0 {envLndLogStrategy = logMaskErrors}
  where
    this (x :: Int) env =
      if x > 0
        then do
          res <- getInfo env
          if isRight res
            then return $ Right ()
            else liftIO (delay 1000000) >> this (x - 1) env
        else do
          let msg = "waitForGrpc attempt limit exceeded"
          return . Left $ LndError msg

lazyUnlockWallet ::
  (MonadIO m) =>
  LndEnv ->
  m (Either LndError ())
lazyUnlockWallet env = do
  unlocked <- isRight <$> getInfo (env {envLndLogStrategy = logMaskErrors})
  if unlocked
    then return $ Right ()
    else unlockWallet env

lazyInitWallet ::
  (MonadIO m) =>
  LndEnv ->
  m (Either LndError ())
lazyInitWallet env = do
  unlockRes <- lazyUnlockWallet $ env {envLndLogStrategy = logMaskErrors}
  if isRight unlockRes
    then return unlockRes
    else initWallet env

ensureHodlInvoice ::
  (MonadIO m) =>
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
  CloseChannelRequest ->
  m (Either LndError ())
closeChannelSync env req = do
  cs0 <- listChannels env (ListChannels.ListChannelsRequest False False False False Nothing)
  case cs0 of
    Left err -> pure $ Left err
    Right x ->
      case filter (\ch -> channelPoint req == Channel.channelPoint ch) x of
        [] -> return $ Right ()
        _ -> do
          mVar <- newEmptyMVar
          closeChannelRecursive mVar 10
  where
    closeChannelRecursive _ (0 :: Int) = return $ Left $ LndError "Cannot close channel"
    closeChannelRecursive mVar0 n = do
      _ <-
        Util.spawnLink $
          closeChannel
            (void . tryPutMVar mVar0)
            env
            req
      upd <- liftIO $ Just <$> takeMVar mVar0 <|> Nothing <$ delay 1000000
      case upd of
        Just _ -> return $ Right ()
        Nothing -> closeChannelRecursive mVar0 (n -1)
