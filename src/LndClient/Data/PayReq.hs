{-# LANGUAGE TypeApplications #-}

module LndClient.Data.PayReq
  ( PayReq (..),
    addSeconds,
  )
where

import Data.Time.Clock (addUTCTime)
import Data.Time.Clock.POSIX (posixSecondsToUTCTime)
import LndClient.Import
import qualified Proto.Lnrpc.Ln1 as LnGRPC
import qualified Proto.Lnrpc.Ln1_Fields as LnGRPC

data PayReq = PayReq
  { destination :: NodePubKey,
    paymentHash :: RHash,
    numMsat :: Msat,
    expiry :: Seconds,
    timestamp :: UTCTime,
    expiresAt :: UTCTime
  }
  deriving stock (Eq, Show, Generic)

instance Out PayReq

instance FromGrpc PayReq LnGRPC.PayReq where
  fromGrpc x = do
    dest <- fromGrpc (x ^. LnGRPC.destination)
    hash <- fromGrpc (x ^. LnGRPC.paymentHash)
    msat <- tryFromGrpcMSat (x ^. LnGRPC.numMsat)
    expSec <- fromGrpc (x ^. LnGRPC.expiry)
    let createdAt = secToUtcTime $ x ^. LnGRPC.timestamp
    pure
      PayReq
        { destination = dest,
          paymentHash = hash,
          numMsat = msat,
          expiry = expSec,
          timestamp = createdAt,
          expiresAt = addSeconds expSec createdAt
        }

addSeconds :: Seconds -> UTCTime -> UTCTime
addSeconds =
  addUTCTime
    . fromRational
    . toRational
    . secondsToDiffTime
    . from @Natural @Integer
    . unSeconds

secToUtcTime :: Int64 -> UTCTime
secToUtcTime x =
  addUTCTime
    ( fromRational
        . toRational
        . secondsToDiffTime
        $ from @Int64 @Integer x
    )
    epoch

epoch :: UTCTime
epoch =
  posixSecondsToUTCTime 0
