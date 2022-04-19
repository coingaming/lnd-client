{- This file was auto-generated from walletrpc/walletkit.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Walletrpc.Walletkit_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
import qualified Proto.Lightning
import qualified Proto.Lnrpc.Ln0
import qualified Proto.Signrpc.Signer
account ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "account" a) =>
  Lens.Family2.LensLike' f s a
account = Data.ProtoLens.Field.field @"account"
accounts ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "accounts" a) =>
  Lens.Family2.LensLike' f s a
accounts = Data.ProtoLens.Field.field @"accounts"
addr ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "addr" a) =>
  Lens.Family2.LensLike' f s a
addr = Data.ProtoLens.Field.field @"addr"
addressType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "addressType" a) =>
  Lens.Family2.LensLike' f s a
addressType = Data.ProtoLens.Field.field @"addressType"
amountSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "amountSat" a) =>
  Lens.Family2.LensLike' f s a
amountSat = Data.ProtoLens.Field.field @"amountSat"
broadcastAttempts ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "broadcastAttempts" a) =>
  Lens.Family2.LensLike' f s a
broadcastAttempts = Data.ProtoLens.Field.field @"broadcastAttempts"
change ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "change" a) =>
  Lens.Family2.LensLike' f s a
change = Data.ProtoLens.Field.field @"change"
changeOutputIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "changeOutputIndex" a) =>
  Lens.Family2.LensLike' f s a
changeOutputIndex = Data.ProtoLens.Field.field @"changeOutputIndex"
confTarget ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "confTarget" a) =>
  Lens.Family2.LensLike' f s a
confTarget = Data.ProtoLens.Field.field @"confTarget"
derivationPath ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "derivationPath" a) =>
  Lens.Family2.LensLike' f s a
derivationPath = Data.ProtoLens.Field.field @"derivationPath"
dryRun ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "dryRun" a) =>
  Lens.Family2.LensLike' f s a
dryRun = Data.ProtoLens.Field.field @"dryRun"
dryRunExternalAddrs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "dryRunExternalAddrs" a) =>
  Lens.Family2.LensLike' f s a
dryRunExternalAddrs
  = Data.ProtoLens.Field.field @"dryRunExternalAddrs"
dryRunInternalAddrs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "dryRunInternalAddrs" a) =>
  Lens.Family2.LensLike' f s a
dryRunInternalAddrs
  = Data.ProtoLens.Field.field @"dryRunInternalAddrs"
expiration ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "expiration" a) =>
  Lens.Family2.LensLike' f s a
expiration = Data.ProtoLens.Field.field @"expiration"
expirationSeconds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "expirationSeconds" a) =>
  Lens.Family2.LensLike' f s a
expirationSeconds = Data.ProtoLens.Field.field @"expirationSeconds"
extendedPublicKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "extendedPublicKey" a) =>
  Lens.Family2.LensLike' f s a
extendedPublicKey = Data.ProtoLens.Field.field @"extendedPublicKey"
externalKeyCount ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "externalKeyCount" a) =>
  Lens.Family2.LensLike' f s a
externalKeyCount = Data.ProtoLens.Field.field @"externalKeyCount"
force ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "force" a) =>
  Lens.Family2.LensLike' f s a
force = Data.ProtoLens.Field.field @"force"
fundedPsbt ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fundedPsbt" a) =>
  Lens.Family2.LensLike' f s a
fundedPsbt = Data.ProtoLens.Field.field @"fundedPsbt"
id ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "id" a) =>
  Lens.Family2.LensLike' f s a
id = Data.ProtoLens.Field.field @"id"
inputs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "inputs" a) =>
  Lens.Family2.LensLike' f s a
inputs = Data.ProtoLens.Field.field @"inputs"
internalKeyCount ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "internalKeyCount" a) =>
  Lens.Family2.LensLike' f s a
internalKeyCount = Data.ProtoLens.Field.field @"internalKeyCount"
key ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "key" a) =>
  Lens.Family2.LensLike' f s a
key = Data.ProtoLens.Field.field @"key"
keyFamily ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "keyFamily" a) =>
  Lens.Family2.LensLike' f s a
keyFamily = Data.ProtoLens.Field.field @"keyFamily"
keyFingerPrint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "keyFingerPrint" a) =>
  Lens.Family2.LensLike' f s a
keyFingerPrint = Data.ProtoLens.Field.field @"keyFingerPrint"
label ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "label" a) =>
  Lens.Family2.LensLike' f s a
label = Data.ProtoLens.Field.field @"label"
lockedUtxos ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lockedUtxos" a) =>
  Lens.Family2.LensLike' f s a
