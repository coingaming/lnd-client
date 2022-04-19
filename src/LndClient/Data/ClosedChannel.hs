module LndClient.Data.ClosedChannel
  ( ClosedChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Lnrpc.Ln0_Fields as LnGRPC

data ClosedChannel = ClosedChannel
  { channel :: PendingChannel,
    closingTxid :: TxId 'Closing
  }
  deriving stock (Eq, Show, Generic)

instance Out ClosedChannel

instance
  FromGrpc
    ClosedChannel
    LnGRPC.PendingChannelsResponse'ClosedChannel
  where
  fromGrpc x =
    ClosedChannel
      <$> ( case pendingChannel of
              Nothing ->
                Left $ FromGrpcError "PendingChannel is required"
              Just this ->
                fromGrpc this
          )
      <*> fromGrpc
        (x ^. LnGRPC.closingTxid)
    where
      pendingChannel =
        x ^. LnGRPC.maybe'channel
