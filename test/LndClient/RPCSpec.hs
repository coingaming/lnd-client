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
import LndClient.Data.ListChannels as LC (Channel (..), ListChannelsRequest (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Import
import LndClient.QRCode
import LndClient.RPC.Katip
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
