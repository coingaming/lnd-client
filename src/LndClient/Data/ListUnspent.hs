{-# LANGUAGE FlexibleContexts #-}
module LndClient.Data.ListUnspent
  (ListUnspentRequest(..), ListUnspentResponse(..), Utxo(..))
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Walletrpc.Walletkit as W
import qualified Proto.Walletrpc.Walletkit_Fields as W
import LndClient.Data.OutPoint
import qualified Proto.Lightning as L
import qualified Proto.Lightning_Fields as L
import LndClient.Data.NewAddress (AddressType)

data ListUnspentRequest = ListUnspentRequest
  {
    minConfs :: Int32,
    maxConfs :: Int32,
    account :: Text
  }
  deriving (Eq, Ord, Show, Generic)

instance Out ListUnspentRequest

instance ToGrpc ListUnspentRequest W.ListUnspentRequest where
  toGrpc x = pure $ msg (minConfs x) (maxConfs x) (account x)
    where
      msg mn mx a =
        defMessage
          & W.minConfs .~ mn
          & W.maxConfs .~ mx
          & W.account .~ a


data Utxo = Utxo
  {
    addressType :: AddressType,
    address :: Text,
    amountSat :: MSat,
    pkScript :: Text,
    outpoint :: OutPoint,
    confirmations :: Int64
  } deriving (Eq, Ord, Show, Generic)

instance Out Utxo

instance FromGrpc Utxo L.Utxo where
  fromGrpc x =
    Utxo
      <$> fromGrpc (x ^. L.addressType)
      <*> fromGrpc (x ^. L.address)
      <*> fromGrpcSat (x ^. L.amountSat)
      <*> fromGrpc (x ^. L.pkScript)
      <*> fromGrpc (x ^. L.outpoint)
      <*> fromGrpc (x ^. L.confirmations)


newtype ListUnspentResponse = ListUnspentResponse
  {
    utxos :: [Utxo]
  } deriving (Eq, Ord, Show, Generic)

instance Out ListUnspentResponse

instance FromGrpc ListUnspentResponse W.ListUnspentResponse where
  fromGrpc x = ListUnspentResponse <$> mapM fromGrpc (x ^. W.utxos)
