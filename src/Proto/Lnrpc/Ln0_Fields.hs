{- This file was auto-generated from lnrpc/ln0.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Lnrpc.Ln0_Fields where
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
accountBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "accountBalance" a) =>
  Lens.Family2.LensLike' f s a
accountBalance = Data.ProtoLens.Field.field @"accountBalance"
active ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "active" a) =>
  Lens.Family2.LensLike' f s a
active = Data.ProtoLens.Field.field @"active"
activeChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "activeChannel" a) =>
  Lens.Family2.LensLike' f s a
activeChannel = Data.ProtoLens.Field.field @"activeChannel"
addr ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "addr" a) =>
  Lens.Family2.LensLike' f s a
addr = Data.ProtoLens.Field.field @"addr"
addresses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "addresses" a) =>
  Lens.Family2.LensLike' f s a
addresses = Data.ProtoLens.Field.field @"addresses"
advertisingNode ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "advertisingNode" a) =>
  Lens.Family2.LensLike' f s a
advertisingNode = Data.ProtoLens.Field.field @"advertisingNode"
alias ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "alias" a) =>
  Lens.Family2.LensLike' f s a
alias = Data.ProtoLens.Field.field @"alias"
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
ampRecord ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ampRecord" a) =>
  Lens.Family2.LensLike' f s a
ampRecord = Data.ProtoLens.Field.field @"ampRecord"
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
amtToForward ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "amtToForward" a) =>
  Lens.Family2.LensLike' f s a
amtToForward = Data.ProtoLens.Field.field @"amtToForward"
amtToForwardMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "amtToForwardMsat" a) =>
  Lens.Family2.LensLike' f s a
amtToForwardMsat = Data.ProtoLens.Field.field @"amtToForwardMsat"
anchor ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "anchor" a) =>
  Lens.Family2.LensLike' f s a
anchor = Data.ProtoLens.Field.field @"anchor"
avgChannelSize ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "avgChannelSize" a) =>
  Lens.Family2.LensLike' f s a
avgChannelSize = Data.ProtoLens.Field.field @"avgChannelSize"
avgOutDegree ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "avgOutDegree" a) =>
  Lens.Family2.LensLike' f s a
avgOutDegree = Data.ProtoLens.Field.field @"avgOutDegree"
balance ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "balance" a) =>
  Lens.Family2.LensLike' f s a
balance = Data.ProtoLens.Field.field @"balance"
basePsbt ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "basePsbt" a) =>
  Lens.Family2.LensLike' f s a
basePsbt = Data.ProtoLens.Field.field @"basePsbt"
betweennessCentrality ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "betweennessCentrality" a) =>
  Lens.Family2.LensLike' f s a
betweennessCentrality
  = Data.ProtoLens.Field.field @"betweennessCentrality"
blocksTilMaturity ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "blocksTilMaturity" a) =>
  Lens.Family2.LensLike' f s a
blocksTilMaturity = Data.ProtoLens.Field.field @"blocksTilMaturity"
capacity ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "capacity" a) =>
  Lens.Family2.LensLike' f s a
capacity = Data.ProtoLens.Field.field @"capacity"
chainHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chainHash" a) =>
  Lens.Family2.LensLike' f s a
chainHash = Data.ProtoLens.Field.field @"chainHash"
chanCapacity ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanCapacity" a) =>
  Lens.Family2.LensLike' f s a
chanCapacity = Data.ProtoLens.Field.field @"chanCapacity"
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
chanPointShim ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanPointShim" a) =>
  Lens.Family2.LensLike' f s a
chanPointShim = Data.ProtoLens.Field.field @"chanPointShim"
chanReserveSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanReserveSat" a) =>
  Lens.Family2.LensLike' f s a
chanReserveSat = Data.ProtoLens.Field.field @"chanReserveSat"
chanStatusFlags ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chanStatusFlags" a) =>
  Lens.Family2.LensLike' f s a
chanStatusFlags = Data.ProtoLens.Field.field @"chanStatusFlags"
channel ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "channel" a) =>
  Lens.Family2.LensLike' f s a
channel = Data.ProtoLens.Field.field @"channel"
channelId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channelId" a) =>
  Lens.Family2.LensLike' f s a
channelId = Data.ProtoLens.Field.field @"channelId"
channelPoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channelPoint" a) =>
  Lens.Family2.LensLike' f s a
channelPoint = Data.ProtoLens.Field.field @"channelPoint"
channelUpdates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channelUpdates" a) =>
  Lens.Family2.LensLike' f s a
channelUpdates = Data.ProtoLens.Field.field @"channelUpdates"
channels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channels" a) =>
  Lens.Family2.LensLike' f s a
channels = Data.ProtoLens.Field.field @"channels"
childIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "childIndex" a) =>
  Lens.Family2.LensLike' f s a
childIndex = Data.ProtoLens.Field.field @"childIndex"
closeAddress ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closeAddress" a) =>
  Lens.Family2.LensLike' f s a
closeAddress = Data.ProtoLens.Field.field @"closeAddress"
closeHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closeHeight" a) =>
  Lens.Family2.LensLike' f s a
closeHeight = Data.ProtoLens.Field.field @"closeHeight"
closeInitiator ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closeInitiator" a) =>
  Lens.Family2.LensLike' f s a
closeInitiator = Data.ProtoLens.Field.field @"closeInitiator"
closeType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closeType" a) =>
  Lens.Family2.LensLike' f s a
closeType = Data.ProtoLens.Field.field @"closeType"
closedChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closedChannel" a) =>
  Lens.Family2.LensLike' f s a
closedChannel = Data.ProtoLens.Field.field @"closedChannel"
closedChans ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closedChans" a) =>
  Lens.Family2.LensLike' f s a
closedChans = Data.ProtoLens.Field.field @"closedChans"
closedHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closedHeight" a) =>
  Lens.Family2.LensLike' f s a
closedHeight = Data.ProtoLens.Field.field @"closedHeight"
closingTxHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closingTxHash" a) =>
  Lens.Family2.LensLike' f s a