lockedUtxos = Data.ProtoLens.Field.field @"lockedUtxos"
masterKeyFingerprint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "masterKeyFingerprint" a) =>
  Lens.Family2.LensLike' f s a
masterKeyFingerprint
  = Data.ProtoLens.Field.field @"masterKeyFingerprint"
maxConfs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxConfs" a) =>
  Lens.Family2.LensLike' f s a
maxConfs = Data.ProtoLens.Field.field @"maxConfs"
maybe'account ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'account" a) =>
  Lens.Family2.LensLike' f s a
maybe'account = Data.ProtoLens.Field.field @"maybe'account"
maybe'fees ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'fees" a) =>
  Lens.Family2.LensLike' f s a
maybe'fees = Data.ProtoLens.Field.field @"maybe'fees"
maybe'outpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'outpoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'outpoint = Data.ProtoLens.Field.field @"maybe'outpoint"
maybe'psbt ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'psbt" a) =>
  Lens.Family2.LensLike' f s a
maybe'psbt = Data.ProtoLens.Field.field @"maybe'psbt"
maybe'raw ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'raw" a) =>
  Lens.Family2.LensLike' f s a
maybe'raw = Data.ProtoLens.Field.field @"maybe'raw"
maybe'satPerVbyte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'satPerVbyte" a) =>
  Lens.Family2.LensLike' f s a
maybe'satPerVbyte = Data.ProtoLens.Field.field @"maybe'satPerVbyte"
maybe'sweeps ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sweeps" a) =>
  Lens.Family2.LensLike' f s a
maybe'sweeps = Data.ProtoLens.Field.field @"maybe'sweeps"
maybe'targetConf ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'targetConf" a) =>
  Lens.Family2.LensLike' f s a
maybe'targetConf = Data.ProtoLens.Field.field @"maybe'targetConf"
maybe'template ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'template" a) =>
  Lens.Family2.LensLike' f s a
maybe'template = Data.ProtoLens.Field.field @"maybe'template"
maybe'transactionDetails ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'transactionDetails" a) =>
  Lens.Family2.LensLike' f s a
maybe'transactionDetails
  = Data.ProtoLens.Field.field @"maybe'transactionDetails"
maybe'transactionIds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'transactionIds" a) =>
  Lens.Family2.LensLike' f s a
maybe'transactionIds
  = Data.ProtoLens.Field.field @"maybe'transactionIds"
minConfs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minConfs" a) =>
  Lens.Family2.LensLike' f s a
minConfs = Data.ProtoLens.Field.field @"minConfs"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
nextBroadcastHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "nextBroadcastHeight" a) =>
  Lens.Family2.LensLike' f s a
nextBroadcastHeight
  = Data.ProtoLens.Field.field @"nextBroadcastHeight"
outpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outpoint" a) =>
  Lens.Family2.LensLike' f s a
outpoint = Data.ProtoLens.Field.field @"outpoint"
outputs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "outputs" a) =>
  Lens.Family2.LensLike' f s a
outputs = Data.ProtoLens.Field.field @"outputs"
overwrite ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "overwrite" a) =>
  Lens.Family2.LensLike' f s a
overwrite = Data.ProtoLens.Field.field @"overwrite"
pendingSweeps ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingSweeps" a) =>
  Lens.Family2.LensLike' f s a
pendingSweeps = Data.ProtoLens.Field.field @"pendingSweeps"
psbt ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "psbt" a) =>
  Lens.Family2.LensLike' f s a
psbt = Data.ProtoLens.Field.field @"psbt"
publicKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "publicKey" a) =>
  Lens.Family2.LensLike' f s a
publicKey = Data.ProtoLens.Field.field @"publicKey"
publishError ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "publishError" a) =>
  Lens.Family2.LensLike' f s a
publishError = Data.ProtoLens.Field.field @"publishError"
raw ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "raw" a) =>
  Lens.Family2.LensLike' f s a
raw = Data.ProtoLens.Field.field @"raw"
rawFinalTx ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rawFinalTx" a) =>
  Lens.Family2.LensLike' f s a
rawFinalTx = Data.ProtoLens.Field.field @"rawFinalTx"
rawTx ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "rawTx" a) =>
  Lens.Family2.LensLike' f s a
rawTx = Data.ProtoLens.Field.field @"rawTx"
requestedConfTarget ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "requestedConfTarget" a) =>
  Lens.Family2.LensLike' f s a
requestedConfTarget
  = Data.ProtoLens.Field.field @"requestedConfTarget"
requestedSatPerByte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "requestedSatPerByte" a) =>
  Lens.Family2.LensLike' f s a
