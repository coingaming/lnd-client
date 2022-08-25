module LndClient.Data.ForceClosedChannel
  ( ForceClosedChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Lnrpc.Ln0_Fields as LnGRPC

data ForceClosedChannel = ForceClosedChannel
  { channel :: PendingChannel,
    closingTxid :: TxId 'Closing,
    limboBalance :: Msat,
    maturityHeight :: Word32,
    blocksTilMaturity :: Int32,
    recoveredBalance :: Msat
  }
  deriving stock (Eq, Show, Generic)

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
      <*> fromGrpcSat (x ^. LnGRPC.limboBalance)
      <*> fromGrpc (x ^. LnGRPC.maturityHeight)
      <*> fromGrpc (x ^. LnGRPC.blocksTilMaturity)
      <*> fromGrpcSat (x ^. LnGRPC.recoveredBalance)
    where
      pendingChannel =
        x ^. LnGRPC.maybe'channel
