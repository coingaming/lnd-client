{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.ClosedChannels
  ( ClosedChannelsRequest (..),
    defReq,
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data ClosedChannelsRequest = ClosedChannelsRequest
  { cooperative :: Bool,
    localForce :: Bool,
    remoteForce :: Bool,
    breach :: Bool,
    fundingCanceled :: Bool,
    abandoned :: Bool
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out ClosedChannelsRequest

instance ToGrpc ClosedChannelsRequest LnGRPC.ClosedChannelsRequest where
  toGrpc x =
    msg
      <$> toGrpc (cooperative x)
      <*> toGrpc (localForce x)
      <*> toGrpc (remoteForce x)
      <*> toGrpc (breach x)
      <*> toGrpc (fundingCanceled x)
      <*> toGrpc (abandoned x)
    where
      msg gCooperative gLocalForce gRemoteForce gBreach gFundingCanceled gAbandoned =
        defMessage
          & LnGRPC.cooperative .~ gCooperative
          & LnGRPC.localForce .~ gLocalForce
          & LnGRPC.remoteForce .~ gRemoteForce
          & LnGRPC.breach .~ gBreach
          & LnGRPC.fundingCanceled .~ gFundingCanceled
          & LnGRPC.abandoned .~ gAbandoned

defReq :: ClosedChannelsRequest
defReq =
  ClosedChannelsRequest
    { cooperative = True,
      localForce = True,
      remoteForce = True,
      breach = True,
      fundingCanceled = True,
      abandoned = True
    }
