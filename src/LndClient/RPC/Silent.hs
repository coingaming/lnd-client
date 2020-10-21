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
    subscribeInvoicesQ,
    subscribeChannelEvents,
    subscribeChannelEventsQ,
    subscribeHtlcEvents,
    decodePayReq,
  )
where

import LndClient.Import
import LndClient.RPC.TH

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
