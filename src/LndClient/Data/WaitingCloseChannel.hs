module LndClient.Data.WaitingCloseChannel
  ( WaitingCloseChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data WaitingCloseChannel = WaitingCloseChannel
  { channel :: PendingChannel,
    limboBalance :: MSat
  }
  deriving (Eq, Show, Generic)

instance Out WaitingCloseChannel

instance
  FromGrpc
    WaitingCloseChannel
    LnGRPC.PendingChannelsResponse'WaitingCloseChannel
  where
  fromGrpc x =
    WaitingCloseChannel
      <$> ( case pendingChannel of
              Nothing ->
                Left $ FromGrpcError "PendingChannel is required"
              Just this ->
                fromGrpc this
          )
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.limboBalance)
          )
    where
      pendingChannel =
        x ^. LnGRPC.maybe'channel
