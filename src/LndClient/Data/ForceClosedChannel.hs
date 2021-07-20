module LndClient.Data.ForceClosedChannel
  ( ForceClosedChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
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
