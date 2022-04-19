{- This file was auto-generated from lnrpc/ln1.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Lnrpc.Ln1_Fields where
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
acceptHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "acceptHeight" a) =>
  Lens.Family2.LensLike' f s a
acceptHeight = Data.ProtoLens.Field.field @"acceptHeight"
acceptTime ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "acceptTime" a) =>
  Lens.Family2.LensLike' f s a
acceptTime = Data.ProtoLens.Field.field @"acceptTime"
action ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "action" a) =>
  Lens.Family2.LensLike' f s a
action = Data.ProtoLens.Field.field @"action"
actions ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "actions" a) =>
  Lens.Family2.LensLike' f s a
actions = Data.ProtoLens.Field.field @"actions"
addIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "addIndex" a) =>
  Lens.Family2.LensLike' f s a
addIndex = Data.ProtoLens.Field.field @"addIndex"
allowExternalPermissions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "allowExternalPermissions" a) =>
  Lens.Family2.LensLike' f s a
allowExternalPermissions
  = Data.ProtoLens.Field.field @"allowExternalPermissions"
amp ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amp" a) =>
  Lens.Family2.LensLike' f s a
amp = Data.ProtoLens.Field.field @"amp"
ampInvoiceState ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ampInvoiceState" a) =>
  Lens.Family2.LensLike' f s a
ampInvoiceState = Data.ProtoLens.Field.field @"ampInvoiceState"
amtIn ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amtIn" a) =>
  Lens.Family2.LensLike' f s a
amtIn = Data.ProtoLens.Field.field @"amtIn"
amtInMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "amtInMsat" a) =>
  Lens.Family2.LensLike' f s a
amtInMsat = Data.ProtoLens.Field.field @"amtInMsat"
amtMsat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amtMsat" a) =>
  Lens.Family2.LensLike' f s a
amtMsat = Data.ProtoLens.Field.field @"amtMsat"
amtOut ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amtOut" a) =>
  Lens.Family2.LensLike' f s a
amtOut = Data.ProtoLens.Field.field @"amtOut"
amtOutMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "amtOutMsat" a) =>
  Lens.Family2.LensLike' f s a
amtOutMsat = Data.ProtoLens.Field.field @"amtOutMsat"
amtPaid ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amtPaid" a) =>
  Lens.Family2.LensLike' f s a
amtPaid = Data.ProtoLens.Field.field @"amtPaid"
amtPaidMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "amtPaidMsat" a) =>
  Lens.Family2.LensLike' f s a
amtPaidMsat = Data.ProtoLens.Field.field @"amtPaidMsat"
amtPaidSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "amtPaidSat" a) =>
  Lens.Family2.LensLike' f s a
amtPaidSat = Data.ProtoLens.Field.field @"amtPaidSat"
attemptId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "attemptId" a) =>
  Lens.Family2.LensLike' f s a
attemptId = Data.ProtoLens.Field.field @"attemptId"
attemptTimeNs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "attemptTimeNs" a) =>
  Lens.Family2.LensLike' f s a
attemptTimeNs = Data.ProtoLens.Field.field @"attemptTimeNs"
baseFee ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "baseFee" a) =>
  Lens.Family2.LensLike' f s a
baseFee = Data.ProtoLens.Field.field @"baseFee"
baseFeeMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "baseFeeMsat" a) =>
  Lens.Family2.LensLike' f s a
baseFeeMsat = Data.ProtoLens.Field.field @"baseFeeMsat"
chainHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chainHash" a) =>
  Lens.Family2.LensLike' f s a
chainHash = Data.ProtoLens.Field.field @"chainHash"
chanBackup ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanBackup" a) =>
  Lens.Family2.LensLike' f s a
chanBackup = Data.ProtoLens.Field.field @"chanBackup"
chanBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanBackups" a) =>
  Lens.Family2.LensLike' f s a
chanBackups = Data.ProtoLens.Field.field @"chanBackups"
chanId ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "chanId" a) =>
  Lens.Family2.LensLike' f s a