closingTxHash = Data.ProtoLens.Field.field @"closingTxHash"
closingTxid ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "closingTxid" a) =>
  Lens.Family2.LensLike' f s a
closingTxid = Data.ProtoLens.Field.field @"closingTxid"
cltvExpiryDelta ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "cltvExpiryDelta" a) =>
  Lens.Family2.LensLike' f s a
cltvExpiryDelta = Data.ProtoLens.Field.field @"cltvExpiryDelta"
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
commitFee ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "commitFee" a) =>
  Lens.Family2.LensLike' f s a
commitFee = Data.ProtoLens.Field.field @"commitFee"
commitWeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "commitWeight" a) =>
  Lens.Family2.LensLike' f s a
commitWeight = Data.ProtoLens.Field.field @"commitWeight"
commitmentType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "commitmentType" a) =>
  Lens.Family2.LensLike' f s a
commitmentType = Data.ProtoLens.Field.field @"commitmentType"
commitments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "commitments" a) =>
  Lens.Family2.LensLike' f s a
commitments = Data.ProtoLens.Field.field @"commitments"
confirmationHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "confirmationHeight" a) =>
  Lens.Family2.LensLike' f s a
confirmationHeight
  = Data.ProtoLens.Field.field @"confirmationHeight"
confirmedBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "confirmedBalance" a) =>
  Lens.Family2.LensLike' f s a
confirmedBalance = Data.ProtoLens.Field.field @"confirmedBalance"
connectingNode ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "connectingNode" a) =>
  Lens.Family2.LensLike' f s a
connectingNode = Data.ProtoLens.Field.field @"connectingNode"
csvDelay ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "csvDelay" a) =>
  Lens.Family2.LensLike' f s a
csvDelay = Data.ProtoLens.Field.field @"csvDelay"
customRecords ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "customRecords" a) =>
  Lens.Family2.LensLike' f s a
customRecords = Data.ProtoLens.Field.field @"customRecords"
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
directionReverse ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "directionReverse" a) =>
  Lens.Family2.LensLike' f s a
directionReverse = Data.ProtoLens.Field.field @"directionReverse"
disabled ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "disabled" a) =>
  Lens.Family2.LensLike' f s a
disabled = Data.ProtoLens.Field.field @"disabled"
dustLimitSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "dustLimitSat" a) =>
  Lens.Family2.LensLike' f s a
dustLimitSat = Data.ProtoLens.Field.field @"dustLimitSat"
edges ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "edges" a) =>
  Lens.Family2.LensLike' f s a
edges = Data.ProtoLens.Field.field @"edges"
expirationHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "expirationHeight" a) =>
  Lens.Family2.LensLike' f s a
expirationHeight = Data.ProtoLens.Field.field @"expirationHeight"
expiry ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "expiry" a) =>
  Lens.Family2.LensLike' f s a
expiry = Data.ProtoLens.Field.field @"expiry"
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
feeBaseMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feeBaseMsat" a) =>
  Lens.Family2.LensLike' f s a
feeBaseMsat = Data.ProtoLens.Field.field @"feeBaseMsat"
feeLimit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feeLimit" a) =>
  Lens.Family2.LensLike' f s a
feeLimit = Data.ProtoLens.Field.field @"feeLimit"
feeMsat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "feeMsat" a) =>
  Lens.Family2.LensLike' f s a
feeMsat = Data.ProtoLens.Field.field @"feeMsat"
feePerKw ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feePerKw" a) =>
  Lens.Family2.LensLike' f s a
feePerKw = Data.ProtoLens.Field.field @"feePerKw"
feeProportionalMillionths ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feeProportionalMillionths" a) =>
  Lens.Family2.LensLike' f s a
feeProportionalMillionths
  = Data.ProtoLens.Field.field @"feeProportionalMillionths"
feeRateMilliMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "feeRateMilliMsat" a) =>
  Lens.Family2.LensLike' f s a
feeRateMilliMsat = Data.ProtoLens.Field.field @"feeRateMilliMsat"
finalCltvDelta ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "finalCltvDelta" a) =>
  Lens.Family2.LensLike' f s a
finalCltvDelta = Data.ProtoLens.Field.field @"finalCltvDelta"
finalRawTx ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "finalRawTx" a) =>
  Lens.Family2.LensLike' f s a
finalRawTx = Data.ProtoLens.Field.field @"finalRawTx"
fixed ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "fixed" a) =>
  Lens.Family2.LensLike' f s a
fixed = Data.ProtoLens.Field.field @"fixed"
fixedMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fixedMsat" a) =>
  Lens.Family2.LensLike' f s a
fixedMsat = Data.ProtoLens.Field.field @"fixedMsat"
forwardingChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "forwardingChannel" a) =>
  Lens.Family2.LensLike' f s a
forwardingChannel = Data.ProtoLens.Field.field @"forwardingChannel"
forwardingHtlcIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "forwardingHtlcIndex" a) =>
  Lens.Family2.LensLike' f s a
forwardingHtlcIndex
  = Data.ProtoLens.Field.field @"forwardingHtlcIndex"
from ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "from" a) =>
  Lens.Family2.LensLike' f s a
from = Data.ProtoLens.Field.field @"from"
fullyResolvedChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fullyResolvedChannel" a) =>
  Lens.Family2.LensLike' f s a
fullyResolvedChannel
  = Data.ProtoLens.Field.field @"fullyResolvedChannel"
fundedPsbt ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fundedPsbt" a) =>
  Lens.Family2.LensLike' f s a
fundedPsbt = Data.ProtoLens.Field.field @"fundedPsbt"
fundingTxidBytes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fundingTxidBytes" a) =>
  Lens.Family2.LensLike' f s a
fundingTxidBytes = Data.ProtoLens.Field.field @"fundingTxidBytes"
fundingTxidStr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fundingTxidStr" a) =>
  Lens.Family2.LensLike' f s a
fundingTxidStr = Data.ProtoLens.Field.field @"fundingTxidStr"
globalFeatures ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "globalFeatures" a) =>
  Lens.Family2.LensLike' f s a
