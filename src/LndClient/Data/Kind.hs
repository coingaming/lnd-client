module LndClient.Data.Kind
  ( TxKind (..),
  )
where

data TxKind
  = Funding
  | Closing