chanId = Data.ProtoLens.Field.field @"chanId"
chanIdIn ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanIdIn" a) =>
  Lens.Family2.LensLike' f s a
chanIdIn = Data.ProtoLens.Field.field @"chanIdIn"
chanIdOut ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanIdOut" a) =>
  Lens.Family2.LensLike' f s a
chanIdOut = Data.ProtoLens.Field.field @"chanIdOut"
chanPoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanPoint" a) =>
  Lens.Family2.LensLike' f s a
chanPoint = Data.ProtoLens.Field.field @"chanPoint"
chanPoints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanPoints" a) =>
  Lens.Family2.LensLike' f s a
chanPoints = Data.ProtoLens.Field.field @"chanPoints"
channelFees ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channelFees" a) =>
  Lens.Family2.LensLike' f s a
channelFees = Data.ProtoLens.Field.field @"channelFees"
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
channelUpdate ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channelUpdate" a) =>
  Lens.Family2.LensLike' f s a
channelUpdate = Data.ProtoLens.Field.field @"channelUpdate"
childIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "childIndex" a) =>
  Lens.Family2.LensLike' f s a
childIndex = Data.ProtoLens.Field.field @"childIndex"
cltvExpiry ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "cltvExpiry" a) =>
  Lens.Family2.LensLike' f s a
cltvExpiry = Data.ProtoLens.Field.field @"cltvExpiry"
code ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "code" a) =>
  Lens.Family2.LensLike' f s a
code = Data.ProtoLens.Field.field @"code"
creationDate ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "creationDate" a) =>
  Lens.Family2.LensLike' f s a
creationDate = Data.ProtoLens.Field.field @"creationDate"
creationTimeNs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "creationTimeNs" a) =>
  Lens.Family2.LensLike' f s a
creationTimeNs = Data.ProtoLens.Field.field @"creationTimeNs"
customCaveatCondition ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "customCaveatCondition" a) =>
  Lens.Family2.LensLike' f s a
customCaveatCondition
  = Data.ProtoLens.Field.field @"customCaveatCondition"
customMacaroonCaveatName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "customMacaroonCaveatName" a) =>
  Lens.Family2.LensLike' f s a
customMacaroonCaveatName
  = Data.ProtoLens.Field.field @"customMacaroonCaveatName"
customRecords ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "customRecords" a) =>
  Lens.Family2.LensLike' f s a
customRecords = Data.ProtoLens.Field.field @"customRecords"
dayFeeSum ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "dayFeeSum" a) =>
  Lens.Family2.LensLike' f s a
dayFeeSum = Data.ProtoLens.Field.field @"dayFeeSum"
deleted ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "deleted" a) =>
  Lens.Family2.LensLike' f s a
deleted = Data.ProtoLens.Field.field @"deleted"
description ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "description" a) =>
  Lens.Family2.LensLike' f s a
description = Data.ProtoLens.Field.field @"description"
descriptionHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "descriptionHash" a) =>
  Lens.Family2.LensLike' f s a
descriptionHash = Data.ProtoLens.Field.field @"descriptionHash"
destination ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "destination" a) =>
  Lens.Family2.LensLike' f s a
destination = Data.ProtoLens.Field.field @"destination"
endTime ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "endTime" a) =>
  Lens.Family2.LensLike' f s a
endTime = Data.ProtoLens.Field.field @"endTime"
entity ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "entity" a) =>
  Lens.Family2.LensLike' f s a
entity = Data.ProtoLens.Field.field @"entity"
error ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "error" a) =>
  Lens.Family2.LensLike' f s a
error = Data.ProtoLens.Field.field @"error"
expiry ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "expiry" a) =>
  Lens.Family2.LensLike' f s a
expiry = Data.ProtoLens.Field.field @"expiry"
expiryHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "expiryHeight" a) =>
  Lens.Family2.LensLike' f s a
expiryHeight = Data.ProtoLens.Field.field @"expiryHeight"
extraOpaqueData ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "extraOpaqueData" a) =>
  Lens.Family2.LensLike' f s a
