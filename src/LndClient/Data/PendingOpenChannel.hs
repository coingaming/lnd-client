module LndClient.Data.PendingOpenChannel
  ( PendingOpenChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified LndGrpc as G

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
  FromGrpc
    PendingOpenChannel
    G.PendingChannelsResponse_PendingOpenChannel
  where
  fromGrpc x =
    PendingOpenChannel
      <$> fromGrpc
        (G.pendingChannelsResponse_PendingOpenChannelChannel x)
      <*> fromGrpc
        (G.pendingChannelsResponse_PendingOpenChannelConfirmationHeight x)
      <*> ( toMSat
              <$> fromGrpc
                (G.pendingChannelsResponse_PendingOpenChannelCommitFee x)
          )
      <*> fromGrpc
        (G.pendingChannelsResponse_PendingOpenChannelCommitWeight x)
      <*> ( toMSat
              <$> fromGrpc
                (G.pendingChannelsResponse_PendingOpenChannelFeePerKw x)
          )
