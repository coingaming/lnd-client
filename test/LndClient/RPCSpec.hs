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
import LndClient.LndTest
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
  it "decodePayReq" $ withEnv $ \_ -> do
    lnd <- getLndEnv Bob
    x0 <- liftLndResult =<< addInvoice lnd addInvoiceRequest
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
  it "lookupInvoice" $ withEnv $ \_ -> do
    lnd <- getLndEnv Bob
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
  it "addInvoice" $ withEnv $ \_ -> do
    bob <- getLndEnv Bob
    res <- addInvoice bob addInvoiceRequest
    liftIO $ res `shouldSatisfy` isRight
  it "addInvoiceQrCode" $ withEnv $ \_ -> do
    bob <- getLndEnv Bob
    res <- liftLndResult =<< addInvoice bob addInvoiceRequest
    let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
    liftIO $ qr `shouldSatisfy` isJust
  it "addNormalInvoice" $ withEnv $ \_ -> do
    queue <- dupInvoiceTChan Bob
    bob <- getLndEnv Bob
    inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
    res <-
      receiveInvoice
        (AddInvoice.rHash inv)
        GRPC.Invoice_InvoiceStateOPEN
        queue
    liftIO $ res `shouldSatisfy` isRight
  it "settleNormalInvoice" $ withEnv $ \_ -> do
    setupOneChannel
    q <- dupInvoiceTChan Bob
    bob <- getLndEnv Bob
    inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
    let rh = AddInvoice.rHash inv
    let pr = AddInvoice.paymentRequest inv
    let spr = SendPaymentRequest pr $ MoneyAmount 1000
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateOPEN q
    alice <- getLndEnv Alice
    void $
      liftLndResult =<< sendPayment alice spr
    res <- receiveInvoice rh GRPC.Invoice_InvoiceStateSETTLED q
    liftIO $ res `shouldSatisfy` isRight
  it "addHodlInvoice" $ withEnv $ \_ -> do
    lnd <- getLndEnv Bob
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
  it "watchNormal" $ withEnv $ \_ -> do
    merEnv <- getLndEnv Bob
    w <-
      Watcher.spawnLink
        merEnv
        subscribeInvoicesChan
        $ \_ _ _ -> pure ()
    chan <- Watcher.dupLndTChan w
    Watcher.watch w subscribeInvoicesRequest
    inv <- liftLndResult =<< addInvoice merEnv addInvoiceRequest
    res <-
      receiveInvoice
        (AddInvoice.rHash inv)
        GRPC.Invoice_InvoiceStateOPEN
        chan
    Watcher.delete w
    liftIO $ res `shouldSatisfy` isRight
  it "watchUnit" $ withEnv $ \_ -> do
    merEnv <- getLndEnv Bob
    w <-
      Watcher.spawnLinkUnit
        merEnv
        subscribeChannelEventsChan
        $ \_ _ -> pure ()
    chan <- Watcher.dupLndTChan w
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
    alice <- getLndEnv Alice
    cp <- liftLndResult =<< openChannelSync alice openChannelRequest
    res <- receiveActiveChannel cp chan
    Watcher.delete w
    liftIO $ res `shouldSatisfy` isRight
  it "unWatch" $ withEnv $ \_ -> do
    merEnv <- getLndEnv Bob
    w <-
      Watcher.spawnLink
        merEnv
        subscribeInvoicesChan
        -- can unWatch from the callback
        $ \w k _ -> Watcher.unWatch w k
    chan <- Watcher.dupLndTChan w
    let emptyChan = do
          x <- readTChanTimeout (MicroSecondsDelay 500000) chan
          if isJust x then emptyChan else return ()
    Watcher.watch w subscribeInvoicesRequest
    void . liftLndResult =<< addInvoice merEnv addInvoiceRequest
    -- can unWatch from the outside as well
    Watcher.unWatch w subscribeInvoicesRequest
    emptyChan
    void . liftLndResult =<< addInvoice merEnv addInvoiceRequest
    res <- readTChanTimeout (MicroSecondsDelay 500000) chan
    Watcher.delete w
    liftIO $ res `shouldBe` Nothing
  it "ensureHodlInvoice" $ withEnv $ \_ -> do
    r <- newRPreimage
    let req =
          AddHodlInvoiceRequest
            { memo = Just "HELLO",
              hash = newRHash r,
              value = MoneyAmount 1000,
              expiry = Just $ Seconds 1000
            }
    bob <- getLndEnv Bob
    res <- ensureHodlInvoice bob req
    liftIO $ res `shouldSatisfy` isRight
  it "cancelInvoice" $ withEnv $ \_ -> do
    setupOneChannel
    r <- newRPreimage
    let rh = newRHash r
    let hipr =
          AddHodlInvoiceRequest
            Nothing
            rh
            (MoneyAmount 1000)
            Nothing
    merchantEnv <- getLndEnv Bob
    q <- dupInvoiceTChan Bob
    pr <-
      liftLndResult
        =<< addHodlInvoice merchantEnv hipr
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateOPEN q
    let spr = SendPaymentRequest pr $ MoneyAmount 1000
    alice <- getLndEnv Alice
    withSpawnLink
      (liftLndResult =<< sendPayment alice spr)
      ( const $ do
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
      )
  it "settleInvoice" $ withEnv $ \_ -> do
    setupOneChannel
    r <- newRPreimage
    let rh = newRHash r
    let hipr =
          AddHodlInvoiceRequest Nothing rh (MoneyAmount 1000) Nothing
    merchantEnv <- getLndEnv Bob
    q <- dupInvoiceTChan Bob
    pr <- liftLndResult =<< addHodlInvoice merchantEnv hipr
    liftLndResult
      =<< receiveInvoice rh GRPC.Invoice_InvoiceStateOPEN q
    let spr = SendPaymentRequest pr $ MoneyAmount 1000
    alice <- getLndEnv Alice
    withSpawnLink
      (liftLndResult =<< sendPayment alice spr)
      ( const $ do
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
      )
  it "listChannelAndClose" $ withEnv $ \_ -> do
    setupOneChannel
    chan <- dupChannelTChan Bob
    lnd <- getLndEnv Bob
    let listReq = ListChannelsRequest False False False False Nothing
    cs0 <- liftLndResult =<< listChannels lnd listReq
    cp <-
      liftMaybe "ChannelPoint is required" $
        Channel.channelPoint <$> safeHead cs0
    withSpawnLink
      ( closeChannel
          (const $ return ())
          lnd
          (CloseChannelRequest cp True Nothing Nothing Nothing)
      )
      ( const $ do
          liftLndResult =<< receiveClosedChannels [cp] chan
          cs1 <- liftLndResult =<< listChannels lnd listReq
          liftIO $ (length cs0 - length cs1) `shouldBe` 1
      )
  it "trackPaymentV2" $ withEnv $ \_ -> do
    setupOneChannel
    (cw, cr) <- atomically $ do
      cw <- newBroadcastTChan
      (cw,) <$> dupTChan cw
    --
    -- prepare invoice and subscription
    --
    bob <- getLndEnv Bob
    inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
    let rh = AddInvoice.rHash inv
    let pr = AddInvoice.paymentRequest inv
    let spr = SendPaymentRequest pr $ MoneyAmount 1000
    cusEnv <- getLndEnv Alice
    let sub = TrackPaymentRequest rh False
    --
    -- spawn payment watcher and settle invoice
    --
    w <-
      Watcher.spawnLink
        cusEnv
        trackPaymentV2Chan
        $ \w s x ->
          Watcher.unWatch w s >> atomically (writeTChan cw x)
    Watcher.watch w sub
    void $ liftLndResult =<< sendPayment cusEnv spr
    res <- readTChanTimeout (MicroSecondsDelay 500000) cr
    Watcher.delete w
    liftIO $ res `shouldSatisfy` isJust
  where
    subscribeInvoicesRequest =
      SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing
    addInvoiceRequest =
      AddInvoiceRequest
        { memo = Just "HELLO",
          value = MoneyAmount 1000,
          expiry = Just $ Seconds 1000
        }