extraOpaqueData = Data.ProtoLens.Field.field @"extraOpaqueData"
failedHtlcsOnly ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failedHtlcsOnly" a) =>
  Lens.Family2.LensLike' f s a
failedHtlcsOnly = Data.ProtoLens.Field.field @"failedHtlcsOnly"
failedPaymentsOnly ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failedPaymentsOnly" a) =>
  Lens.Family2.LensLike' f s a
failedPaymentsOnly
  = Data.ProtoLens.Field.field @"failedPaymentsOnly"
failedUpdates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failedUpdates" a) =>
  Lens.Family2.LensLike' f s a
failedUpdates = Data.ProtoLens.Field.field @"failedUpdates"
failure ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "failure" a) =>
  Lens.Family2.LensLike' f s a
failure = Data.ProtoLens.Field.field @"failure"
failureReason ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failureReason" a) =>
  Lens.Family2.LensLike' f s a
failureReason = Data.ProtoLens.Field.field @"failureReason"
failureSourceIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "failureSourceIndex" a) =>
  Lens.Family2.LensLike' f s a
failureSourceIndex
  = Data.ProtoLens.Field.field @"failureSourceIndex"
fallbackAddr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fallbackAddr" a) =>
  Lens.Family2.LensLike' f s a
fallbackAddr = Data.ProtoLens.Field.field @"fallbackAddr"
features ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "features" a) =>
  Lens.Family2.LensLike' f s a
features = Data.ProtoLens.Field.field @"features"
fee ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "fee" a) =>
  Lens.Family2.LensLike' f s a
fee = Data.ProtoLens.Field.field @"fee"
feeMsat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "feeMsat" a) =>
  Lens.Family2.LensLike' f s a
feeMsat = Data.ProtoLens.Field.field @"feeMsat"
feePerMil ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feePerMil" a) =>
  Lens.Family2.LensLike' f s a
feePerMil = Data.ProtoLens.Field.field @"feePerMil"
feeRate ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "feeRate" a) =>
  Lens.Family2.LensLike' f s a
feeRate = Data.ProtoLens.Field.field @"feeRate"
feeSat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "feeSat" a) =>
  Lens.Family2.LensLike' f s a
feeSat = Data.ProtoLens.Field.field @"feeSat"
feedback ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feedback" a) =>
  Lens.Family2.LensLike' f s a
feedback = Data.ProtoLens.Field.field @"feedback"
firstIndexOffset ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "firstIndexOffset" a) =>
  Lens.Family2.LensLike' f s a
firstIndexOffset = Data.ProtoLens.Field.field @"firstIndexOffset"
flags ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "flags" a) =>
  Lens.Family2.LensLike' f s a
flags = Data.ProtoLens.Field.field @"flags"
forwardingEvents ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "forwardingEvents" a) =>
  Lens.Family2.LensLike' f s a
forwardingEvents = Data.ProtoLens.Field.field @"forwardingEvents"
fullMethod ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fullMethod" a) =>
  Lens.Family2.LensLike' f s a
fullMethod = Data.ProtoLens.Field.field @"fullMethod"
global ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "global" a) =>
  Lens.Family2.LensLike' f s a
global = Data.ProtoLens.Field.field @"global"
hash ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "hash" a) =>
  Lens.Family2.LensLike' f s a
hash = Data.ProtoLens.Field.field @"hash"
height ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "height" a) =>
  Lens.Family2.LensLike' f s a
height = Data.ProtoLens.Field.field @"height"
htlcIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "htlcIndex" a) =>
  Lens.Family2.LensLike' f s a
htlcIndex = Data.ProtoLens.Field.field @"htlcIndex"
htlcMaximumMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "htlcMaximumMsat" a) =>
  Lens.Family2.LensLike' f s a
htlcMaximumMsat = Data.ProtoLens.Field.field @"htlcMaximumMsat"
htlcMinimumMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "htlcMinimumMsat" a) =>
  Lens.Family2.LensLike' f s a