globalFeatures = Data.ProtoLens.Field.field @"globalFeatures"
graphDiameter ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "graphDiameter" a) =>
  Lens.Family2.LensLike' f s a
graphDiameter = Data.ProtoLens.Field.field @"graphDiameter"
hashLock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hashLock" a) =>
  Lens.Family2.LensLike' f s a
hashLock = Data.ProtoLens.Field.field @"hashLock"
hopHints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hopHints" a) =>
  Lens.Family2.LensLike' f s a
hopHints = Data.ProtoLens.Field.field @"hopHints"
hops ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "hops" a) =>
  Lens.Family2.LensLike' f s a
hops = Data.ProtoLens.Field.field @"hops"
htlcIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "htlcIndex" a) =>
  Lens.Family2.LensLike' f s a
htlcIndex = Data.ProtoLens.Field.field @"htlcIndex"
identityKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "identityKey" a) =>
  Lens.Family2.LensLike' f s a
identityKey = Data.ProtoLens.Field.field @"identityKey"
ignoredEdges ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ignoredEdges" a) =>
  Lens.Family2.LensLike' f s a
ignoredEdges = Data.ProtoLens.Field.field @"ignoredEdges"
ignoredNodes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ignoredNodes" a) =>
  Lens.Family2.LensLike' f s a
ignoredNodes = Data.ProtoLens.Field.field @"ignoredNodes"
ignoredPairs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ignoredPairs" a) =>
  Lens.Family2.LensLike' f s a
ignoredPairs = Data.ProtoLens.Field.field @"ignoredPairs"
inactiveChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "inactiveChannel" a) =>
  Lens.Family2.LensLike' f s a
inactiveChannel = Data.ProtoLens.Field.field @"inactiveChannel"
includeChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "includeChannels" a) =>
  Lens.Family2.LensLike' f s a
includeChannels = Data.ProtoLens.Field.field @"includeChannels"
includeUnannounced ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "includeUnannounced" a) =>
  Lens.Family2.LensLike' f s a
includeUnannounced
  = Data.ProtoLens.Field.field @"includeUnannounced"
incoming ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "incoming" a) =>
  Lens.Family2.LensLike' f s a
incoming = Data.ProtoLens.Field.field @"incoming"
initiator ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "initiator" a) =>
  Lens.Family2.LensLike' f s a
initiator = Data.ProtoLens.Field.field @"initiator"
isKnown ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "isKnown" a) =>
  Lens.Family2.LensLike' f s a
isKnown = Data.ProtoLens.Field.field @"isKnown"
isRequired ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "isRequired" a) =>
  Lens.Family2.LensLike' f s a
isRequired = Data.ProtoLens.Field.field @"isRequired"
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
keyIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "keyIndex" a) =>
  Lens.Family2.LensLike' f s a
keyIndex = Data.ProtoLens.Field.field @"keyIndex"
keyLoc ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "keyLoc" a) =>
  Lens.Family2.LensLike' f s a
keyLoc = Data.ProtoLens.Field.field @"keyLoc"
lastHopPubkey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastHopPubkey" a) =>
  Lens.Family2.LensLike' f s a
lastHopPubkey = Data.ProtoLens.Field.field @"lastHopPubkey"
lastUpdate ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastUpdate" a) =>
  Lens.Family2.LensLike' f s a
lastUpdate = Data.ProtoLens.Field.field @"lastUpdate"
lifetime ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lifetime" a) =>
  Lens.Family2.LensLike' f s a
lifetime = Data.ProtoLens.Field.field @"lifetime"
limboBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "limboBalance" a) =>
  Lens.Family2.LensLike' f s a
limboBalance = Data.ProtoLens.Field.field @"limboBalance"
localBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "localBalance" a) =>
  Lens.Family2.LensLike' f s a
localBalance = Data.ProtoLens.Field.field @"localBalance"
localChanReserveSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "localChanReserveSat" a) =>
  Lens.Family2.LensLike' f s a
localChanReserveSat
  = Data.ProtoLens.Field.field @"localChanReserveSat"
localCommitFeeSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "localCommitFeeSat" a) =>
  Lens.Family2.LensLike' f s a
localCommitFeeSat = Data.ProtoLens.Field.field @"localCommitFeeSat"
localConstraints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "localConstraints" a) =>
  Lens.Family2.LensLike' f s a
localConstraints = Data.ProtoLens.Field.field @"localConstraints"
localKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "localKey" a) =>
  Lens.Family2.LensLike' f s a
localKey = Data.ProtoLens.Field.field @"localKey"
localTxid ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "localTxid" a) =>
  Lens.Family2.LensLike' f s a
localTxid = Data.ProtoLens.Field.field @"localTxid"
maturityHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maturityHeight" a) =>
  Lens.Family2.LensLike' f s a
maturityHeight = Data.ProtoLens.Field.field @"maturityHeight"
maxAcceptedHtlcs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxAcceptedHtlcs" a) =>
  Lens.Family2.LensLike' f s a
maxAcceptedHtlcs = Data.ProtoLens.Field.field @"maxAcceptedHtlcs"
maxChannelSize ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxChannelSize" a) =>
  Lens.Family2.LensLike' f s a
maxChannelSize = Data.ProtoLens.Field.field @"maxChannelSize"
maxHtlcMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxHtlcMsat" a) =>
  Lens.Family2.LensLike' f s a
maxHtlcMsat = Data.ProtoLens.Field.field @"maxHtlcMsat"
maxOutDegree ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxOutDegree" a) =>
  Lens.Family2.LensLike' f s a
maxOutDegree = Data.ProtoLens.Field.field @"maxOutDegree"
maxPendingAmtMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxPendingAmtMsat" a) =>
  Lens.Family2.LensLike' f s a
maxPendingAmtMsat = Data.ProtoLens.Field.field @"maxPendingAmtMsat"
maybe'activeChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'activeChannel" a) =>
  Lens.Family2.LensLike' f s a
maybe'activeChannel
  = Data.ProtoLens.Field.field @"maybe'activeChannel"
