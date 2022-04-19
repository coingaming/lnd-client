{- This file was auto-generated from lightning.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Lightning_Fields where
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
import qualified Proto.Lnrpc.Ln0
import qualified Proto.Lnrpc.Ln1
abandoned ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "abandoned" a) =>
  Lens.Family2.LensLike' f s a
abandoned = Data.ProtoLens.Field.field @"abandoned"
accept ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "accept" a) =>
  Lens.Family2.LensLike' f s a
accept = Data.ProtoLens.Field.field @"accept"
account ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "account" a) =>
  Lens.Family2.LensLike' f s a
account = Data.ProtoLens.Field.field @"account"
activeOnly ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "activeOnly" a) =>
  Lens.Family2.LensLike' f s a
activeOnly = Data.ProtoLens.Field.field @"activeOnly"
addr ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "addr" a) =>
  Lens.Family2.LensLike' f s a
addr = Data.ProtoLens.Field.field @"addr"
addrToAmount ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "addrToAmount" a) =>
  Lens.Family2.LensLike' f s a
addrToAmount = Data.ProtoLens.Field.field @"addrToAmount"
address ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "address" a) =>
  Lens.Family2.LensLike' f s a
address = Data.ProtoLens.Field.field @"address"
addressType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "addressType" a) =>
  Lens.Family2.LensLike' f s a
addressType = Data.ProtoLens.Field.field @"addressType"
alias ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "alias" a) =>
  Lens.Family2.LensLike' f s a
alias = Data.ProtoLens.Field.field @"alias"
allowSelfPayment ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "allowSelfPayment" a) =>
  Lens.Family2.LensLike' f s a
allowSelfPayment = Data.ProtoLens.Field.field @"allowSelfPayment"
amount ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amount" a) =>
  Lens.Family2.LensLike' f s a
amount = Data.ProtoLens.Field.field @"amount"
amountSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "amountSat" a) =>
  Lens.Family2.LensLike' f s a
amountSat = Data.ProtoLens.Field.field @"amountSat"
amt ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amt" a) =>
  Lens.Family2.LensLike' f s a
amt = Data.ProtoLens.Field.field @"amt"
amtMsat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amtMsat" a) =>
  Lens.Family2.LensLike' f s a
amtMsat = Data.ProtoLens.Field.field @"amtMsat"
bestHeaderTimestamp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "bestHeaderTimestamp" a) =>
  Lens.Family2.LensLike' f s a
bestHeaderTimestamp
  = Data.ProtoLens.Field.field @"bestHeaderTimestamp"
blockHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "blockHash" a) =>
  Lens.Family2.LensLike' f s a
blockHash = Data.ProtoLens.Field.field @"blockHash"
blockHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "blockHeight" a) =>
  Lens.Family2.LensLike' f s a
blockHeight = Data.ProtoLens.Field.field @"blockHeight"
blockSha ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "blockSha" a) =>
  Lens.Family2.LensLike' f s a
blockSha = Data.ProtoLens.Field.field @"blockSha"
breach ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "breach" a) =>
  Lens.Family2.LensLike' f s a
breach = Data.ProtoLens.Field.field @"breach"
bytesRecv ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "bytesRecv" a) =>
  Lens.Family2.LensLike' f s a
bytesRecv = Data.ProtoLens.Field.field @"bytesRecv"
bytesSent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "bytesSent" a) =>
  Lens.Family2.LensLike' f s a
bytesSent = Data.ProtoLens.Field.field @"bytesSent"
chain ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "chain" a) =>
  Lens.Family2.LensLike' f s a
chain = Data.ProtoLens.Field.field @"chain"
chainHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chainHash" a) =>
  Lens.Family2.LensLike' f s a
chainHash = Data.ProtoLens.Field.field @"chainHash"
chains ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "chains" a) =>
  Lens.Family2.LensLike' f s a
chains = Data.ProtoLens.Field.field @"chains"
chanClose ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanClose" a) =>
  Lens.Family2.LensLike' f s a
chanClose = Data.ProtoLens.Field.field @"chanClose"
chanOpen ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanOpen" a) =>
  Lens.Family2.LensLike' f s a
chanOpen = Data.ProtoLens.Field.field @"chanOpen"
chanPending ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanPending" a) =>
  Lens.Family2.LensLike' f s a
