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
import qualified LndClient.Data.CloseChannel as CloseChannel
import qualified LndClient.Data.ClosedChannels as ClosedChannels
import LndClient.Data.GetInfo (GetInfoResponse (..))
import LndClient.Data.Invoice as Invoice (Invoice (..), InvoiceState (..))
import LndClient.Data.ListChannels as LC (ListChannelsRequest (..))
import LndClient.Data.ListInvoices as ListInvoices
  ( ListInvoiceRequest (..),
    ListInvoiceResponse (..),
  )
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.PayReq as PayReq (PayReq (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import LndClient.Import
import LndClient.LndTest
import LndClient.QRCode
import LndClient.RPC.Katip
import LndClient.TestApp
import qualified LndClient.Watcher as Watcher
import Test.Hspec

spec :: Spec
spec = do
  it "fromJSON" $ do
    x <- readLndEnv
    envLndSyncGrpcTimeout x `shouldBe` newGrpcTimeout 59
    envLndAsyncGrpcTimeout x `shouldBe` Nothing
  it "decodePayReq" $ withEnv $ do
    lnd <- getLndEnv Bob
    x0 <- liftLndResult =<< addInvoice lnd addInvoiceRequest
    x1 <-
      liftLndResult
        =<< decodePayReq lnd (AddInvoice.paymentRequest x0)
    liftIO $ do
      PayReq.paymentHash x1
        `shouldBe` AddInvoice.rHash x0
      PayReq.numMsat x1
        `shouldBe` AddInvoice.valueMsat addInvoiceRequest
      Just (PayReq.expiry x1)
        `shouldBe` AddInvoice.expiry addInvoiceRequest
  it "lookupInvoice" $ withEnv $ do
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
      Invoice.valueMsat x1
        `shouldBe` AddInvoice.valueMsat addInvoiceRequest
  it "addInvoice" $ withEnv $ do
    lnd <- getLndEnv Bob
    res <- addInvoice lnd addInvoiceRequest
    liftIO $ res `shouldSatisfy` isRight
  it "addInvoiceQrCode" $ withEnv $ do
    lnd <- getLndEnv Bob
    res <- liftLndResult =<< addInvoice lnd addInvoiceRequest
    let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
    liftIO $ qr `shouldSatisfy` isJust
  it "addNormalInvoice" $ withEnv $ do
    queue <- getInvoiceTChan Bob
    lnd <- getLndEnv Bob
    inv <- liftLndResult =<< addInvoice lnd addInvoiceRequest
    res <-
      receiveInvoice
        (AddInvoice.rHash inv)
        Invoice.OPEN
        queue
    liftIO $ res `shouldSatisfy` isRight
  it "settleNormalInvoice" $ withEnv $ do
    void $ setupOneChannel Alice Bob
    chan <- getInvoiceTChan Bob
    bob <- getLndEnv Bob
    inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
    let rh = AddInvoice.rHash inv
    liftLndResult
      =<< receiveInvoice rh Invoice.OPEN chan
    alice <- getLndEnv Alice
    let pr = AddInvoice.paymentRequest inv
    let spr = SendPaymentRequest pr $ MSat 1000000
    void $ liftLndResult =<< sendPayment alice spr
    res <- receiveInvoice rh Invoice.SETTLED chan
    liftIO $ res `shouldSatisfy` isRight
  it "addHodlInvoice" $ withEnv $ do
    lnd <- getLndEnv Bob
    r <- newRPreimage
    let req =
          AddHodlInvoiceRequest
            { memo = Just "HELLO",
              hash = newRHash r,
              valueMsat = MSat 1000000,
              expiry = Just $ Seconds 1000
            }
    x0 <- addHodlInvoice lnd req
    x1 <- ensureHodlInvoice lnd req
    liftIO $ do
      x0 `shouldSatisfy` isRight
      x0 `shouldBe` AddInvoice.paymentRequest <$> x1
  it "watchNormal" $ withEnv $ do
    bob <- getLndEnv Bob
    w <- Watcher.spawnLink bob subscribeInvoicesChan ignore3
    chan <- Watcher.dupLndTChan w
    Watcher.watch w subscribeInvoicesRequest
    inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
    res <-
      receiveInvoice
        (AddInvoice.rHash inv)
        Invoice.OPEN
        chan
    Watcher.delete w
    liftIO $ res `shouldSatisfy` isRight
  it "watchUnit" $ withEnv $ do
    bob <- getLndEnv Bob
    alice <- getLndEnv Alice
    w <- Watcher.spawnLinkUnit bob subscribeChannelEventsChan ignore2
    chan <- Watcher.dupLndTChan w
    Watcher.watchUnit w
    GetInfoResponse bobPubKey _ _ <- liftLndResult =<< getInfo bob
    let openChannelRequest =
          OpenChannelRequest
            { nodePubkey = bobPubKey,
              localFundingAmount = MSat 20000000,
              pushSat = Just $ MSat 1000000,
              targetConf = Nothing,
              satPerByte = Nothing,
              private = Nothing,
              minHtlcMsat = Nothing,
              remoteCsvDelay = Nothing,
              minConfs = Nothing,
              spendUnconfirmed = Nothing,
              closeAddress = Nothing
            }
    cp <- liftLndResult =<< openChannelSync alice openChannelRequest
    res <- receiveActiveChannel proxyOwner cp chan
    Watcher.delete w
    liftIO $ res `shouldSatisfy` isRight
  it "unWatch" $ withEnv $ do
    lnd <- getLndEnv Bob
    w <-
      Watcher.spawnLink
        lnd
        subscribeInvoicesChan
        -- can unWatch from the callback
        $ \w k _ -> Watcher.unWatch w k
    chan <- Watcher.dupLndTChan w
    Watcher.watch w subscribeInvoicesRequest
    void . liftLndResult =<< addInvoice lnd addInvoiceRequest
    -- can unWatch from the outside as well
    Watcher.unWatch w subscribeInvoicesRequest
    purgeChan chan
    void . liftLndResult =<< addInvoice lnd addInvoiceRequest
    res <- readTChanTimeout (MicroSecondsDelay 500000) chan
    Watcher.delete w
    liftIO $ res `shouldBe` Nothing
  it "ensureHodlInvoice" $ withEnv $ do
    r <- newRPreimage
    let req =
          AddHodlInvoiceRequest
            { memo = Just "HELLO",
              hash = newRHash r,
              valueMsat = MSat 1000000,
              expiry = Just $ Seconds 1000
            }
    bob <- getLndEnv Bob
    res <- ensureHodlInvoice bob req
    liftIO $ res `shouldSatisfy` isRight
  it "cancelInvoice" $ withEnv $ do
    void $ setupOneChannel Alice Bob
    r <- newRPreimage
    let rh = newRHash r
    let hipr =
          AddHodlInvoiceRequest
            Nothing
            rh
            (MSat 1000000)
            Nothing
    bob <- getLndEnv Bob
    q <- getInvoiceTChan Bob
    qq <- getSingleInvoiceTChan Bob
    pr <-
      liftLndResult
        =<< addHodlInvoice bob hipr
    watchSingleInvoice Bob rh
    liftLndResult
      =<< receiveInvoice rh Invoice.OPEN q
    let spr = SendPaymentRequest pr $ MSat 1000000
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
            =<< receiveInvoice rh Invoice.ACCEPTED qq
          res <- cancelInvoice bob rh
          liftLndResult
            =<< receiveInvoice rh Invoice.CANCELED qq
          liftIO $ res `shouldSatisfy` isRight
      )
  it "settleInvoice" $ withEnv $ do
    void $ setupOneChannel Alice Bob
    r <- newRPreimage
    let rh = newRHash r
    let hipr =
          AddHodlInvoiceRequest Nothing rh (MSat 1000000) Nothing
    bob <- getLndEnv Bob
    q <- getInvoiceTChan Bob
    qq <- getSingleInvoiceTChan Bob
    pr <- liftLndResult =<< addHodlInvoice bob hipr
    watchSingleInvoice Bob rh
    liftLndResult
      =<< receiveInvoice rh Invoice.OPEN q
    let spr = SendPaymentRequest pr $ MSat 1000000
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
            =<< receiveInvoice rh Invoice.ACCEPTED qq
          res <- settleInvoice bob r
          liftLndResult
            =<< receiveInvoice rh Invoice.SETTLED qq
          liftIO $ res `shouldSatisfy` isRight
      )
  it "listInvoices" $ withEnv $ do
    lnd <- getLndEnv Bob
    rh <-
      AddInvoice.rHash
        <$> (liftLndResult =<< addInvoice lnd addInvoiceRequest)
    let listReq =
          ListInvoiceRequest
            { pendingOnly = False,
              indexOffset = AddIndex 0,
              numMaxInvoices = 0,
              reversed = False
            }
    xs <-
      ListInvoices.invoices
        <$> (liftLndResult =<< listInvoices lnd listReq)
    liftIO $ xs `shouldSatisfy` any ((rh ==) . Invoice.rHash)
  it "listChannelAndClose" $ withEnv $ do
    void $ setupOneChannel Alice Bob
    lnd <- getLndEnv Bob
    let listReq = ListChannelsRequest False False False False Nothing
    cs0 <- liftLndResult =<< listChannels lnd listReq
    lazyConnectNodes proxyOwner
    cp <-
      liftMaybe "ChannelPoint is required" $
        Channel.channelPoint <$> safeHead cs0
    withSpawnLink
      ( closeChannel
          (const $ return ())
          lnd
          (CloseChannelRequest cp False Nothing Nothing Nothing)
      )
      ( const $ do
          liftLndResult =<< receiveClosedChannels proxyOwner [cp]
          cs1 <- liftLndResult =<< listChannels lnd listReq
          liftIO $ (length cs0 - length cs1) `shouldBe` 1
      )
  it "closedChannels" $ withEnv $ do
    cp <- setupOneChannel Alice Bob
    closeAllChannels proxyOwner
    lnd <- getLndEnv Bob
    res <- closedChannels lnd ClosedChannels.defReq
    liftIO $
      res
        `shouldSatisfy` ( \case
                            Left {} -> False
                            Right xs -> any ((cp ==) . CloseChannel.chPoint) xs
                        )
  where
    --
    -- TODO : fix this, it's not really working for some reason
    -- LND says "payment isn't initiated" error in logs
    --
    --it "trackPaymentV2" $ withEnv $ do
    --  setupOneChannel
    --  --
    --  -- prepare invoice and subscription
    --  --
    --  bob <- getLndEnv Bob
    --  inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
    --  let rh = AddInvoice.rHash inv
    --  let pr = AddInvoice.paymentRequest inv
    --  let spr = SendPaymentRequest pr $ MSat 1000
    --  --
    --  -- spawn payment watcher and settle invoice
    --  --
    --  w <- Watcher.spawnLink bob trackPaymentV2Chan $ \_ _ _ -> pure ()
    --  chan <- Watcher.dupLndTChan w
    --  Watcher.watch w $ TrackPaymentRequest rh False
    --  alice <- getLndEnv Alice
    --  void $ liftLndResult =<< sendPayment alice spr
    --  res <- readTChanTimeout (MicroSecondsDelay 500000) chan
    --  Watcher.delete w
    --  liftIO $ res `shouldSatisfy` isJust
    subscribeInvoicesRequest =
      SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing
    addInvoiceRequest =
      AddInvoiceRequest
        { memo = Just "HELLO",
          valueMsat = MSat 1000000,
          expiry = Just $ Seconds 1000
        }