maybe'ampRecord ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'ampRecord" a) =>
  Lens.Family2.LensLike' f s a
maybe'ampRecord = Data.ProtoLens.Field.field @"maybe'ampRecord"
maybe'chanPoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'chanPoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'chanPoint = Data.ProtoLens.Field.field @"maybe'chanPoint"
maybe'chanPointShim ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'chanPointShim" a) =>
  Lens.Family2.LensLike' f s a
maybe'chanPointShim
  = Data.ProtoLens.Field.field @"maybe'chanPointShim"
maybe'channel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'channel" a) =>
  Lens.Family2.LensLike' f s a
maybe'channel = Data.ProtoLens.Field.field @"maybe'channel"
maybe'closedChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'closedChannel" a) =>
  Lens.Family2.LensLike' f s a
maybe'closedChannel
  = Data.ProtoLens.Field.field @"maybe'closedChannel"
maybe'commitments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'commitments" a) =>
  Lens.Family2.LensLike' f s a
maybe'commitments = Data.ProtoLens.Field.field @"maybe'commitments"
maybe'feeLimit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'feeLimit" a) =>
  Lens.Family2.LensLike' f s a
maybe'feeLimit = Data.ProtoLens.Field.field @"maybe'feeLimit"
maybe'fixed ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'fixed" a) =>
  Lens.Family2.LensLike' f s a
maybe'fixed = Data.ProtoLens.Field.field @"maybe'fixed"
maybe'fixedMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'fixedMsat" a) =>
  Lens.Family2.LensLike' f s a
maybe'fixedMsat = Data.ProtoLens.Field.field @"maybe'fixedMsat"
maybe'fullyResolvedChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'fullyResolvedChannel" a) =>
  Lens.Family2.LensLike' f s a
maybe'fullyResolvedChannel
  = Data.ProtoLens.Field.field @"maybe'fullyResolvedChannel"
maybe'fundingTxid ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'fundingTxid" a) =>
  Lens.Family2.LensLike' f s a
maybe'fundingTxid = Data.ProtoLens.Field.field @"maybe'fundingTxid"
maybe'fundingTxidBytes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'fundingTxidBytes" a) =>
  Lens.Family2.LensLike' f s a
maybe'fundingTxidBytes
  = Data.ProtoLens.Field.field @"maybe'fundingTxidBytes"
maybe'fundingTxidStr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'fundingTxidStr" a) =>
  Lens.Family2.LensLike' f s a
maybe'fundingTxidStr
  = Data.ProtoLens.Field.field @"maybe'fundingTxidStr"
maybe'inactiveChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'inactiveChannel" a) =>
  Lens.Family2.LensLike' f s a
maybe'inactiveChannel
  = Data.ProtoLens.Field.field @"maybe'inactiveChannel"
maybe'keyLoc ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'keyLoc" a) =>
  Lens.Family2.LensLike' f s a
maybe'keyLoc = Data.ProtoLens.Field.field @"maybe'keyLoc"
maybe'limit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'limit" a) =>
  Lens.Family2.LensLike' f s a
maybe'limit = Data.ProtoLens.Field.field @"maybe'limit"
maybe'localBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'localBalance" a) =>
  Lens.Family2.LensLike' f s a
maybe'localBalance
  = Data.ProtoLens.Field.field @"maybe'localBalance"
maybe'localConstraints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'localConstraints" a) =>
  Lens.Family2.LensLike' f s a
maybe'localConstraints
  = Data.ProtoLens.Field.field @"maybe'localConstraints"
maybe'localKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'localKey" a) =>
  Lens.Family2.LensLike' f s a
maybe'localKey = Data.ProtoLens.Field.field @"maybe'localKey"
maybe'mppRecord ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'mppRecord" a) =>
  Lens.Family2.LensLike' f s a
maybe'mppRecord = Data.ProtoLens.Field.field @"maybe'mppRecord"
maybe'node ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'node" a) =>
  Lens.Family2.LensLike' f s a
maybe'node = Data.ProtoLens.Field.field @"maybe'node"
maybe'node1Policy ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'node1Policy" a) =>
  Lens.Family2.LensLike' f s a
maybe'node1Policy = Data.ProtoLens.Field.field @"maybe'node1Policy"
maybe'node2Policy ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'node2Policy" a) =>
  Lens.Family2.LensLike' f s a
maybe'node2Policy = Data.ProtoLens.Field.field @"maybe'node2Policy"
maybe'openChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'openChannel" a) =>
  Lens.Family2.LensLike' f s a
maybe'openChannel = Data.ProtoLens.Field.field @"maybe'openChannel"
maybe'outpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'outpoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'outpoint = Data.ProtoLens.Field.field @"maybe'outpoint"
maybe'pendingOpenChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'pendingOpenChannel" a) =>
  Lens.Family2.LensLike' f s a
maybe'pendingOpenChannel
  = Data.ProtoLens.Field.field @"maybe'pendingOpenChannel"
maybe'pendingOpenLocalBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'pendingOpenLocalBalance" a) =>
  Lens.Family2.LensLike' f s a
maybe'pendingOpenLocalBalance
  = Data.ProtoLens.Field.field @"maybe'pendingOpenLocalBalance"
maybe'pendingOpenRemoteBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'pendingOpenRemoteBalance" a) =>
  Lens.Family2.LensLike' f s a
maybe'pendingOpenRemoteBalance
  = Data.ProtoLens.Field.field @"maybe'pendingOpenRemoteBalance"
maybe'percent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'percent" a) =>
  Lens.Family2.LensLike' f s a
maybe'percent = Data.ProtoLens.Field.field @"maybe'percent"
maybe'psbtFinalize ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'psbtFinalize" a) =>
  Lens.Family2.LensLike' f s a
maybe'psbtFinalize
  = Data.ProtoLens.Field.field @"maybe'psbtFinalize"
maybe'psbtShim ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'psbtShim" a) =>
  Lens.Family2.LensLike' f s a