htlcMinimumMsat = Data.ProtoLens.Field.field @"htlcMinimumMsat"
htlcMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "htlcMsat" a) =>
  Lens.Family2.LensLike' f s a
htlcMsat = Data.ProtoLens.Field.field @"htlcMsat"
htlcs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "htlcs" a) =>
  Lens.Family2.LensLike' f s a
htlcs = Data.ProtoLens.Field.field @"htlcs"
iKnowWhatIAmDoing ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "iKnowWhatIAmDoing" a) =>
  Lens.Family2.LensLike' f s a
iKnowWhatIAmDoing = Data.ProtoLens.Field.field @"iKnowWhatIAmDoing"
includeIncomplete ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "includeIncomplete" a) =>
  Lens.Family2.LensLike' f s a
includeIncomplete = Data.ProtoLens.Field.field @"includeIncomplete"
indexOffset ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "indexOffset" a) =>
  Lens.Family2.LensLike' f s a
indexOffset = Data.ProtoLens.Field.field @"indexOffset"
invoices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "invoices" a) =>
  Lens.Family2.LensLike' f s a
invoices = Data.ProtoLens.Field.field @"invoices"
isAmp ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "isAmp" a) =>
  Lens.Family2.LensLike' f s a
isAmp = Data.ProtoLens.Field.field @"isAmp"
isKeysend ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "isKeysend" a) =>
  Lens.Family2.LensLike' f s a
isKeysend = Data.ProtoLens.Field.field @"isKeysend"
key ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "key" a) =>
  Lens.Family2.LensLike' f s a
key = Data.ProtoLens.Field.field @"key"
lastIndexOffset ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastIndexOffset" a) =>
  Lens.Family2.LensLike' f s a
lastIndexOffset = Data.ProtoLens.Field.field @"lastIndexOffset"
lastOffsetIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastOffsetIndex" a) =>
  Lens.Family2.LensLike' f s a
lastOffsetIndex = Data.ProtoLens.Field.field @"lastOffsetIndex"
levelSpec ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "levelSpec" a) =>
  Lens.Family2.LensLike' f s a
levelSpec = Data.ProtoLens.Field.field @"levelSpec"
macaroon ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "macaroon" a) =>
  Lens.Family2.LensLike' f s a
macaroon = Data.ProtoLens.Field.field @"macaroon"
maxHtlcMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxHtlcMsat" a) =>
  Lens.Family2.LensLike' f s a
maxHtlcMsat = Data.ProtoLens.Field.field @"maxHtlcMsat"
maxPayments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxPayments" a) =>
  Lens.Family2.LensLike' f s a
maxPayments = Data.ProtoLens.Field.field @"maxPayments"
maybe'amp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'amp" a) =>
  Lens.Family2.LensLike' f s a
maybe'amp = Data.ProtoLens.Field.field @"maybe'amp"
maybe'backup ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'backup" a) =>
  Lens.Family2.LensLike' f s a
maybe'backup = Data.ProtoLens.Field.field @"maybe'backup"
maybe'chanBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'chanBackups" a) =>
  Lens.Family2.LensLike' f s a
maybe'chanBackups = Data.ProtoLens.Field.field @"maybe'chanBackups"
maybe'chanPoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'chanPoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'chanPoint = Data.ProtoLens.Field.field @"maybe'chanPoint"
maybe'channelPoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'channelPoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'channelPoint
  = Data.ProtoLens.Field.field @"maybe'channelPoint"
maybe'channelUpdate ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'channelUpdate" a) =>
  Lens.Family2.LensLike' f s a
maybe'channelUpdate
  = Data.ProtoLens.Field.field @"maybe'channelUpdate"
maybe'failure ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'failure" a) =>
  Lens.Family2.LensLike' f s a
maybe'failure = Data.ProtoLens.Field.field @"maybe'failure"
maybe'feedback ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'feedback" a) =>
  Lens.Family2.LensLike' f s a
