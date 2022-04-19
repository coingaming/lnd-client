{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.TrackPayment
  ( TrackPaymentRequest (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Routerrpc.Router as LnGRPC
import qualified Proto.Routerrpc.Router_Fields as LnGRPC

data TrackPaymentRequest = TrackPaymentRequest
  { paymentHash :: RHash,
    noInflightUpdates :: Bool
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out TrackPaymentRequest

instance ToGrpc TrackPaymentRequest LnGRPC.TrackPaymentRequest where
  toGrpc x =
    msg
      <$> toGrpc (paymentHash x)
      <*> toGrpc (noInflightUpdates x)
    where
      msg x0 x1 =
        defMessage
          & LnGRPC.paymentHash .~ x0
          & LnGRPC.noInflightUpdates .~ x1