maybe'psbtShim = Data.ProtoLens.Field.field @"maybe'psbtShim"
maybe'psbtVerify ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'psbtVerify" a) =>
  Lens.Family2.LensLike' f s a
maybe'psbtVerify = Data.ProtoLens.Field.field @"maybe'psbtVerify"
maybe'remoteBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'remoteBalance" a) =>
  Lens.Family2.LensLike' f s a
maybe'remoteBalance
  = Data.ProtoLens.Field.field @"maybe'remoteBalance"
maybe'remoteConstraints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'remoteConstraints" a) =>
  Lens.Family2.LensLike' f s a
maybe'remoteConstraints
  = Data.ProtoLens.Field.field @"maybe'remoteConstraints"
maybe'routingPolicy ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'routingPolicy" a) =>
  Lens.Family2.LensLike' f s a
maybe'routingPolicy
  = Data.ProtoLens.Field.field @"maybe'routingPolicy"
maybe'shim ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'shim" a) =>
  Lens.Family2.LensLike' f s a
maybe'shim = Data.ProtoLens.Field.field @"maybe'shim"
maybe'shimCancel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'shimCancel" a) =>
  Lens.Family2.LensLike' f s a
maybe'shimCancel = Data.ProtoLens.Field.field @"maybe'shimCancel"
maybe'shimRegister ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'shimRegister" a) =>
  Lens.Family2.LensLike' f s a
maybe'shimRegister
  = Data.ProtoLens.Field.field @"maybe'shimRegister"
maybe'trigger ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'trigger" a) =>
  Lens.Family2.LensLike' f s a
maybe'trigger = Data.ProtoLens.Field.field @"maybe'trigger"
maybe'unsettledLocalBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'unsettledLocalBalance" a) =>
  Lens.Family2.LensLike' f s a
maybe'unsettledLocalBalance
  = Data.ProtoLens.Field.field @"maybe'unsettledLocalBalance"
maybe'unsettledRemoteBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'unsettledRemoteBalance" a) =>
  Lens.Family2.LensLike' f s a
maybe'unsettledRemoteBalance
  = Data.ProtoLens.Field.field @"maybe'unsettledRemoteBalance"
maybe'value ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'value" a) =>
  Lens.Family2.LensLike' f s a
maybe'value = Data.ProtoLens.Field.field @"maybe'value"
medianChannelSizeSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "medianChannelSizeSat" a) =>
  Lens.Family2.LensLike' f s a
medianChannelSizeSat
  = Data.ProtoLens.Field.field @"medianChannelSizeSat"
minChannelSize ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minChannelSize" a) =>
  Lens.Family2.LensLike' f s a
minChannelSize = Data.ProtoLens.Field.field @"minChannelSize"
minHtlc ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "minHtlc" a) =>
  Lens.Family2.LensLike' f s a
minHtlc = Data.ProtoLens.Field.field @"minHtlc"
minHtlcMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minHtlcMsat" a) =>
  Lens.Family2.LensLike' f s a
minHtlcMsat = Data.ProtoLens.Field.field @"minHtlcMsat"
mppRecord ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "mppRecord" a) =>
  Lens.Family2.LensLike' f s a
mppRecord = Data.ProtoLens.Field.field @"mppRecord"
msat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "msat" a) =>
  Lens.Family2.LensLike' f s a
msat = Data.ProtoLens.Field.field @"msat"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
network ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "network" a) =>
  Lens.Family2.LensLike' f s a
network = Data.ProtoLens.Field.field @"network"
noPublish ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "noPublish" a) =>
  Lens.Family2.LensLike' f s a
noPublish = Data.ProtoLens.Field.field @"noPublish"
node ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "node" a) =>
  Lens.Family2.LensLike' f s a
node = Data.ProtoLens.Field.field @"node"
node1Policy ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "node1Policy" a) =>
  Lens.Family2.LensLike' f s a
node1Policy = Data.ProtoLens.Field.field @"node1Policy"
node1Pub ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "node1Pub" a) =>
  Lens.Family2.LensLike' f s a
node1Pub = Data.ProtoLens.Field.field @"node1Pub"
node2Policy ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "node2Policy" a) =>
  Lens.Family2.LensLike' f s a
node2Policy = Data.ProtoLens.Field.field @"node2Policy"
node2Pub ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "node2Pub" a) =>
  Lens.Family2.LensLike' f s a
node2Pub = Data.ProtoLens.Field.field @"node2Pub"
nodeAddresses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "nodeAddresses" a) =>
  Lens.Family2.LensLike' f s a
nodeAddresses = Data.ProtoLens.Field.field @"nodeAddresses"
nodeId ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "nodeId" a) =>
  Lens.Family2.LensLike' f s a
nodeId = Data.ProtoLens.Field.field @"nodeId"
nodeUpdates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "nodeUpdates" a) =>
  Lens.Family2.LensLike' f s a
nodeUpdates = Data.ProtoLens.Field.field @"nodeUpdates"
nodes ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "nodes" a) =>
  Lens.Family2.LensLike' f s a
nodes = Data.ProtoLens.Field.field @"nodes"
normalizedValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "normalizedValue" a) =>
  Lens.Family2.LensLike' f s a
normalizedValue = Data.ProtoLens.Field.field @"normalizedValue"
numChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numChannels" a) =>
  Lens.Family2.LensLike' f s a
numChannels = Data.ProtoLens.Field.field @"numChannels"
numForwardingPackages ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numForwardingPackages" a) =>
  Lens.Family2.LensLike' f s a
numForwardingPackages
  = Data.ProtoLens.Field.field @"numForwardingPackages"
numNodes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numNodes" a) =>
  Lens.Family2.LensLike' f s a
numNodes = Data.ProtoLens.Field.field @"numNodes"
numUpdates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numUpdates" a) =>
  Lens.Family2.LensLike' f s a
numUpdates = Data.ProtoLens.Field.field @"numUpdates"
numZombieChans ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numZombieChans" a) =>
  Lens.Family2.LensLike' f s a
