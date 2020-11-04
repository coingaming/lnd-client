{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-missing-export-lists #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module LndGrpc.Orphan2 where

import LndGrpc as GRPC
import Proto3.Suite.Class as Import (HasDefault (..))

instance HasDefault GRPC.ChannelEventUpdateChannel
