module LndClient.Data.ForceClosedChannel
  ( ForceClosedChannel (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Data.PendingChannel
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

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
      <*> ( toMSat
              <$> fromGrpc
                (GRPC.pendingChannelsResponse_ForceClosedChannelLimboBalance x)
          )
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelMaturityHeight x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ForceClosedChannelBlocksTilMaturity x)
      <*> ( toMSat
              <$> fromGrpc
                (GRPC.pendingChannelsResponse_ForceClosedChannelRecoveredBalance x)
          )
    where
      pendingChannel =
        GRPC.pendingChannelsResponse_ForceClosedChannelChannel x

instance
  C2.FromGrpc
    ForceClosedChannel
    LnGRPC.PendingChannelsResponse'ForceClosedChannel
  where
  fromGrpc x =
    ForceClosedChannel
      <$> ( case pendingChannel of
              Nothing ->
                Left $ FromGrpcError "PendingChannel is required"
              Just this ->
                C2.fromGrpc this
          )
      <*> fromGrpc
        (fromStrict $ x ^. LnGRPC.closingTxid)
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.limboBalance)
          )
      <*> fromGrpc
        (x ^. LnGRPC.maturityHeight)
      <*> fromGrpc
        (x ^. LnGRPC.blocksTilMaturity)
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.recoveredBalance)
          )
    where
      pendingChannel =
        x ^. LnGRPC.maybe'channel