numZombieChans = Data.ProtoLens.Field.field @"numZombieChans"
openChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "openChannel" a) =>
  Lens.Family2.LensLike' f s a
openChannel = Data.ProtoLens.Field.field @"openChannel"
openInitiator ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "openInitiator" a) =>
  Lens.Family2.LensLike' f s a
openInitiator = Data.ProtoLens.Field.field @"openInitiator"
outcome ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "outcome" a) =>
  Lens.Family2.LensLike' f s a
outcome = Data.ProtoLens.Field.field @"outcome"
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
outputIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outputIndex" a) =>
  Lens.Family2.LensLike' f s a
outputIndex = Data.ProtoLens.Field.field @"outputIndex"
paymentAddr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentAddr" a) =>
  Lens.Family2.LensLike' f s a
paymentAddr = Data.ProtoLens.Field.field @"paymentAddr"
pendingChanId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingChanId" a) =>
  Lens.Family2.LensLike' f s a
pendingChanId = Data.ProtoLens.Field.field @"pendingChanId"
pendingClosingChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingClosingChannels" a) =>
  Lens.Family2.LensLike' f s a
pendingClosingChannels
  = Data.ProtoLens.Field.field @"pendingClosingChannels"
pendingForceClosingChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingForceClosingChannels" a) =>
  Lens.Family2.LensLike' f s a
pendingForceClosingChannels
  = Data.ProtoLens.Field.field @"pendingForceClosingChannels"
pendingHtlcs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingHtlcs" a) =>
  Lens.Family2.LensLike' f s a
pendingHtlcs = Data.ProtoLens.Field.field @"pendingHtlcs"
pendingOpenBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingOpenBalance" a) =>
  Lens.Family2.LensLike' f s a
pendingOpenBalance
  = Data.ProtoLens.Field.field @"pendingOpenBalance"
pendingOpenChannel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingOpenChannel" a) =>
  Lens.Family2.LensLike' f s a
pendingOpenChannel
  = Data.ProtoLens.Field.field @"pendingOpenChannel"
pendingOpenChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingOpenChannels" a) =>
  Lens.Family2.LensLike' f s a
pendingOpenChannels
  = Data.ProtoLens.Field.field @"pendingOpenChannels"
pendingOpenLocalBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingOpenLocalBalance" a) =>
  Lens.Family2.LensLike' f s a
pendingOpenLocalBalance
  = Data.ProtoLens.Field.field @"pendingOpenLocalBalance"
pendingOpenRemoteBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pendingOpenRemoteBalance" a) =>
  Lens.Family2.LensLike' f s a
pendingOpenRemoteBalance
  = Data.ProtoLens.Field.field @"pendingOpenRemoteBalance"
percent ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "percent" a) =>
  Lens.Family2.LensLike' f s a
percent = Data.ProtoLens.Field.field @"percent"
private ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "private" a) =>
  Lens.Family2.LensLike' f s a
private = Data.ProtoLens.Field.field @"private"
psbtFinalize ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "psbtFinalize" a) =>
  Lens.Family2.LensLike' f s a
psbtFinalize = Data.ProtoLens.Field.field @"psbtFinalize"
psbtShim ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "psbtShim" a) =>
  Lens.Family2.LensLike' f s a
psbtShim = Data.ProtoLens.Field.field @"psbtShim"
psbtVerify ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "psbtVerify" a) =>
  Lens.Family2.LensLike' f s a
psbtVerify = Data.ProtoLens.Field.field @"psbtVerify"
pubKey ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "pubKey" a) =>
  Lens.Family2.LensLike' f s a
pubKey = Data.ProtoLens.Field.field @"pubKey"
pushAmountSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pushAmountSat" a) =>
  Lens.Family2.LensLike' f s a
pushAmountSat = Data.ProtoLens.Field.field @"pushAmountSat"
rawKeyBytes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rawKeyBytes" a) =>
  Lens.Family2.LensLike' f s a
rawKeyBytes = Data.ProtoLens.Field.field @"rawKeyBytes"
recoveredBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "recoveredBalance" a) =>
  Lens.Family2.LensLike' f s a
recoveredBalance = Data.ProtoLens.Field.field @"recoveredBalance"
remoteBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteBalance" a) =>
  Lens.Family2.LensLike' f s a
remoteBalance = Data.ProtoLens.Field.field @"remoteBalance"
remoteChanReserveSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteChanReserveSat" a) =>
  Lens.Family2.LensLike' f s a
remoteChanReserveSat
  = Data.ProtoLens.Field.field @"remoteChanReserveSat"
remoteCommitFeeSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteCommitFeeSat" a) =>
  Lens.Family2.LensLike' f s a
remoteCommitFeeSat
  = Data.ProtoLens.Field.field @"remoteCommitFeeSat"
remoteConstraints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteConstraints" a) =>
  Lens.Family2.LensLike' f s a
remoteConstraints = Data.ProtoLens.Field.field @"remoteConstraints"
remoteKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteKey" a) =>
  Lens.Family2.LensLike' f s a
remoteKey = Data.ProtoLens.Field.field @"remoteKey"
remoteNodePub ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteNodePub" a) =>
  Lens.Family2.LensLike' f s a
remoteNodePub = Data.ProtoLens.Field.field @"remoteNodePub"
remotePendingCommitFeeSat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remotePendingCommitFeeSat" a) =>
  Lens.Family2.LensLike' f s a
remotePendingCommitFeeSat
  = Data.ProtoLens.Field.field @"remotePendingCommitFeeSat"
remotePendingTxid ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remotePendingTxid" a) =>
  Lens.Family2.LensLike' f s a
remotePendingTxid = Data.ProtoLens.Field.field @"remotePendingTxid"
remotePubkey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remotePubkey" a) =>
  Lens.Family2.LensLike' f s a
remotePubkey = Data.ProtoLens.Field.field @"remotePubkey"
remoteTxid ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "remoteTxid" a) =>
  Lens.Family2.LensLike' f s a
remoteTxid = Data.ProtoLens.Field.field @"remoteTxid"
resolutionType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "resolutionType" a) =>
  Lens.Family2.LensLike' f s a
