{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.SendPayment
  ( SendPaymentRequest (..),
    SendPaymentResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data SendPaymentRequest = SendPaymentRequest
  { paymentRequest :: PaymentRequest,
    amt :: Maybe Msat,
    outgoingChanId :: Maybe ChanId
  }
  deriving stock (Eq, Show, Generic)

instance Out SendPaymentRequest

data SendPaymentResponse = SendPaymentResponse
  { paymentError :: Text,
    paymentPreimage :: RPreimage,
    paymentHash :: RHash
  }
  deriving stock (Eq, Show, Generic)

instance Out SendPaymentResponse

instance ToGrpc SendPaymentRequest LnGRPC.SendRequest where
  toGrpc x =
    msg
      <$> toGrpcMSat (fromMaybe (Msat 0) $ amt x)
      <*> toGrpc (paymentRequest x)
      <*> toGrpc (outgoingChanId x)
    where
      msg gAmt gPaymentRequest gChanId =
        defMessage
          & LnGRPC.amtMsat .~ gAmt
          & LnGRPC.paymentRequest .~ gPaymentRequest
          & LnGRPC.outgoingChanId .~ gChanId

instance FromGrpc SendPaymentResponse LnGRPC.SendResponse where
  fromGrpc x = do
    res <-
      SendPaymentResponse
        <$> fromGrpc (x ^. LnGRPC.paymentError)
        <*> fromGrpc (x ^. LnGRPC.paymentPreimage)
        <*> fromGrpc (x ^. LnGRPC.paymentHash)
    if newRHash (paymentPreimage res) == paymentHash res
      then Right res
      else
        Left . LndError $
          "paymentPreimage doesn't match paymentHash, error: "
            <> paymentError res
