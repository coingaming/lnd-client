module LndClient.Data.ClosedChannels
  ( ClosedChannelsRequest (..),
    defReq,
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data ClosedChannelsRequest
  = ClosedChannelsRequest
      { cooperative :: Bool,
        localForce :: Bool,
        remoteForce :: Bool,
        breach :: Bool,
        fundingCanceled :: Bool,
        abandoned :: Bool
      }
  deriving (Eq, Ord, Show)

instance ToGrpc ClosedChannelsRequest GRPC.ClosedChannelsRequest where
  toGrpc x =
    msg
      <$> toGrpc (cooperative x)
      <*> toGrpc (localForce x)
      <*> toGrpc (remoteForce x)
      <*> toGrpc (breach x)
      <*> toGrpc (fundingCanceled x)
      <*> toGrpc (abandoned x)
    where
      msg x0 x1 x2 x3 x4 x5 =
        def
          { GRPC.closedChannelsRequestCooperative = x0,
            GRPC.closedChannelsRequestLocalForce = x1,
            GRPC.closedChannelsRequestRemoteForce = x2,
            GRPC.closedChannelsRequestBreach = x3,
            GRPC.closedChannelsRequestFundingCanceled = x4,
            GRPC.closedChannelsRequestAbandoned = x5
          }

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
