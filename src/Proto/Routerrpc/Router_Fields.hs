{- This file was auto-generated from routerrpc/router.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Routerrpc.Router_Fields where
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
action ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "action" a) =>
  Lens.Family2.LensLike' f s a
action = Data.ProtoLens.Field.field @"action"
allowSelfPayment ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "allowSelfPayment" a) =>
  Lens.Family2.LensLike' f s a
allowSelfPayment = Data.ProtoLens.Field.field @"allowSelfPayment"
amp ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amp" a) =>
  Lens.Family2.LensLike' f s a
amp = Data.ProtoLens.Field.field @"amp"
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
amtSat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amtSat" a) =>
  Lens.Family2.LensLike' f s a
amtSat = Data.ProtoLens.Field.field @"amtSat"
chanId ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "chanId" a) =>
  Lens.Family2.LensLike' f s a
chanId = Data.ProtoLens.Field.field @"chanId"
chanPoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanPoint" a) =>
  Lens.Family2.LensLike' f s a
chanPoint = Data.ProtoLens.Field.field @"chanPoint"
cltvLimit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "cltvLimit" a) =>
  Lens.Family2.LensLike' f s a
cltvLimit = Data.ProtoLens.Field.field @"cltvLimit"
config ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "config" a) =>
  Lens.Family2.LensLike' f s a
config = Data.ProtoLens.Field.field @"config"
customRecords ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "customRecords" a) =>
  Lens.Family2.LensLike' f s a
customRecords = Data.ProtoLens.Field.field @"customRecords"
dest ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "dest" a) =>
  Lens.Family2.LensLike' f s a
dest = Data.ProtoLens.Field.field @"dest"
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
eventType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "eventType" a) =>
  Lens.Family2.LensLike' f s a
eventType = Data.ProtoLens.Field.field @"eventType"
failAmtMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failAmtMsat" a) =>
  Lens.Family2.LensLike' f s a
failAmtMsat = Data.ProtoLens.Field.field @"failAmtMsat"
failAmtSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failAmtSat" a) =>
  Lens.Family2.LensLike' f s a
failAmtSat = Data.ProtoLens.Field.field @"failAmtSat"
failTime ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failTime" a) =>
  Lens.Family2.LensLike' f s a
failTime = Data.ProtoLens.Field.field @"failTime"
failure ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "failure" a) =>
  Lens.Family2.LensLike' f s a
failure = Data.ProtoLens.Field.field @"failure"
failureDetail ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failureDetail" a) =>
  Lens.Family2.LensLike' f s a
failureDetail = Data.ProtoLens.Field.field @"failureDetail"
failureString ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failureString" a) =>
  Lens.Family2.LensLike' f s a
failureString = Data.ProtoLens.Field.field @"failureString"
feeLimitMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feeLimitMsat" a) =>
  Lens.Family2.LensLike' f s a
feeLimitMsat = Data.ProtoLens.Field.field @"feeLimitMsat"
feeLimitSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feeLimitSat" a) =>
  Lens.Family2.LensLike' f s a
feeLimitSat = Data.ProtoLens.Field.field @"feeLimitSat"
finalCltvDelta ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "finalCltvDelta" a) =>
  Lens.Family2.LensLike' f s a
finalCltvDelta = Data.ProtoLens.Field.field @"finalCltvDelta"
forwardEvent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "forwardEvent" a) =>
  Lens.Family2.LensLike' f s a
forwardEvent = Data.ProtoLens.Field.field @"forwardEvent"
forwardFailEvent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "forwardFailEvent" a) =>
  Lens.Family2.LensLike' f s a
forwardFailEvent = Data.ProtoLens.Field.field @"forwardFailEvent"
fromNode ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fromNode" a) =>
  Lens.Family2.LensLike' f s a
fromNode = Data.ProtoLens.Field.field @"fromNode"
halfLifeSeconds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "halfLifeSeconds" a) =>
  Lens.Family2.LensLike' f s a
halfLifeSeconds = Data.ProtoLens.Field.field @"halfLifeSeconds"
history ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "history" a) =>
  Lens.Family2.LensLike' f s a
