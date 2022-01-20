{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.HtlcInterceptor
  ( ForwardHtlcInterceptRequest (..),
    ForwardHtlcInterceptResponse (..),
    CircuitKey (..),
    ResolveHoldForwardAction (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.RouterGrpc as LnGRPC
import qualified Proto.RouterGrpc_Fields as LnGRPC

data ForwardHtlcInterceptRequest = ForwardHtlcInterceptRequest
  { incCircuitKey :: CircuitKey,
    incomingAmountMsat :: MSat,
    paymentHash :: ByteString
  }
  deriving (Eq, Generic, Show)

instance FromGrpc ForwardHtlcInterceptRequest LnGRPC.ForwardHtlcInterceptRequest where
  fromGrpc x =
    ForwardHtlcInterceptRequest
      <$> fromGrpc (x ^. LnGRPC.incomingCircuitKey)
      <*> fromGrpcMSat (x ^. LnGRPC.incomingAmountMsat)
      <*> fromGrpc (x ^. LnGRPC.paymentHash)

data ForwardHtlcInterceptResponse = ForwardHtlcInterceptResponse
  { incomingCircuitKey :: CircuitKey,
    action :: ResolveHoldForwardAction,
    preimage :: ByteString
  }
  deriving (Eq, Generic, Show)

instance ToGrpc ForwardHtlcInterceptResponse LnGRPC.ForwardHtlcInterceptResponse where
  toGrpc x =
    msg
      <$> toGrpc (incomingCircuitKey x)
      <*> toGrpc (action x)
      <*> toGrpc (preimage x)
    where
      msg gIncomingCircuitKey gAction gPreimage =
        defMessage
          & LnGRPC.incomingCircuitKey .~ gIncomingCircuitKey
          & LnGRPC.action .~ gAction
          & LnGRPC.preimage .~ gPreimage

data CircuitKey = CircuitKey
  { chanId :: Word64,
    htlcId :: Word64
  }
  deriving (Eq, Generic, Show)

instance FromGrpc CircuitKey LnGRPC.CircuitKey where
  fromGrpc x =
    CircuitKey
      <$> fromGrpc (x ^. LnGRPC.chanId)
      <*> fromGrpc (x ^. LnGRPC.htlcId)

instance ToGrpc CircuitKey LnGRPC.CircuitKey where
  toGrpc x =
    msg
      <$> toGrpc (chanId x)
      <*> toGrpc (htlcId x)
    where
      msg gChanId gHtlcId =
        defMessage
          & LnGRPC.chanId .~ gChanId
          & LnGRPC.htlcId .~ gHtlcId

data ResolveHoldForwardAction
  = SETTLE
  | FAIL
  | RESUME
  deriving (Eq, Show, Generic)

instance Out ResolveHoldForwardAction

instance FromGrpc ResolveHoldForwardAction LnGRPC.ResolveHoldForwardAction where
  fromGrpc x =
    case x of
      LnGRPC.SETTLE -> Right SETTLE
      LnGRPC.FAIL -> Right FAIL
      LnGRPC.RESUME -> Right RESUME
      LnGRPC.ResolveHoldForwardAction'Unrecognized v ->
        Left
          . FromGrpcError
          $ "Cannot parse ResolveHoldForwardAction, value:" <> inspect v

instance ToGrpc ResolveHoldForwardAction LnGRPC.ResolveHoldForwardAction where
  toGrpc x =
    Right $ case x of
      SETTLE -> LnGRPC.SETTLE
      FAIL -> LnGRPC.FAIL
      RESUME -> LnGRPC.RESUME