maybe'feedback = Data.ProtoLens.Field.field @"maybe'feedback"
maybe'global ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'global" a) =>
  Lens.Family2.LensLike' f s a
maybe'global = Data.ProtoLens.Field.field @"maybe'global"
maybe'interceptType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'interceptType" a) =>
  Lens.Family2.LensLike' f s a
maybe'interceptType
  = Data.ProtoLens.Field.field @"maybe'interceptType"
maybe'middlewareMessage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'middlewareMessage" a) =>
  Lens.Family2.LensLike' f s a
maybe'middlewareMessage
  = Data.ProtoLens.Field.field @"maybe'middlewareMessage"
maybe'multiChanBackup ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'multiChanBackup" a) =>
  Lens.Family2.LensLike' f s a
maybe'multiChanBackup
  = Data.ProtoLens.Field.field @"maybe'multiChanBackup"
maybe'outpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'outpoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'outpoint = Data.ProtoLens.Field.field @"maybe'outpoint"
maybe'register ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'register" a) =>
  Lens.Family2.LensLike' f s a
maybe'register = Data.ProtoLens.Field.field @"maybe'register"
maybe'request ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'request" a) =>
  Lens.Family2.LensLike' f s a
maybe'request = Data.ProtoLens.Field.field @"maybe'request"
maybe'response ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'response" a) =>
  Lens.Family2.LensLike' f s a
maybe'response = Data.ProtoLens.Field.field @"maybe'response"
maybe'route ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'route" a) =>
  Lens.Family2.LensLike' f s a
maybe'route = Data.ProtoLens.Field.field @"maybe'route"
maybe'scope ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'scope" a) =>
  Lens.Family2.LensLike' f s a
maybe'scope = Data.ProtoLens.Field.field @"maybe'scope"
maybe'singleChanBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'singleChanBackups" a) =>
  Lens.Family2.LensLike' f s a
maybe'singleChanBackups
  = Data.ProtoLens.Field.field @"maybe'singleChanBackups"
maybe'streamAuth ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'streamAuth" a) =>
  Lens.Family2.LensLike' f s a
maybe'streamAuth = Data.ProtoLens.Field.field @"maybe'streamAuth"
maybe'value ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'value" a) =>
  Lens.Family2.LensLike' f s a
maybe'value = Data.ProtoLens.Field.field @"maybe'value"
memo ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "memo" a) =>
  Lens.Family2.LensLike' f s a
memo = Data.ProtoLens.Field.field @"memo"
messageFlags ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "messageFlags" a) =>
  Lens.Family2.LensLike' f s a
messageFlags = Data.ProtoLens.Field.field @"messageFlags"
methodFullUri ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "methodFullUri" a) =>
  Lens.Family2.LensLike' f s a
methodFullUri = Data.ProtoLens.Field.field @"methodFullUri"
methodPermissions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "methodPermissions" a) =>
  Lens.Family2.LensLike' f s a
methodPermissions = Data.ProtoLens.Field.field @"methodPermissions"
middlewareName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "middlewareName" a) =>
  Lens.Family2.LensLike' f s a
middlewareName = Data.ProtoLens.Field.field @"middlewareName"
minHtlcMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minHtlcMsat" a) =>
  Lens.Family2.LensLike' f s a
minHtlcMsat = Data.ProtoLens.Field.field @"minHtlcMsat"
minHtlcMsatSpecified ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minHtlcMsatSpecified" a) =>
  Lens.Family2.LensLike' f s a
minHtlcMsatSpecified
  = Data.ProtoLens.Field.field @"minHtlcMsatSpecified"
monthFeeSum ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "monthFeeSum" a) =>
  Lens.Family2.LensLike' f s a
monthFeeSum = Data.ProtoLens.Field.field @"monthFeeSum"
mppTotalAmtMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "mppTotalAmtMsat" a) =>
  Lens.Family2.LensLike' f s a
