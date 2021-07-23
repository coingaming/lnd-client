module LndClient.Data.ClosedChannel
  ( ClosedChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data ClosedChannel
  = ClosedChannel
      { channel :: PendingChannel,
        closingTxid :: TxId 'Closing
      }
  deriving (Eq, Show)

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
