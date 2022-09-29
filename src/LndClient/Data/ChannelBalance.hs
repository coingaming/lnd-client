{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.ChannelBalance
  ( ChannelBalanceResponse (..),
  )
where

import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as Proto
import qualified Proto.Lnrpc.Ln0_Fields as Proto

data ChannelBalanceResponse = ChannelBalanceResponse
  { localBalance :: Msat,
    remoteBalance :: Msat,
    unsettledLocalBalance :: Msat,
    unsettledRemoteBalance :: Msat,
    pendingOpenLocalBalance :: Msat,
    pendingOpenRemoteBalance :: Msat
  }
  deriving stock
    ( Eq,
      Ord,
      Show,
      Generic
    )

instance Out ChannelBalanceResponse

instance FromGrpc ChannelBalanceResponse Proto.ChannelBalanceResponse where
  fromGrpc x =
    ChannelBalanceResponse
      <$> fromGrpc (x ^. Proto.localBalance)
      <*> fromGrpc (x ^. Proto.remoteBalance)
      <*> fromGrpc (x ^. Proto.unsettledLocalBalance)
      <*> fromGrpc (x ^. Proto.unsettledRemoteBalance)
      <*> fromGrpc (x ^. Proto.pendingOpenLocalBalance)
      <*> fromGrpc (x ^. Proto.pendingOpenRemoteBalance)