mppTotalAmtMsat = Data.ProtoLens.Field.field @"mppTotalAmtMsat"
msgId ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "msgId" a) =>
  Lens.Family2.LensLike' f s a
msgId = Data.ProtoLens.Field.field @"msgId"
multiChanBackup ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "multiChanBackup" a) =>
  Lens.Family2.LensLike' f s a
multiChanBackup = Data.ProtoLens.Field.field @"multiChanBackup"
nonce ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "nonce" a) =>
  Lens.Family2.LensLike' f s a
nonce = Data.ProtoLens.Field.field @"nonce"
numMaxEvents ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numMaxEvents" a) =>
  Lens.Family2.LensLike' f s a
numMaxEvents = Data.ProtoLens.Field.field @"numMaxEvents"
numMaxInvoices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numMaxInvoices" a) =>
  Lens.Family2.LensLike' f s a
numMaxInvoices = Data.ProtoLens.Field.field @"numMaxInvoices"
numMsat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "numMsat" a) =>
  Lens.Family2.LensLike' f s a
numMsat = Data.ProtoLens.Field.field @"numMsat"
numSatoshis ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numSatoshis" a) =>
  Lens.Family2.LensLike' f s a
numSatoshis = Data.ProtoLens.Field.field @"numSatoshis"
onionSha256 ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "onionSha256" a) =>
  Lens.Family2.LensLike' f s a
onionSha256 = Data.ProtoLens.Field.field @"onionSha256"
ops ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "ops" a) =>
  Lens.Family2.LensLike' f s a
ops = Data.ProtoLens.Field.field @"ops"
outpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outpoint" a) =>
  Lens.Family2.LensLike' f s a
outpoint = Data.ProtoLens.Field.field @"outpoint"
payReq ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "payReq" a) =>
  Lens.Family2.LensLike' f s a
payReq = Data.ProtoLens.Field.field @"payReq"
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
paymentIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentIndex" a) =>
  Lens.Family2.LensLike' f s a
paymentIndex = Data.ProtoLens.Field.field @"paymentIndex"
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
payments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "payments" a) =>
  Lens.Family2.LensLike' f s a
payments = Data.ProtoLens.Field.field @"payments"
pendingFundingShimOnly ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingFundingShimOnly" a) =>
  Lens.Family2.LensLike' f s a
pendingFundingShimOnly
  = Data.ProtoLens.Field.field @"pendingFundingShimOnly"
pendingOnly ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingOnly" a) =>
  Lens.Family2.LensLike' f s a
pendingOnly = Data.ProtoLens.Field.field @"pendingOnly"
permissions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "permissions" a) =>
  Lens.Family2.LensLike' f s a
permissions = Data.ProtoLens.Field.field @"permissions"
preimage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "preimage" a) =>
  Lens.Family2.LensLike' f s a
preimage = Data.ProtoLens.Field.field @"preimage"
private ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "private" a) =>
  Lens.Family2.LensLike' f s a
private = Data.ProtoLens.Field.field @"private"
rHash ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "rHash" a) =>
  Lens.Family2.LensLike' f s a
rHash = Data.ProtoLens.Field.field @"rHash"
rHashStr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rHashStr" a) =>
  Lens.Family2.LensLike' f s a
rHashStr = Data.ProtoLens.Field.field @"rHashStr"
rPreimage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rPreimage" a) =>
  Lens.Family2.LensLike' f s a
rPreimage = Data.ProtoLens.Field.field @"rPreimage"
rawMacaroon ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rawMacaroon" a) =>
  Lens.Family2.LensLike' f s a
rawMacaroon = Data.ProtoLens.Field.field @"rawMacaroon"
readOnlyMode ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "readOnlyMode" a) =>
  Lens.Family2.LensLike' f s a
readOnlyMode = Data.ProtoLens.Field.field @"readOnlyMode"
reason ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "reason" a) =>
  Lens.Family2.LensLike' f s a
reason = Data.ProtoLens.Field.field @"reason"
refMsgId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "refMsgId" a) =>
  Lens.Family2.LensLike' f s a
