module LndClient.Data.ForceClosedChannel
  ( ForceClosedChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data ForceClosedChannel = ForceClosedChannel
  { channel :: PendingChannel,
    closingTxid :: TxId 'Closing,
    limboBalance :: MSat,
    maturityHeight :: Word32,
    blocksTilMaturity :: Int32,
    recoveredBalance :: MSat
  }
  deriving (Eq, Show, Generic)

instance Out ForceClosedChannel

instance
  FromGrpc
    ForceClosedChannel
    LnGRPC.PendingChannelsResponse'ForceClosedChannel
  where
  fromGrpc x =
    ForceClosedChannel
      <$> ( case pendingChannel of
              Nothing ->
                Left $ FromGrpcError "PendingChannel is required"
              Just this ->
                fromGrpc this
          )
      <*> fromGrpc (x ^. LnGRPC.closingTxid)
      <*> grpcSatToMSat (x ^. LnGRPC.limboBalance)
      <*> fromGrpc (x ^. LnGRPC.maturityHeight)
      <*> fromGrpc (x ^. LnGRPC.blocksTilMaturity)
      <*> grpcSatToMSat (x ^. LnGRPC.recoveredBalance)
    where
      pendingChannel =
        x ^. LnGRPC.maybe'channel
