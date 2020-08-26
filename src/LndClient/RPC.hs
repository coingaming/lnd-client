{-# LANGUAGE TemplateHaskell #-}

module LndClient.RPC
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
  )
where

import LndClient.Import
import LndClient.RPC.Generic
import LndClient.RPC.TH

$(mkRpc RpcKatip)

waitForGrpc ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
waitForGrpc env0 =
  katipAddContext (sl "RpcName" WaitForGrpc)
    $ this 30
    $ env0 {envLndLogStrategy = logMaskErrors}
  where
    this (x :: Int) env =
      if x > 0
        then do
          $(logTM) InfoS "Waiting for GRPC..."
          res <- getInfo env
          if isRight res
            then return $ Right ()
            else liftIO (delay 1000000) >> this (x - 1) env
        else do
          let msg = "waitForGrpc attempt limit exceeded"
          $(logTM) ErrorS $ logStr msg
          return . Left $ LndError msg

lazyUnlockWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
lazyUnlockWallet env =
  katipAddContext (sl "RpcName" LazyUnlockWallet) $ do
    $(logTM) (newSeverity env InfoS Nothing Nothing) "RPC is running..."
    unlocked <- isRight <$> getInfo (env {envLndLogStrategy = logMaskErrors})
    if unlocked
      then do
        $(logTM)
          (newSeverity env InfoS Nothing Nothing)
          "Wallet is already unlocked, doing nothing"
        return $ Right ()
      else unlockWallet env

lazyInitWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
lazyInitWallet env =
  katipAddContext (sl "RpcName" LazyInitWallet) $ do
    $(logTM) (newSeverity env InfoS Nothing Nothing) "RPC is running..."
    unlockRes <- lazyUnlockWallet $ env {envLndLogStrategy = logMaskErrors}
    if isRight unlockRes
      then do
        $(logTM)
          (newSeverity env InfoS Nothing Nothing)
          "Wallet is already initialized, doing nothing"
        return unlockRes
      else initWallet env