refMsgId = Data.ProtoLens.Field.field @"refMsgId"
register ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "register" a) =>
  Lens.Family2.LensLike' f s a
register = Data.ProtoLens.Field.field @"register"
replaceResponse ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "replaceResponse" a) =>
  Lens.Family2.LensLike' f s a
replaceResponse = Data.ProtoLens.Field.field @"replaceResponse"
replacementSerialized ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "replacementSerialized" a) =>
  Lens.Family2.LensLike' f s a
replacementSerialized
  = Data.ProtoLens.Field.field @"replacementSerialized"
request ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "request" a) =>
  Lens.Family2.LensLike' f s a
request = Data.ProtoLens.Field.field @"request"
requestId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "requestId" a) =>
  Lens.Family2.LensLike' f s a
requestId = Data.ProtoLens.Field.field @"requestId"
resolveTime ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "resolveTime" a) =>
  Lens.Family2.LensLike' f s a
resolveTime = Data.ProtoLens.Field.field @"resolveTime"
resolveTimeNs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "resolveTimeNs" a) =>
  Lens.Family2.LensLike' f s a
resolveTimeNs = Data.ProtoLens.Field.field @"resolveTimeNs"
response ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "response" a) =>
  Lens.Family2.LensLike' f s a
response = Data.ProtoLens.Field.field @"response"
reversed ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "reversed" a) =>
  Lens.Family2.LensLike' f s a
reversed = Data.ProtoLens.Field.field @"reversed"
rootKeyId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rootKeyId" a) =>
  Lens.Family2.LensLike' f s a
rootKeyId = Data.ProtoLens.Field.field @"rootKeyId"
rootKeyIds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rootKeyIds" a) =>
  Lens.Family2.LensLike' f s a
rootKeyIds = Data.ProtoLens.Field.field @"rootKeyIds"
rootShare ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rootShare" a) =>
  Lens.Family2.LensLike' f s a
rootShare = Data.ProtoLens.Field.field @"rootShare"
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
serialized ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "serialized" a) =>
  Lens.Family2.LensLike' f s a
serialized = Data.ProtoLens.Field.field @"serialized"
setId ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "setId" a) =>
  Lens.Family2.LensLike' f s a
setId = Data.ProtoLens.Field.field @"setId"
settleDate ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "settleDate" a) =>
  Lens.Family2.LensLike' f s a
settleDate = Data.ProtoLens.Field.field @"settleDate"
settleIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "settleIndex" a) =>
  Lens.Family2.LensLike' f s a
settleIndex = Data.ProtoLens.Field.field @"settleIndex"
settleTime ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "settleTime" a) =>
  Lens.Family2.LensLike' f s a
settleTime = Data.ProtoLens.Field.field @"settleTime"
settled ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "settled" a) =>
  Lens.Family2.LensLike' f s a
settled = Data.ProtoLens.Field.field @"settled"
show ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "show" a) =>
  Lens.Family2.LensLike' f s a
show = Data.ProtoLens.Field.field @"show"
signature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "signature" a) =>
  Lens.Family2.LensLike' f s a
signature = Data.ProtoLens.Field.field @"signature"
singleChanBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "singleChanBackups" a) =>
  Lens.Family2.LensLike' f s a
singleChanBackups = Data.ProtoLens.Field.field @"singleChanBackups"
startTime ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "startTime" a) =>
  Lens.Family2.LensLike' f s a
startTime = Data.ProtoLens.Field.field @"startTime"
state ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "state" a) =>
  Lens.Family2.LensLike' f s a
state = Data.ProtoLens.Field.field @"state"
status ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "status" a) =>
  Lens.Family2.LensLike' f s a
status = Data.ProtoLens.Field.field @"status"
storageId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "storageId" a) =>
  Lens.Family2.LensLike' f s a
storageId = Data.ProtoLens.Field.field @"storageId"
streamAuth ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "streamAuth" a) =>
  Lens.Family2.LensLike' f s a
