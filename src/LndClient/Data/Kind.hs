module LndClient.Data.Kind
  ( TxKind (..),
  )
where

import LndClient.Import.External

data TxKind
  = Funding
  | Closing
  deriving (Eq, Show)
