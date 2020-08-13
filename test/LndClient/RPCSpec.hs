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

import Data.Aeson as AE (Result (..))
import Data.Aeson.QQ.Simple
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.CloseChannel (CloseChannelRequest (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (Channel (..), ListChannelsRequest (..))
import LndClient.Data.LndEnv
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
    it "addInvoice succeeds"
      $ shouldBeRight envLndMerchant
      $ flip addInvoice addInvoiceRequest
    it "addInvoice qrcode" $ \env -> do
      res <-
        runApp env $
          liftLndResult =<< addInvoice (envLndMerchant env) addInvoiceRequest
      let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
      qr `shouldSatisfy` isJust
  describe "listChannelAndClose"
    $ it "listChannelAndClose succeeds"
    $ \env ->
      do
        channelList <-
          runApp env $
            liftLndResult
              =<< listChannels
                (envLndMerchant env)
                (ListChannelsRequest False False False False Nothing)
        cp <-
          case LC.channelPoint <$> safeHead channelList of
            Just x -> return x
            Nothing -> fail "No channel point found"
        x <- newEmptyMVar
        spawnLinkDelayed_ $ runApp env $
          closeChannel
            (liftIO . putMVar x)
            (envLndMerchant env)
            (CloseChannelRequest cp False Nothing Nothing Nothing)
        mine101_ env
        _ <- takeMVar x
        channelList2 <-
          runApp env $
            liftLndResult
              =<< listChannels
                (envLndMerchant env)
                (ListChannelsRequest False False False False Nothing)
        (length channelList - length channelList2) `shouldBe` 1
  describe "subscribeInvoices"
    $ it "subscribeInvoices succeeds"
    $ \env -> do
      x <- newEmptyMVar
      -- can't use proper "race" there
      -- because of this
      -- https://github.com/awakesecurity/gRPC-haskell/issues/104
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
      _ <-
        runApp env $
          liftLndResult =<< sendPayment (envLndCustomer env) sendPaymentRequest
      res <- takeMVar x
      res
        `shouldSatisfy` ( \this ->
                            AddInvoice.rHash invoice == Invoice.rHash this
                        )
  describe "subscribeChannelEvents"
    $ it "subscribeChannelEvents succeeds"
    $ \env -> do
      x <- newEmptyMVar
      hpk <- somePubKey env envLndCustomer
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
      _ <-
        runApp env $ do
          _ <- syncWallets env
          liftLndResult =<< openChannelSync (envLndCustomer env) openChannelReq
      mine101_ env
      res <- takeMVar x
      res
        `shouldSatisfy` (\this -> eventType this == Enumerated {enumerated = Right GRPC.ChannelEventUpdate_UpdateTypePENDING_OPEN_CHANNEL})
  describe "Env"
    $ it "Env jsonify"
    $ \_ ->
      case (fromJSON envJsonRequest :: Result RawConfig) of
        Success _ -> True
        _ -> False
  where
    addInvoiceRequest =
      AddInvoiceRequest
        { memo = Just "HELLO",
          value = MoneyAmount 1000,
          expiry = Just $ Seconds 1000
        }
    somePubKey env envLnd = do
      res <- runApp env $ liftLndResult =<< listPeers (envLnd env)
      let mPeer = safeHead res
      case mPeer of
        Just pPeer -> return $ pubKey pPeer
        Nothing -> fail "no any peers connected"
    shouldBeRight lndEnv rpc env = do
      res <- runApp env $ rpc (lndEnv env)
      res `shouldSatisfy` isRight
    envJsonRequest =
      [aesonQQ|
            {
                "name":"bitcasino",
                "lnd_wallet_password":"developer",
                "lnd_tls_cert":"-----BEGIN CERTIFICATE-----\nMIIB5TCCAYugAwIBAgIQdO9Ld+VoSDTS6iCH8Q1vOTAKBggqhkjOPQQDAjA4MR8w\nHQYDVQQKExZsbmQgYXV0b2dlbmVyYXRlZCBjZXJ0MRUwEwYDVQQDEww3MmRlNDc0\nNWY0ZmIwHhcNMTkxMTI2MTAxMzE5WhcNMjEwMTIwMTAxMzE5WjA4MR8wHQYDVQQK\nExZsbmQgYXV0b2dlbmVyYXRlZCBjZXJ0MRUwEwYDVQQDEww3MmRlNDc0NWY0ZmIw\nWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQT8jCB5MLjVgZ19RelGVgNiI2AtX9w\nd+k+EPdBn1ETVvtbtB0d21j2JYilKCwfJvTSFyEcrpSNhZPEc06RdoHRo3cwdTAO\nBgNVHQ8BAf8EBAMCAqQwDwYDVR0TAQH/BAUwAwEB/zBSBgNVHREESzBJggw3MmRl\nNDc0NWY0ZmKCCWxvY2FsaG9zdIIEdW5peIIKdW5peHBhY2tldIcEfwAAAYcQAAAA\nAAAAAAAAAAAAAAAAAYcErBEAAjAKBggqhkjOPQQDAgNIADBFAiAcgXfpsWP36e+J\nf9lsNk/4t2cUEhiP/g3zbvxPQCS4DgIhAPNO2hW1X7vyIWWfrOKawB8OzSeP9r2D\n1y1UOaK4Ps1i\n-----END CERTIFICATE-----",
                "lnd_hex_macaroon":"0201036C6E6402CF01030A10634D5C8D3227E9F63529F82690C1898E1201301A160A0761646472657373120472656164120577726974651A130A04696E666F120472656164120577726974651A170A08696E766F69636573120472656164120577726974651A160A076D657373616765120472656164120577726974651A170A086F6666636861696E120472656164120577726974651A160A076F6E636861696E120472656164120577726974651A140A057065657273120472656164120577726974651A120A067369676E6572120867656E657261746500000620EB31C7413A5A44D14705852F8C0CA399104658C40AC866918C1D4B981DF2E71E",
                "lnd_host":"localhost",
                "lnd_port":10009,
                "lnd_cipher_seed_mnemonic":[
                  "absent",
                  "betray",
                  "direct",
                  "scheme",
                  "sunset",
                  "mechanic",
                  "exhaust",
                  "suggest",
                  "boy",
                  "arena",
                  "sketch",
                  "bone",
                  "news",
                  "south",
                  "way",
                  "survey",
                  "clip",
                  "dutch",
                  "depart",
                  "green",
                  "furnace",
                  "wire",
                  "wave",
                  "fall"
                ],
                "lnd_aezeed_passphrase":"developer"
                        }
          |]

liftMaybe :: MonadFail m => String -> Maybe a -> m a
liftMaybe msg mx =
  case mx of
    Just x -> return x
    Nothing -> fail msg
