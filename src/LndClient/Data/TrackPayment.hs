module LndClient.Data.TrackPayment
  ( TrackPaymentRequest (..),
  )
where

import LndClient.Import
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