resolutionType = Data.ProtoLens.Field.field @"resolutionType"
resolutions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "resolutions" a) =>
  Lens.Family2.LensLike' f s a
resolutions = Data.ProtoLens.Field.field @"resolutions"
rootShare ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rootShare" a) =>
  Lens.Family2.LensLike' f s a
rootShare = Data.ProtoLens.Field.field @"rootShare"
routeHints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "routeHints" a) =>
  Lens.Family2.LensLike' f s a
routeHints = Data.ProtoLens.Field.field @"routeHints"
routes ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "routes" a) =>
  Lens.Family2.LensLike' f s a
routes = Data.ProtoLens.Field.field @"routes"
routingPolicy ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "routingPolicy" a) =>
  Lens.Family2.LensLike' f s a
routingPolicy = Data.ProtoLens.Field.field @"routingPolicy"
sat ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "sat" a) =>
  Lens.Family2.LensLike' f s a
sat = Data.ProtoLens.Field.field @"sat"
setId ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "setId" a) =>
  Lens.Family2.LensLike' f s a
setId = Data.ProtoLens.Field.field @"setId"
settledBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "settledBalance" a) =>
  Lens.Family2.LensLike' f s a
settledBalance = Data.ProtoLens.Field.field @"settledBalance"
shimCancel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "shimCancel" a) =>
  Lens.Family2.LensLike' f s a
shimCancel = Data.ProtoLens.Field.field @"shimCancel"
shimRegister ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "shimRegister" a) =>
  Lens.Family2.LensLike' f s a
shimRegister = Data.ProtoLens.Field.field @"shimRegister"
signedPsbt ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "signedPsbt" a) =>
  Lens.Family2.LensLike' f s a
signedPsbt = Data.ProtoLens.Field.field @"signedPsbt"
skipFinalize ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "skipFinalize" a) =>
  Lens.Family2.LensLike' f s a
skipFinalize = Data.ProtoLens.Field.field @"skipFinalize"
sourcePubKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sourcePubKey" a) =>
  Lens.Family2.LensLike' f s a
sourcePubKey = Data.ProtoLens.Field.field @"sourcePubKey"
stage ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "stage" a) =>
  Lens.Family2.LensLike' f s a
stage = Data.ProtoLens.Field.field @"stage"
staticRemoteKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "staticRemoteKey" a) =>
  Lens.Family2.LensLike' f s a
staticRemoteKey = Data.ProtoLens.Field.field @"staticRemoteKey"
successProb ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "successProb" a) =>
  Lens.Family2.LensLike' f s a
successProb = Data.ProtoLens.Field.field @"successProb"
sweepTxid ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sweepTxid" a) =>
  Lens.Family2.LensLike' f s a
sweepTxid = Data.ProtoLens.Field.field @"sweepTxid"
thawHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "thawHeight" a) =>
  Lens.Family2.LensLike' f s a
thawHeight = Data.ProtoLens.Field.field @"thawHeight"
timeLockDelta ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timeLockDelta" a) =>
  Lens.Family2.LensLike' f s a
timeLockDelta = Data.ProtoLens.Field.field @"timeLockDelta"
timeLockedBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timeLockedBalance" a) =>
  Lens.Family2.LensLike' f s a
timeLockedBalance = Data.ProtoLens.Field.field @"timeLockedBalance"
tlvPayload ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "tlvPayload" a) =>
  Lens.Family2.LensLike' f s a
tlvPayload = Data.ProtoLens.Field.field @"tlvPayload"
to ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "to" a) =>
  Lens.Family2.LensLike' f s a
to = Data.ProtoLens.Field.field @"to"
totalAmt ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalAmt" a) =>
  Lens.Family2.LensLike' f s a
totalAmt = Data.ProtoLens.Field.field @"totalAmt"
totalAmtMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalAmtMsat" a) =>
  Lens.Family2.LensLike' f s a
totalAmtMsat = Data.ProtoLens.Field.field @"totalAmtMsat"
totalBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalBalance" a) =>
  Lens.Family2.LensLike' f s a
totalBalance = Data.ProtoLens.Field.field @"totalBalance"
totalCapacity ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalCapacity" a) =>
  Lens.Family2.LensLike' f s a
totalCapacity = Data.ProtoLens.Field.field @"totalCapacity"
totalFees ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalFees" a) =>
  Lens.Family2.LensLike' f s a
totalFees = Data.ProtoLens.Field.field @"totalFees"
totalFeesMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalFeesMsat" a) =>
  Lens.Family2.LensLike' f s a
totalFeesMsat = Data.ProtoLens.Field.field @"totalFeesMsat"
totalLimboBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalLimboBalance" a) =>
  Lens.Family2.LensLike' f s a
totalLimboBalance = Data.ProtoLens.Field.field @"totalLimboBalance"
totalNetworkCapacity ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalNetworkCapacity" a) =>
  Lens.Family2.LensLike' f s a
totalNetworkCapacity
  = Data.ProtoLens.Field.field @"totalNetworkCapacity"
totalSatoshisReceived ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalSatoshisReceived" a) =>
  Lens.Family2.LensLike' f s a
totalSatoshisReceived
  = Data.ProtoLens.Field.field @"totalSatoshisReceived"
totalSatoshisSent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalSatoshisSent" a) =>
  Lens.Family2.LensLike' f s a
totalSatoshisSent = Data.ProtoLens.Field.field @"totalSatoshisSent"
totalTimeLock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "totalTimeLock" a) =>
  Lens.Family2.LensLike' f s a
totalTimeLock = Data.ProtoLens.Field.field @"totalTimeLock"
txid ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "txid" a) =>
  Lens.Family2.LensLike' f s a
txid = Data.ProtoLens.Field.field @"txid"
txidBytes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "txidBytes" a) =>
  Lens.Family2.LensLike' f s a
txidBytes = Data.ProtoLens.Field.field @"txidBytes"
txidStr ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "txidStr" a) =>
  Lens.Family2.LensLike' f s a