history = Data.ProtoLens.Field.field @"history"
hopProbability ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hopProbability" a) =>
  Lens.Family2.LensLike' f s a
hopProbability = Data.ProtoLens.Field.field @"hopProbability"
hopPubkeys ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hopPubkeys" a) =>
  Lens.Family2.LensLike' f s a
hopPubkeys = Data.ProtoLens.Field.field @"hopPubkeys"
htlcId ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "htlcId" a) =>
  Lens.Family2.LensLike' f s a
htlcId = Data.ProtoLens.Field.field @"htlcId"
htlcs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "htlcs" a) =>
  Lens.Family2.LensLike' f s a
htlcs = Data.ProtoLens.Field.field @"htlcs"
incomingAmountMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "incomingAmountMsat" a) =>
  Lens.Family2.LensLike' f s a
incomingAmountMsat
  = Data.ProtoLens.Field.field @"incomingAmountMsat"
incomingAmtMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "incomingAmtMsat" a) =>
  Lens.Family2.LensLike' f s a
incomingAmtMsat = Data.ProtoLens.Field.field @"incomingAmtMsat"
incomingChannelId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "incomingChannelId" a) =>
  Lens.Family2.LensLike' f s a
incomingChannelId = Data.ProtoLens.Field.field @"incomingChannelId"
incomingCircuitKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "incomingCircuitKey" a) =>
  Lens.Family2.LensLike' f s a
incomingCircuitKey
  = Data.ProtoLens.Field.field @"incomingCircuitKey"
incomingExpiry ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "incomingExpiry" a) =>
  Lens.Family2.LensLike' f s a
incomingExpiry = Data.ProtoLens.Field.field @"incomingExpiry"
incomingHtlcId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "incomingHtlcId" a) =>
  Lens.Family2.LensLike' f s a
incomingHtlcId = Data.ProtoLens.Field.field @"incomingHtlcId"
incomingTimelock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "incomingTimelock" a) =>
  Lens.Family2.LensLike' f s a
incomingTimelock = Data.ProtoLens.Field.field @"incomingTimelock"
info ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "info" a) =>
  Lens.Family2.LensLike' f s a
info = Data.ProtoLens.Field.field @"info"
key ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "key" a) =>
  Lens.Family2.LensLike' f s a
key = Data.ProtoLens.Field.field @"key"
lastHopPubkey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastHopPubkey" a) =>
  Lens.Family2.LensLike' f s a
lastHopPubkey = Data.ProtoLens.Field.field @"lastHopPubkey"
linkFailEvent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "linkFailEvent" a) =>
  Lens.Family2.LensLike' f s a
linkFailEvent = Data.ProtoLens.Field.field @"linkFailEvent"
maxParts ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxParts" a) =>
  Lens.Family2.LensLike' f s a
maxParts = Data.ProtoLens.Field.field @"maxParts"
maxShardSizeMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxShardSizeMsat" a) =>
  Lens.Family2.LensLike' f s a
maxShardSizeMsat = Data.ProtoLens.Field.field @"maxShardSizeMsat"
maximumPaymentResults ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maximumPaymentResults" a) =>
  Lens.Family2.LensLike' f s a
maximumPaymentResults
  = Data.ProtoLens.Field.field @"maximumPaymentResults"
maybe'chanPoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'chanPoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'chanPoint = Data.ProtoLens.Field.field @"maybe'chanPoint"
maybe'config ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'config" a) =>
  Lens.Family2.LensLike' f s a
maybe'config = Data.ProtoLens.Field.field @"maybe'config"
maybe'event ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'event" a) =>
  Lens.Family2.LensLike' f s a
maybe'event = Data.ProtoLens.Field.field @"maybe'event"
maybe'failure ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'failure" a) =>
  Lens.Family2.LensLike' f s a
maybe'failure = Data.ProtoLens.Field.field @"maybe'failure"
maybe'forwardEvent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'forwardEvent" a) =>
  Lens.Family2.LensLike' f s a
maybe'forwardEvent
  = Data.ProtoLens.Field.field @"maybe'forwardEvent"
maybe'forwardFailEvent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'forwardFailEvent" a) =>
  Lens.Family2.LensLike' f s a
