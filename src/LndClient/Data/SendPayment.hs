{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.SendPayment
  ( SendPaymentRequest (..),
    SendPaymentResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data SendPaymentRequest
  = SendPaymentRequest
      { paymentRequest :: PaymentRequest,
        amt :: MSat
      }
  deriving (Eq, Show)

data SendPaymentResponse
  = SendPaymentResponse
      { paymentError :: Text,
        paymentPreimage :: RPreimage,
        paymentHash :: RHash
      }
  deriving (Eq, Show)

instance ToGrpc SendPaymentRequest LnGRPC.SendRequest where
  toGrpc x =
    msg
      <$> toGrpc (amt x)
      <*> toGrpc (paymentRequest x)
    where
      msg gAmt gPaymentRequest =
        defMessage
          & LnGRPC.amtMsat .~ gAmt
          & LnGRPC.paymentRequest .~ toStrict gPaymentRequest

instance FromGrpc SendPaymentResponse LnGRPC.SendResponse where
  fromGrpc x = do
    res <-
      SendPaymentResponse
        <$> fromGrpc (fromStrict $ x ^. LnGRPC.paymentError)
        <*> fromGrpc (x ^. LnGRPC.paymentPreimage)
        <*> fromGrpc (x ^. LnGRPC.paymentHash)
    if newRHash (paymentPreimage res) == paymentHash res
      then Right res
      else
        Left . LndError $
          "paymentPreimage doesn't match paymentHash, error: "
            <> paymentError res