chanPending = Data.ProtoLens.Field.field @"chanPending"
channelFlags ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channelFlags" a) =>
  Lens.Family2.LensLike' f s a
channelFlags = Data.ProtoLens.Field.field @"channelFlags"
channelPoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channelPoint" a) =>
  Lens.Family2.LensLike' f s a
channelPoint = Data.ProtoLens.Field.field @"channelPoint"
channelReserve ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channelReserve" a) =>
  Lens.Family2.LensLike' f s a
channelReserve = Data.ProtoLens.Field.field @"channelReserve"
channels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channels" a) =>
  Lens.Family2.LensLike' f s a
channels = Data.ProtoLens.Field.field @"channels"
closeAddress ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closeAddress" a) =>
  Lens.Family2.LensLike' f s a
closeAddress = Data.ProtoLens.Field.field @"closeAddress"
closePending ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closePending" a) =>
  Lens.Family2.LensLike' f s a
closePending = Data.ProtoLens.Field.field @"closePending"
closingTxid ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closingTxid" a) =>
  Lens.Family2.LensLike' f s a
closingTxid = Data.ProtoLens.Field.field @"closingTxid"
cltvLimit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "cltvLimit" a) =>
  Lens.Family2.LensLike' f s a
cltvLimit = Data.ProtoLens.Field.field @"cltvLimit"
color ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "color" a) =>
  Lens.Family2.LensLike' f s a
color = Data.ProtoLens.Field.field @"color"
commitHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "commitHash" a) =>
  Lens.Family2.LensLike' f s a
commitHash = Data.ProtoLens.Field.field @"commitHash"
commitmentType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "commitmentType" a) =>
  Lens.Family2.LensLike' f s a
commitmentType = Data.ProtoLens.Field.field @"commitmentType"
confirmations ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "confirmations" a) =>
  Lens.Family2.LensLike' f s a
confirmations = Data.ProtoLens.Field.field @"confirmations"
cooperative ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "cooperative" a) =>
  Lens.Family2.LensLike' f s a
cooperative = Data.ProtoLens.Field.field @"cooperative"
csvDelay ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "csvDelay" a) =>
  Lens.Family2.LensLike' f s a
csvDelay = Data.ProtoLens.Field.field @"csvDelay"
data' ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "data'" a) =>
  Lens.Family2.LensLike' f s a
data' = Data.ProtoLens.Field.field @"data'"
deliveryAddress ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "deliveryAddress" a) =>
  Lens.Family2.LensLike' f s a
deliveryAddress = Data.ProtoLens.Field.field @"deliveryAddress"
dest ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "dest" a) =>
  Lens.Family2.LensLike' f s a
dest = Data.ProtoLens.Field.field @"dest"
destAddresses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "destAddresses" a) =>
  Lens.Family2.LensLike' f s a
destAddresses = Data.ProtoLens.Field.field @"destAddresses"
destCustomRecords ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "destCustomRecords" a) =>
  Lens.Family2.LensLike' f s a
destCustomRecords = Data.ProtoLens.Field.field @"destCustomRecords"
destFeatures ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "destFeatures" a) =>
  Lens.Family2.LensLike' f s a
destFeatures = Data.ProtoLens.Field.field @"destFeatures"
destString ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "destString" a) =>
  Lens.Family2.LensLike' f s a
destString = Data.ProtoLens.Field.field @"destString"
dustLimit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "dustLimit" a) =>
  Lens.Family2.LensLike' f s a
dustLimit = Data.ProtoLens.Field.field @"dustLimit"
endHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "endHeight" a) =>
  Lens.Family2.LensLike' f s a
endHeight = Data.ProtoLens.Field.field @"endHeight"
error ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "error" a) =>
  Lens.Family2.LensLike' f s a
error = Data.ProtoLens.Field.field @"error"
errors ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "errors" a) =>
  Lens.Family2.LensLike' f s a
errors = Data.ProtoLens.Field.field @"errors"
features ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "features" a) =>
  Lens.Family2.LensLike' f s a
features = Data.ProtoLens.Field.field @"features"
feeLimit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feeLimit" a) =>
  Lens.Family2.LensLike' f s a
feeLimit = Data.ProtoLens.Field.field @"feeLimit"
feePerKw ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feePerKw" a) =>
  Lens.Family2.LensLike' f s a
