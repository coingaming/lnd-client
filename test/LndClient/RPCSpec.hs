{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralisedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.RPCSpec
  ( spec,
  )
where

import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.CloseChannel (CloseChannelRequest (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (Channel (..), ListChannelsRequest (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (Peer (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeChannelEvents (ChannelEventUpdate (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Import
import LndClient.QRCode
import LndClient.RPC
import LndClient.TestApp
import LndClient.TestOrphan ()
import qualified LndGrpc as GRPC
import Test.Hspec

spec :: Spec
spec = around withEnv $ do
  describe "addInvoice" $ do
    it "addInvoice succeeds" $ \env -> do
      res <- runApp env $ addInvoice (envLndMerchant env) addInvoiceRequest
      res `shouldSatisfy` isRight
    it "addInvoice qrcode" $ \env -> do
      res <-
        runApp env $
          liftLndResult =<< addInvoice (envLndMerchant env) addInvoiceRequest
      let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
      qr `shouldSatisfy` isJust
  describe "listChannelAndClose"
    $ it "listChannelAndClose succeeds"
    $ \env -> do
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
      mine101_ env
      void $ takeMVar x
      cs1 <-
        runApp env $
          liftLndResult
            =<< listChannels
              (envLndMerchant env)
              (ListChannelsRequest False False False False Nothing)
      (length cs0 - length cs1) `shouldBe` 1
  describe "subscribeInvoices"
    $ it "subscribeInvoices succeeds"
    $ \env -> do
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
  describe "subscribeInvoicesAndSettleIt"
    $ it "subscribeInvoicesAndSettleIt succeeds"
    $ \env -> do
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
  describe "subscribeChannelEvents"
    $ it "subscribeChannelEvents succeeds"
    $ \env -> do
      x <- newEmptyMVar
      hpk <- peerPubKey env envLndCustomer
      pk <- liftMaybe "Can't decode hex pub key" $ unHexPubKey hpk
      let openChannelReq =
            OpenChannelRequest
              { nodePubkey = pk,
                localFundingAmount = MoneyAmount 20000,
                pushSat = Nothing,
                targetConf = Nothing,
                satPerByte = Nothing,
                private = Nothing,
                minHtlcMsat = Nothing,
                remoteCsvDelay = Nothing,
                minConfs = Nothing,
                spendUnconfirmed = Nothing,
                closeAddress = Nothing
              }
      spawnLinkDelayed_ $ runApp env $
        subscribeChannelEvents
          (liftIO . putMVar x)
          (envLndMerchant env)
      runApp_ env $ do
        void $ liftLndResult =<< syncWallets env
        liftLndResult =<< openChannelSync (envLndCustomer env) openChannelReq
      mine101_ env
      res <- takeMVar x
      res `shouldSatisfy` (\this -> elem (enumerated $ eventType this) [Right GRPC.ChannelEventUpdate_UpdateTypePENDING_OPEN_CHANNEL, Right GRPC.ChannelEventUpdate_UpdateTypeOPEN_CHANNEL])
  where
    addInvoiceRequest =
      AddInvoiceRequest
        { memo = Just "HELLO",
          value = MoneyAmount 1000,
          expiry = Just $ Seconds 1000
        }
    peerPubKey env envLnd = do
      res <- runApp env $ liftLndResult =<< listPeers (envLnd env)
      let mPeer = safeHead res
      case mPeer of
        Just pPeer -> return $ pubKey pPeer
        Nothing -> fail "No any peers connected"

liftMaybe :: MonadFail m => String -> Maybe a -> m a
liftMaybe msg mx =
  case mx of
    Just x -> return x
    Nothing -> fail msg
