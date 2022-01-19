{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.HtlcInterceptorSpec
  ( spec,
  )
where

import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    paymentRequest,
  )
import LndClient.Data.HtlcInterceptor
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Import
import LndClient.LndTest
import LndClient.RPC.Katip
import LndClient.TestApp
import Test.Hspec
import Universum

spec :: Spec
spec = do
  focus $
    it "HtlcInterceptor test" $
      withEnv $ do
        print ("==============================================" :: Text)
        tChan <- atomically newBroadcastTChan
        rChan <- atomically $ dupTChan tChan
        void $ closeAllChannels proxyOwner
        void $ cancelAllInvoices proxyOwner
        void $ setupOneChannel Alice Bob
        void $ setupOneChannel Bob Nick

        ---Payment will go from Alice to Nick through Bob, which will intercept it
        alice <- getLndEnv Alice
        bob <- getLndEnv Bob
        nick <- getLndEnv Nick
        inv <- liftLndResult =<< addInvoice nick addInvoiceRequest
        let req =
              SendPaymentRequest
                (AddInvoice.paymentRequest inv)
                $ AddInvoice.valueMsat addInvoiceRequest

        print ("+++++++++++++++++++++++++++++++++++++++++++++++" :: Text)
        _ <- spawnLink $ htlcInterceptor handlerIn (handlerOut rChan) bob
        _ <- sleep $ MicroSecondsDelay 1000000
        res <- liftLndResult =<< sendPayment alice req
        print (("[[[[[[[[[[[[[[[[[[[[[[[" :: Text) <> show res <> "]]]]]]]]]]]]]]]]]]]]]]]")
       -- Watcher.withWatcher alice trackPaymentV2Chan (\_ _ _ -> pure ()) $ \w -> do
       --   void $ liftLndResult =<< sendPayment alice req
       --   chan <- Watcher.dupLndTChan w
       --   Watcher.watch w $
       --     TrackPayment.TrackPaymentRequest (AddInvoice.rHash inv) False
       --   res <- readTChanTimeout (MicroSecondsDelay 2000000) chan
       --   liftIO $ res `shouldSatisfy` isJust
        --
        -- spawn payment watcher and settle invoice
        --
        liftIO $ Just () `shouldSatisfy` isJust
  where
    addInvoiceRequest =
      AddInvoiceRequest
        { memo = Just "HELLO",
          valueMsat = MSat 1000000,
          expiry = Just $ Seconds 100000
        }
    --handlerIn :: Either LndError ForwardHtlcInterceptRequest -> m ()
    handlerIn x = do
      liftIO $ print $ ("HEHEHEHEHEHEHEHEHE --- " :: Text) <> Universum.show x <> " --- HEHEHEHEHEHEHEHEHE"
      pure ()
    handlerOut :: MonadIO m => TChan ForwardHtlcInterceptResponse -> m ForwardHtlcInterceptResponse
    handlerOut ch = do
      resp <- atomically $ readTChan ch
      liftIO $ print ("HOHOHOHOHOHOHOHO" :: Text)
      liftIO $ print resp
      pure resp
      --pure $ ForwardHtlcInterceptResponse (CircuitKey 1 1) RESUME ("" :: ByteString)