feePerKw = Data.ProtoLens.Field.field @"feePerKw"
feeSat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "feeSat" a) =>
  Lens.Family2.LensLike' f s a
feeSat = Data.ProtoLens.Field.field @"feeSat"
feerateSatPerByte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feerateSatPerByte" a) =>
  Lens.Family2.LensLike' f s a
feerateSatPerByte = Data.ProtoLens.Field.field @"feerateSatPerByte"
finalCltvDelta ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "finalCltvDelta" a) =>
  Lens.Family2.LensLike' f s a
finalCltvDelta = Data.ProtoLens.Field.field @"finalCltvDelta"
flapCount ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "flapCount" a) =>
  Lens.Family2.LensLike' f s a
flapCount = Data.ProtoLens.Field.field @"flapCount"
force ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "force" a) =>
  Lens.Family2.LensLike' f s a
force = Data.ProtoLens.Field.field @"force"
fundingAddress ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fundingAddress" a) =>
  Lens.Family2.LensLike' f s a
fundingAddress = Data.ProtoLens.Field.field @"fundingAddress"
fundingAmount ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fundingAmount" a) =>
  Lens.Family2.LensLike' f s a
fundingAmount = Data.ProtoLens.Field.field @"fundingAmount"
fundingAmt ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fundingAmt" a) =>
  Lens.Family2.LensLike' f s a
fundingAmt = Data.ProtoLens.Field.field @"fundingAmt"
fundingCanceled ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fundingCanceled" a) =>
  Lens.Family2.LensLike' f s a
fundingCanceled = Data.ProtoLens.Field.field @"fundingCanceled"
fundingShim ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fundingShim" a) =>
  Lens.Family2.LensLike' f s a
fundingShim = Data.ProtoLens.Field.field @"fundingShim"
host ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "host" a) =>
  Lens.Family2.LensLike' f s a
host = Data.ProtoLens.Field.field @"host"
identityPubkey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "identityPubkey" a) =>
  Lens.Family2.LensLike' f s a
identityPubkey = Data.ProtoLens.Field.field @"identityPubkey"
inFlightMaxMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "inFlightMaxMsat" a) =>
  Lens.Family2.LensLike' f s a
inFlightMaxMsat = Data.ProtoLens.Field.field @"inFlightMaxMsat"
inactiveOnly ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "inactiveOnly" a) =>
  Lens.Family2.LensLike' f s a
inactiveOnly = Data.ProtoLens.Field.field @"inactiveOnly"
inbound ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "inbound" a) =>
  Lens.Family2.LensLike' f s a
inbound = Data.ProtoLens.Field.field @"inbound"
key ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "key" a) =>
  Lens.Family2.LensLike' f s a
key = Data.ProtoLens.Field.field @"key"
label ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "label" a) =>
  Lens.Family2.LensLike' f s a
label = Data.ProtoLens.Field.field @"label"
lastFlapNs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastFlapNs" a) =>
  Lens.Family2.LensLike' f s a
lastFlapNs = Data.ProtoLens.Field.field @"lastFlapNs"
lastHopPubkey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastHopPubkey" a) =>
  Lens.Family2.LensLike' f s a
lastHopPubkey = Data.ProtoLens.Field.field @"lastHopPubkey"
lastPingPayload ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastPingPayload" a) =>
  Lens.Family2.LensLike' f s a
lastPingPayload = Data.ProtoLens.Field.field @"lastPingPayload"
latestError ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "latestError" a) =>
  Lens.Family2.LensLike' f s a
latestError = Data.ProtoLens.Field.field @"latestError"
localForce ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "localForce" a) =>
  Lens.Family2.LensLike' f s a
localForce = Data.ProtoLens.Field.field @"localForce"
localFundingAmount ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "localFundingAmount" a) =>
  Lens.Family2.LensLike' f s a
localFundingAmount
  = Data.ProtoLens.Field.field @"localFundingAmount"
maxAcceptedHtlcs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxAcceptedHtlcs" a) =>
  Lens.Family2.LensLike' f s a
maxAcceptedHtlcs = Data.ProtoLens.Field.field @"maxAcceptedHtlcs"
maxConfs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxConfs" a) =>
  Lens.Family2.LensLike' f s a
