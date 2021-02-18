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
        limboBalance :: MoneyAmount,
        maturityHeight :: Word32,
        blocksTilMaturity :: Int32,
        recoveredBalance :: MoneyAmount
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
        (GRPC.pendingChannelsResponse_ForceClosedChannelLimboBalance x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelMaturityHeight x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelBlocksTilMaturity x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelRecoveredBalance x)
    where
      pendingChannel =
        GRPC.pendingChannelsResponse_ForceClosedChannelChannel x
