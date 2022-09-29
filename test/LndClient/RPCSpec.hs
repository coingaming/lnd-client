{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.RPCSpec
  ( spec,
  )
where

import qualified Control.Concurrent.Async as Async
import LndClient.Data.AddHodlInvoice as HodlInvoice (AddHodlInvoiceRequest (..))
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.Channel as Channel (Channel (..))
import qualified LndClient.Data.ChannelBalance as ChannelBalance
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
import qualified LndClient.Data.PayReq as PayReq
import LndClient.Data.Payment as Payment (Payment (..), PaymentStatus (..))
import LndClient.Data.PendingChannels (PendingChannelsResponse (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SignMessage
import LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import qualified LndClient.Data.TrackPayment as TrackPayment
import LndClient.Data.VerifyMessage
import qualified LndClient.Data.WalletBalance as Wallet
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
  it "decodePayReq" $
    withEnv $ do
      lnd <- getLndEnv Bob
      x0 <- liftLndResult =<< addInvoice lnd addInvoiceRequest
      ct <- liftIO getCurrentTime
      GetInfoResponse pub _ _ <- liftLndResult =<< getInfo lnd
      x1 <-
        liftLndResult
          =<< decodePayReq lnd (AddInvoice.paymentRequest x0)
      let dt =
            picosecondsToDiffTime
              . (* 1000000000000)
              . (`div` 1000000000000)
              . diffTimeToPicoseconds
              $ utctDayTime ct
      let expSec = Seconds 1000
      let utc = ct {utctDayTime = dt}
      liftIO $
        x1
          `shouldBe` PayReq.PayReq
            { PayReq.destination = pub,
              PayReq.paymentHash = AddInvoice.rHash x0,
              PayReq.numMsat = AddInvoice.valueMsat addInvoiceRequest,
              PayReq.expiry = Seconds 1000,
              PayReq.timestamp = ct {utctDayTime = dt},
              PayReq.expiresAt = PayReq.addSeconds expSec utc
            }
      liftIO $ do
        PayReq.paymentHash x1
          `shouldBe` AddInvoice.rHash x0
        PayReq.numMsat x1
          `shouldBe` AddInvoice.valueMsat addInvoiceRequest
        Just (PayReq.expiry x1)
          `shouldBe` AddInvoice.expiry addInvoiceRequest
  it "lookupInvoice" $
    withEnv $ do
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
  it "addInvoice" $
    withEnv $ do
      lnd <- getLndEnv Bob
      res <- addInvoice lnd addInvoiceRequest
      liftIO $ res `shouldSatisfy` isRight
  it "addInvoiceQrCode" $
    withEnv $ do
      lnd <- getLndEnv Bob
      res <- liftLndResult =<< addInvoice lnd addInvoiceRequest
      let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
      liftIO $ qr `shouldSatisfy` isJust
  it "addNormalInvoice" $
    withEnv $ do
      queue <- getInvoiceTChan Bob
      lnd <- getLndEnv Bob
      inv <- liftLndResult =<< addInvoice lnd addInvoiceRequest
      res <-
        receiveInvoice
          lnd
          (AddInvoice.rHash inv)
          Invoice.OPEN
          queue
      liftIO $ res `shouldSatisfy` isRight
  it "settleNormalInvoice" $
    withEnv $ do
      void $ setupOneChannel Alice Bob
      chan <- getInvoiceTChan Bob
      bob <- getLndEnv Bob
      inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
      let rh = AddInvoice.rHash inv
      liftLndResult
        =<< receiveInvoice bob rh Invoice.OPEN chan
      alice <- getLndEnv Alice
      let pr = AddInvoice.paymentRequest inv
      let spr = SendPaymentRequest pr (Just $ Msat 1000000) Nothing
      void $ liftLndResult =<< sendPayment alice spr
      res <- receiveInvoice bob rh Invoice.SETTLED chan
      liftIO $ res `shouldSatisfy` isRight
  it "settleNormalInvoice amt not specified" $
    withEnv $ do
      void $ setupOneChannel Alice Bob
      chan <- getInvoiceTChan Bob
      bob <- getLndEnv Bob
      inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
      let rh = AddInvoice.rHash inv
      liftLndResult
        =<< receiveInvoice bob rh Invoice.OPEN chan
      alice <- getLndEnv Alice
      let pr = AddInvoice.paymentRequest inv
      let spr = SendPaymentRequest pr Nothing Nothing
      void $ liftLndResult =<< sendPayment alice spr
      res <- receiveInvoice bob rh Invoice.SETTLED chan
      liftIO $ res `shouldSatisfy` isRight
  it "addHodlInvoice" $
    withEnv $ do
      lnd <- getLndEnv Bob
      r <- newRPreimage
      let req =
            AddHodlInvoiceRequest
              { memo = Just "HELLO",
                hash = newRHash r,
                valueMsat = Msat 1000000,
                expiry = Just $ Seconds 1000
              }
      x0 <- addHodlInvoice lnd req
      x1 <- ensureHodlInvoice lnd req
      liftIO $ do
        x0 `shouldSatisfy` isRight
        x0 `shouldBe` AddInvoice.paymentRequest <$> x1
  it "watchNormal" $
    withEnv $ do
      bob <- getLndEnv Bob
      Watcher.withWatcher bob subscribeInvoicesChan ignore3 $ \w -> do
        chan <- Watcher.dupLndTChan w
        Watcher.watch w subscribeInvoicesRequest
        inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
        res <-
          receiveInvoice
            bob
            (AddInvoice.rHash inv)
            Invoice.OPEN
            chan
        liftIO $ res `shouldSatisfy` isRight
  it "watchUnit" $
    withEnv $ do
      bob <- getLndEnv Bob
      alice <- getLndEnv Alice
      Watcher.withWatcherUnit bob subscribeChannelEventsChan ignore2 $ \w -> do
        chan <- Watcher.dupLndTChan w
        Watcher.watchUnit w
        GetInfoResponse bobPubKey _ _ <- liftLndResult =<< getInfo bob
        let openChannelRequest =
              OpenChannelRequest
                { nodePubkey = bobPubKey,
                  localFundingAmount = Msat 20000000,
                  pushMSat = Just $ Msat 1000000,
                  targetConf = Nothing,
                  mSatPerByte = Nothing,
                  private = Nothing,
                  minHtlcMsat = Nothing,
                  remoteCsvDelay = Nothing,
                  minConfs = Nothing,
                  spendUnconfirmed = Nothing,
                  closeAddress = Nothing,
                  fundingShim = Nothing
                }
        cp <- liftLndResult =<< openChannelSync alice openChannelRequest
        res <- receiveActiveChannel proxyOwner cp chan
        liftIO $ res `shouldSatisfy` isRight
  it "unWatch" $
    withEnv $ do
      lnd <- getLndEnv Bob
      Watcher.withWatcher
        lnd
        subscribeInvoicesChan
        -- can unWatch from the callback
        (\w k _ -> Watcher.unWatch w k)
        $ \w -> do
          chan <- Watcher.dupLndTChan w
          Watcher.watch w subscribeInvoicesRequest
          void . liftLndResult =<< addInvoice lnd addInvoiceRequest
          -- can unWatch from the outside as well
          Watcher.unWatch w subscribeInvoicesRequest
          purgeChan chan
          void . liftLndResult =<< addInvoice lnd addInvoiceRequest
          res <- readTChanTimeout (MicroSecondsDelay 500000) chan
          liftIO $ res `shouldBe` Nothing
  it "ensureHodlInvoice" $
    withEnv $ do
      r <- newRPreimage
      let req =
            AddHodlInvoiceRequest
              { memo = Just "HELLO",
                hash = newRHash r,
                valueMsat = Msat 1000000,
                expiry = Just $ Seconds 1000
              }
      bob <- getLndEnv Bob
      res <- ensureHodlInvoice bob req
      liftIO $ res `shouldSatisfy` isRight
  it "cancelInvoice" $
    withEnv $ do
      void $ setupOneChannel Alice Bob
      r <- newRPreimage
      let rh = newRHash r
      let hipr =
            AddHodlInvoiceRequest
              Nothing
              rh
              (Msat 1000000)
              Nothing
      bob <- getLndEnv Bob
      q <- getInvoiceTChan Bob
      qq <- getSingleInvoiceTChan Bob
      pr <-
        liftLndResult
          =<< addHodlInvoice bob hipr
      watchSingleInvoice Bob rh
      liftLndResult
        =<< receiveInvoice bob rh Invoice.OPEN q
      let spr = SendPaymentRequest pr (Just $ Msat 1000000) Nothing
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
              =<< receiveInvoice bob rh Invoice.ACCEPTED qq
            res <- cancelInvoice bob rh
            liftLndResult
              =<< receiveInvoice bob rh Invoice.CANCELED qq
            liftIO $ res `shouldSatisfy` isRight
        )
  it "settleInvoice" $
    withEnv $ do
      void $ setupOneChannel Alice Bob
      r <- newRPreimage
      let rh = newRHash r
      let hipr =
            AddHodlInvoiceRequest Nothing rh (Msat 1000000) Nothing
      bob <- getLndEnv Bob
      q <- getInvoiceTChan Bob
      qq <- getSingleInvoiceTChan Bob
      pr <- liftLndResult =<< addHodlInvoice bob hipr
      watchSingleInvoice Bob rh
      liftLndResult
        =<< receiveInvoice bob rh Invoice.OPEN q
      let spr = SendPaymentRequest pr (Just $ Msat 1000000) Nothing
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
              =<< receiveInvoice bob rh Invoice.ACCEPTED qq
            res <- settleInvoice bob r
            liftLndResult
              =<< receiveInvoice bob rh Invoice.SETTLED qq
            liftIO $ res `shouldSatisfy` isRight
        )
  it "listInvoices" $
    withEnv $ do
      lnd <- getLndEnv Bob
      rh <-
        AddInvoice.rHash
          <$> (liftLndResult =<< addInvoice lnd addInvoiceRequest)
      let listReq =
            ListInvoiceRequest
              { pendingOnly = True,
                indexOffset = AddIndex 0,
                numMaxInvoices = 0,
                reversed = False
              }
      xs <-
        ListInvoices.invoices
          <$> (liftLndResult =<< listInvoices lnd listReq)
      liftIO $ xs `shouldSatisfy` any ((rh ==) . Invoice.rHash)
  it "listChannelAndClose" $
    withEnv $ do
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
  it "closedChannels" $
    withEnv $ do
      cp <- setupOneChannel Alice Bob
      closeAllChannels proxyOwner
      lnd <- getLndEnv Bob
      res <- liftLndResult =<< closedChannels lnd ClosedChannels.defReq
      liftIO $ res `shouldSatisfy` any ((cp ==) . CloseChannel.chPoint)
  it "subscriptionCanBeCancelled" $
    withEnv $ do
      bob <- getLndEnv Bob
      alice <- getLndEnv Alice
      GetInfoResponse bobPubKey _ _ <- liftLndResult =<< getInfo bob
      let openChannelRequest =
            OpenChannelRequest
              { nodePubkey = bobPubKey,
                localFundingAmount = Msat 20000000,
                pushMSat = Just $ Msat 1000000,
                targetConf = Nothing,
                mSatPerByte = Nothing,
                private = Nothing,
                minHtlcMsat = Nothing,
                remoteCsvDelay = Nothing,
                minConfs = Nothing,
                spendUnconfirmed = Nothing,
                closeAddress = Nothing,
                fundingShim = Nothing
              }
      a <-
        spawnLink $
          liftLndResult
            =<< openChannel (const $ return ()) alice openChannelRequest
      liftIO $ do
        res <- Async.race (sleep $ MicroSecondsDelay 100000) $ Async.cancel a
        res `shouldSatisfy` isRight
  it "trackPaymentV2" $
    withEnv $
      do
        void $ setupOneChannel Alice Bob
        --
        -- prepare invoice and subscription
        --
        alice <- getLndEnv Alice
        bob <- getLndEnv Bob
        inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
        let req =
              SendPaymentRequest
                (AddInvoice.paymentRequest inv)
                (Just $ AddInvoice.valueMsat addInvoiceRequest)
                Nothing
        --
        -- spawn payment watcher and settle invoice
        --
        Watcher.withWatcher alice trackPaymentV2Chan (\_ _ _ -> pure ()) $ \w -> do
          void $ liftLndResult =<< sendPayment alice req
          chan <- Watcher.dupLndTChan w
          Watcher.watch w $
            TrackPayment.TrackPaymentRequest (AddInvoice.rHash inv) False
          res <- readTChanTimeout (MicroSecondsDelay 2000000) chan
          liftIO $ res `shouldSatisfy` isJust
  it "signVerify" $
    withEnv $ do
      alice <- getLndEnv Alice
      bob <- getLndEnv Bob
      --
      -- TODO : verifyMessage will work only in case
      -- where both (double-hash and compact) flags
      -- are set to False. Investigate why.
      --
      SignMessageResponse sig <-
        liftLndResult
          =<< signMessage alice (SignMessageRequest "test" (KeyLocator 6 0) False False)
      GetInfoResponse pubKey _ _ <-
        liftLndResult
          =<< getInfo alice
      VerifyMessageResponse res <-
        liftLndResult
          =<< verifyMessage bob (VerifyMessageRequest "test" sig (unNodePubKey pubKey))
      liftIO $
        res `shouldBe` True
  it "waitForGrpc" $
    withEnv $ do
      res <- waitForGrpc =<< getLndEnv Alice
      liftIO $ res `shouldSatisfy` isRight
  it "setupChannelAndClose" $
    withEnv $ do
      lndAlice <- getLndEnv Alice
      lndBob <- getLndEnv Bob
      GetInfoResponse merchantPubKey _ _ <-
        liftLndResult =<< getInfo lndBob
      let openChannelRequest =
            OpenChannelRequest
              { nodePubkey = merchantPubKey,
                localFundingAmount = Msat 200000000,
                pushMSat = Just $ Msat 10000000,
                targetConf = Nothing,
                mSatPerByte = Nothing,
                private = Nothing,
                minHtlcMsat = Nothing,
                remoteCsvDelay = Nothing,
                minConfs = Nothing,
                spendUnconfirmed = Nothing,
                closeAddress = Nothing,
                fundingShim = Nothing
              }
      _ <-
        liftLndResult
          =<< openChannelSync lndAlice openChannelRequest
      sleep $ MicroSecondsDelay 100000
      res <- pendingChannels =<< getLndEnv Alice
      let pc = case res of
            Left {} -> fail "Pending channels fail"
            Right (PendingChannelsResponse _ x _ _ _) -> x
      liftIO $ pc `shouldNotSatisfy` null
  it "trackPaymentV2Sync SUCCEEDED" $
    withEnv $
      do
        void $ setupOneChannel Alice Bob
        alice <- getLndEnv Alice
        bob <- getLndEnv Bob
        inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
        let req =
              SendPaymentRequest
                (AddInvoice.paymentRequest inv)
                (Just $ AddInvoice.valueMsat addInvoiceRequest)
                Nothing
        let tpreq = TrackPayment.TrackPaymentRequest (AddInvoice.rHash inv) False
        _ <- sendPayment alice req
        tp <- liftLndResult =<< trackPaymentSync alice tpreq
        liftIO $ Payment.state tp `shouldBe` Payment.SUCCEEDED
  it "trackPaymentV2Sync FAILED" $
    withEnv $
      do
        void $ setupZeroChannels proxyOwner
        alice <- getLndEnv Alice
        bob <- getLndEnv Bob
        inv <- liftLndResult =<< addInvoice bob addInvoiceRequest
        let req =
              SendPaymentRequest
                (AddInvoice.paymentRequest inv)
                (Just $ AddInvoice.valueMsat addInvoiceRequest)
                Nothing
        let tpreq = TrackPayment.TrackPaymentRequest (AddInvoice.rHash inv) False
        _ <- sendPayment alice req
        tp <- liftLndResult =<< trackPaymentSync alice tpreq
        liftIO $ Payment.state tp `shouldBe` Payment.FAILED
  it "walletBalance" $
    withEnv $ do
      void $ setupOneChannel Alice Bob
      lnd <- getLndEnv Alice
      res <- liftLndResult =<< walletBalance lnd
      liftIO $ do
        Wallet.totalBalance res `shouldSatisfy` (> 0)
        Wallet.confirmedBalance res `shouldSatisfy` (> 0)
  it "channelBalance" $
    withEnv $ do
      setupZeroChannels proxyOwner
      void $ setupOneChannel Alice Bob
      sleep $ MicroSecondsDelay 1000000
      alice <- getLndEnv Alice
      aliceBalance <- liftLndResult =<< channelBalance alice
      bob <- getLndEnv Bob
      bobBalance <- liftLndResult =<< channelBalance bob
      liftIO $ do
        aliceBalance
          `shouldBe` ChannelBalance.ChannelBalanceResponse
            { localBalance = Msat 186530000,
              remoteBalance = Msat 10000000,
              unsettledLocalBalance = Msat 0,
              unsettledRemoteBalance = Msat 0,
              pendingOpenLocalBalance = Msat 0,
              pendingOpenRemoteBalance = Msat 0
            }
        bobBalance
          `shouldBe` ChannelBalance.ChannelBalanceResponse
            { localBalance = Msat 10000000,
              remoteBalance = Msat 186530000,
              unsettledLocalBalance = Msat 0,
              unsettledRemoteBalance = Msat 0,
              pendingOpenLocalBalance = Msat 0,
              pendingOpenRemoteBalance = Msat 0
            }
  where
    subscribeInvoicesRequest =
      SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing
    addInvoiceRequest =
      AddInvoiceRequest
        { memo = Just "HELLO",
          valueMsat = Msat 1000000,
          expiry = Just $ Seconds 1000
        }