maxConfs = Data.ProtoLens.Field.field @"maxConfs"
maxHtlcCount ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxHtlcCount" a) =>
  Lens.Family2.LensLike' f s a
maxHtlcCount = Data.ProtoLens.Field.field @"maxHtlcCount"
maxLocalCsv ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxLocalCsv" a) =>
  Lens.Family2.LensLike' f s a
maxLocalCsv = Data.ProtoLens.Field.field @"maxLocalCsv"
maxValueInFlight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxValueInFlight" a) =>
  Lens.Family2.LensLike' f s a
maxValueInFlight = Data.ProtoLens.Field.field @"maxValueInFlight"
maybe'addr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'addr" a) =>
  Lens.Family2.LensLike' f s a
maybe'addr = Data.ProtoLens.Field.field @"maybe'addr"
maybe'chanClose ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'chanClose" a) =>
  Lens.Family2.LensLike' f s a
maybe'chanClose = Data.ProtoLens.Field.field @"maybe'chanClose"
maybe'chanOpen ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'chanOpen" a) =>
  Lens.Family2.LensLike' f s a
maybe'chanOpen = Data.ProtoLens.Field.field @"maybe'chanOpen"
maybe'chanPending ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'chanPending" a) =>
  Lens.Family2.LensLike' f s a
maybe'chanPending = Data.ProtoLens.Field.field @"maybe'chanPending"
maybe'channelPoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'channelPoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'channelPoint
  = Data.ProtoLens.Field.field @"maybe'channelPoint"
maybe'closePending ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'closePending" a) =>
  Lens.Family2.LensLike' f s a
maybe'closePending
  = Data.ProtoLens.Field.field @"maybe'closePending"
maybe'feeLimit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'feeLimit" a) =>
  Lens.Family2.LensLike' f s a
maybe'feeLimit = Data.ProtoLens.Field.field @"maybe'feeLimit"
maybe'fundingShim ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'fundingShim" a) =>
  Lens.Family2.LensLike' f s a
maybe'fundingShim = Data.ProtoLens.Field.field @"maybe'fundingShim"
maybe'outpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'outpoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'outpoint = Data.ProtoLens.Field.field @"maybe'outpoint"
maybe'paymentRoute ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'paymentRoute" a) =>
  Lens.Family2.LensLike' f s a
maybe'paymentRoute
  = Data.ProtoLens.Field.field @"maybe'paymentRoute"
maybe'psbtFund ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'psbtFund" a) =>
  Lens.Family2.LensLike' f s a
maybe'psbtFund = Data.ProtoLens.Field.field @"maybe'psbtFund"
maybe'route ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'route" a) =>
  Lens.Family2.LensLike' f s a
maybe'route = Data.ProtoLens.Field.field @"maybe'route"
maybe'update ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'update" a) =>
  Lens.Family2.LensLike' f s a
maybe'update = Data.ProtoLens.Field.field @"maybe'update"
maybe'value ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'value" a) =>
  Lens.Family2.LensLike' f s a
maybe'value = Data.ProtoLens.Field.field @"maybe'value"
minAcceptDepth ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minAcceptDepth" a) =>
  Lens.Family2.LensLike' f s a
minAcceptDepth = Data.ProtoLens.Field.field @"minAcceptDepth"
minConfs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minConfs" a) =>
  Lens.Family2.LensLike' f s a
minConfs = Data.ProtoLens.Field.field @"minConfs"
minHtlc ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "minHtlc" a) =>
  Lens.Family2.LensLike' f s a
minHtlc = Data.ProtoLens.Field.field @"minHtlc"
minHtlcIn ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minHtlcIn" a) =>
  Lens.Family2.LensLike' f s a
minHtlcIn = Data.ProtoLens.Field.field @"minHtlcIn"
minHtlcMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minHtlcMsat" a) =>
  Lens.Family2.LensLike' f s a
minHtlcMsat = Data.ProtoLens.Field.field @"minHtlcMsat"
msg ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "msg" a) =>
  Lens.Family2.LensLike' f s a
msg = Data.ProtoLens.Field.field @"msg"
network ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "network" a) =>
  Lens.Family2.LensLike' f s a
network = Data.ProtoLens.Field.field @"network"
nodePubkey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "nodePubkey" a) =>
  Lens.Family2.LensLike' f s a