txidStr = Data.ProtoLens.Field.field @"txidStr"
type' ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "type'" a) =>
  Lens.Family2.LensLike' f s a
type' = Data.ProtoLens.Field.field @"type'"
types ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "types" a) =>
  Lens.Family2.LensLike' f s a
types = Data.ProtoLens.Field.field @"types"
unconfirmedBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "unconfirmedBalance" a) =>
  Lens.Family2.LensLike' f s a
unconfirmedBalance
  = Data.ProtoLens.Field.field @"unconfirmedBalance"
unsettledBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "unsettledBalance" a) =>
  Lens.Family2.LensLike' f s a
unsettledBalance = Data.ProtoLens.Field.field @"unsettledBalance"
unsettledLocalBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "unsettledLocalBalance" a) =>
  Lens.Family2.LensLike' f s a
unsettledLocalBalance
  = Data.ProtoLens.Field.field @"unsettledLocalBalance"
unsettledRemoteBalance ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "unsettledRemoteBalance" a) =>
  Lens.Family2.LensLike' f s a
unsettledRemoteBalance
  = Data.ProtoLens.Field.field @"unsettledRemoteBalance"
uptime ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "uptime" a) =>
  Lens.Family2.LensLike' f s a
uptime = Data.ProtoLens.Field.field @"uptime"
useMissionControl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "useMissionControl" a) =>
  Lens.Family2.LensLike' f s a
useMissionControl = Data.ProtoLens.Field.field @"useMissionControl"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
vec'addresses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'addresses" a) =>
  Lens.Family2.LensLike' f s a
vec'addresses = Data.ProtoLens.Field.field @"vec'addresses"
vec'channelUpdates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'channelUpdates" a) =>
  Lens.Family2.LensLike' f s a
vec'channelUpdates
  = Data.ProtoLens.Field.field @"vec'channelUpdates"
vec'channels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'channels" a) =>
  Lens.Family2.LensLike' f s a
vec'channels = Data.ProtoLens.Field.field @"vec'channels"
vec'closedChans ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'closedChans" a) =>
  Lens.Family2.LensLike' f s a
vec'closedChans = Data.ProtoLens.Field.field @"vec'closedChans"
vec'destFeatures ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'destFeatures" a) =>
  Lens.Family2.LensLike' f s a
vec'destFeatures = Data.ProtoLens.Field.field @"vec'destFeatures"
vec'edges ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'edges" a) =>
  Lens.Family2.LensLike' f s a
vec'edges = Data.ProtoLens.Field.field @"vec'edges"
vec'hopHints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'hopHints" a) =>
  Lens.Family2.LensLike' f s a
vec'hopHints = Data.ProtoLens.Field.field @"vec'hopHints"
vec'hops ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'hops" a) =>
  Lens.Family2.LensLike' f s a
vec'hops = Data.ProtoLens.Field.field @"vec'hops"
vec'ignoredEdges ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'ignoredEdges" a) =>
  Lens.Family2.LensLike' f s a
vec'ignoredEdges = Data.ProtoLens.Field.field @"vec'ignoredEdges"
vec'ignoredNodes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'ignoredNodes" a) =>
  Lens.Family2.LensLike' f s a
vec'ignoredNodes = Data.ProtoLens.Field.field @"vec'ignoredNodes"
vec'ignoredPairs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'ignoredPairs" a) =>
  Lens.Family2.LensLike' f s a
vec'ignoredPairs = Data.ProtoLens.Field.field @"vec'ignoredPairs"
vec'nodeAddresses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'nodeAddresses" a) =>
  Lens.Family2.LensLike' f s a
vec'nodeAddresses = Data.ProtoLens.Field.field @"vec'nodeAddresses"
vec'nodeUpdates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'nodeUpdates" a) =>
  Lens.Family2.LensLike' f s a
vec'nodeUpdates = Data.ProtoLens.Field.field @"vec'nodeUpdates"
vec'nodes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'nodes" a) =>
  Lens.Family2.LensLike' f s a
vec'nodes = Data.ProtoLens.Field.field @"vec'nodes"
vec'pendingClosingChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'pendingClosingChannels" a) =>
  Lens.Family2.LensLike' f s a
vec'pendingClosingChannels
  = Data.ProtoLens.Field.field @"vec'pendingClosingChannels"
vec'pendingForceClosingChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'pendingForceClosingChannels" a) =>
  Lens.Family2.LensLike' f s a
vec'pendingForceClosingChannels
  = Data.ProtoLens.Field.field @"vec'pendingForceClosingChannels"
vec'pendingHtlcs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'pendingHtlcs" a) =>
  Lens.Family2.LensLike' f s a
vec'pendingHtlcs = Data.ProtoLens.Field.field @"vec'pendingHtlcs"
vec'pendingOpenChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'pendingOpenChannels" a) =>
  Lens.Family2.LensLike' f s a
vec'pendingOpenChannels
  = Data.ProtoLens.Field.field @"vec'pendingOpenChannels"
vec'resolutions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'resolutions" a) =>
  Lens.Family2.LensLike' f s a
vec'resolutions = Data.ProtoLens.Field.field @"vec'resolutions"
vec'routeHints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'routeHints" a) =>
  Lens.Family2.LensLike' f s a
vec'routeHints = Data.ProtoLens.Field.field @"vec'routeHints"
vec'routes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'routes" a) =>
  Lens.Family2.LensLike' f s a
vec'routes = Data.ProtoLens.Field.field @"vec'routes"
vec'types ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'types" a) =>
  Lens.Family2.LensLike' f s a
vec'types = Data.ProtoLens.Field.field @"vec'types"
vec'waitingCloseChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'waitingCloseChannels" a) =>
  Lens.Family2.LensLike' f s a
vec'waitingCloseChannels
  = Data.ProtoLens.Field.field @"vec'waitingCloseChannels"
waitingCloseChannels ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "waitingCloseChannels" a) =>
  Lens.Family2.LensLike' f s a
waitingCloseChannels
  = Data.ProtoLens.Field.field @"waitingCloseChannels"