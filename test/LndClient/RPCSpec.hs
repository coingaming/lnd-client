{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralisedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.RPCSpec
  ( spec,
  )
where

import LndClient.Data.AddHodlInvoice as HodlInvoice (AddHodlInvoiceRequest (..))
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.Channel as Channel (Channel (..))
import LndClient.Data.CloseChannel (CloseChannelRequest (..))
import LndClient.Data.GetInfo (GetInfoResponse (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (ListChannelsRequest (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.PayReq as PayReq (PayReq (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import LndClient.Data.TrackPayment (TrackPaymentRequest (..))
import LndClient.Import
import LndClient.QRCode
import LndClient.RPC.Katip
import LndClient.TestApp
import qualified LndClient.Watcher as Watcher
import qualified LndGrpc as GRPC
import Test.Hspec

spec :: Spec
spec = do
  it "fromJSON" $ do
    x <- readLndEnv
    envLndSyncGrpcTimeout x `shouldBe` newGrpcTimeout 59
    envLndAsyncGrpcTimeout x `shouldBe` Nothing
  it "decodePayReq" $ withEnv $ \env -> do
    let lnd = envLndMerchant env
    x0 <-
      liftLndResult
        =<< addInvoice lnd addInvoiceRequest
    x1 <-
      liftLndResult
        =<< decodePayReq lnd (AddInvoice.paymentRequest x0)
    liftIO $ do
      PayReq.paymentHash x1
        `shouldBe` AddInvoice.rHash x0
      PayReq.numSatoshis x1
        `shouldBe` AddInvoice.value addInvoiceRequest
      Just (PayReq.expiry x1)
        `shouldBe` AddInvoice.expiry addInvoiceRequest
  it "lookupInvoice" $ withEnv $ \env -> do
    let lnd = envLndMerchant env
    x0 <- liftLndResult =<< addInvoice lnd addInvoiceRequest
    x1 <- liftLndResult =<< lookupInvoice lnd (AddInvoice.rHash x0)
    liftIO $ do
      Invoice.rHash x1
        `shouldBe` AddInvoice.rHash x0
      Invoice.paymentRequest x1
        `shouldBe` AddInvoice.paymentRequest x0
      Invoice.addIndex x1
        `shouldBe` AddInvoice.addIndex x0
      Just (Invoice.memo x1)
        `shouldBe` AddInvoice.memo addInvoiceRequest
      Invoice.value x1
        `shouldBe` AddInvoice.value addInvoiceRequest
  it "addInvoice" $ withEnv $ \env -> do
    res <- addInvoice (envLndMerchant env) addInvoiceRequest
    liftIO $ res `shouldSatisfy` isRight
  it "addInvoiceQrCode" $ withEnv $ \env -> do
    res <-
      liftLndResult
        =<< addInvoice (envLndMerchant env) addInvoiceRequest
    let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
    liftIO $ qr `shouldSatisfy` isJust
  it "addNormalInvoice" $ withEnv $ \env -> do
    queue <- atomically . dupTChan $ envMerchantIQ env
    i <-
      liftLndResult
        =<< addInvoice (envLndMerchant env) addInvoiceRequest
    res <-
      receiveInvoice
        (AddInvoice.rHash i)
        GRPC.Invoice_InvoiceStateOPEN
        queue
    liftIO $ res `shouldSatisfy` isRight
  it "settleNormalInvoice" $ withEnv $ \env -> do
    setupOneChannel env
    q <- atomically . dupTChan $ envMerchantIQ env
    i <-
      liftLndResult
        =<< addInvoice (envLndMerchant env) addInvoiceRequest
    let rh = AddInvoice.rHash i
    let pr = AddInvoice.paymentRequest i
    let spr = SendPaymentRequest pr $ MoneyAmount 1000
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateOPEN q
    void $
      liftLndResult =<< sendPayment (envLndCustomer env) spr
    res <- receiveInvoice rh GRPC.Invoice_InvoiceStateSETTLED q
    liftIO $ res `shouldSatisfy` isRight
  it "addHodlInvoice" $ withEnv $ \env -> do
    let lnd = envLndMerchant env
    r <- newRPreimage
    let req =
          AddHodlInvoiceRequest
            { memo = Just "HELLO",
              hash = newRHash r,
              value = MoneyAmount 1000,
              expiry = Just $ Seconds 1000
            }
    x0 <- addHodlInvoice lnd req
    x1 <- ensureHodlInvoice lnd req
    liftIO $ do
      x0 `shouldSatisfy` isRight
      x0 `shouldBe` AddInvoice.paymentRequest <$> x1
  it "watch" $ withEnv $ \env -> do
    (cw, cr) <- atomically $ do
      cw <- newBroadcastTChan
      (cw,) <$> dupTChan cw
    let merEnv = envLndMerchant env
    let sub = SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing
    (proc, w) <-
      Watcher.spawnLink
        merEnv
        subscribeInvoicesChan
        $ \_ _ x -> atomically $ writeTChan cw x
    Watcher.watch w sub
    void . liftLndResult =<< addInvoice merEnv addInvoiceRequest
    void . liftLndResult =<< addInvoice merEnv addInvoiceRequest
    res <- readTChanTimeout (MicroSecondsDelay 500000) cr
    liftIO $ do
      cancel proc
      res `shouldSatisfy` isJust
  it "watchUnit" $ withEnv $ \env -> do
    (cw, cr) <- atomically $ do
      cw <- newBroadcastTChan
      (cw,) <$> dupTChan cw
    let merEnv = envLndMerchant env
    (_, w) <-
      Watcher.spawnLinkUnit
        merEnv
        subscribeChannelEventsChan
        $ \_ x -> atomically $ writeTChan cw x
    Watcher.watchUnit w
    GetInfoResponse merchantPubKey _ _ <-
      liftLndResult =<< getInfo merEnv
    let openChannelRequest =
          OpenChannelRequest
            { nodePubkey = merchantPubKey,
              localFundingAmount = MoneyAmount 20000,
              pushSat = Just $ MoneyAmount 1000,
              targetConf = Nothing,
              satPerByte = Nothing,
              private = Nothing,
              minHtlcMsat = Nothing,
              remoteCsvDelay = Nothing,
              minConfs = Nothing,
              spendUnconfirmed = Nothing,
              closeAddress = Nothing
            }
    void . liftLndResult
      =<< openChannelSync (envLndCustomer env) openChannelRequest
    res <- readTChanTimeout (MicroSecondsDelay 500000) cr
    liftIO $ isJust res `shouldBe` True
  it "unWatch" $ withEnv $ \env -> do
    (cw, cr) <- atomically $ do
      cw <- newBroadcastTChan
      (cw,) <$> dupTChan cw
    let merEnv = envLndMerchant env
    let req = AddInvoiceRequest (MoneyAmount 1000) Nothing Nothing
    let sub = SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing
    let emptyChan = do
          x <- readTChanTimeout (MicroSecondsDelay 500000) cr
          if isJust x then emptyChan else return ()
    (_, w) <-
      Watcher.spawnLink
        merEnv
        subscribeInvoicesChan
        $ \w k x -> do
          -- can unWatch from the callback
          Watcher.unWatch w k
          atomically $ writeTChan cw x
    Watcher.watch w sub
    void . liftLndResult =<< addInvoice merEnv req
    void . liftLndResult =<< addInvoice merEnv req
    -- can unWatch from the outside as well
    --Watcher.unWatch w sub
    emptyChan
    void . liftLndResult =<< addInvoice merEnv req
    res <- readTChanTimeout (MicroSecondsDelay 500000) cr
    liftIO $ res `shouldSatisfy` isNothing
  it "ensureHodlInvoice" $ withEnv $ \env -> do
    r <- newRPreimage
    let req =
          AddHodlInvoiceRequest
            { memo = Just "HELLO",
              hash = newRHash r,
              value = MoneyAmount 1000,
              expiry = Just $ Seconds 1000
            }
    res <- ensureHodlInvoice (envLndMerchant env) req
    liftIO $ res `shouldSatisfy` isRight
  it "cancelInvoice" $ withEnv $ \env -> do
    setupOneChannel env
    r <- newRPreimage
    let rh = newRHash r
    let hipr = AddHodlInvoiceRequest Nothing rh (MoneyAmount 1000) Nothing
    let merchantEnv = envLndMerchant env
    q <- atomically . dupTChan $ envMerchantIQ env
    pr <-
      liftLndResult
        =<< addHodlInvoice merchantEnv hipr
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateOPEN q
    let spr = SendPaymentRequest pr $ MoneyAmount 1000
    void . spawnLink $
      liftLndResult =<< sendPayment (envLndCustomer env) spr
    --
    -- NOTE : this is working only in coingaming LND fork
    -- which is fixing this bug
    -- https://github.com/lightningnetwork/lnd/issues/4544
    --
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateACCEPTED q
    res <- cancelInvoice merchantEnv rh
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateCANCELED q
    liftIO $ res `shouldSatisfy` isRight
  it "settleInvoice" $ withEnv $ \env -> do
    setupOneChannel env
    r <- newRPreimage
    let rh = newRHash r
    let hipr =
          AddHodlInvoiceRequest Nothing rh (MoneyAmount 1000) Nothing
    let merchantEnv = envLndMerchant env
    q <- atomically . dupTChan $ envMerchantIQ env
    pr <- liftLndResult =<< addHodlInvoice merchantEnv hipr
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateOPEN q
    let spr = SendPaymentRequest pr $ MoneyAmount 1000
    void . spawnLink $
      liftLndResult =<< sendPayment (envLndCustomer env) spr
    --
    -- NOTE : this is working only in coingaming LND fork
    -- which is fixing this bug
    -- https://github.com/lightningnetwork/lnd/issues/4544
    --
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateACCEPTED q
    res <- settleInvoice merchantEnv r
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateSETTLED q
    liftIO $ res `shouldSatisfy` isRight
  it "listChannelAndClose" $ withEnv $ \env -> do
    setupOneChannel env
    chan <- atomically . dupTChan $ envMerchantCQ env
    let lnd = envLndMerchant env
    let listReq = ListChannelsRequest False False False False Nothing
    cs0 <- liftLndResult =<< listChannels lnd listReq
    cp <-
      case Channel.channelPoint <$> safeHead cs0 of
        Just x -> pure x
        Nothing -> error "No channel point found"
    proc <-
      spawnLink $ runApp env $
        closeChannel
          (const $ return ())
          lnd
          (CloseChannelRequest cp True Nothing Nothing Nothing)
    liftLndResult =<< receiveClosedChannels env [cp] chan
    cs1 <- liftLndResult =<< listChannels lnd listReq
    liftIO $ do
      cancel proc
      (length cs0 - length cs1) `shouldBe` 1
  it "trackPaymentV2" $ withEnv $ \env -> do
    setupOneChannel env
    (cw, cr) <- atomically $ do
      cw <- newBroadcastTChan
      (cw,) <$> dupTChan cw
    --
    -- prepare invoice and subscription
    --
    let air = AddInvoiceRequest (MoneyAmount 1000) Nothing Nothing
    i <- liftLndResult =<< addInvoice (envLndMerchant env) air
    let rh = AddInvoice.rHash i
    let pr = AddInvoice.paymentRequest i
    let spr = SendPaymentRequest pr $ MoneyAmount 1000
    let cusEnv = envLndCustomer env
    let sub = TrackPaymentRequest rh False
    --
    -- spawn payment watcher and settle invoice
    --
    (_, w) <-
      Watcher.spawnLink
        cusEnv
        trackPaymentV2Chan
        $ \w s x ->
          Watcher.unWatch w s >> atomically (writeTChan cw x)
    Watcher.watch w sub
    void $ liftLndResult =<< sendPayment cusEnv spr
    res <- readTChanTimeout (MicroSecondsDelay 500000) cr
    liftIO $ res `shouldSatisfy` isJust
  where
    addInvoiceRequest =
      AddInvoiceRequest
        { memo = Just "HELLO",
          value = MoneyAmount 1000,
          expiry = Just $ Seconds 1000
        }