maybe'forwardFailEvent
  = Data.ProtoLens.Field.field @"maybe'forwardFailEvent"
maybe'history ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'history" a) =>
  Lens.Family2.LensLike' f s a
maybe'history = Data.ProtoLens.Field.field @"maybe'history"
maybe'incomingCircuitKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'incomingCircuitKey" a) =>
  Lens.Family2.LensLike' f s a
maybe'incomingCircuitKey
  = Data.ProtoLens.Field.field @"maybe'incomingCircuitKey"
maybe'info ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'info" a) =>
  Lens.Family2.LensLike' f s a
maybe'info = Data.ProtoLens.Field.field @"maybe'info"
maybe'linkFailEvent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'linkFailEvent" a) =>
  Lens.Family2.LensLike' f s a
maybe'linkFailEvent
  = Data.ProtoLens.Field.field @"maybe'linkFailEvent"
maybe'route ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'route" a) =>
  Lens.Family2.LensLike' f s a
maybe'route = Data.ProtoLens.Field.field @"maybe'route"
maybe'settleEvent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'settleEvent" a) =>
  Lens.Family2.LensLike' f s a
maybe'settleEvent = Data.ProtoLens.Field.field @"maybe'settleEvent"
minimumFailureRelaxInterval ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minimumFailureRelaxInterval" a) =>
  Lens.Family2.LensLike' f s a
minimumFailureRelaxInterval
  = Data.ProtoLens.Field.field @"minimumFailureRelaxInterval"
noInflightUpdates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "noInflightUpdates" a) =>
  Lens.Family2.LensLike' f s a
noInflightUpdates = Data.ProtoLens.Field.field @"noInflightUpdates"
nodeFrom ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "nodeFrom" a) =>
  Lens.Family2.LensLike' f s a
nodeFrom = Data.ProtoLens.Field.field @"nodeFrom"
nodeTo ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "nodeTo" a) =>
  Lens.Family2.LensLike' f s a
nodeTo = Data.ProtoLens.Field.field @"nodeTo"
onionBlob ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "onionBlob" a) =>
  Lens.Family2.LensLike' f s a
onionBlob = Data.ProtoLens.Field.field @"onionBlob"
outgoingAmountMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingAmountMsat" a) =>
  Lens.Family2.LensLike' f s a
outgoingAmountMsat
  = Data.ProtoLens.Field.field @"outgoingAmountMsat"
outgoingAmtMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingAmtMsat" a) =>
  Lens.Family2.LensLike' f s a
outgoingAmtMsat = Data.ProtoLens.Field.field @"outgoingAmtMsat"
outgoingChanId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingChanId" a) =>
  Lens.Family2.LensLike' f s a
outgoingChanId = Data.ProtoLens.Field.field @"outgoingChanId"
outgoingChanIds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingChanIds" a) =>
  Lens.Family2.LensLike' f s a
outgoingChanIds = Data.ProtoLens.Field.field @"outgoingChanIds"
outgoingChannelId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingChannelId" a) =>
  Lens.Family2.LensLike' f s a
outgoingChannelId = Data.ProtoLens.Field.field @"outgoingChannelId"
outgoingExpiry ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingExpiry" a) =>
  Lens.Family2.LensLike' f s a
outgoingExpiry = Data.ProtoLens.Field.field @"outgoingExpiry"
outgoingHtlcId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingHtlcId" a) =>
  Lens.Family2.LensLike' f s a
outgoingHtlcId = Data.ProtoLens.Field.field @"outgoingHtlcId"
outgoingRequestedChanId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingRequestedChanId" a) =>
  Lens.Family2.LensLike' f s a
outgoingRequestedChanId
  = Data.ProtoLens.Field.field @"outgoingRequestedChanId"
outgoingTimelock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outgoingTimelock" a) =>
  Lens.Family2.LensLike' f s a
outgoingTimelock = Data.ProtoLens.Field.field @"outgoingTimelock"
pairs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "pairs" a) =>
  Lens.Family2.LensLike' f s a
pairs = Data.ProtoLens.Field.field @"pairs"
paymentAddr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentAddr" a) =>
  Lens.Family2.LensLike' f s a
