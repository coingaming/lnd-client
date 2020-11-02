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
import LndClient.Data.CloseChannel (CloseChannelRequest (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (Channel (..), ListChannelsRequest (..))
import LndClient.Data.PayReq as PayReq (PayReq (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Import
import LndClient.QRCode
import LndClient.RPC.Katip
import LndClient.TestApp
import LndClient.TestOrphan ()
import qualified LndClient.Watcher as Watcher
import qualified LndGrpc as GRPC
import Test.Hspec

spec :: Spec
spec =
  beforeAll newEnv $ afterAll deleteEnv $ do
    describe "LndEnv" $ do
      it "fromJSON" $ \_ -> do
        x <- readLndEnv
        envLndSyncGrpcTimeout x `shouldBe` newGrpcTimeout 59
        envLndAsyncGrpcTimeout x `shouldBe` Nothing
    describe "decodePayReq" $ do
      it "succeeds" $ \env -> do
        let lnd = envLndMerchant env
        (x0, x1) <- runApp env $ do
          x0 <- liftLndResult =<< addInvoice lnd addInvoiceRequest
          x1 <- liftLndResult =<< decodePayReq lnd (AddInvoice.paymentRequest x0)
          return (x0, x1)
        PayReq.paymentHash x1 `shouldBe` AddInvoice.rHash x0
        PayReq.numSatoshis x1 `shouldBe` AddInvoice.value addInvoiceRequest
        Just (PayReq.expiry x1) `shouldBe` AddInvoice.expiry addInvoiceRequest
    describe "lookupInvoice" $ do
      it "succeeds" $ \env -> do
        let lnd = envLndMerchant env
        (x0, x1) <- runApp env $ do
          x0 <- liftLndResult =<< addInvoice lnd addInvoiceRequest
          x1 <- liftLndResult =<< lookupInvoice lnd (AddInvoice.rHash x0)
          return (x0, x1)
        Invoice.rHash x1 `shouldBe` AddInvoice.rHash x0
        Invoice.paymentRequest x1 `shouldBe` AddInvoice.paymentRequest x0
        Invoice.addIndex x1 `shouldBe` AddInvoice.addIndex x0
        Just (Invoice.memo x1) `shouldBe` AddInvoice.memo addInvoiceRequest
        Invoice.value x1 `shouldBe` AddInvoice.value addInvoiceRequest
    describe "addInvoice" $ do
      it "succeeds" $ \env -> do
        res <- runApp env $ addInvoice (envLndMerchant env) addInvoiceRequest
        res `shouldSatisfy` isRight
      it "qrcode" $ \env -> do
        res <-
          runApp env $
            liftLndResult =<< addInvoice (envLndMerchant env) addInvoiceRequest
        let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
        qr `shouldSatisfy` isJust
    describe "subscribeInvoices" $ do
      --
      -- TODO : investigate why this is not working sometimes
      --
      --it "addNormalInvoice" $ \env -> do
      --  res <-
      --    runApp env $ do
      --      i <- liftLndResult =<< addInvoice (envLndMerchant env) addInvoiceRequest
      --      q <- atomically . dupTChan $ envMerchantIQ env
      --      receiveInvoice (AddInvoice.rHash i) GRPC.Invoice_InvoiceStateOPEN q
      --  res `shouldSatisfy` isRight
      it "settleNormalInvoice" $ \env -> do
        setupEnv env
        res <-
          runApp env $ do
            let air = AddInvoiceRequest (MoneyAmount 1000) Nothing Nothing
            i <- liftLndResult =<< addInvoice (envLndMerchant env) air
            let rh = AddInvoice.rHash i
            let pr = AddInvoice.paymentRequest i
            let spr = SendPaymentRequest pr $ MoneyAmount 1000
            q <- atomically . dupTChan $ envMerchantIQ env
            --
            -- TODO : investigate why this is not working sometimes
            --
            --liftLndResult =<< receiveInvoice rh GRPC.Invoice_InvoiceStateOPEN q
            void $ liftLndResult =<< sendPayment (envLndCustomer env) spr
            receiveInvoice rh GRPC.Invoice_InvoiceStateSETTLED q
        res `shouldSatisfy` isRight
    describe "addHodlInvoice" $ it "succeeds" $ \env -> do
      let lnd = envLndMerchant env
      r <- newRPreimage
      let req =
            AddHodlInvoiceRequest
              { memo = Just "HELLO",
                hash = newRHash r,
                value = MoneyAmount 1000,
                expiry = Just $ Seconds 1000
              }
      (x0, x1) <- runApp env $ do
        x0 <- addHodlInvoice lnd req
        x1 <- ensureHodlInvoice lnd req
        return (x0, x1)
      x0 `shouldSatisfy` isRight
      x0 `shouldBe` AddInvoice.paymentRequest <$> x1
    describe "watcher" $ do
      it "watch" $ \env -> do
        (cw, cr) <- atomically $ do
          cw <- newBroadcastTChan
          (cw,) <$> dupTChan cw
        let merEnv = envLndMerchant env
        let req =
              AddInvoiceRequest
                (MoneyAmount 1000)
                Nothing
                Nothing
        let sub =
              SubscribeInvoicesRequest
                (Just $ AddIndex 1)
                (Just $ SettleIndex 1)
        x <- runApp env $ do
          (_, chan) <-
            Watcher.spawnLink
              merEnv
              subscribeInvoicesChan
              $ \_ _ x -> atomically $ writeTChan cw x
          Watcher.watch chan sub
          void . liftLndResult =<< addInvoice merEnv req
          void . liftLndResult =<< addInvoice merEnv req
          readTChanTimeout (MicroSecondsDelay 500000) cr
        x `shouldSatisfy` isJust
      it "unWatch" $ \env -> do
        (cw, cr) <- atomically $ do
          cw <- newBroadcastTChan
          (cw,) <$> dupTChan cw
        let merEnv = envLndMerchant env
        let req =
              AddInvoiceRequest
                (MoneyAmount 1000)
                Nothing
                Nothing
        let sub =
              SubscribeInvoicesRequest
                (Just $ AddIndex 1)
                (Just $ SettleIndex 1)
        let emptyChan = do
              x <- readTChanTimeout (MicroSecondsDelay 500000) cr
              if isJust x then emptyChan else return ()
        x <- runApp env $ do
          (_, chan) <-
            Watcher.spawnLink
              merEnv
              subscribeInvoicesChan
              $ \chan k x -> do
                -- can unWatch from the callback
                Watcher.unWatch chan k
                atomically $ writeTChan cw x
          Watcher.watch chan sub
          void . liftLndResult =<< addInvoice merEnv req
          void . liftLndResult =<< addInvoice merEnv req
          -- can unWatch from the outside as well
          --Watcher.unWatch chan sub
          emptyChan
          void . liftLndResult =<< addInvoice merEnv req
          readTChanTimeout (MicroSecondsDelay 500000) cr
        x `shouldSatisfy` isNothing
    describe "ensureHodlInvoice" $ it "succeeds" $ \env -> do
      r <- newRPreimage
      let req =
            AddHodlInvoiceRequest
              { memo = Just "HELLO",
                hash = newRHash r,
                value = MoneyAmount 1000,
                expiry = Just $ Seconds 1000
              }
      res <- runApp env $ ensureHodlInvoice (envLndMerchant env) req
      res `shouldSatisfy` isRight
    describe "cancelInvoice" $ it "succeeds" $ \env -> do
      setupEnv env
      r <- newRPreimage
      let rh = newRHash r
      let hipr = AddHodlInvoiceRequest Nothing rh (MoneyAmount 1000) Nothing
      let merchantEnv = envLndMerchant env
      q <- atomically . dupTChan $ envMerchantIQ env
      res <- runApp env $ do
        pr <- liftLndResult =<< addHodlInvoice merchantEnv hipr
        liftLndResult =<< receiveInvoice rh GRPC.Invoice_InvoiceStateOPEN q
        let spr = SendPaymentRequest pr $ MoneyAmount 1000
        void . spawnLink $ liftLndResult =<< sendPayment (envLndCustomer env) spr
        --
        -- NOTE : this is working only in coingaming LND fork
        -- which is fixing this bug
        -- https://github.com/lightningnetwork/lnd/issues/4544
        --
        liftLndResult =<< receiveInvoice rh GRPC.Invoice_InvoiceStateACCEPTED q
        res <- cancelInvoice merchantEnv rh
        liftLndResult =<< receiveInvoice rh GRPC.Invoice_InvoiceStateCANCELED q
        return res
      res `shouldSatisfy` isRight
    describe "settleInvoice" $ it "succeeds" $ \env -> do
      setupEnv env
      r <- newRPreimage
      let rh = newRHash r
      let hipr = AddHodlInvoiceRequest Nothing rh (MoneyAmount 1000) Nothing
      let merchantEnv = envLndMerchant env
      q <- atomically . dupTChan $ envMerchantIQ env
      res <- runApp env $ do
        pr <- liftLndResult =<< addHodlInvoice merchantEnv hipr
        liftLndResult =<< receiveInvoice rh GRPC.Invoice_InvoiceStateOPEN q
        let spr = SendPaymentRequest pr $ MoneyAmount 1000
        void . spawnLink $ liftLndResult =<< sendPayment (envLndCustomer env) spr
        --
        -- NOTE : this is working only in coingaming LND fork
        -- which is fixing this bug
        -- https://github.com/lightningnetwork/lnd/issues/4544
        --
        liftLndResult =<< receiveInvoice rh GRPC.Invoice_InvoiceStateACCEPTED q
        res <- settleInvoice merchantEnv r
        liftLndResult =<< receiveInvoice rh GRPC.Invoice_InvoiceStateSETTLED q
        return res
      res `shouldSatisfy` isRight
    describe "listChannelAndClose" $ it "succeeds" $ \env -> do
      setupEnv env
      cs0 <-
        runApp env $
          liftLndResult
            =<< listChannels
              (envLndMerchant env)
              (ListChannelsRequest False False False False Nothing)
      cp <-
        case LC.channelPoint <$> safeHead cs0 of
          Just x -> return x
          Nothing -> fail "No channel point found"
      x <- newEmptyMVar
      spawnLinkDelayed_ $ runApp env $
        closeChannel
          (liftIO . putMVar x)
          (envLndMerchant env)
          (CloseChannelRequest cp True Nothing Nothing Nothing)
      mine6_ env
      void $ takeMVar x
      cs1 <-
        runApp env $
          liftLndResult
            =<< listChannels
              (envLndMerchant env)
              (ListChannelsRequest False False False False Nothing)
      (length cs0 - length cs1) `shouldBe` 1
  where
    addInvoiceRequest =
      AddInvoiceRequest
        { memo = Just "HELLO",
          value = MoneyAmount 1000,
          expiry = Just $ Seconds 1000
        }
