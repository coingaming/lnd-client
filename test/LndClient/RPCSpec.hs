{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralisedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.RPCSpec
  ( spec,
  )
where

import LndClient.Data.AddHodlInvoice as Invoice (AddHodlInvoiceRequest (..))
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.CloseChannel (CloseChannelRequest (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (Channel (..), ListChannelsRequest (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Import
import LndClient.QRCode
import LndClient.RPC
import LndClient.TestApp
import LndClient.TestOrphan ()
import qualified LndGrpc as GRPC
import Test.Hspec

spec :: Spec
spec =
  beforeAll newEnv $ afterAll deleteEnv $ do
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
    describe "addHodlInvoice" $ it "succeeds" $ \env -> do
      r <- newRPreimage
      let req =
            AddHodlInvoiceRequest
              { memo = Just "HELLO",
                hash = newRHash r,
                value = MoneyAmount 1000,
                expiry = Just $ Seconds 1000
              }
      res <- runApp env $ addHodlInvoice (envLndMerchant env) req
      res `shouldSatisfy` isRight
    describe "cancelInvoice" $ it "succeeds" $ \env -> do
      setupEnv env
      r <- newRPreimage
      let rh = newRHash r
      let req0 =
            AddHodlInvoiceRequest
              { memo = Just "HELLO",
                hash = rh,
                value = MoneyAmount 1000,
                expiry = Just $ Seconds 1000
              }
      let merchantEnv = envLndMerchant env
      q <- atomically . dupTChan $ envMerchantIQ env
      res <- runApp env $ do
        pr <- liftLndResult =<< addHodlInvoice merchantEnv req0
        liftLndResult =<< waitForInvoice rh GRPC.Invoice_InvoiceStateOPEN q
        let req1 = SendPaymentRequest {paymentRequest = pr, amt = MoneyAmount 1000}
        void . spawnLink $ liftLndResult =<< sendPayment (envLndCustomer env) req1
        --
        -- TODO : uncomment when bug is fixed
        -- https://github.com/lightningnetwork/lnd/issues/4544
        --
        --liftLndResult =<< waitForInvoice rh GRPC.Invoice_InvoiceStateACCEPTED q
        res <- cancelInvoice merchantEnv rh
        --liftLndResult =<< waitForInvoice rh GRPC.Invoice_InvoiceStateCANCELED q
        return res
      res `shouldSatisfy` isRight
    describe "settleInvoice" $ it "succeeds" $ \env -> do
      setupEnv env
      r <- newRPreimage
      let rh = newRHash r
      let req0 =
            AddHodlInvoiceRequest
              { memo = Just "HELLO",
                hash = rh,
                value = MoneyAmount 1000,
                expiry = Just $ Seconds 1000
              }
      let merchantEnv = envLndMerchant env
      q <- atomically . dupTChan $ envMerchantIQ env
      res <- runApp env $ do
        pr <- liftLndResult =<< addHodlInvoice merchantEnv req0
        liftLndResult =<< waitForInvoice rh GRPC.Invoice_InvoiceStateOPEN q
        let req1 = SendPaymentRequest {paymentRequest = pr, amt = MoneyAmount 1000}
        void . spawnLink $ liftLndResult =<< sendPayment (envLndCustomer env) req1
        --
        -- TODO : uncomment when bug is fixed
        -- https://github.com/lightningnetwork/lnd/issues/4544
        --
        liftIO $ delay 3000000
        --liftLndResult =<< waitForInvoice rh GRPC.Invoice_InvoiceStateACCEPTED q
        res <- settleInvoice merchantEnv r
        liftLndResult =<< waitForInvoice rh GRPC.Invoice_InvoiceStateSETTLED q
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
          (CloseChannelRequest cp False Nothing Nothing Nothing)
      mine6_ env
      void $ takeMVar x
      cs1 <-
        runApp env $
          liftLndResult
            =<< listChannels
              (envLndMerchant env)
              (ListChannelsRequest False False False False Nothing)
      (length cs0 - length cs1) `shouldBe` 1
    describe "subscribeInvoices" $ it "succeeds" $ \env -> do
      setupEnv env
      x <- newEmptyMVar
      spawnLinkDelayed_ $ runApp env $
        subscribeInvoices
          (liftIO . putMVar x)
          (envLndMerchant env)
          (SubscribeInvoicesRequest Nothing Nothing)
      originalInvoice <-
        runApp env $
          liftLndResult =<< addInvoice (envLndMerchant env) addInvoiceRequest
      res <- takeMVar x
      res
        `shouldSatisfy` ( \this ->
                            AddInvoice.rHash originalInvoice == Invoice.rHash this
                        )
    describe "subscribeInvoicesAndSettleIt" $ it "succeeds" $ \env -> do
      setupEnv env
      invoice <-
        runApp env $
          liftLndResult =<< addInvoice (envLndMerchant env) addInvoiceRequest
      x <- newEmptyMVar
      let sendPaymentRequest =
            SendPaymentRequest
              { paymentRequest = AddInvoice.paymentRequest invoice,
                amt = MoneyAmount 1000
              }
      spawnLinkDelayed_ $ runApp env $
        subscribeInvoices
          (liftIO . putMVar x)
          (envLndMerchant env)
          (SubscribeInvoicesRequest Nothing Nothing)
      runApp_ env $
        liftLndResult =<< sendPayment (envLndCustomer env) sendPaymentRequest
      res <- takeMVar x
      res `shouldSatisfy` (\this -> AddInvoice.rHash invoice == Invoice.rHash this)
  where
    addInvoiceRequest =
      AddInvoiceRequest
        { memo = Just "HELLO",
          value = MoneyAmount 1000,
          expiry = Just $ Seconds 1000
        }
