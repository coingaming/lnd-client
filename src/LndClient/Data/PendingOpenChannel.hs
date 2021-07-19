module LndClient.Data.PendingOpenChannel
  ( PendingOpenChannel (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Data.PendingChannel
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data PendingOpenChannel
  = PendingOpenChannel
      { channel :: PendingChannel,
        confirmationHeight :: Word32,
        commitFee :: MSat,
        commitWeight :: Int64,
        feePerKw :: MSat
      }
  deriving (Eq, Show)

instance
  C2.FromGrpc
    PendingOpenChannel
    LnGRPC.PendingChannelsResponse'PendingOpenChannel
  where
  fromGrpc x =
    PendingOpenChannel
      <$> C2.fromGrpc
        (x ^. LnGRPC.channel)
      <*> fromGrpc
        (x ^. LnGRPC.confirmationHeight)
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.commitFee)
          )
      <*> fromGrpc
        (x ^. LnGRPC.commitWeight)
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.feePerKw)
          )