requestedSatPerByte
  = Data.ProtoLens.Field.field @"requestedSatPerByte"
requestedSatPerVbyte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "requestedSatPerVbyte" a) =>
  Lens.Family2.LensLike' f s a
requestedSatPerVbyte
  = Data.ProtoLens.Field.field @"requestedSatPerVbyte"
satPerByte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "satPerByte" a) =>
  Lens.Family2.LensLike' f s a
satPerByte = Data.ProtoLens.Field.field @"satPerByte"
satPerKw ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "satPerKw" a) =>
  Lens.Family2.LensLike' f s a
satPerKw = Data.ProtoLens.Field.field @"satPerKw"
satPerVbyte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "satPerVbyte" a) =>
  Lens.Family2.LensLike' f s a
satPerVbyte = Data.ProtoLens.Field.field @"satPerVbyte"
signedPsbt ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "signedPsbt" a) =>
  Lens.Family2.LensLike' f s a
signedPsbt = Data.ProtoLens.Field.field @"signedPsbt"
spendUnconfirmed ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "spendUnconfirmed" a) =>
  Lens.Family2.LensLike' f s a
spendUnconfirmed = Data.ProtoLens.Field.field @"spendUnconfirmed"
targetConf ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "targetConf" a) =>
  Lens.Family2.LensLike' f s a
targetConf = Data.ProtoLens.Field.field @"targetConf"
transactionDetails ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "transactionDetails" a) =>
  Lens.Family2.LensLike' f s a
transactionDetails
  = Data.ProtoLens.Field.field @"transactionDetails"
transactionIds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "transactionIds" a) =>
  Lens.Family2.LensLike' f s a
transactionIds = Data.ProtoLens.Field.field @"transactionIds"
txHex ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "txHex" a) =>
  Lens.Family2.LensLike' f s a
txHex = Data.ProtoLens.Field.field @"txHex"
txid ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "txid" a) =>
  Lens.Family2.LensLike' f s a
txid = Data.ProtoLens.Field.field @"txid"
type' ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "type'" a) =>
  Lens.Family2.LensLike' f s a
type' = Data.ProtoLens.Field.field @"type'"
utxos ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "utxos" a) =>
  Lens.Family2.LensLike' f s a
utxos = Data.ProtoLens.Field.field @"utxos"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
vec'accounts ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'accounts" a) =>
  Lens.Family2.LensLike' f s a
vec'accounts = Data.ProtoLens.Field.field @"vec'accounts"
vec'dryRunExternalAddrs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'dryRunExternalAddrs" a) =>
  Lens.Family2.LensLike' f s a
vec'dryRunExternalAddrs
  = Data.ProtoLens.Field.field @"vec'dryRunExternalAddrs"
vec'dryRunInternalAddrs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'dryRunInternalAddrs" a) =>
  Lens.Family2.LensLike' f s a
vec'dryRunInternalAddrs
  = Data.ProtoLens.Field.field @"vec'dryRunInternalAddrs"
vec'inputs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'inputs" a) =>
  Lens.Family2.LensLike' f s a
vec'inputs = Data.ProtoLens.Field.field @"vec'inputs"
vec'lockedUtxos ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'lockedUtxos" a) =>
  Lens.Family2.LensLike' f s a
vec'lockedUtxos = Data.ProtoLens.Field.field @"vec'lockedUtxos"
vec'outputs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'outputs" a) =>
  Lens.Family2.LensLike' f s a
vec'outputs = Data.ProtoLens.Field.field @"vec'outputs"
vec'pendingSweeps ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'pendingSweeps" a) =>
  Lens.Family2.LensLike' f s a
vec'pendingSweeps = Data.ProtoLens.Field.field @"vec'pendingSweeps"
vec'transactionIds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'transactionIds" a) =>
  Lens.Family2.LensLike' f s a
vec'transactionIds
  = Data.ProtoLens.Field.field @"vec'transactionIds"
vec'utxos ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'utxos" a) =>
  Lens.Family2.LensLike' f s a
vec'utxos = Data.ProtoLens.Field.field @"vec'utxos"
verbose ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "verbose" a) =>
  Lens.Family2.LensLike' f s a
verbose = Data.ProtoLens.Field.field @"verbose"
watchOnly ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "watchOnly" a) =>
  Lens.Family2.LensLike' f s a
watchOnly = Data.ProtoLens.Field.field @"watchOnly"
witnessType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "witnessType" a) =>
  Lens.Family2.LensLike' f s a
witnessType = Data.ProtoLens.Field.field @"witnessType"