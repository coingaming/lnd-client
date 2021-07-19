{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.TrackPayment
  ( TrackPaymentRequest (..),
  )
where

import Data.ProtoLens.Message
import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified Proto.RouterGrpc as LnGRPC
import qualified Proto.RouterGrpc_Fields as LnGRPC
import qualified RouterGrpc as GRPC

data TrackPaymentRequest
  = TrackPaymentRequest
      { paymentHash :: RHash,
        noInflightUpdates :: Bool
      }
  deriving (Eq, Ord, Show)

instance ToGrpc TrackPaymentRequest GRPC.TrackPaymentRequest where
  toGrpc x =
    msg
      <$> toGrpc (paymentHash x)
      <*> toGrpc (noInflightUpdates x)
    where
      msg x0 x1 =
        def
          { GRPC.trackPaymentRequestPaymentHash = x0,
            GRPC.trackPaymentRequestNoInflightUpdates = x1
          }

instance C2.ToGrpc TrackPaymentRequest LnGRPC.TrackPaymentRequest where
  toGrpc x =
    msg
      <$> toGrpc (paymentHash x)
      <*> toGrpc (noInflightUpdates x)
    where
      msg x0 x1 =
        defMessage
          & LnGRPC.paymentHash .~ x0
          & LnGRPC.noInflightUpdates .~ x1