streamAuth = Data.ProtoLens.Field.field @"streamAuth"
streamRpc ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "streamRpc" a) =>
  Lens.Family2.LensLike' f s a
streamRpc = Data.ProtoLens.Field.field @"streamRpc"
subSystems ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "subSystems" a) =>
  Lens.Family2.LensLike' f s a
subSystems = Data.ProtoLens.Field.field @"subSystems"
timeLockDelta ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timeLockDelta" a) =>
  Lens.Family2.LensLike' f s a
timeLockDelta = Data.ProtoLens.Field.field @"timeLockDelta"
timestamp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timestamp" a) =>
  Lens.Family2.LensLike' f s a
timestamp = Data.ProtoLens.Field.field @"timestamp"
timestampNs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timestampNs" a) =>
  Lens.Family2.LensLike' f s a
timestampNs = Data.ProtoLens.Field.field @"timestampNs"
typeName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "typeName" a) =>
  Lens.Family2.LensLike' f s a
typeName = Data.ProtoLens.Field.field @"typeName"
updateError ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "updateError" a) =>
  Lens.Family2.LensLike' f s a
updateError = Data.ProtoLens.Field.field @"updateError"
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
valueMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "valueMsat" a) =>
  Lens.Family2.LensLike' f s a
valueMsat = Data.ProtoLens.Field.field @"valueMsat"
valueSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "valueSat" a) =>
  Lens.Family2.LensLike' f s a
valueSat = Data.ProtoLens.Field.field @"valueSat"
vec'actions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'actions" a) =>
  Lens.Family2.LensLike' f s a
vec'actions = Data.ProtoLens.Field.field @"vec'actions"
vec'chanBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'chanBackups" a) =>
  Lens.Family2.LensLike' f s a
vec'chanBackups = Data.ProtoLens.Field.field @"vec'chanBackups"
vec'chanPoints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'chanPoints" a) =>
  Lens.Family2.LensLike' f s a
vec'chanPoints = Data.ProtoLens.Field.field @"vec'chanPoints"
vec'channelFees ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'channelFees" a) =>
  Lens.Family2.LensLike' f s a
vec'channelFees = Data.ProtoLens.Field.field @"vec'channelFees"
vec'failedUpdates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'failedUpdates" a) =>
  Lens.Family2.LensLike' f s a
vec'failedUpdates = Data.ProtoLens.Field.field @"vec'failedUpdates"
vec'forwardingEvents ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'forwardingEvents" a) =>
  Lens.Family2.LensLike' f s a
vec'forwardingEvents
  = Data.ProtoLens.Field.field @"vec'forwardingEvents"
vec'htlcs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'htlcs" a) =>
  Lens.Family2.LensLike' f s a
vec'htlcs = Data.ProtoLens.Field.field @"vec'htlcs"
vec'invoices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'invoices" a) =>
  Lens.Family2.LensLike' f s a
vec'invoices = Data.ProtoLens.Field.field @"vec'invoices"
vec'ops ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "vec'ops" a) =>
  Lens.Family2.LensLike' f s a
vec'ops = Data.ProtoLens.Field.field @"vec'ops"
vec'payments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'payments" a) =>
  Lens.Family2.LensLike' f s a
vec'payments = Data.ProtoLens.Field.field @"vec'payments"
vec'permissions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'permissions" a) =>
  Lens.Family2.LensLike' f s a
vec'permissions = Data.ProtoLens.Field.field @"vec'permissions"
vec'rootKeyIds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'rootKeyIds" a) =>
  Lens.Family2.LensLike' f s a
vec'rootKeyIds = Data.ProtoLens.Field.field @"vec'rootKeyIds"
vec'routeHints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'routeHints" a) =>
  Lens.Family2.LensLike' f s a
vec'routeHints = Data.ProtoLens.Field.field @"vec'routeHints"
weekFeeSum ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "weekFeeSum" a) =>
  Lens.Family2.LensLike' f s a
weekFeeSum = Data.ProtoLens.Field.field @"weekFeeSum"