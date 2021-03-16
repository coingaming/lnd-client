module LndClient.Data.ForceClosedChannel
  ( ForceClosedChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified LndGrpc as GRPC

data ForceClosedChannel
  = ForceClosedChannel
      { channel :: PendingChannel,
        closingTxid :: TxId 'Closing,
        limboBalance :: MSat,
        maturityHeight :: Word32,
        blocksTilMaturity :: Int32,
        recoveredBalance :: MSat
      }
  deriving (Eq, Show)

instance
  FromGrpc
    ForceClosedChannel
    GRPC.PendingChannelsResponse_ForceClosedChannel
  where
  fromGrpc x =
    ForceClosedChannel
      <$> ( case pendingChannel of
              Nothing ->
                Left $ FromGrpcError "PendingChannel is required"
              Just this ->
                fromGrpc this
          )
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelClosingTxid x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelLimboBalance x * 1000)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelMaturityHeight x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelBlocksTilMaturity x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelRecoveredBalance x * 1000)
    where
      pendingChannel =
        GRPC.pendingChannelsResponse_ForceClosedChannelChannel x