nodePubkey = Data.ProtoLens.Field.field @"nodePubkey"
nodePubkeyString ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "nodePubkeyString" a) =>
  Lens.Family2.LensLike' f s a
nodePubkeyString = Data.ProtoLens.Field.field @"nodePubkeyString"
numActiveChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numActiveChannels" a) =>
  Lens.Family2.LensLike' f s a
numActiveChannels = Data.ProtoLens.Field.field @"numActiveChannels"
numConfirmations ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numConfirmations" a) =>
  Lens.Family2.LensLike' f s a
numConfirmations = Data.ProtoLens.Field.field @"numConfirmations"
numConfsLeft ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numConfsLeft" a) =>
  Lens.Family2.LensLike' f s a
numConfsLeft = Data.ProtoLens.Field.field @"numConfsLeft"
numInactiveChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numInactiveChannels" a) =>
  Lens.Family2.LensLike' f s a
numInactiveChannels
  = Data.ProtoLens.Field.field @"numInactiveChannels"
numPeers ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numPeers" a) =>
  Lens.Family2.LensLike' f s a
numPeers = Data.ProtoLens.Field.field @"numPeers"
numPendingChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numPendingChannels" a) =>
  Lens.Family2.LensLike' f s a
numPendingChannels
  = Data.ProtoLens.Field.field @"numPendingChannels"
outgoingChanId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingChanId" a) =>
  Lens.Family2.LensLike' f s a
outgoingChanId = Data.ProtoLens.Field.field @"outgoingChanId"
outpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outpoint" a) =>
  Lens.Family2.LensLike' f s a
outpoint = Data.ProtoLens.Field.field @"outpoint"
paymentAddr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentAddr" a) =>
  Lens.Family2.LensLike' f s a
paymentAddr = Data.ProtoLens.Field.field @"paymentAddr"
paymentError ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentError" a) =>
  Lens.Family2.LensLike' f s a
paymentError = Data.ProtoLens.Field.field @"paymentError"
paymentHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentHash" a) =>
  Lens.Family2.LensLike' f s a
paymentHash = Data.ProtoLens.Field.field @"paymentHash"
paymentHashString ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentHashString" a) =>
  Lens.Family2.LensLike' f s a
paymentHashString = Data.ProtoLens.Field.field @"paymentHashString"
paymentPreimage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentPreimage" a) =>
  Lens.Family2.LensLike' f s a
paymentPreimage = Data.ProtoLens.Field.field @"paymentPreimage"
paymentRequest ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentRequest" a) =>
  Lens.Family2.LensLike' f s a
paymentRequest = Data.ProtoLens.Field.field @"paymentRequest"
paymentRoute ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentRoute" a) =>
  Lens.Family2.LensLike' f s a
paymentRoute = Data.ProtoLens.Field.field @"paymentRoute"
peer ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "peer" a) =>
  Lens.Family2.LensLike' f s a
peer = Data.ProtoLens.Field.field @"peer"
peers ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "peers" a) =>
  Lens.Family2.LensLike' f s a
peers = Data.ProtoLens.Field.field @"peers"
pendingChanId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingChanId" a) =>
  Lens.Family2.LensLike' f s a
pendingChanId = Data.ProtoLens.Field.field @"pendingChanId"
pendingChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingChannels" a) =>
  Lens.Family2.LensLike' f s a
pendingChannels = Data.ProtoLens.Field.field @"pendingChannels"
perm ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "perm" a) =>
  Lens.Family2.LensLike' f s a
perm = Data.ProtoLens.Field.field @"perm"
pingTime ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pingTime" a) =>
  Lens.Family2.LensLike' f s a
pingTime = Data.ProtoLens.Field.field @"pingTime"
pkScript ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pkScript" a) =>
  Lens.Family2.LensLike' f s a
pkScript = Data.ProtoLens.Field.field @"pkScript"
private ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "private" a) =>
  Lens.Family2.LensLike' f s a
private = Data.ProtoLens.Field.field @"private"
privateOnly ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "privateOnly" a) =>
  Lens.Family2.LensLike' f s a
privateOnly = Data.ProtoLens.Field.field @"privateOnly"
progress ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "progress" a) =>
  Lens.Family2.LensLike' f s a
