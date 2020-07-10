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

import Control.Concurrent.Async (async, link)
import Control.Concurrent.Thread.Delay (delay)
import Data.Aeson as AE (Result (..))
import Data.Aeson.QQ.Simple
import Data.Maybe (fromMaybe)
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.CloseChannel (ChannelPoint (..), CloseChannelRequest (..))
import LndClient.Data.GetInfo (GetInfoResponse (..))
import LndClient.Data.Invoice as Invoice (Invoice (..))
import LndClient.Data.ListChannels as LC (Channel (..), ListChannelsRequest (..))
import LndClient.Data.LndEnv
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..), Peer (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..))
import LndClient.Data.SubscribeChannelEvents (ChannelEventUpdate (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Import
import LndClient.QRCode
import LndClient.RPC
import LndClient.TestApp
import LndClient.TestOrphan ()
import qualified LndGrpc as GRPC
import Network.Bitcoin.Mining (generateToAddress)
import Network.GRPC.HighLevel.Generated
import Test.Hspec

spec :: Spec
spec = around withEnv $ do
  describe "lazyInitWallet"
    $ it "succeeds"
    $ shouldBeRight envLndMerchant
    $ lazyInitWallet
  describe "lazyUnlockWallet"
    $ it "succeeds"
    $ shouldBeRight envLndMerchant
    $ lazyUnlockWallet
  describe "addInvoice" $ do
    it "succeeds"
      $ shouldBeRight envLndMerchant
      $ flip addInvoice addInvoiceRequest
    it "generates-qrcode" $ \env -> do
      res <-
        runApp env $
          coerceLndResult =<< addInvoice (envLndMerchant env) addInvoiceRequest
      let qr = qrPngDataUrl qrDefOpts (AddInvoice.paymentRequest res)
      qr `shouldSatisfy` isJust
  describe "newAddress" $ do
    it "succeeds"
      $ shouldBeRight envLndMerchant
      $ flip newAddress GRPC.AddressTypeWITNESS_PUBKEY_HASH
  describe "listPeers" $ do
    it "succeeds" $
      shouldBeRight envLndMerchant listPeers
  describe "connectPeer" $ do
    it "succeeds" $ \env -> do
      let envLnd = envLndCustomer env
      res <- runApp env $ do
        GetInfoResponse nodePubKey <-
          coerceLndResult =<< getInfo envLnd
        let req =
              ConnectPeerRequest
                { addr =
                    LightningAddress
                      { pubkey = nodePubKey,
                        host = NodeLocation "localhost:9734"
                      },
                  perm = False
                }
        connectPeer envLnd req
      res
        `shouldSatisfy` ( \case
                            Right _ -> True
                            --
                            -- TODO : !!!
                            --
                            Left (GrpcError (ClientIOError _)) -> True
                            _ -> False
                        )
  describe "OpenChannel"
    $ it "rpc-succeeds"
    $ \env -> do
      NewAddressResponse btcAddress <-
        runApp env $
          coerceLndResult
            =<< newAddress
              (envLndCustomer env)
              GRPC.AddressTypeWITNESS_PUBKEY_HASH
      GetInfoResponse mercPubKey <-
        runApp env $
          coerceLndResult =<< getInfo (envLndMerchant env)
      let connectPeerRequest =
            ConnectPeerRequest
              { addr =
                  LightningAddress
                    { pubkey = mercPubKey,
                      host = NodeLocation "localhost:9735"
                    },
                perm = False
              }
      _ <- runApp env $ connectPeer (envLndCustomer env) connectPeerRequest
      _ <- generateToAddress (envBtcClient env) 100 (toStrict btcAddress) Nothing
      _ <- delay 3000000
      req <- openChannelRequest env
      shouldBeRight envLndCustomer (flip openChannelSync req) env
  describe "ListChannelAndClose"
    $ it "rpc-succeeds"
    $ \env ->
      do
        NewAddressResponse btcAddress <-
          runApp env $
            coerceLndResult
              =<< newAddress
                (envLndCustomer env)
                GRPC.AddressTypeWITNESS_PUBKEY_HASH
        GetInfoResponse mercPubKey <-
          runApp env $
            coerceLndResult =<< getInfo (envLndMerchant env)
        let connectPeerRequest =
              ConnectPeerRequest
                { addr =
                    LightningAddress
                      { pubkey = mercPubKey,
                        host = NodeLocation "localhost:9735"
                      },
                  perm = False
                }
        _ <- runApp env $ connectPeer (envLndCustomer env) connectPeerRequest
        _ <- generateToAddress (envBtcClient env) 100 (toStrict btcAddress) Nothing
        _ <- delay 3000000
        req <- openChannelRequest env
        _ <- runApp env $ openChannelSync (envLndCustomer env) req
        channelList <-
          runApp env $
            coerceLndResult
              =<< listChannels
                (envLndMerchant env)
                (ListChannelsRequest False False False False Nothing)
        let cp =
              fromMaybe
                (ChannelPoint "" 0)
                $ LC.channelPoint <$> safeHead channelList
        x <- newEmptyMVar
        link
          =<< ( async $ runApp env $
                  closeChannel
                    (liftIO . putMVar x)
                    (envLndMerchant env)
                    (CloseChannelRequest cp True Nothing Nothing Nothing)
              )
        _ <- delay 3000000
        channelList2 <-
          runApp env $
            coerceLndResult
              =<< listChannels
                (envLndMerchant env)
                (ListChannelsRequest False False False False Nothing)
        _ <- takeMVar x
        (length channelList - length channelList2)
          `shouldBe` 1
  describe "SubscribeInvoices"
    $ it "rpc-succeeds"
    $ \env -> do
      x <- newEmptyMVar
      -- can't use proper "race" there
      -- because of this
      -- https://github.com/awakesecurity/gRPC-haskell/issues/104
      -- will use low-level async + link for now
      link
        =<< ( async $ runApp env $
                subscribeInvoices
                  (liftIO . putMVar x)
                  (envLndMerchant env)
                  (SubscribeInvoicesRequest Nothing Nothing)
            )
      _ <- delay 3000000
      originalInvoice <-
        runApp env $
          coerceLndResult =<< addInvoice (envLndMerchant env) addInvoiceRequest
      resultingInvoice <- takeMVar x
      print resultingInvoice
      resultingInvoice
        `shouldSatisfy` ( \this ->
                            AddInvoice.rHash originalInvoice == Invoice.rHash this
                        )
  describe "SubscribeInvoicesAndSettleIt"
    $ it "rpc-succeeds"
    $ \env -> do
      NewAddressResponse btcAddress <-
        runApp env $
          coerceLndResult
            =<< newAddress
              (envLndCustomer env)
              GRPC.AddressTypeWITNESS_PUBKEY_HASH
      _ <- generateToAddress (envBtcClient env) 100 (toStrict btcAddress) Nothing
      invoice <- runApp env $ coerceLndResult =<< addInvoice (envLndMerchant env) addInvoiceRequest
      x <- newEmptyMVar
      let sendPaymentRequest =
            SendPaymentRequest
              { paymentRequest = (AddInvoice.paymentRequest invoice),
                amt = (MoneyAmount 1000)
              }
      link
        =<< ( async $ runApp env $
                subscribeInvoices
                  (liftIO . putMVar x)
                  (envLndMerchant env)
                  (SubscribeInvoicesRequest Nothing Nothing)
            )
      _ <- delay 3000000
      _ <-
        runApp env $
          coerceLndResult =<< sendPayment (envLndCustomer env) sendPaymentRequest
      resultingInvoice <- takeMVar x
      print resultingInvoice
      resultingInvoice
        `shouldSatisfy` ( \this ->
                            AddInvoice.rHash invoice == Invoice.rHash this
                        )
  describe "SubscribeChannelEvents"
    $ it "rpc-succeeds"
    $ \env -> do
      NewAddressResponse btcAddress <-
        runApp env $
          coerceLndResult
            =<< newAddress
              (envLndCustomer env)
              GRPC.AddressTypeWITNESS_PUBKEY_HASH
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
      link
        =<< ( async $ runApp env $
                subscribeChannelEvents
                  (liftIO . putMVar x)
                  (envLndMerchant env)
            )
      _ <- delay 3000000
      _ <-
        runApp env $
          coerceLndResult =<< openChannelSync (envLndCustomer env) openChannelReq
      _ <- generateToAddress (envBtcClient env) 100 (toStrict btcAddress) Nothing
      resultingEvents <- takeMVar x
      print resultingEvents
      resultingEvents
        `shouldSatisfy` (\this -> eventType this == Enumerated {enumerated = Right GRPC.ChannelEventUpdate_UpdateTypePENDING_OPEN_CHANNEL})
  describe "GetInfo"
    $ it "rpc-succeeds"
    $ \env ->
      shouldBeOk getInfo env
  describe "LoadEnv"
    $ it "request-jsonify"
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
    openChannelRequest :: Env -> IO OpenChannelRequest
    openChannelRequest env = do
      hpk <- somePubKey env envLndCustomer
      pk <- liftMaybe "Can't decode hex pub key" $ unHexPubKey hpk
      let req =
            OpenChannelRequest
              { nodePubkey = pk,
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
      return req
    somePubKey env envLnd = do
      res <- runApp env $ coerceLndResult =<< listPeers (envLnd env)
      let mPeer = safeHead res
      case mPeer of
        Just pPeer -> return $ pubKey pPeer
        Nothing -> fail "no any peers connected"
    shouldBeRight lndEnv rpc env = do
      res <- runApp env $ rpc (lndEnv env)
      res `shouldSatisfy` isRight
    shouldBeOk this env = do
      res <- runApp env $ this $ envLndMerchant env
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
