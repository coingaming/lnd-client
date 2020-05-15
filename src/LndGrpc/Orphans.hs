{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-missing-export-lists #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module LndGrpc.Orphans where

import Data.ByteString
import qualified Data.Map as M
import LndClient.Import.External
import Proto3.Suite.JSONPB

instance {-# OVERLAPPING #-} ToSchema (OverrideToSchema (M.Map a ByteString)) where
  declareNamedSchema _ = return (NamedSchema Nothing mempty)