progress = Data.ProtoLens.Field.field @"progress"
psbt ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "psbt" a) =>
  Lens.Family2.LensLike' f s a
psbt = Data.ProtoLens.Field.field @"psbt"
psbtFund ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "psbtFund" a) =>
  Lens.Family2.LensLike' f s a
psbtFund = Data.ProtoLens.Field.field @"psbtFund"
pubKey ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "pubKey" a) =>
  Lens.Family2.LensLike' f s a
pubKey = Data.ProtoLens.Field.field @"pubKey"
pubkey ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "pubkey" a) =>
  Lens.Family2.LensLike' f s a
pubkey = Data.ProtoLens.Field.field @"pubkey"
publicOnly ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "publicOnly" a) =>
  Lens.Family2.LensLike' f s a
publicOnly = Data.ProtoLens.Field.field @"publicOnly"
pushAmt ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "pushAmt" a) =>
  Lens.Family2.LensLike' f s a
pushAmt = Data.ProtoLens.Field.field @"pushAmt"
pushSat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "pushSat" a) =>
  Lens.Family2.LensLike' f s a
pushSat = Data.ProtoLens.Field.field @"pushSat"
rawTxHex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rawTxHex" a) =>
  Lens.Family2.LensLike' f s a
rawTxHex = Data.ProtoLens.Field.field @"rawTxHex"
recoveryFinished ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "recoveryFinished" a) =>
  Lens.Family2.LensLike' f s a
recoveryFinished = Data.ProtoLens.Field.field @"recoveryFinished"
recoveryMode ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "recoveryMode" a) =>
  Lens.Family2.LensLike' f s a
recoveryMode = Data.ProtoLens.Field.field @"recoveryMode"
remoteCsvDelay ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteCsvDelay" a) =>
  Lens.Family2.LensLike' f s a
remoteCsvDelay = Data.ProtoLens.Field.field @"remoteCsvDelay"
remoteForce ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteForce" a) =>
  Lens.Family2.LensLike' f s a
remoteForce = Data.ProtoLens.Field.field @"remoteForce"
remoteMaxHtlcs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteMaxHtlcs" a) =>
  Lens.Family2.LensLike' f s a
remoteMaxHtlcs = Data.ProtoLens.Field.field @"remoteMaxHtlcs"
remoteMaxValueInFlightMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteMaxValueInFlightMsat" a) =>
  Lens.Family2.LensLike' f s a
remoteMaxValueInFlightMsat
  = Data.ProtoLens.Field.field @"remoteMaxValueInFlightMsat"
reserveSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "reserveSat" a) =>
  Lens.Family2.LensLike' f s a
reserveSat = Data.ProtoLens.Field.field @"reserveSat"
route ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "route" a) =>
  Lens.Family2.LensLike' f s a
route = Data.ProtoLens.Field.field @"route"
satPerByte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "satPerByte" a) =>
  Lens.Family2.LensLike' f s a
satPerByte = Data.ProtoLens.Field.field @"satPerByte"
satPerVbyte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "satPerVbyte" a) =>
  Lens.Family2.LensLike' f s a
satPerVbyte = Data.ProtoLens.Field.field @"satPerVbyte"
satRecv ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "satRecv" a) =>
  Lens.Family2.LensLike' f s a
satRecv = Data.ProtoLens.Field.field @"satRecv"
satSent ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "satSent" a) =>
  Lens.Family2.LensLike' f s a
satSent = Data.ProtoLens.Field.field @"satSent"
sendAll ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "sendAll" a) =>
  Lens.Family2.LensLike' f s a
sendAll = Data.ProtoLens.Field.field @"sendAll"
signature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "signature" a) =>
  Lens.Family2.LensLike' f s a
signature = Data.ProtoLens.Field.field @"signature"
singleHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "singleHash" a) =>
  Lens.Family2.LensLike' f s a
singleHash = Data.ProtoLens.Field.field @"singleHash"
spendUnconfirmed ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "spendUnconfirmed" a) =>
  Lens.Family2.LensLike' f s a
spendUnconfirmed = Data.ProtoLens.Field.field @"spendUnconfirmed"
startHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "startHeight" a) =>
  Lens.Family2.LensLike' f s a
startHeight = Data.ProtoLens.Field.field @"startHeight"
success ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "success" a) =>
  Lens.Family2.LensLike' f s a