paymentAddr = Data.ProtoLens.Field.field @"paymentAddr"
paymentHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentHash" a) =>
  Lens.Family2.LensLike' f s a
paymentHash = Data.ProtoLens.Field.field @"paymentHash"
paymentRequest ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentRequest" a) =>
  Lens.Family2.LensLike' f s a
paymentRequest = Data.ProtoLens.Field.field @"paymentRequest"
preimage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "preimage" a) =>
  Lens.Family2.LensLike' f s a
preimage = Data.ProtoLens.Field.field @"preimage"
probability ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "probability" a) =>
  Lens.Family2.LensLike' f s a
probability = Data.ProtoLens.Field.field @"probability"
route ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "route" a) =>
  Lens.Family2.LensLike' f s a
route = Data.ProtoLens.Field.field @"route"
routeHints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "routeHints" a) =>
  Lens.Family2.LensLike' f s a
routeHints = Data.ProtoLens.Field.field @"routeHints"
routingFeeMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "routingFeeMsat" a) =>
  Lens.Family2.LensLike' f s a
routingFeeMsat = Data.ProtoLens.Field.field @"routingFeeMsat"
settleEvent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "settleEvent" a) =>
  Lens.Family2.LensLike' f s a
settleEvent = Data.ProtoLens.Field.field @"settleEvent"
state ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "state" a) =>
  Lens.Family2.LensLike' f s a
state = Data.ProtoLens.Field.field @"state"
successAmtMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "successAmtMsat" a) =>
  Lens.Family2.LensLike' f s a
successAmtMsat = Data.ProtoLens.Field.field @"successAmtMsat"
successAmtSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "successAmtSat" a) =>
  Lens.Family2.LensLike' f s a
successAmtSat = Data.ProtoLens.Field.field @"successAmtSat"
successTime ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "successTime" a) =>
  Lens.Family2.LensLike' f s a
successTime = Data.ProtoLens.Field.field @"successTime"
timeLockDelay ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timeLockDelay" a) =>
  Lens.Family2.LensLike' f s a
timeLockDelay = Data.ProtoLens.Field.field @"timeLockDelay"
timeoutSeconds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timeoutSeconds" a) =>
  Lens.Family2.LensLike' f s a
timeoutSeconds = Data.ProtoLens.Field.field @"timeoutSeconds"
timestampNs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timestampNs" a) =>
  Lens.Family2.LensLike' f s a
timestampNs = Data.ProtoLens.Field.field @"timestampNs"
toNode ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "toNode" a) =>
  Lens.Family2.LensLike' f s a
toNode = Data.ProtoLens.Field.field @"toNode"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
vec'destFeatures ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'destFeatures" a) =>
  Lens.Family2.LensLike' f s a
vec'destFeatures = Data.ProtoLens.Field.field @"vec'destFeatures"
vec'hopPubkeys ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'hopPubkeys" a) =>
  Lens.Family2.LensLike' f s a
vec'hopPubkeys = Data.ProtoLens.Field.field @"vec'hopPubkeys"
vec'htlcs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'htlcs" a) =>
  Lens.Family2.LensLike' f s a
vec'htlcs = Data.ProtoLens.Field.field @"vec'htlcs"
vec'outgoingChanIds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'outgoingChanIds" a) =>
  Lens.Family2.LensLike' f s a
vec'outgoingChanIds
  = Data.ProtoLens.Field.field @"vec'outgoingChanIds"
vec'pairs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'pairs" a) =>
  Lens.Family2.LensLike' f s a
vec'pairs = Data.ProtoLens.Field.field @"vec'pairs"
vec'routeHints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'routeHints" a) =>
  Lens.Family2.LensLike' f s a
vec'routeHints = Data.ProtoLens.Field.field @"vec'routeHints"
weight ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "weight" a) =>
  Lens.Family2.LensLike' f s a
weight = Data.ProtoLens.Field.field @"weight"
wireFailure ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "wireFailure" a) =>
  Lens.Family2.LensLike' f s a
wireFailure = Data.ProtoLens.Field.field @"wireFailure"