success = Data.ProtoLens.Field.field @"success"
syncType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "syncType" a) =>
  Lens.Family2.LensLike' f s a
syncType = Data.ProtoLens.Field.field @"syncType"
syncedToChain ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "syncedToChain" a) =>
  Lens.Family2.LensLike' f s a
syncedToChain = Data.ProtoLens.Field.field @"syncedToChain"
syncedToGraph ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "syncedToGraph" a) =>
  Lens.Family2.LensLike' f s a
syncedToGraph = Data.ProtoLens.Field.field @"syncedToGraph"
targetConf ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "targetConf" a) =>
  Lens.Family2.LensLike' f s a
targetConf = Data.ProtoLens.Field.field @"targetConf"
testnet ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "testnet" a) =>
  Lens.Family2.LensLike' f s a
testnet = Data.ProtoLens.Field.field @"testnet"
timeStamp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timeStamp" a) =>
  Lens.Family2.LensLike' f s a
timeStamp = Data.ProtoLens.Field.field @"timeStamp"
timeout ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "timeout" a) =>
  Lens.Family2.LensLike' f s a
timeout = Data.ProtoLens.Field.field @"timeout"
timestamp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timestamp" a) =>
  Lens.Family2.LensLike' f s a
timestamp = Data.ProtoLens.Field.field @"timestamp"
totalFees ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalFees" a) =>
  Lens.Family2.LensLike' f s a
totalFees = Data.ProtoLens.Field.field @"totalFees"
transactions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "transactions" a) =>
  Lens.Family2.LensLike' f s a
transactions = Data.ProtoLens.Field.field @"transactions"
txHash ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "txHash" a) =>
  Lens.Family2.LensLike' f s a
txHash = Data.ProtoLens.Field.field @"txHash"
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
upfrontShutdown ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "upfrontShutdown" a) =>
  Lens.Family2.LensLike' f s a
upfrontShutdown = Data.ProtoLens.Field.field @"upfrontShutdown"
uris ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "uris" a) =>
  Lens.Family2.LensLike' f s a
uris = Data.ProtoLens.Field.field @"uris"
utxos ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "utxos" a) =>
  Lens.Family2.LensLike' f s a
utxos = Data.ProtoLens.Field.field @"utxos"
valid ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "valid" a) =>
  Lens.Family2.LensLike' f s a
valid = Data.ProtoLens.Field.field @"valid"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
vec'chains ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'chains" a) =>
  Lens.Family2.LensLike' f s a
vec'chains = Data.ProtoLens.Field.field @"vec'chains"
vec'channels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'channels" a) =>
  Lens.Family2.LensLike' f s a
vec'channels = Data.ProtoLens.Field.field @"vec'channels"
vec'destAddresses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'destAddresses" a) =>
  Lens.Family2.LensLike' f s a
vec'destAddresses = Data.ProtoLens.Field.field @"vec'destAddresses"
vec'destFeatures ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'destFeatures" a) =>
  Lens.Family2.LensLike' f s a
vec'destFeatures = Data.ProtoLens.Field.field @"vec'destFeatures"
vec'errors ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'errors" a) =>
  Lens.Family2.LensLike' f s a
vec'errors = Data.ProtoLens.Field.field @"vec'errors"
vec'peers ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'peers" a) =>
  Lens.Family2.LensLike' f s a
vec'peers = Data.ProtoLens.Field.field @"vec'peers"
vec'pendingChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'pendingChannels" a) =>
  Lens.Family2.LensLike' f s a
vec'pendingChannels
  = Data.ProtoLens.Field.field @"vec'pendingChannels"
vec'transactions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'transactions" a) =>
  Lens.Family2.LensLike' f s a
vec'transactions = Data.ProtoLens.Field.field @"vec'transactions"
vec'uris ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'uris" a) =>
  Lens.Family2.LensLike' f s a
vec'uris = Data.ProtoLens.Field.field @"vec'uris"
vec'utxos ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'utxos" a) =>
  Lens.Family2.LensLike' f s a
vec'utxos = Data.ProtoLens.Field.field @"vec'utxos"
version ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "version" a) =>
  Lens.Family2.LensLike' f s a
version = Data.ProtoLens.Field.field @"version"