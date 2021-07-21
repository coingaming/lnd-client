{- This file was auto-generated from router_grpc.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.RouterGrpc (
        Router(..), BuildRouteRequest(), BuildRouteResponse(),
        ChanStatusAction(..), ChanStatusAction(),
        ChanStatusAction'UnrecognizedValue, CircuitKey(),
        FailureDetail(..), FailureDetail(),
        FailureDetail'UnrecognizedValue, ForwardEvent(),
        ForwardFailEvent(), ForwardHtlcInterceptRequest(),
        ForwardHtlcInterceptRequest'CustomRecordsEntry(),
        ForwardHtlcInterceptResponse(), GetMissionControlConfigRequest(),
        GetMissionControlConfigResponse(), HtlcEvent(),
        HtlcEvent'Event(..), _HtlcEvent'ForwardEvent,
        _HtlcEvent'ForwardFailEvent, _HtlcEvent'SettleEvent,
        _HtlcEvent'LinkFailEvent, HtlcEvent'EventType(..),
        HtlcEvent'EventType(), HtlcEvent'EventType'UnrecognizedValue,
        HtlcInfo(), LinkFailEvent(), MissionControlConfig(), PairData(),
        PairHistory(), PaymentState(..), PaymentState(),
        PaymentState'UnrecognizedValue, PaymentStatus(),
        QueryMissionControlRequest(), QueryMissionControlResponse(),
        QueryProbabilityRequest(), QueryProbabilityResponse(),
        ResetMissionControlRequest(), ResetMissionControlResponse(),
        ResolveHoldForwardAction(..), ResolveHoldForwardAction(),
        ResolveHoldForwardAction'UnrecognizedValue, RouteFeeRequest(),
        RouteFeeResponse(), SendPaymentRequest(),
        SendPaymentRequest'DestCustomRecordsEntry(), SendToRouteRequest(),
        SendToRouteResponse(), SetMissionControlConfigRequest(),
        SetMissionControlConfigResponse(), SettleEvent(),
        SubscribeHtlcEventsRequest(), TrackPaymentRequest(),
        UpdateChanStatusRequest(), UpdateChanStatusResponse(),
        XImportMissionControlRequest(), XImportMissionControlResponse()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
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
import qualified Proto.LndGrpc
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.amtMsat' @:: Lens' BuildRouteRequest Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.finalCltvDelta' @:: Lens' BuildRouteRequest Data.Int.Int32@
         * 'Proto.RouterGrpc_Fields.outgoingChanId' @:: Lens' BuildRouteRequest Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.hopPubkeys' @:: Lens' BuildRouteRequest [Data.ByteString.ByteString]@
         * 'Proto.RouterGrpc_Fields.vec'hopPubkeys' @:: Lens' BuildRouteRequest (Data.Vector.Vector Data.ByteString.ByteString)@
         * 'Proto.RouterGrpc_Fields.paymentAddr' @:: Lens' BuildRouteRequest Data.ByteString.ByteString@ -}
data BuildRouteRequest
  = BuildRouteRequest'_constructor {_BuildRouteRequest'amtMsat :: !Data.Int.Int64,
                                    _BuildRouteRequest'finalCltvDelta :: !Data.Int.Int32,
                                    _BuildRouteRequest'outgoingChanId :: !Data.Word.Word64,
                                    _BuildRouteRequest'hopPubkeys :: !(Data.Vector.Vector Data.ByteString.ByteString),
                                    _BuildRouteRequest'paymentAddr :: !Data.ByteString.ByteString,
                                    _BuildRouteRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show BuildRouteRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField BuildRouteRequest "amtMsat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BuildRouteRequest'amtMsat
           (\ x__ y__ -> x__ {_BuildRouteRequest'amtMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField BuildRouteRequest "finalCltvDelta" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BuildRouteRequest'finalCltvDelta
           (\ x__ y__ -> x__ {_BuildRouteRequest'finalCltvDelta = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField BuildRouteRequest "outgoingChanId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BuildRouteRequest'outgoingChanId
           (\ x__ y__ -> x__ {_BuildRouteRequest'outgoingChanId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField BuildRouteRequest "hopPubkeys" [Data.ByteString.ByteString] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BuildRouteRequest'hopPubkeys
           (\ x__ y__ -> x__ {_BuildRouteRequest'hopPubkeys = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField BuildRouteRequest "vec'hopPubkeys" (Data.Vector.Vector Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BuildRouteRequest'hopPubkeys
           (\ x__ y__ -> x__ {_BuildRouteRequest'hopPubkeys = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField BuildRouteRequest "paymentAddr" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BuildRouteRequest'paymentAddr
           (\ x__ y__ -> x__ {_BuildRouteRequest'paymentAddr = y__}))
        Prelude.id
instance Data.ProtoLens.Message BuildRouteRequest where
  messageName _ = Data.Text.pack "routerrpc.BuildRouteRequest"
  fieldsByTag
    = let
        amtMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amt_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"amtMsat")) ::
              Data.ProtoLens.FieldDescriptor BuildRouteRequest
        finalCltvDelta__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "final_cltv_delta"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"finalCltvDelta")) ::
              Data.ProtoLens.FieldDescriptor BuildRouteRequest
        outgoingChanId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_chan_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"outgoingChanId")) ::
              Data.ProtoLens.FieldDescriptor BuildRouteRequest
        hopPubkeys__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "hop_pubkeys"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"hopPubkeys")) ::
              Data.ProtoLens.FieldDescriptor BuildRouteRequest
        paymentAddr__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_addr"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentAddr")) ::
              Data.ProtoLens.FieldDescriptor BuildRouteRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, amtMsat__field_descriptor),
           (Data.ProtoLens.Tag 2, finalCltvDelta__field_descriptor),
           (Data.ProtoLens.Tag 3, outgoingChanId__field_descriptor),
           (Data.ProtoLens.Tag 4, hopPubkeys__field_descriptor),
           (Data.ProtoLens.Tag 5, paymentAddr__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _BuildRouteRequest'_unknownFields
        (\ x__ y__ -> x__ {_BuildRouteRequest'_unknownFields = y__})
  defMessage
    = BuildRouteRequest'_constructor
        {_BuildRouteRequest'amtMsat = Data.ProtoLens.fieldDefault,
         _BuildRouteRequest'finalCltvDelta = Data.ProtoLens.fieldDefault,
         _BuildRouteRequest'outgoingChanId = Data.ProtoLens.fieldDefault,
         _BuildRouteRequest'hopPubkeys = Data.Vector.Generic.empty,
         _BuildRouteRequest'paymentAddr = Data.ProtoLens.fieldDefault,
         _BuildRouteRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          BuildRouteRequest
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.ByteString.ByteString
             -> Data.ProtoLens.Encoding.Bytes.Parser BuildRouteRequest
        loop x mutable'hopPubkeys
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'hopPubkeys <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'hopPubkeys)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'hopPubkeys")
                              frozen'hopPubkeys
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "amt_msat"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"amtMsat") y x)
                                  mutable'hopPubkeys
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "final_cltv_delta"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"finalCltvDelta") y x)
                                  mutable'hopPubkeys
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "outgoing_chan_id"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"outgoingChanId") y x)
                                  mutable'hopPubkeys
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getBytes
                                              (Prelude.fromIntegral len))
                                        "hop_pubkeys"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'hopPubkeys y)
                                loop x v
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "payment_addr"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"paymentAddr") y x)
                                  mutable'hopPubkeys
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'hopPubkeys
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'hopPubkeys <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'hopPubkeys)
          "BuildRouteRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"amtMsat") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"finalCltvDelta") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"outgoingChanId") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((\ bs
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                             (Prelude.fromIntegral (Data.ByteString.length bs)))
                                          (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'hopPubkeys") _x))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view (Data.ProtoLens.Field.field @"paymentAddr") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                  ((\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                     _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData BuildRouteRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_BuildRouteRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_BuildRouteRequest'amtMsat x__)
                (Control.DeepSeq.deepseq
                   (_BuildRouteRequest'finalCltvDelta x__)
                   (Control.DeepSeq.deepseq
                      (_BuildRouteRequest'outgoingChanId x__)
                      (Control.DeepSeq.deepseq
                         (_BuildRouteRequest'hopPubkeys x__)
                         (Control.DeepSeq.deepseq
                            (_BuildRouteRequest'paymentAddr x__) ())))))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.route' @:: Lens' BuildRouteResponse Proto.LndGrpc.Route@
         * 'Proto.RouterGrpc_Fields.maybe'route' @:: Lens' BuildRouteResponse (Prelude.Maybe Proto.LndGrpc.Route)@ -}
data BuildRouteResponse
  = BuildRouteResponse'_constructor {_BuildRouteResponse'route :: !(Prelude.Maybe Proto.LndGrpc.Route),
                                     _BuildRouteResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show BuildRouteResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField BuildRouteResponse "route" Proto.LndGrpc.Route where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BuildRouteResponse'route
           (\ x__ y__ -> x__ {_BuildRouteResponse'route = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField BuildRouteResponse "maybe'route" (Prelude.Maybe Proto.LndGrpc.Route) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BuildRouteResponse'route
           (\ x__ y__ -> x__ {_BuildRouteResponse'route = y__}))
        Prelude.id
instance Data.ProtoLens.Message BuildRouteResponse where
  messageName _ = Data.Text.pack "routerrpc.BuildRouteResponse"
  fieldsByTag
    = let
        route__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "route"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.Route)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'route")) ::
              Data.ProtoLens.FieldDescriptor BuildRouteResponse
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, route__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _BuildRouteResponse'_unknownFields
        (\ x__ y__ -> x__ {_BuildRouteResponse'_unknownFields = y__})
  defMessage
    = BuildRouteResponse'_constructor
        {_BuildRouteResponse'route = Prelude.Nothing,
         _BuildRouteResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          BuildRouteResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser BuildRouteResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "route"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"route") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "BuildRouteResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'route") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData BuildRouteResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_BuildRouteResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_BuildRouteResponse'route x__) ())
newtype ChanStatusAction'UnrecognizedValue
  = ChanStatusAction'UnrecognizedValue Data.Int.Int32
  deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data ChanStatusAction
  = ENABLE |
    DISABLE |
    AUTO |
    ChanStatusAction'Unrecognized !ChanStatusAction'UnrecognizedValue
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum ChanStatusAction where
  maybeToEnum 0 = Prelude.Just ENABLE
  maybeToEnum 1 = Prelude.Just DISABLE
  maybeToEnum 2 = Prelude.Just AUTO
  maybeToEnum k
    = Prelude.Just
        (ChanStatusAction'Unrecognized
           (ChanStatusAction'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum ENABLE = "ENABLE"
  showEnum DISABLE = "DISABLE"
  showEnum AUTO = "AUTO"
  showEnum
    (ChanStatusAction'Unrecognized (ChanStatusAction'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "ENABLE" = Prelude.Just ENABLE
    | (Prelude.==) k "DISABLE" = Prelude.Just DISABLE
    | (Prelude.==) k "AUTO" = Prelude.Just AUTO
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded ChanStatusAction where
  minBound = ENABLE
  maxBound = AUTO
instance Prelude.Enum ChanStatusAction where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum ChanStatusAction: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum ENABLE = 0
  fromEnum DISABLE = 1
  fromEnum AUTO = 2
  fromEnum
    (ChanStatusAction'Unrecognized (ChanStatusAction'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ AUTO
    = Prelude.error
        "ChanStatusAction.succ: bad argument AUTO. This value would be out of bounds."
  succ ENABLE = DISABLE
  succ DISABLE = AUTO
  succ (ChanStatusAction'Unrecognized _)
    = Prelude.error
        "ChanStatusAction.succ: bad argument: unrecognized value"
  pred ENABLE
    = Prelude.error
        "ChanStatusAction.pred: bad argument ENABLE. This value would be out of bounds."
  pred DISABLE = ENABLE
  pred AUTO = DISABLE
  pred (ChanStatusAction'Unrecognized _)
    = Prelude.error
        "ChanStatusAction.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault ChanStatusAction where
  fieldDefault = ENABLE
instance Control.DeepSeq.NFData ChanStatusAction where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.chanId' @:: Lens' CircuitKey Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.htlcId' @:: Lens' CircuitKey Data.Word.Word64@ -}
data CircuitKey
  = CircuitKey'_constructor {_CircuitKey'chanId :: !Data.Word.Word64,
                             _CircuitKey'htlcId :: !Data.Word.Word64,
                             _CircuitKey'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CircuitKey where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField CircuitKey "chanId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CircuitKey'chanId (\ x__ y__ -> x__ {_CircuitKey'chanId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField CircuitKey "htlcId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CircuitKey'htlcId (\ x__ y__ -> x__ {_CircuitKey'htlcId = y__}))
        Prelude.id
instance Data.ProtoLens.Message CircuitKey where
  messageName _ = Data.Text.pack "routerrpc.CircuitKey"
  fieldsByTag
    = let
        chanId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "chan_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"chanId")) ::
              Data.ProtoLens.FieldDescriptor CircuitKey
        htlcId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "htlc_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"htlcId")) ::
              Data.ProtoLens.FieldDescriptor CircuitKey
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, chanId__field_descriptor),
           (Data.ProtoLens.Tag 2, htlcId__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CircuitKey'_unknownFields
        (\ x__ y__ -> x__ {_CircuitKey'_unknownFields = y__})
  defMessage
    = CircuitKey'_constructor
        {_CircuitKey'chanId = Data.ProtoLens.fieldDefault,
         _CircuitKey'htlcId = Data.ProtoLens.fieldDefault,
         _CircuitKey'_unknownFields = []}
  parseMessage
    = let
        loop ::
          CircuitKey -> Data.ProtoLens.Encoding.Bytes.Parser CircuitKey
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "chan_id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"chanId") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "htlc_id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"htlcId") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "CircuitKey"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"chanId") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"htlcId") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData CircuitKey where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_CircuitKey'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_CircuitKey'chanId x__)
                (Control.DeepSeq.deepseq (_CircuitKey'htlcId x__) ()))
newtype FailureDetail'UnrecognizedValue
  = FailureDetail'UnrecognizedValue Data.Int.Int32
  deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data FailureDetail
  = UNKNOWN |
    NO_DETAIL |
    ONION_DECODE |
    LINK_NOT_ELIGIBLE |
    ON_CHAIN_TIMEOUT |
    HTLC_EXCEEDS_MAX |
    INSUFFICIENT_BALANCE |
    INCOMPLETE_FORWARD |
    HTLC_ADD_FAILED |
    FORWARDS_DISABLED |
    INVOICE_CANCELED |
    INVOICE_UNDERPAID |
    INVOICE_EXPIRY_TOO_SOON |
    INVOICE_NOT_OPEN |
    MPP_INVOICE_TIMEOUT |
    ADDRESS_MISMATCH |
    SET_TOTAL_MISMATCH |
    SET_TOTAL_TOO_LOW |
    SET_OVERPAID |
    UNKNOWN_INVOICE |
    INVALID_KEYSEND |
    MPP_IN_PROGRESS |
    CIRCULAR_ROUTE |
    FailureDetail'Unrecognized !FailureDetail'UnrecognizedValue
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FailureDetail where
  maybeToEnum 0 = Prelude.Just UNKNOWN
  maybeToEnum 1 = Prelude.Just NO_DETAIL
  maybeToEnum 2 = Prelude.Just ONION_DECODE
  maybeToEnum 3 = Prelude.Just LINK_NOT_ELIGIBLE
  maybeToEnum 4 = Prelude.Just ON_CHAIN_TIMEOUT
  maybeToEnum 5 = Prelude.Just HTLC_EXCEEDS_MAX
  maybeToEnum 6 = Prelude.Just INSUFFICIENT_BALANCE
  maybeToEnum 7 = Prelude.Just INCOMPLETE_FORWARD
  maybeToEnum 8 = Prelude.Just HTLC_ADD_FAILED
  maybeToEnum 9 = Prelude.Just FORWARDS_DISABLED
  maybeToEnum 10 = Prelude.Just INVOICE_CANCELED
  maybeToEnum 11 = Prelude.Just INVOICE_UNDERPAID
  maybeToEnum 12 = Prelude.Just INVOICE_EXPIRY_TOO_SOON
  maybeToEnum 13 = Prelude.Just INVOICE_NOT_OPEN
  maybeToEnum 14 = Prelude.Just MPP_INVOICE_TIMEOUT
  maybeToEnum 15 = Prelude.Just ADDRESS_MISMATCH
  maybeToEnum 16 = Prelude.Just SET_TOTAL_MISMATCH
  maybeToEnum 17 = Prelude.Just SET_TOTAL_TOO_LOW
  maybeToEnum 18 = Prelude.Just SET_OVERPAID
  maybeToEnum 19 = Prelude.Just UNKNOWN_INVOICE
  maybeToEnum 20 = Prelude.Just INVALID_KEYSEND
  maybeToEnum 21 = Prelude.Just MPP_IN_PROGRESS
  maybeToEnum 22 = Prelude.Just CIRCULAR_ROUTE
  maybeToEnum k
    = Prelude.Just
        (FailureDetail'Unrecognized
           (FailureDetail'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UNKNOWN = "UNKNOWN"
  showEnum NO_DETAIL = "NO_DETAIL"
  showEnum ONION_DECODE = "ONION_DECODE"
  showEnum LINK_NOT_ELIGIBLE = "LINK_NOT_ELIGIBLE"
  showEnum ON_CHAIN_TIMEOUT = "ON_CHAIN_TIMEOUT"
  showEnum HTLC_EXCEEDS_MAX = "HTLC_EXCEEDS_MAX"
  showEnum INSUFFICIENT_BALANCE = "INSUFFICIENT_BALANCE"
  showEnum INCOMPLETE_FORWARD = "INCOMPLETE_FORWARD"
  showEnum HTLC_ADD_FAILED = "HTLC_ADD_FAILED"
  showEnum FORWARDS_DISABLED = "FORWARDS_DISABLED"
  showEnum INVOICE_CANCELED = "INVOICE_CANCELED"
  showEnum INVOICE_UNDERPAID = "INVOICE_UNDERPAID"
  showEnum INVOICE_EXPIRY_TOO_SOON = "INVOICE_EXPIRY_TOO_SOON"
  showEnum INVOICE_NOT_OPEN = "INVOICE_NOT_OPEN"
  showEnum MPP_INVOICE_TIMEOUT = "MPP_INVOICE_TIMEOUT"
  showEnum ADDRESS_MISMATCH = "ADDRESS_MISMATCH"
  showEnum SET_TOTAL_MISMATCH = "SET_TOTAL_MISMATCH"
  showEnum SET_TOTAL_TOO_LOW = "SET_TOTAL_TOO_LOW"
  showEnum SET_OVERPAID = "SET_OVERPAID"
  showEnum UNKNOWN_INVOICE = "UNKNOWN_INVOICE"
  showEnum INVALID_KEYSEND = "INVALID_KEYSEND"
  showEnum MPP_IN_PROGRESS = "MPP_IN_PROGRESS"
  showEnum CIRCULAR_ROUTE = "CIRCULAR_ROUTE"
  showEnum
    (FailureDetail'Unrecognized (FailureDetail'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UNKNOWN" = Prelude.Just UNKNOWN
    | (Prelude.==) k "NO_DETAIL" = Prelude.Just NO_DETAIL
    | (Prelude.==) k "ONION_DECODE" = Prelude.Just ONION_DECODE
    | (Prelude.==) k "LINK_NOT_ELIGIBLE"
    = Prelude.Just LINK_NOT_ELIGIBLE
    | (Prelude.==) k "ON_CHAIN_TIMEOUT" = Prelude.Just ON_CHAIN_TIMEOUT
    | (Prelude.==) k "HTLC_EXCEEDS_MAX" = Prelude.Just HTLC_EXCEEDS_MAX
    | (Prelude.==) k "INSUFFICIENT_BALANCE"
    = Prelude.Just INSUFFICIENT_BALANCE
    | (Prelude.==) k "INCOMPLETE_FORWARD"
    = Prelude.Just INCOMPLETE_FORWARD
    | (Prelude.==) k "HTLC_ADD_FAILED" = Prelude.Just HTLC_ADD_FAILED
    | (Prelude.==) k "FORWARDS_DISABLED"
    = Prelude.Just FORWARDS_DISABLED
    | (Prelude.==) k "INVOICE_CANCELED" = Prelude.Just INVOICE_CANCELED
    | (Prelude.==) k "INVOICE_UNDERPAID"
    = Prelude.Just INVOICE_UNDERPAID
    | (Prelude.==) k "INVOICE_EXPIRY_TOO_SOON"
    = Prelude.Just INVOICE_EXPIRY_TOO_SOON
    | (Prelude.==) k "INVOICE_NOT_OPEN" = Prelude.Just INVOICE_NOT_OPEN
    | (Prelude.==) k "MPP_INVOICE_TIMEOUT"
    = Prelude.Just MPP_INVOICE_TIMEOUT
    | (Prelude.==) k "ADDRESS_MISMATCH" = Prelude.Just ADDRESS_MISMATCH
    | (Prelude.==) k "SET_TOTAL_MISMATCH"
    = Prelude.Just SET_TOTAL_MISMATCH
    | (Prelude.==) k "SET_TOTAL_TOO_LOW"
    = Prelude.Just SET_TOTAL_TOO_LOW
    | (Prelude.==) k "SET_OVERPAID" = Prelude.Just SET_OVERPAID
    | (Prelude.==) k "UNKNOWN_INVOICE" = Prelude.Just UNKNOWN_INVOICE
    | (Prelude.==) k "INVALID_KEYSEND" = Prelude.Just INVALID_KEYSEND
    | (Prelude.==) k "MPP_IN_PROGRESS" = Prelude.Just MPP_IN_PROGRESS
    | (Prelude.==) k "CIRCULAR_ROUTE" = Prelude.Just CIRCULAR_ROUTE
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FailureDetail where
  minBound = UNKNOWN
  maxBound = CIRCULAR_ROUTE
instance Prelude.Enum FailureDetail where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum FailureDetail: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum UNKNOWN = 0
  fromEnum NO_DETAIL = 1
  fromEnum ONION_DECODE = 2
  fromEnum LINK_NOT_ELIGIBLE = 3
  fromEnum ON_CHAIN_TIMEOUT = 4
  fromEnum HTLC_EXCEEDS_MAX = 5
  fromEnum INSUFFICIENT_BALANCE = 6
  fromEnum INCOMPLETE_FORWARD = 7
  fromEnum HTLC_ADD_FAILED = 8
  fromEnum FORWARDS_DISABLED = 9
  fromEnum INVOICE_CANCELED = 10
  fromEnum INVOICE_UNDERPAID = 11
  fromEnum INVOICE_EXPIRY_TOO_SOON = 12
  fromEnum INVOICE_NOT_OPEN = 13
  fromEnum MPP_INVOICE_TIMEOUT = 14
  fromEnum ADDRESS_MISMATCH = 15
  fromEnum SET_TOTAL_MISMATCH = 16
  fromEnum SET_TOTAL_TOO_LOW = 17
  fromEnum SET_OVERPAID = 18
  fromEnum UNKNOWN_INVOICE = 19
  fromEnum INVALID_KEYSEND = 20
  fromEnum MPP_IN_PROGRESS = 21
  fromEnum CIRCULAR_ROUTE = 22
  fromEnum
    (FailureDetail'Unrecognized (FailureDetail'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ CIRCULAR_ROUTE
    = Prelude.error
        "FailureDetail.succ: bad argument CIRCULAR_ROUTE. This value would be out of bounds."
  succ UNKNOWN = NO_DETAIL
  succ NO_DETAIL = ONION_DECODE
  succ ONION_DECODE = LINK_NOT_ELIGIBLE
  succ LINK_NOT_ELIGIBLE = ON_CHAIN_TIMEOUT
  succ ON_CHAIN_TIMEOUT = HTLC_EXCEEDS_MAX
  succ HTLC_EXCEEDS_MAX = INSUFFICIENT_BALANCE
  succ INSUFFICIENT_BALANCE = INCOMPLETE_FORWARD
  succ INCOMPLETE_FORWARD = HTLC_ADD_FAILED
  succ HTLC_ADD_FAILED = FORWARDS_DISABLED
  succ FORWARDS_DISABLED = INVOICE_CANCELED
  succ INVOICE_CANCELED = INVOICE_UNDERPAID
  succ INVOICE_UNDERPAID = INVOICE_EXPIRY_TOO_SOON
  succ INVOICE_EXPIRY_TOO_SOON = INVOICE_NOT_OPEN
  succ INVOICE_NOT_OPEN = MPP_INVOICE_TIMEOUT
  succ MPP_INVOICE_TIMEOUT = ADDRESS_MISMATCH
  succ ADDRESS_MISMATCH = SET_TOTAL_MISMATCH
  succ SET_TOTAL_MISMATCH = SET_TOTAL_TOO_LOW
  succ SET_TOTAL_TOO_LOW = SET_OVERPAID
  succ SET_OVERPAID = UNKNOWN_INVOICE
  succ UNKNOWN_INVOICE = INVALID_KEYSEND
  succ INVALID_KEYSEND = MPP_IN_PROGRESS
  succ MPP_IN_PROGRESS = CIRCULAR_ROUTE
  succ (FailureDetail'Unrecognized _)
    = Prelude.error
        "FailureDetail.succ: bad argument: unrecognized value"
  pred UNKNOWN
    = Prelude.error
        "FailureDetail.pred: bad argument UNKNOWN. This value would be out of bounds."
  pred NO_DETAIL = UNKNOWN
  pred ONION_DECODE = NO_DETAIL
  pred LINK_NOT_ELIGIBLE = ONION_DECODE
  pred ON_CHAIN_TIMEOUT = LINK_NOT_ELIGIBLE
  pred HTLC_EXCEEDS_MAX = ON_CHAIN_TIMEOUT
  pred INSUFFICIENT_BALANCE = HTLC_EXCEEDS_MAX
  pred INCOMPLETE_FORWARD = INSUFFICIENT_BALANCE
  pred HTLC_ADD_FAILED = INCOMPLETE_FORWARD
  pred FORWARDS_DISABLED = HTLC_ADD_FAILED
  pred INVOICE_CANCELED = FORWARDS_DISABLED
  pred INVOICE_UNDERPAID = INVOICE_CANCELED
  pred INVOICE_EXPIRY_TOO_SOON = INVOICE_UNDERPAID
  pred INVOICE_NOT_OPEN = INVOICE_EXPIRY_TOO_SOON
  pred MPP_INVOICE_TIMEOUT = INVOICE_NOT_OPEN
  pred ADDRESS_MISMATCH = MPP_INVOICE_TIMEOUT
  pred SET_TOTAL_MISMATCH = ADDRESS_MISMATCH
  pred SET_TOTAL_TOO_LOW = SET_TOTAL_MISMATCH
  pred SET_OVERPAID = SET_TOTAL_TOO_LOW
  pred UNKNOWN_INVOICE = SET_OVERPAID
  pred INVALID_KEYSEND = UNKNOWN_INVOICE
  pred MPP_IN_PROGRESS = INVALID_KEYSEND
  pred CIRCULAR_ROUTE = MPP_IN_PROGRESS
  pred (FailureDetail'Unrecognized _)
    = Prelude.error
        "FailureDetail.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FailureDetail where
  fieldDefault = UNKNOWN
instance Control.DeepSeq.NFData FailureDetail where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.info' @:: Lens' ForwardEvent HtlcInfo@
         * 'Proto.RouterGrpc_Fields.maybe'info' @:: Lens' ForwardEvent (Prelude.Maybe HtlcInfo)@ -}
data ForwardEvent
  = ForwardEvent'_constructor {_ForwardEvent'info :: !(Prelude.Maybe HtlcInfo),
                               _ForwardEvent'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ForwardEvent where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ForwardEvent "info" HtlcInfo where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardEvent'info (\ x__ y__ -> x__ {_ForwardEvent'info = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ForwardEvent "maybe'info" (Prelude.Maybe HtlcInfo) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardEvent'info (\ x__ y__ -> x__ {_ForwardEvent'info = y__}))
        Prelude.id
instance Data.ProtoLens.Message ForwardEvent where
  messageName _ = Data.Text.pack "routerrpc.ForwardEvent"
  fieldsByTag
    = let
        info__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "info"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor HtlcInfo)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'info")) ::
              Data.ProtoLens.FieldDescriptor ForwardEvent
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, info__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ForwardEvent'_unknownFields
        (\ x__ y__ -> x__ {_ForwardEvent'_unknownFields = y__})
  defMessage
    = ForwardEvent'_constructor
        {_ForwardEvent'info = Prelude.Nothing,
         _ForwardEvent'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ForwardEvent -> Data.ProtoLens.Encoding.Bytes.Parser ForwardEvent
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "info"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"info") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ForwardEvent"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'info") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ForwardEvent where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ForwardEvent'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ForwardEvent'info x__) ())
{- | Fields :
      -}
data ForwardFailEvent
  = ForwardFailEvent'_constructor {_ForwardFailEvent'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ForwardFailEvent where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message ForwardFailEvent where
  messageName _ = Data.Text.pack "routerrpc.ForwardFailEvent"
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ForwardFailEvent'_unknownFields
        (\ x__ y__ -> x__ {_ForwardFailEvent'_unknownFields = y__})
  defMessage
    = ForwardFailEvent'_constructor
        {_ForwardFailEvent'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ForwardFailEvent
          -> Data.ProtoLens.Encoding.Bytes.Parser ForwardFailEvent
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ForwardFailEvent"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData ForwardFailEvent where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ForwardFailEvent'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.incomingCircuitKey' @:: Lens' ForwardHtlcInterceptRequest CircuitKey@
         * 'Proto.RouterGrpc_Fields.maybe'incomingCircuitKey' @:: Lens' ForwardHtlcInterceptRequest (Prelude.Maybe CircuitKey)@
         * 'Proto.RouterGrpc_Fields.incomingAmountMsat' @:: Lens' ForwardHtlcInterceptRequest Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.incomingExpiry' @:: Lens' ForwardHtlcInterceptRequest Data.Word.Word32@
         * 'Proto.RouterGrpc_Fields.paymentHash' @:: Lens' ForwardHtlcInterceptRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.outgoingRequestedChanId' @:: Lens' ForwardHtlcInterceptRequest Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.outgoingAmountMsat' @:: Lens' ForwardHtlcInterceptRequest Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.outgoingExpiry' @:: Lens' ForwardHtlcInterceptRequest Data.Word.Word32@
         * 'Proto.RouterGrpc_Fields.customRecords' @:: Lens' ForwardHtlcInterceptRequest (Data.Map.Map Data.Word.Word64 Data.ByteString.ByteString)@
         * 'Proto.RouterGrpc_Fields.onionBlob' @:: Lens' ForwardHtlcInterceptRequest Data.ByteString.ByteString@ -}
data ForwardHtlcInterceptRequest
  = ForwardHtlcInterceptRequest'_constructor {_ForwardHtlcInterceptRequest'incomingCircuitKey :: !(Prelude.Maybe CircuitKey),
                                              _ForwardHtlcInterceptRequest'incomingAmountMsat :: !Data.Word.Word64,
                                              _ForwardHtlcInterceptRequest'incomingExpiry :: !Data.Word.Word32,
                                              _ForwardHtlcInterceptRequest'paymentHash :: !Data.ByteString.ByteString,
                                              _ForwardHtlcInterceptRequest'outgoingRequestedChanId :: !Data.Word.Word64,
                                              _ForwardHtlcInterceptRequest'outgoingAmountMsat :: !Data.Word.Word64,
                                              _ForwardHtlcInterceptRequest'outgoingExpiry :: !Data.Word.Word32,
                                              _ForwardHtlcInterceptRequest'customRecords :: !(Data.Map.Map Data.Word.Word64 Data.ByteString.ByteString),
                                              _ForwardHtlcInterceptRequest'onionBlob :: !Data.ByteString.ByteString,
                                              _ForwardHtlcInterceptRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ForwardHtlcInterceptRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "incomingCircuitKey" CircuitKey where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'incomingCircuitKey
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptRequest'incomingCircuitKey = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "maybe'incomingCircuitKey" (Prelude.Maybe CircuitKey) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'incomingCircuitKey
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptRequest'incomingCircuitKey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "incomingAmountMsat" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'incomingAmountMsat
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptRequest'incomingAmountMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "incomingExpiry" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'incomingExpiry
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptRequest'incomingExpiry = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "paymentHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'paymentHash
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptRequest'paymentHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "outgoingRequestedChanId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'outgoingRequestedChanId
           (\ x__ y__
              -> x__
                   {_ForwardHtlcInterceptRequest'outgoingRequestedChanId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "outgoingAmountMsat" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'outgoingAmountMsat
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptRequest'outgoingAmountMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "outgoingExpiry" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'outgoingExpiry
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptRequest'outgoingExpiry = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "customRecords" (Data.Map.Map Data.Word.Word64 Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'customRecords
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptRequest'customRecords = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest "onionBlob" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'onionBlob
           (\ x__ y__ -> x__ {_ForwardHtlcInterceptRequest'onionBlob = y__}))
        Prelude.id
instance Data.ProtoLens.Message ForwardHtlcInterceptRequest where
  messageName _
    = Data.Text.pack "routerrpc.ForwardHtlcInterceptRequest"
  fieldsByTag
    = let
        incomingCircuitKey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "incoming_circuit_key"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor CircuitKey)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'incomingCircuitKey")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest
        incomingAmountMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "incoming_amount_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"incomingAmountMsat")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest
        incomingExpiry__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "incoming_expiry"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"incomingExpiry")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest
        paymentHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentHash")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest
        outgoingRequestedChanId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_requested_chan_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"outgoingRequestedChanId")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest
        outgoingAmountMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_amount_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"outgoingAmountMsat")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest
        outgoingExpiry__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_expiry"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"outgoingExpiry")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest
        customRecords__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "custom_records"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ForwardHtlcInterceptRequest'CustomRecordsEntry)
              (Data.ProtoLens.MapField
                 (Data.ProtoLens.Field.field @"key")
                 (Data.ProtoLens.Field.field @"value")
                 (Data.ProtoLens.Field.field @"customRecords")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest
        onionBlob__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "onion_blob"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"onionBlob")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, incomingCircuitKey__field_descriptor),
           (Data.ProtoLens.Tag 5, incomingAmountMsat__field_descriptor),
           (Data.ProtoLens.Tag 6, incomingExpiry__field_descriptor),
           (Data.ProtoLens.Tag 2, paymentHash__field_descriptor),
           (Data.ProtoLens.Tag 7, outgoingRequestedChanId__field_descriptor),
           (Data.ProtoLens.Tag 3, outgoingAmountMsat__field_descriptor),
           (Data.ProtoLens.Tag 4, outgoingExpiry__field_descriptor),
           (Data.ProtoLens.Tag 8, customRecords__field_descriptor),
           (Data.ProtoLens.Tag 9, onionBlob__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ForwardHtlcInterceptRequest'_unknownFields
        (\ x__ y__
           -> x__ {_ForwardHtlcInterceptRequest'_unknownFields = y__})
  defMessage
    = ForwardHtlcInterceptRequest'_constructor
        {_ForwardHtlcInterceptRequest'incomingCircuitKey = Prelude.Nothing,
         _ForwardHtlcInterceptRequest'incomingAmountMsat = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptRequest'incomingExpiry = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptRequest'paymentHash = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptRequest'outgoingRequestedChanId = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptRequest'outgoingAmountMsat = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptRequest'outgoingExpiry = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptRequest'customRecords = Data.Map.empty,
         _ForwardHtlcInterceptRequest'onionBlob = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ForwardHtlcInterceptRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ForwardHtlcInterceptRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "incoming_circuit_key"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"incomingCircuitKey") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt
                                       "incoming_amount_msat"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"incomingAmountMsat") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "incoming_expiry"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"incomingExpiry") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "payment_hash"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"paymentHash") y x)
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt
                                       "outgoing_requested_chan_id"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"outgoingRequestedChanId") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt
                                       "outgoing_amount_msat"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"outgoingAmountMsat") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "outgoing_expiry"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"outgoingExpiry") y x)
                        66
                          -> do !(entry :: ForwardHtlcInterceptRequest'CustomRecordsEntry) <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                                                (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                                                                    Data.ProtoLens.Encoding.Bytes.isolate
                                                                                                      (Prelude.fromIntegral
                                                                                                         len)
                                                                                                      Data.ProtoLens.parseMessage)
                                                                                                "custom_records"
                                (let
                                   key = Lens.Family2.view (Data.ProtoLens.Field.field @"key") entry
                                   value
                                     = Lens.Family2.view (Data.ProtoLens.Field.field @"value") entry
                                 in
                                   loop
                                     (Lens.Family2.over
                                        (Data.ProtoLens.Field.field @"customRecords")
                                        (\ !t -> Data.Map.insert key value t)
                                        x))
                        74
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "onion_blob"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"onionBlob") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ForwardHtlcInterceptRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'incomingCircuitKey") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"incomingAmountMsat") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"incomingExpiry") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view (Data.ProtoLens.Field.field @"paymentHash") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                               ((\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"outgoingRequestedChanId") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                         ((Data.Monoid.<>)
                            (let
                               _v
                                 = Lens.Family2.view
                                     (Data.ProtoLens.Field.field @"outgoingAmountMsat") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"outgoingExpiry") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           Prelude.fromIntegral
                                           _v))
                               ((Data.Monoid.<>)
                                  (Data.Monoid.mconcat
                                     (Prelude.map
                                        (\ _v
                                           -> (Data.Monoid.<>)
                                                (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                                ((Prelude..)
                                                   (\ bs
                                                      -> (Data.Monoid.<>)
                                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                              (Prelude.fromIntegral
                                                                 (Data.ByteString.length bs)))
                                                           (Data.ProtoLens.Encoding.Bytes.putBytes
                                                              bs))
                                                   Data.ProtoLens.encodeMessage
                                                   (Lens.Family2.set
                                                      (Data.ProtoLens.Field.field @"key")
                                                      (Prelude.fst _v)
                                                      (Lens.Family2.set
                                                         (Data.ProtoLens.Field.field @"value")
                                                         (Prelude.snd _v)
                                                         (Data.ProtoLens.defMessage ::
                                                            ForwardHtlcInterceptRequest'CustomRecordsEntry)))))
                                        (Data.Map.toList
                                           (Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"customRecords") _x))))
                                  ((Data.Monoid.<>)
                                     (let
                                        _v
                                          = Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"onionBlob") _x
                                      in
                                        if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                            Data.Monoid.mempty
                                        else
                                            (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                                              ((\ bs
                                                  -> (Data.Monoid.<>)
                                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                          (Prelude.fromIntegral
                                                             (Data.ByteString.length bs)))
                                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                                 _v))
                                     (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                        (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))))
instance Control.DeepSeq.NFData ForwardHtlcInterceptRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ForwardHtlcInterceptRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ForwardHtlcInterceptRequest'incomingCircuitKey x__)
                (Control.DeepSeq.deepseq
                   (_ForwardHtlcInterceptRequest'incomingAmountMsat x__)
                   (Control.DeepSeq.deepseq
                      (_ForwardHtlcInterceptRequest'incomingExpiry x__)
                      (Control.DeepSeq.deepseq
                         (_ForwardHtlcInterceptRequest'paymentHash x__)
                         (Control.DeepSeq.deepseq
                            (_ForwardHtlcInterceptRequest'outgoingRequestedChanId x__)
                            (Control.DeepSeq.deepseq
                               (_ForwardHtlcInterceptRequest'outgoingAmountMsat x__)
                               (Control.DeepSeq.deepseq
                                  (_ForwardHtlcInterceptRequest'outgoingExpiry x__)
                                  (Control.DeepSeq.deepseq
                                     (_ForwardHtlcInterceptRequest'customRecords x__)
                                     (Control.DeepSeq.deepseq
                                        (_ForwardHtlcInterceptRequest'onionBlob x__) ())))))))))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.key' @:: Lens' ForwardHtlcInterceptRequest'CustomRecordsEntry Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.value' @:: Lens' ForwardHtlcInterceptRequest'CustomRecordsEntry Data.ByteString.ByteString@ -}
data ForwardHtlcInterceptRequest'CustomRecordsEntry
  = ForwardHtlcInterceptRequest'CustomRecordsEntry'_constructor {_ForwardHtlcInterceptRequest'CustomRecordsEntry'key :: !Data.Word.Word64,
                                                                 _ForwardHtlcInterceptRequest'CustomRecordsEntry'value :: !Data.ByteString.ByteString,
                                                                 _ForwardHtlcInterceptRequest'CustomRecordsEntry'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ForwardHtlcInterceptRequest'CustomRecordsEntry where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest'CustomRecordsEntry "key" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'CustomRecordsEntry'key
           (\ x__ y__
              -> x__
                   {_ForwardHtlcInterceptRequest'CustomRecordsEntry'key = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptRequest'CustomRecordsEntry "value" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptRequest'CustomRecordsEntry'value
           (\ x__ y__
              -> x__
                   {_ForwardHtlcInterceptRequest'CustomRecordsEntry'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message ForwardHtlcInterceptRequest'CustomRecordsEntry where
  messageName _
    = Data.Text.pack
        "routerrpc.ForwardHtlcInterceptRequest.CustomRecordsEntry"
  fieldsByTag
    = let
        key__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"key")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest'CustomRecordsEntry
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptRequest'CustomRecordsEntry
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, key__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ForwardHtlcInterceptRequest'CustomRecordsEntry'_unknownFields
        (\ x__ y__
           -> x__
                {_ForwardHtlcInterceptRequest'CustomRecordsEntry'_unknownFields = y__})
  defMessage
    = ForwardHtlcInterceptRequest'CustomRecordsEntry'_constructor
        {_ForwardHtlcInterceptRequest'CustomRecordsEntry'key = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptRequest'CustomRecordsEntry'value = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptRequest'CustomRecordsEntry'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ForwardHtlcInterceptRequest'CustomRecordsEntry
          -> Data.ProtoLens.Encoding.Bytes.Parser ForwardHtlcInterceptRequest'CustomRecordsEntry
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "key"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "CustomRecordsEntry"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData ForwardHtlcInterceptRequest'CustomRecordsEntry where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ForwardHtlcInterceptRequest'CustomRecordsEntry'_unknownFields
                x__)
             (Control.DeepSeq.deepseq
                (_ForwardHtlcInterceptRequest'CustomRecordsEntry'key x__)
                (Control.DeepSeq.deepseq
                   (_ForwardHtlcInterceptRequest'CustomRecordsEntry'value x__) ()))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.incomingCircuitKey' @:: Lens' ForwardHtlcInterceptResponse CircuitKey@
         * 'Proto.RouterGrpc_Fields.maybe'incomingCircuitKey' @:: Lens' ForwardHtlcInterceptResponse (Prelude.Maybe CircuitKey)@
         * 'Proto.RouterGrpc_Fields.action' @:: Lens' ForwardHtlcInterceptResponse ResolveHoldForwardAction@
         * 'Proto.RouterGrpc_Fields.preimage' @:: Lens' ForwardHtlcInterceptResponse Data.ByteString.ByteString@ -}
data ForwardHtlcInterceptResponse
  = ForwardHtlcInterceptResponse'_constructor {_ForwardHtlcInterceptResponse'incomingCircuitKey :: !(Prelude.Maybe CircuitKey),
                                               _ForwardHtlcInterceptResponse'action :: !ResolveHoldForwardAction,
                                               _ForwardHtlcInterceptResponse'preimage :: !Data.ByteString.ByteString,
                                               _ForwardHtlcInterceptResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ForwardHtlcInterceptResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptResponse "incomingCircuitKey" CircuitKey where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptResponse'incomingCircuitKey
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptResponse'incomingCircuitKey = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptResponse "maybe'incomingCircuitKey" (Prelude.Maybe CircuitKey) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptResponse'incomingCircuitKey
           (\ x__ y__
              -> x__ {_ForwardHtlcInterceptResponse'incomingCircuitKey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptResponse "action" ResolveHoldForwardAction where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptResponse'action
           (\ x__ y__ -> x__ {_ForwardHtlcInterceptResponse'action = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ForwardHtlcInterceptResponse "preimage" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ForwardHtlcInterceptResponse'preimage
           (\ x__ y__ -> x__ {_ForwardHtlcInterceptResponse'preimage = y__}))
        Prelude.id
instance Data.ProtoLens.Message ForwardHtlcInterceptResponse where
  messageName _
    = Data.Text.pack "routerrpc.ForwardHtlcInterceptResponse"
  fieldsByTag
    = let
        incomingCircuitKey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "incoming_circuit_key"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor CircuitKey)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'incomingCircuitKey")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptResponse
        action__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "action"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor ResolveHoldForwardAction)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"action")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptResponse
        preimage__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "preimage"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"preimage")) ::
              Data.ProtoLens.FieldDescriptor ForwardHtlcInterceptResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, incomingCircuitKey__field_descriptor),
           (Data.ProtoLens.Tag 2, action__field_descriptor),
           (Data.ProtoLens.Tag 3, preimage__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ForwardHtlcInterceptResponse'_unknownFields
        (\ x__ y__
           -> x__ {_ForwardHtlcInterceptResponse'_unknownFields = y__})
  defMessage
    = ForwardHtlcInterceptResponse'_constructor
        {_ForwardHtlcInterceptResponse'incomingCircuitKey = Prelude.Nothing,
         _ForwardHtlcInterceptResponse'action = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptResponse'preimage = Data.ProtoLens.fieldDefault,
         _ForwardHtlcInterceptResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ForwardHtlcInterceptResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser ForwardHtlcInterceptResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "incoming_circuit_key"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"incomingCircuitKey") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "action"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"action") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "preimage"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"preimage") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ForwardHtlcInterceptResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'incomingCircuitKey") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"action") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                            Prelude.fromEnum
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"preimage") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData ForwardHtlcInterceptResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ForwardHtlcInterceptResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ForwardHtlcInterceptResponse'incomingCircuitKey x__)
                (Control.DeepSeq.deepseq
                   (_ForwardHtlcInterceptResponse'action x__)
                   (Control.DeepSeq.deepseq
                      (_ForwardHtlcInterceptResponse'preimage x__) ())))
{- | Fields :
      -}
data GetMissionControlConfigRequest
  = GetMissionControlConfigRequest'_constructor {_GetMissionControlConfigRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GetMissionControlConfigRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message GetMissionControlConfigRequest where
  messageName _
    = Data.Text.pack "routerrpc.GetMissionControlConfigRequest"
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetMissionControlConfigRequest'_unknownFields
        (\ x__ y__
           -> x__ {_GetMissionControlConfigRequest'_unknownFields = y__})
  defMessage
    = GetMissionControlConfigRequest'_constructor
        {_GetMissionControlConfigRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetMissionControlConfigRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser GetMissionControlConfigRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage)
          "GetMissionControlConfigRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData GetMissionControlConfigRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GetMissionControlConfigRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.config' @:: Lens' GetMissionControlConfigResponse MissionControlConfig@
         * 'Proto.RouterGrpc_Fields.maybe'config' @:: Lens' GetMissionControlConfigResponse (Prelude.Maybe MissionControlConfig)@ -}
data GetMissionControlConfigResponse
  = GetMissionControlConfigResponse'_constructor {_GetMissionControlConfigResponse'config :: !(Prelude.Maybe MissionControlConfig),
                                                  _GetMissionControlConfigResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GetMissionControlConfigResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField GetMissionControlConfigResponse "config" MissionControlConfig where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetMissionControlConfigResponse'config
           (\ x__ y__ -> x__ {_GetMissionControlConfigResponse'config = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField GetMissionControlConfigResponse "maybe'config" (Prelude.Maybe MissionControlConfig) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetMissionControlConfigResponse'config
           (\ x__ y__ -> x__ {_GetMissionControlConfigResponse'config = y__}))
        Prelude.id
instance Data.ProtoLens.Message GetMissionControlConfigResponse where
  messageName _
    = Data.Text.pack "routerrpc.GetMissionControlConfigResponse"
  fieldsByTag
    = let
        config__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "config"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor MissionControlConfig)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'config")) ::
              Data.ProtoLens.FieldDescriptor GetMissionControlConfigResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, config__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetMissionControlConfigResponse'_unknownFields
        (\ x__ y__
           -> x__ {_GetMissionControlConfigResponse'_unknownFields = y__})
  defMessage
    = GetMissionControlConfigResponse'_constructor
        {_GetMissionControlConfigResponse'config = Prelude.Nothing,
         _GetMissionControlConfigResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetMissionControlConfigResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser GetMissionControlConfigResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "config"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"config") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage)
          "GetMissionControlConfigResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'config") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData GetMissionControlConfigResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GetMissionControlConfigResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_GetMissionControlConfigResponse'config x__) ())
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.incomingChannelId' @:: Lens' HtlcEvent Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.outgoingChannelId' @:: Lens' HtlcEvent Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.incomingHtlcId' @:: Lens' HtlcEvent Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.outgoingHtlcId' @:: Lens' HtlcEvent Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.timestampNs' @:: Lens' HtlcEvent Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.eventType' @:: Lens' HtlcEvent HtlcEvent'EventType@
         * 'Proto.RouterGrpc_Fields.maybe'event' @:: Lens' HtlcEvent (Prelude.Maybe HtlcEvent'Event)@
         * 'Proto.RouterGrpc_Fields.maybe'forwardEvent' @:: Lens' HtlcEvent (Prelude.Maybe ForwardEvent)@
         * 'Proto.RouterGrpc_Fields.forwardEvent' @:: Lens' HtlcEvent ForwardEvent@
         * 'Proto.RouterGrpc_Fields.maybe'forwardFailEvent' @:: Lens' HtlcEvent (Prelude.Maybe ForwardFailEvent)@
         * 'Proto.RouterGrpc_Fields.forwardFailEvent' @:: Lens' HtlcEvent ForwardFailEvent@
         * 'Proto.RouterGrpc_Fields.maybe'settleEvent' @:: Lens' HtlcEvent (Prelude.Maybe SettleEvent)@
         * 'Proto.RouterGrpc_Fields.settleEvent' @:: Lens' HtlcEvent SettleEvent@
         * 'Proto.RouterGrpc_Fields.maybe'linkFailEvent' @:: Lens' HtlcEvent (Prelude.Maybe LinkFailEvent)@
         * 'Proto.RouterGrpc_Fields.linkFailEvent' @:: Lens' HtlcEvent LinkFailEvent@ -}
data HtlcEvent
  = HtlcEvent'_constructor {_HtlcEvent'incomingChannelId :: !Data.Word.Word64,
                            _HtlcEvent'outgoingChannelId :: !Data.Word.Word64,
                            _HtlcEvent'incomingHtlcId :: !Data.Word.Word64,
                            _HtlcEvent'outgoingHtlcId :: !Data.Word.Word64,
                            _HtlcEvent'timestampNs :: !Data.Word.Word64,
                            _HtlcEvent'eventType :: !HtlcEvent'EventType,
                            _HtlcEvent'event :: !(Prelude.Maybe HtlcEvent'Event),
                            _HtlcEvent'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show HtlcEvent where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data HtlcEvent'Event
  = HtlcEvent'ForwardEvent !ForwardEvent |
    HtlcEvent'ForwardFailEvent !ForwardFailEvent |
    HtlcEvent'SettleEvent !SettleEvent |
    HtlcEvent'LinkFailEvent !LinkFailEvent
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField HtlcEvent "incomingChannelId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'incomingChannelId
           (\ x__ y__ -> x__ {_HtlcEvent'incomingChannelId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcEvent "outgoingChannelId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'outgoingChannelId
           (\ x__ y__ -> x__ {_HtlcEvent'outgoingChannelId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcEvent "incomingHtlcId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'incomingHtlcId
           (\ x__ y__ -> x__ {_HtlcEvent'incomingHtlcId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcEvent "outgoingHtlcId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'outgoingHtlcId
           (\ x__ y__ -> x__ {_HtlcEvent'outgoingHtlcId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcEvent "timestampNs" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'timestampNs
           (\ x__ y__ -> x__ {_HtlcEvent'timestampNs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcEvent "eventType" HtlcEvent'EventType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'eventType
           (\ x__ y__ -> x__ {_HtlcEvent'eventType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcEvent "maybe'event" (Prelude.Maybe HtlcEvent'Event) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'event (\ x__ y__ -> x__ {_HtlcEvent'event = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcEvent "maybe'forwardEvent" (Prelude.Maybe ForwardEvent) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'event (\ x__ y__ -> x__ {_HtlcEvent'event = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (HtlcEvent'ForwardEvent x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap HtlcEvent'ForwardEvent y__))
instance Data.ProtoLens.Field.HasField HtlcEvent "forwardEvent" ForwardEvent where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'event (\ x__ y__ -> x__ {_HtlcEvent'event = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (HtlcEvent'ForwardEvent x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap HtlcEvent'ForwardEvent y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField HtlcEvent "maybe'forwardFailEvent" (Prelude.Maybe ForwardFailEvent) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'event (\ x__ y__ -> x__ {_HtlcEvent'event = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (HtlcEvent'ForwardFailEvent x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap HtlcEvent'ForwardFailEvent y__))
instance Data.ProtoLens.Field.HasField HtlcEvent "forwardFailEvent" ForwardFailEvent where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'event (\ x__ y__ -> x__ {_HtlcEvent'event = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (HtlcEvent'ForwardFailEvent x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap HtlcEvent'ForwardFailEvent y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField HtlcEvent "maybe'settleEvent" (Prelude.Maybe SettleEvent) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'event (\ x__ y__ -> x__ {_HtlcEvent'event = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (HtlcEvent'SettleEvent x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap HtlcEvent'SettleEvent y__))
instance Data.ProtoLens.Field.HasField HtlcEvent "settleEvent" SettleEvent where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'event (\ x__ y__ -> x__ {_HtlcEvent'event = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (HtlcEvent'SettleEvent x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap HtlcEvent'SettleEvent y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField HtlcEvent "maybe'linkFailEvent" (Prelude.Maybe LinkFailEvent) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'event (\ x__ y__ -> x__ {_HtlcEvent'event = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (HtlcEvent'LinkFailEvent x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap HtlcEvent'LinkFailEvent y__))
instance Data.ProtoLens.Field.HasField HtlcEvent "linkFailEvent" LinkFailEvent where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcEvent'event (\ x__ y__ -> x__ {_HtlcEvent'event = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (HtlcEvent'LinkFailEvent x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap HtlcEvent'LinkFailEvent y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message HtlcEvent where
  messageName _ = Data.Text.pack "routerrpc.HtlcEvent"
  fieldsByTag
    = let
        incomingChannelId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "incoming_channel_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"incomingChannelId")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
        outgoingChannelId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_channel_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"outgoingChannelId")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
        incomingHtlcId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "incoming_htlc_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"incomingHtlcId")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
        outgoingHtlcId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_htlc_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"outgoingHtlcId")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
        timestampNs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "timestamp_ns"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"timestampNs")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
        eventType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "event_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor HtlcEvent'EventType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"eventType")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
        forwardEvent__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "forward_event"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ForwardEvent)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'forwardEvent")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
        forwardFailEvent__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "forward_fail_event"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ForwardFailEvent)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'forwardFailEvent")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
        settleEvent__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "settle_event"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SettleEvent)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'settleEvent")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
        linkFailEvent__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "link_fail_event"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor LinkFailEvent)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'linkFailEvent")) ::
              Data.ProtoLens.FieldDescriptor HtlcEvent
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, incomingChannelId__field_descriptor),
           (Data.ProtoLens.Tag 2, outgoingChannelId__field_descriptor),
           (Data.ProtoLens.Tag 3, incomingHtlcId__field_descriptor),
           (Data.ProtoLens.Tag 4, outgoingHtlcId__field_descriptor),
           (Data.ProtoLens.Tag 5, timestampNs__field_descriptor),
           (Data.ProtoLens.Tag 6, eventType__field_descriptor),
           (Data.ProtoLens.Tag 7, forwardEvent__field_descriptor),
           (Data.ProtoLens.Tag 8, forwardFailEvent__field_descriptor),
           (Data.ProtoLens.Tag 9, settleEvent__field_descriptor),
           (Data.ProtoLens.Tag 10, linkFailEvent__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _HtlcEvent'_unknownFields
        (\ x__ y__ -> x__ {_HtlcEvent'_unknownFields = y__})
  defMessage
    = HtlcEvent'_constructor
        {_HtlcEvent'incomingChannelId = Data.ProtoLens.fieldDefault,
         _HtlcEvent'outgoingChannelId = Data.ProtoLens.fieldDefault,
         _HtlcEvent'incomingHtlcId = Data.ProtoLens.fieldDefault,
         _HtlcEvent'outgoingHtlcId = Data.ProtoLens.fieldDefault,
         _HtlcEvent'timestampNs = Data.ProtoLens.fieldDefault,
         _HtlcEvent'eventType = Data.ProtoLens.fieldDefault,
         _HtlcEvent'event = Prelude.Nothing, _HtlcEvent'_unknownFields = []}
  parseMessage
    = let
        loop :: HtlcEvent -> Data.ProtoLens.Encoding.Bytes.Parser HtlcEvent
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "incoming_channel_id"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"incomingChannelId") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "outgoing_channel_id"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"outgoingChannelId") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "incoming_htlc_id"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"incomingHtlcId") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "outgoing_htlc_id"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"outgoingHtlcId") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "timestamp_ns"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"timestampNs") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "event_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"eventType") y x)
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "forward_event"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"forwardEvent") y x)
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "forward_fail_event"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"forwardFailEvent") y x)
                        74
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "settle_event"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"settleEvent") y x)
                        82
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "link_fail_event"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"linkFailEvent") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "HtlcEvent"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"incomingChannelId") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"outgoingChannelId") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"incomingHtlcId") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"outgoingHtlcId") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view (Data.ProtoLens.Field.field @"timestampNs") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                         ((Data.Monoid.<>)
                            (let
                               _v = Lens.Family2.view (Data.ProtoLens.Field.field @"eventType") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           Prelude.fromIntegral)
                                        Prelude.fromEnum
                                        _v))
                            ((Data.Monoid.<>)
                               (case
                                    Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'event") _x
                                of
                                  Prelude.Nothing -> Data.Monoid.mempty
                                  (Prelude.Just (HtlcEvent'ForwardEvent v))
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                         ((Prelude..)
                                            (\ bs
                                               -> (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Data.ProtoLens.encodeMessage
                                            v)
                                  (Prelude.Just (HtlcEvent'ForwardFailEvent v))
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                         ((Prelude..)
                                            (\ bs
                                               -> (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Data.ProtoLens.encodeMessage
                                            v)
                                  (Prelude.Just (HtlcEvent'SettleEvent v))
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                                         ((Prelude..)
                                            (\ bs
                                               -> (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Data.ProtoLens.encodeMessage
                                            v)
                                  (Prelude.Just (HtlcEvent'LinkFailEvent v))
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 82)
                                         ((Prelude..)
                                            (\ bs
                                               -> (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Data.ProtoLens.encodeMessage
                                            v))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData HtlcEvent where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_HtlcEvent'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_HtlcEvent'incomingChannelId x__)
                (Control.DeepSeq.deepseq
                   (_HtlcEvent'outgoingChannelId x__)
                   (Control.DeepSeq.deepseq
                      (_HtlcEvent'incomingHtlcId x__)
                      (Control.DeepSeq.deepseq
                         (_HtlcEvent'outgoingHtlcId x__)
                         (Control.DeepSeq.deepseq
                            (_HtlcEvent'timestampNs x__)
                            (Control.DeepSeq.deepseq
                               (_HtlcEvent'eventType x__)
                               (Control.DeepSeq.deepseq (_HtlcEvent'event x__) ())))))))
instance Control.DeepSeq.NFData HtlcEvent'Event where
  rnf (HtlcEvent'ForwardEvent x__) = Control.DeepSeq.rnf x__
  rnf (HtlcEvent'ForwardFailEvent x__) = Control.DeepSeq.rnf x__
  rnf (HtlcEvent'SettleEvent x__) = Control.DeepSeq.rnf x__
  rnf (HtlcEvent'LinkFailEvent x__) = Control.DeepSeq.rnf x__
_HtlcEvent'ForwardEvent ::
  Data.ProtoLens.Prism.Prism' HtlcEvent'Event ForwardEvent
_HtlcEvent'ForwardEvent
  = Data.ProtoLens.Prism.prism'
      HtlcEvent'ForwardEvent
      (\ p__
         -> case p__ of
              (HtlcEvent'ForwardEvent p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_HtlcEvent'ForwardFailEvent ::
  Data.ProtoLens.Prism.Prism' HtlcEvent'Event ForwardFailEvent
_HtlcEvent'ForwardFailEvent
  = Data.ProtoLens.Prism.prism'
      HtlcEvent'ForwardFailEvent
      (\ p__
         -> case p__ of
              (HtlcEvent'ForwardFailEvent p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_HtlcEvent'SettleEvent ::
  Data.ProtoLens.Prism.Prism' HtlcEvent'Event SettleEvent
_HtlcEvent'SettleEvent
  = Data.ProtoLens.Prism.prism'
      HtlcEvent'SettleEvent
      (\ p__
         -> case p__ of
              (HtlcEvent'SettleEvent p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_HtlcEvent'LinkFailEvent ::
  Data.ProtoLens.Prism.Prism' HtlcEvent'Event LinkFailEvent
_HtlcEvent'LinkFailEvent
  = Data.ProtoLens.Prism.prism'
      HtlcEvent'LinkFailEvent
      (\ p__
         -> case p__ of
              (HtlcEvent'LinkFailEvent p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
newtype HtlcEvent'EventType'UnrecognizedValue
  = HtlcEvent'EventType'UnrecognizedValue Data.Int.Int32
  deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data HtlcEvent'EventType
  = HtlcEvent'UNKNOWN |
    HtlcEvent'SEND |
    HtlcEvent'RECEIVE |
    HtlcEvent'FORWARD |
    HtlcEvent'EventType'Unrecognized !HtlcEvent'EventType'UnrecognizedValue
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum HtlcEvent'EventType where
  maybeToEnum 0 = Prelude.Just HtlcEvent'UNKNOWN
  maybeToEnum 1 = Prelude.Just HtlcEvent'SEND
  maybeToEnum 2 = Prelude.Just HtlcEvent'RECEIVE
  maybeToEnum 3 = Prelude.Just HtlcEvent'FORWARD
  maybeToEnum k
    = Prelude.Just
        (HtlcEvent'EventType'Unrecognized
           (HtlcEvent'EventType'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum HtlcEvent'UNKNOWN = "UNKNOWN"
  showEnum HtlcEvent'SEND = "SEND"
  showEnum HtlcEvent'RECEIVE = "RECEIVE"
  showEnum HtlcEvent'FORWARD = "FORWARD"
  showEnum
    (HtlcEvent'EventType'Unrecognized (HtlcEvent'EventType'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UNKNOWN" = Prelude.Just HtlcEvent'UNKNOWN
    | (Prelude.==) k "SEND" = Prelude.Just HtlcEvent'SEND
    | (Prelude.==) k "RECEIVE" = Prelude.Just HtlcEvent'RECEIVE
    | (Prelude.==) k "FORWARD" = Prelude.Just HtlcEvent'FORWARD
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded HtlcEvent'EventType where
  minBound = HtlcEvent'UNKNOWN
  maxBound = HtlcEvent'FORWARD
instance Prelude.Enum HtlcEvent'EventType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum EventType: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum HtlcEvent'UNKNOWN = 0
  fromEnum HtlcEvent'SEND = 1
  fromEnum HtlcEvent'RECEIVE = 2
  fromEnum HtlcEvent'FORWARD = 3
  fromEnum
    (HtlcEvent'EventType'Unrecognized (HtlcEvent'EventType'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ HtlcEvent'FORWARD
    = Prelude.error
        "HtlcEvent'EventType.succ: bad argument HtlcEvent'FORWARD. This value would be out of bounds."
  succ HtlcEvent'UNKNOWN = HtlcEvent'SEND
  succ HtlcEvent'SEND = HtlcEvent'RECEIVE
  succ HtlcEvent'RECEIVE = HtlcEvent'FORWARD
  succ (HtlcEvent'EventType'Unrecognized _)
    = Prelude.error
        "HtlcEvent'EventType.succ: bad argument: unrecognized value"
  pred HtlcEvent'UNKNOWN
    = Prelude.error
        "HtlcEvent'EventType.pred: bad argument HtlcEvent'UNKNOWN. This value would be out of bounds."
  pred HtlcEvent'SEND = HtlcEvent'UNKNOWN
  pred HtlcEvent'RECEIVE = HtlcEvent'SEND
  pred HtlcEvent'FORWARD = HtlcEvent'RECEIVE
  pred (HtlcEvent'EventType'Unrecognized _)
    = Prelude.error
        "HtlcEvent'EventType.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault HtlcEvent'EventType where
  fieldDefault = HtlcEvent'UNKNOWN
instance Control.DeepSeq.NFData HtlcEvent'EventType where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.incomingTimelock' @:: Lens' HtlcInfo Data.Word.Word32@
         * 'Proto.RouterGrpc_Fields.outgoingTimelock' @:: Lens' HtlcInfo Data.Word.Word32@
         * 'Proto.RouterGrpc_Fields.incomingAmtMsat' @:: Lens' HtlcInfo Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.outgoingAmtMsat' @:: Lens' HtlcInfo Data.Word.Word64@ -}
data HtlcInfo
  = HtlcInfo'_constructor {_HtlcInfo'incomingTimelock :: !Data.Word.Word32,
                           _HtlcInfo'outgoingTimelock :: !Data.Word.Word32,
                           _HtlcInfo'incomingAmtMsat :: !Data.Word.Word64,
                           _HtlcInfo'outgoingAmtMsat :: !Data.Word.Word64,
                           _HtlcInfo'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show HtlcInfo where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField HtlcInfo "incomingTimelock" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcInfo'incomingTimelock
           (\ x__ y__ -> x__ {_HtlcInfo'incomingTimelock = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcInfo "outgoingTimelock" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcInfo'outgoingTimelock
           (\ x__ y__ -> x__ {_HtlcInfo'outgoingTimelock = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcInfo "incomingAmtMsat" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcInfo'incomingAmtMsat
           (\ x__ y__ -> x__ {_HtlcInfo'incomingAmtMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HtlcInfo "outgoingAmtMsat" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HtlcInfo'outgoingAmtMsat
           (\ x__ y__ -> x__ {_HtlcInfo'outgoingAmtMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Message HtlcInfo where
  messageName _ = Data.Text.pack "routerrpc.HtlcInfo"
  fieldsByTag
    = let
        incomingTimelock__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "incoming_timelock"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"incomingTimelock")) ::
              Data.ProtoLens.FieldDescriptor HtlcInfo
        outgoingTimelock__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_timelock"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"outgoingTimelock")) ::
              Data.ProtoLens.FieldDescriptor HtlcInfo
        incomingAmtMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "incoming_amt_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"incomingAmtMsat")) ::
              Data.ProtoLens.FieldDescriptor HtlcInfo
        outgoingAmtMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_amt_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"outgoingAmtMsat")) ::
              Data.ProtoLens.FieldDescriptor HtlcInfo
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, incomingTimelock__field_descriptor),
           (Data.ProtoLens.Tag 2, outgoingTimelock__field_descriptor),
           (Data.ProtoLens.Tag 3, incomingAmtMsat__field_descriptor),
           (Data.ProtoLens.Tag 4, outgoingAmtMsat__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _HtlcInfo'_unknownFields
        (\ x__ y__ -> x__ {_HtlcInfo'_unknownFields = y__})
  defMessage
    = HtlcInfo'_constructor
        {_HtlcInfo'incomingTimelock = Data.ProtoLens.fieldDefault,
         _HtlcInfo'outgoingTimelock = Data.ProtoLens.fieldDefault,
         _HtlcInfo'incomingAmtMsat = Data.ProtoLens.fieldDefault,
         _HtlcInfo'outgoingAmtMsat = Data.ProtoLens.fieldDefault,
         _HtlcInfo'_unknownFields = []}
  parseMessage
    = let
        loop :: HtlcInfo -> Data.ProtoLens.Encoding.Bytes.Parser HtlcInfo
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "incoming_timelock"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"incomingTimelock") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "outgoing_timelock"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"outgoingTimelock") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "incoming_amt_msat"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"incomingAmtMsat") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "outgoing_amt_msat"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"outgoingAmtMsat") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "HtlcInfo"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"incomingTimelock") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"outgoingTimelock") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"incomingAmtMsat") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"outgoingAmtMsat") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData HtlcInfo where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_HtlcInfo'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_HtlcInfo'incomingTimelock x__)
                (Control.DeepSeq.deepseq
                   (_HtlcInfo'outgoingTimelock x__)
                   (Control.DeepSeq.deepseq
                      (_HtlcInfo'incomingAmtMsat x__)
                      (Control.DeepSeq.deepseq (_HtlcInfo'outgoingAmtMsat x__) ()))))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.info' @:: Lens' LinkFailEvent HtlcInfo@
         * 'Proto.RouterGrpc_Fields.maybe'info' @:: Lens' LinkFailEvent (Prelude.Maybe HtlcInfo)@
         * 'Proto.RouterGrpc_Fields.wireFailure' @:: Lens' LinkFailEvent Proto.LndGrpc.Failure'FailureCode@
         * 'Proto.RouterGrpc_Fields.failureDetail' @:: Lens' LinkFailEvent FailureDetail@
         * 'Proto.RouterGrpc_Fields.failureString' @:: Lens' LinkFailEvent Data.Text.Text@ -}
data LinkFailEvent
  = LinkFailEvent'_constructor {_LinkFailEvent'info :: !(Prelude.Maybe HtlcInfo),
                                _LinkFailEvent'wireFailure :: !Proto.LndGrpc.Failure'FailureCode,
                                _LinkFailEvent'failureDetail :: !FailureDetail,
                                _LinkFailEvent'failureString :: !Data.Text.Text,
                                _LinkFailEvent'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show LinkFailEvent where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField LinkFailEvent "info" HtlcInfo where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LinkFailEvent'info (\ x__ y__ -> x__ {_LinkFailEvent'info = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField LinkFailEvent "maybe'info" (Prelude.Maybe HtlcInfo) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LinkFailEvent'info (\ x__ y__ -> x__ {_LinkFailEvent'info = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LinkFailEvent "wireFailure" Proto.LndGrpc.Failure'FailureCode where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LinkFailEvent'wireFailure
           (\ x__ y__ -> x__ {_LinkFailEvent'wireFailure = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LinkFailEvent "failureDetail" FailureDetail where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LinkFailEvent'failureDetail
           (\ x__ y__ -> x__ {_LinkFailEvent'failureDetail = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LinkFailEvent "failureString" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LinkFailEvent'failureString
           (\ x__ y__ -> x__ {_LinkFailEvent'failureString = y__}))
        Prelude.id
instance Data.ProtoLens.Message LinkFailEvent where
  messageName _ = Data.Text.pack "routerrpc.LinkFailEvent"
  fieldsByTag
    = let
        info__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "info"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor HtlcInfo)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'info")) ::
              Data.ProtoLens.FieldDescriptor LinkFailEvent
        wireFailure__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "wire_failure"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.Failure'FailureCode)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"wireFailure")) ::
              Data.ProtoLens.FieldDescriptor LinkFailEvent
        failureDetail__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "failure_detail"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FailureDetail)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"failureDetail")) ::
              Data.ProtoLens.FieldDescriptor LinkFailEvent
        failureString__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "failure_string"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"failureString")) ::
              Data.ProtoLens.FieldDescriptor LinkFailEvent
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, info__field_descriptor),
           (Data.ProtoLens.Tag 2, wireFailure__field_descriptor),
           (Data.ProtoLens.Tag 3, failureDetail__field_descriptor),
           (Data.ProtoLens.Tag 4, failureString__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _LinkFailEvent'_unknownFields
        (\ x__ y__ -> x__ {_LinkFailEvent'_unknownFields = y__})
  defMessage
    = LinkFailEvent'_constructor
        {_LinkFailEvent'info = Prelude.Nothing,
         _LinkFailEvent'wireFailure = Data.ProtoLens.fieldDefault,
         _LinkFailEvent'failureDetail = Data.ProtoLens.fieldDefault,
         _LinkFailEvent'failureString = Data.ProtoLens.fieldDefault,
         _LinkFailEvent'_unknownFields = []}
  parseMessage
    = let
        loop ::
          LinkFailEvent -> Data.ProtoLens.Encoding.Bytes.Parser LinkFailEvent
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "info"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"info") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "wire_failure"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"wireFailure") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "failure_detail"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"failureDetail") y x)
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "failure_string"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"failureString") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "LinkFailEvent"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'info") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"wireFailure") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                            Prelude.fromEnum
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"failureDetail") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                               Prelude.fromEnum
                               _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"failureString") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                               ((Prelude..)
                                  (\ bs
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                             (Prelude.fromIntegral (Data.ByteString.length bs)))
                                          (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  Data.Text.Encoding.encodeUtf8
                                  _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData LinkFailEvent where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_LinkFailEvent'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_LinkFailEvent'info x__)
                (Control.DeepSeq.deepseq
                   (_LinkFailEvent'wireFailure x__)
                   (Control.DeepSeq.deepseq
                      (_LinkFailEvent'failureDetail x__)
                      (Control.DeepSeq.deepseq (_LinkFailEvent'failureString x__) ()))))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.halfLifeSeconds' @:: Lens' MissionControlConfig Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.hopProbability' @:: Lens' MissionControlConfig Prelude.Float@
         * 'Proto.RouterGrpc_Fields.weight' @:: Lens' MissionControlConfig Prelude.Float@
         * 'Proto.RouterGrpc_Fields.maximumPaymentResults' @:: Lens' MissionControlConfig Data.Word.Word32@
         * 'Proto.RouterGrpc_Fields.minimumFailureRelaxInterval' @:: Lens' MissionControlConfig Data.Word.Word64@ -}
data MissionControlConfig
  = MissionControlConfig'_constructor {_MissionControlConfig'halfLifeSeconds :: !Data.Word.Word64,
                                       _MissionControlConfig'hopProbability :: !Prelude.Float,
                                       _MissionControlConfig'weight :: !Prelude.Float,
                                       _MissionControlConfig'maximumPaymentResults :: !Data.Word.Word32,
                                       _MissionControlConfig'minimumFailureRelaxInterval :: !Data.Word.Word64,
                                       _MissionControlConfig'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MissionControlConfig where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField MissionControlConfig "halfLifeSeconds" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MissionControlConfig'halfLifeSeconds
           (\ x__ y__ -> x__ {_MissionControlConfig'halfLifeSeconds = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MissionControlConfig "hopProbability" Prelude.Float where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MissionControlConfig'hopProbability
           (\ x__ y__ -> x__ {_MissionControlConfig'hopProbability = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MissionControlConfig "weight" Prelude.Float where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MissionControlConfig'weight
           (\ x__ y__ -> x__ {_MissionControlConfig'weight = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MissionControlConfig "maximumPaymentResults" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MissionControlConfig'maximumPaymentResults
           (\ x__ y__
              -> x__ {_MissionControlConfig'maximumPaymentResults = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MissionControlConfig "minimumFailureRelaxInterval" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MissionControlConfig'minimumFailureRelaxInterval
           (\ x__ y__
              -> x__ {_MissionControlConfig'minimumFailureRelaxInterval = y__}))
        Prelude.id
instance Data.ProtoLens.Message MissionControlConfig where
  messageName _ = Data.Text.pack "routerrpc.MissionControlConfig"
  fieldsByTag
    = let
        halfLifeSeconds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "half_life_seconds"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"halfLifeSeconds")) ::
              Data.ProtoLens.FieldDescriptor MissionControlConfig
        hopProbability__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "hop_probability"
              (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"hopProbability")) ::
              Data.ProtoLens.FieldDescriptor MissionControlConfig
        weight__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "weight"
              (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"weight")) ::
              Data.ProtoLens.FieldDescriptor MissionControlConfig
        maximumPaymentResults__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "maximum_payment_results"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"maximumPaymentResults")) ::
              Data.ProtoLens.FieldDescriptor MissionControlConfig
        minimumFailureRelaxInterval__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "minimum_failure_relax_interval"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"minimumFailureRelaxInterval")) ::
              Data.ProtoLens.FieldDescriptor MissionControlConfig
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, halfLifeSeconds__field_descriptor),
           (Data.ProtoLens.Tag 2, hopProbability__field_descriptor),
           (Data.ProtoLens.Tag 3, weight__field_descriptor),
           (Data.ProtoLens.Tag 4, maximumPaymentResults__field_descriptor),
           (Data.ProtoLens.Tag 5, 
            minimumFailureRelaxInterval__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _MissionControlConfig'_unknownFields
        (\ x__ y__ -> x__ {_MissionControlConfig'_unknownFields = y__})
  defMessage
    = MissionControlConfig'_constructor
        {_MissionControlConfig'halfLifeSeconds = Data.ProtoLens.fieldDefault,
         _MissionControlConfig'hopProbability = Data.ProtoLens.fieldDefault,
         _MissionControlConfig'weight = Data.ProtoLens.fieldDefault,
         _MissionControlConfig'maximumPaymentResults = Data.ProtoLens.fieldDefault,
         _MissionControlConfig'minimumFailureRelaxInterval = Data.ProtoLens.fieldDefault,
         _MissionControlConfig'_unknownFields = []}
  parseMessage
    = let
        loop ::
          MissionControlConfig
          -> Data.ProtoLens.Encoding.Bytes.Parser MissionControlConfig
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "half_life_seconds"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"halfLifeSeconds") y x)
                        21
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToFloat
                                          Data.ProtoLens.Encoding.Bytes.getFixed32)
                                       "hop_probability"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"hopProbability") y x)
                        29
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToFloat
                                          Data.ProtoLens.Encoding.Bytes.getFixed32)
                                       "weight"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"weight") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "maximum_payment_results"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"maximumPaymentResults") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt
                                       "minimum_failure_relax_interval"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"minimumFailureRelaxInterval")
                                     y
                                     x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "MissionControlConfig"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"halfLifeSeconds") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"hopProbability") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 21)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putFixed32
                            Data.ProtoLens.Encoding.Bytes.floatToWord
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"weight") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 29)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putFixed32
                               Data.ProtoLens.Encoding.Bytes.floatToWord
                               _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"maximumPaymentResults") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"minimumFailureRelaxInterval") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData MissionControlConfig where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_MissionControlConfig'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_MissionControlConfig'halfLifeSeconds x__)
                (Control.DeepSeq.deepseq
                   (_MissionControlConfig'hopProbability x__)
                   (Control.DeepSeq.deepseq
                      (_MissionControlConfig'weight x__)
                      (Control.DeepSeq.deepseq
                         (_MissionControlConfig'maximumPaymentResults x__)
                         (Control.DeepSeq.deepseq
                            (_MissionControlConfig'minimumFailureRelaxInterval x__) ())))))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.failTime' @:: Lens' PairData Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.failAmtSat' @:: Lens' PairData Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.failAmtMsat' @:: Lens' PairData Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.successTime' @:: Lens' PairData Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.successAmtSat' @:: Lens' PairData Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.successAmtMsat' @:: Lens' PairData Data.Int.Int64@ -}
data PairData
  = PairData'_constructor {_PairData'failTime :: !Data.Int.Int64,
                           _PairData'failAmtSat :: !Data.Int.Int64,
                           _PairData'failAmtMsat :: !Data.Int.Int64,
                           _PairData'successTime :: !Data.Int.Int64,
                           _PairData'successAmtSat :: !Data.Int.Int64,
                           _PairData'successAmtMsat :: !Data.Int.Int64,
                           _PairData'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show PairData where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField PairData "failTime" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairData'failTime (\ x__ y__ -> x__ {_PairData'failTime = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PairData "failAmtSat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairData'failAmtSat
           (\ x__ y__ -> x__ {_PairData'failAmtSat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PairData "failAmtMsat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairData'failAmtMsat
           (\ x__ y__ -> x__ {_PairData'failAmtMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PairData "successTime" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairData'successTime
           (\ x__ y__ -> x__ {_PairData'successTime = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PairData "successAmtSat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairData'successAmtSat
           (\ x__ y__ -> x__ {_PairData'successAmtSat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PairData "successAmtMsat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairData'successAmtMsat
           (\ x__ y__ -> x__ {_PairData'successAmtMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Message PairData where
  messageName _ = Data.Text.pack "routerrpc.PairData"
  fieldsByTag
    = let
        failTime__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fail_time"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"failTime")) ::
              Data.ProtoLens.FieldDescriptor PairData
        failAmtSat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fail_amt_sat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"failAmtSat")) ::
              Data.ProtoLens.FieldDescriptor PairData
        failAmtMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fail_amt_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"failAmtMsat")) ::
              Data.ProtoLens.FieldDescriptor PairData
        successTime__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success_time"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"successTime")) ::
              Data.ProtoLens.FieldDescriptor PairData
        successAmtSat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success_amt_sat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"successAmtSat")) ::
              Data.ProtoLens.FieldDescriptor PairData
        successAmtMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success_amt_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"successAmtMsat")) ::
              Data.ProtoLens.FieldDescriptor PairData
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, failTime__field_descriptor),
           (Data.ProtoLens.Tag 2, failAmtSat__field_descriptor),
           (Data.ProtoLens.Tag 4, failAmtMsat__field_descriptor),
           (Data.ProtoLens.Tag 5, successTime__field_descriptor),
           (Data.ProtoLens.Tag 6, successAmtSat__field_descriptor),
           (Data.ProtoLens.Tag 7, successAmtMsat__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _PairData'_unknownFields
        (\ x__ y__ -> x__ {_PairData'_unknownFields = y__})
  defMessage
    = PairData'_constructor
        {_PairData'failTime = Data.ProtoLens.fieldDefault,
         _PairData'failAmtSat = Data.ProtoLens.fieldDefault,
         _PairData'failAmtMsat = Data.ProtoLens.fieldDefault,
         _PairData'successTime = Data.ProtoLens.fieldDefault,
         _PairData'successAmtSat = Data.ProtoLens.fieldDefault,
         _PairData'successAmtMsat = Data.ProtoLens.fieldDefault,
         _PairData'_unknownFields = []}
  parseMessage
    = let
        loop :: PairData -> Data.ProtoLens.Encoding.Bytes.Parser PairData
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "fail_time"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"failTime") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "fail_amt_sat"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"failAmtSat") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "fail_amt_msat"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"failAmtMsat") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success_time"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"successTime") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success_amt_sat"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"successAmtSat") y x)
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success_amt_msat"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"successAmtMsat") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "PairData"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"failTime") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"failAmtSat") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"failAmtMsat") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view (Data.ProtoLens.Field.field @"successTime") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"successAmtSat") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                     Prelude.fromIntegral
                                     _v))
                         ((Data.Monoid.<>)
                            (let
                               _v
                                 = Lens.Family2.view
                                     (Data.ProtoLens.Field.field @"successAmtMsat") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                        Prelude.fromIntegral
                                        _v))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData PairData where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_PairData'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_PairData'failTime x__)
                (Control.DeepSeq.deepseq
                   (_PairData'failAmtSat x__)
                   (Control.DeepSeq.deepseq
                      (_PairData'failAmtMsat x__)
                      (Control.DeepSeq.deepseq
                         (_PairData'successTime x__)
                         (Control.DeepSeq.deepseq
                            (_PairData'successAmtSat x__)
                            (Control.DeepSeq.deepseq (_PairData'successAmtMsat x__) ()))))))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.nodeFrom' @:: Lens' PairHistory Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.nodeTo' @:: Lens' PairHistory Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.history' @:: Lens' PairHistory PairData@
         * 'Proto.RouterGrpc_Fields.maybe'history' @:: Lens' PairHistory (Prelude.Maybe PairData)@ -}
data PairHistory
  = PairHistory'_constructor {_PairHistory'nodeFrom :: !Data.ByteString.ByteString,
                              _PairHistory'nodeTo :: !Data.ByteString.ByteString,
                              _PairHistory'history :: !(Prelude.Maybe PairData),
                              _PairHistory'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show PairHistory where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField PairHistory "nodeFrom" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairHistory'nodeFrom
           (\ x__ y__ -> x__ {_PairHistory'nodeFrom = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PairHistory "nodeTo" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairHistory'nodeTo (\ x__ y__ -> x__ {_PairHistory'nodeTo = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PairHistory "history" PairData where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairHistory'history
           (\ x__ y__ -> x__ {_PairHistory'history = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField PairHistory "maybe'history" (Prelude.Maybe PairData) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PairHistory'history
           (\ x__ y__ -> x__ {_PairHistory'history = y__}))
        Prelude.id
instance Data.ProtoLens.Message PairHistory where
  messageName _ = Data.Text.pack "routerrpc.PairHistory"
  fieldsByTag
    = let
        nodeFrom__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "node_from"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"nodeFrom")) ::
              Data.ProtoLens.FieldDescriptor PairHistory
        nodeTo__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "node_to"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"nodeTo")) ::
              Data.ProtoLens.FieldDescriptor PairHistory
        history__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "history"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor PairData)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'history")) ::
              Data.ProtoLens.FieldDescriptor PairHistory
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, nodeFrom__field_descriptor),
           (Data.ProtoLens.Tag 2, nodeTo__field_descriptor),
           (Data.ProtoLens.Tag 7, history__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _PairHistory'_unknownFields
        (\ x__ y__ -> x__ {_PairHistory'_unknownFields = y__})
  defMessage
    = PairHistory'_constructor
        {_PairHistory'nodeFrom = Data.ProtoLens.fieldDefault,
         _PairHistory'nodeTo = Data.ProtoLens.fieldDefault,
         _PairHistory'history = Prelude.Nothing,
         _PairHistory'_unknownFields = []}
  parseMessage
    = let
        loop ::
          PairHistory -> Data.ProtoLens.Encoding.Bytes.Parser PairHistory
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "node_from"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"nodeFrom") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "node_to"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"nodeTo") y x)
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "history"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"history") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "PairHistory"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"nodeFrom") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"nodeTo") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'history") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage
                                _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData PairHistory where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_PairHistory'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_PairHistory'nodeFrom x__)
                (Control.DeepSeq.deepseq
                   (_PairHistory'nodeTo x__)
                   (Control.DeepSeq.deepseq (_PairHistory'history x__) ())))
newtype PaymentState'UnrecognizedValue
  = PaymentState'UnrecognizedValue Data.Int.Int32
  deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data PaymentState
  = IN_FLIGHT |
    SUCCEEDED |
    FAILED_TIMEOUT |
    FAILED_NO_ROUTE |
    FAILED_ERROR |
    FAILED_INCORRECT_PAYMENT_DETAILS |
    FAILED_INSUFFICIENT_BALANCE |
    PaymentState'Unrecognized !PaymentState'UnrecognizedValue
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum PaymentState where
  maybeToEnum 0 = Prelude.Just IN_FLIGHT
  maybeToEnum 1 = Prelude.Just SUCCEEDED
  maybeToEnum 2 = Prelude.Just FAILED_TIMEOUT
  maybeToEnum 3 = Prelude.Just FAILED_NO_ROUTE
  maybeToEnum 4 = Prelude.Just FAILED_ERROR
  maybeToEnum 5 = Prelude.Just FAILED_INCORRECT_PAYMENT_DETAILS
  maybeToEnum 6 = Prelude.Just FAILED_INSUFFICIENT_BALANCE
  maybeToEnum k
    = Prelude.Just
        (PaymentState'Unrecognized
           (PaymentState'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum IN_FLIGHT = "IN_FLIGHT"
  showEnum SUCCEEDED = "SUCCEEDED"
  showEnum FAILED_TIMEOUT = "FAILED_TIMEOUT"
  showEnum FAILED_NO_ROUTE = "FAILED_NO_ROUTE"
  showEnum FAILED_ERROR = "FAILED_ERROR"
  showEnum FAILED_INCORRECT_PAYMENT_DETAILS
    = "FAILED_INCORRECT_PAYMENT_DETAILS"
  showEnum FAILED_INSUFFICIENT_BALANCE
    = "FAILED_INSUFFICIENT_BALANCE"
  showEnum
    (PaymentState'Unrecognized (PaymentState'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "IN_FLIGHT" = Prelude.Just IN_FLIGHT
    | (Prelude.==) k "SUCCEEDED" = Prelude.Just SUCCEEDED
    | (Prelude.==) k "FAILED_TIMEOUT" = Prelude.Just FAILED_TIMEOUT
    | (Prelude.==) k "FAILED_NO_ROUTE" = Prelude.Just FAILED_NO_ROUTE
    | (Prelude.==) k "FAILED_ERROR" = Prelude.Just FAILED_ERROR
    | (Prelude.==) k "FAILED_INCORRECT_PAYMENT_DETAILS"
    = Prelude.Just FAILED_INCORRECT_PAYMENT_DETAILS
    | (Prelude.==) k "FAILED_INSUFFICIENT_BALANCE"
    = Prelude.Just FAILED_INSUFFICIENT_BALANCE
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded PaymentState where
  minBound = IN_FLIGHT
  maxBound = FAILED_INSUFFICIENT_BALANCE
instance Prelude.Enum PaymentState where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum PaymentState: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum IN_FLIGHT = 0
  fromEnum SUCCEEDED = 1
  fromEnum FAILED_TIMEOUT = 2
  fromEnum FAILED_NO_ROUTE = 3
  fromEnum FAILED_ERROR = 4
  fromEnum FAILED_INCORRECT_PAYMENT_DETAILS = 5
  fromEnum FAILED_INSUFFICIENT_BALANCE = 6
  fromEnum
    (PaymentState'Unrecognized (PaymentState'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ FAILED_INSUFFICIENT_BALANCE
    = Prelude.error
        "PaymentState.succ: bad argument FAILED_INSUFFICIENT_BALANCE. This value would be out of bounds."
  succ IN_FLIGHT = SUCCEEDED
  succ SUCCEEDED = FAILED_TIMEOUT
  succ FAILED_TIMEOUT = FAILED_NO_ROUTE
  succ FAILED_NO_ROUTE = FAILED_ERROR
  succ FAILED_ERROR = FAILED_INCORRECT_PAYMENT_DETAILS
  succ FAILED_INCORRECT_PAYMENT_DETAILS = FAILED_INSUFFICIENT_BALANCE
  succ (PaymentState'Unrecognized _)
    = Prelude.error
        "PaymentState.succ: bad argument: unrecognized value"
  pred IN_FLIGHT
    = Prelude.error
        "PaymentState.pred: bad argument IN_FLIGHT. This value would be out of bounds."
  pred SUCCEEDED = IN_FLIGHT
  pred FAILED_TIMEOUT = SUCCEEDED
  pred FAILED_NO_ROUTE = FAILED_TIMEOUT
  pred FAILED_ERROR = FAILED_NO_ROUTE
  pred FAILED_INCORRECT_PAYMENT_DETAILS = FAILED_ERROR
  pred FAILED_INSUFFICIENT_BALANCE = FAILED_INCORRECT_PAYMENT_DETAILS
  pred (PaymentState'Unrecognized _)
    = Prelude.error
        "PaymentState.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault PaymentState where
  fieldDefault = IN_FLIGHT
instance Control.DeepSeq.NFData PaymentState where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.state' @:: Lens' PaymentStatus PaymentState@
         * 'Proto.RouterGrpc_Fields.preimage' @:: Lens' PaymentStatus Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.htlcs' @:: Lens' PaymentStatus [Proto.LndGrpc.HTLCAttempt]@
         * 'Proto.RouterGrpc_Fields.vec'htlcs' @:: Lens' PaymentStatus (Data.Vector.Vector Proto.LndGrpc.HTLCAttempt)@ -}
data PaymentStatus
  = PaymentStatus'_constructor {_PaymentStatus'state :: !PaymentState,
                                _PaymentStatus'preimage :: !Data.ByteString.ByteString,
                                _PaymentStatus'htlcs :: !(Data.Vector.Vector Proto.LndGrpc.HTLCAttempt),
                                _PaymentStatus'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show PaymentStatus where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField PaymentStatus "state" PaymentState where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PaymentStatus'state
           (\ x__ y__ -> x__ {_PaymentStatus'state = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PaymentStatus "preimage" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PaymentStatus'preimage
           (\ x__ y__ -> x__ {_PaymentStatus'preimage = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PaymentStatus "htlcs" [Proto.LndGrpc.HTLCAttempt] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PaymentStatus'htlcs
           (\ x__ y__ -> x__ {_PaymentStatus'htlcs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField PaymentStatus "vec'htlcs" (Data.Vector.Vector Proto.LndGrpc.HTLCAttempt) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PaymentStatus'htlcs
           (\ x__ y__ -> x__ {_PaymentStatus'htlcs = y__}))
        Prelude.id
instance Data.ProtoLens.Message PaymentStatus where
  messageName _ = Data.Text.pack "routerrpc.PaymentStatus"
  fieldsByTag
    = let
        state__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "state"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor PaymentState)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"state")) ::
              Data.ProtoLens.FieldDescriptor PaymentStatus
        preimage__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "preimage"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"preimage")) ::
              Data.ProtoLens.FieldDescriptor PaymentStatus
        htlcs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "htlcs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.HTLCAttempt)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"htlcs")) ::
              Data.ProtoLens.FieldDescriptor PaymentStatus
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, state__field_descriptor),
           (Data.ProtoLens.Tag 2, preimage__field_descriptor),
           (Data.ProtoLens.Tag 4, htlcs__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _PaymentStatus'_unknownFields
        (\ x__ y__ -> x__ {_PaymentStatus'_unknownFields = y__})
  defMessage
    = PaymentStatus'_constructor
        {_PaymentStatus'state = Data.ProtoLens.fieldDefault,
         _PaymentStatus'preimage = Data.ProtoLens.fieldDefault,
         _PaymentStatus'htlcs = Data.Vector.Generic.empty,
         _PaymentStatus'_unknownFields = []}
  parseMessage
    = let
        loop ::
          PaymentStatus
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.LndGrpc.HTLCAttempt
             -> Data.ProtoLens.Encoding.Bytes.Parser PaymentStatus
        loop x mutable'htlcs
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'htlcs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'htlcs)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'htlcs") frozen'htlcs x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "state"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"state") y x)
                                  mutable'htlcs
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "preimage"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"preimage") y x)
                                  mutable'htlcs
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "htlcs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'htlcs y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'htlcs
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'htlcs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'htlcs)
          "PaymentStatus"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"state") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum
                         _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"preimage") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage
                                 _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'htlcs") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData PaymentStatus where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_PaymentStatus'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_PaymentStatus'state x__)
                (Control.DeepSeq.deepseq
                   (_PaymentStatus'preimage x__)
                   (Control.DeepSeq.deepseq (_PaymentStatus'htlcs x__) ())))
{- | Fields :
      -}
data QueryMissionControlRequest
  = QueryMissionControlRequest'_constructor {_QueryMissionControlRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show QueryMissionControlRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message QueryMissionControlRequest where
  messageName _
    = Data.Text.pack "routerrpc.QueryMissionControlRequest"
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _QueryMissionControlRequest'_unknownFields
        (\ x__ y__
           -> x__ {_QueryMissionControlRequest'_unknownFields = y__})
  defMessage
    = QueryMissionControlRequest'_constructor
        {_QueryMissionControlRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          QueryMissionControlRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser QueryMissionControlRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "QueryMissionControlRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData QueryMissionControlRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_QueryMissionControlRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.pairs' @:: Lens' QueryMissionControlResponse [PairHistory]@
         * 'Proto.RouterGrpc_Fields.vec'pairs' @:: Lens' QueryMissionControlResponse (Data.Vector.Vector PairHistory)@ -}
data QueryMissionControlResponse
  = QueryMissionControlResponse'_constructor {_QueryMissionControlResponse'pairs :: !(Data.Vector.Vector PairHistory),
                                              _QueryMissionControlResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show QueryMissionControlResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField QueryMissionControlResponse "pairs" [PairHistory] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryMissionControlResponse'pairs
           (\ x__ y__ -> x__ {_QueryMissionControlResponse'pairs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField QueryMissionControlResponse "vec'pairs" (Data.Vector.Vector PairHistory) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryMissionControlResponse'pairs
           (\ x__ y__ -> x__ {_QueryMissionControlResponse'pairs = y__}))
        Prelude.id
instance Data.ProtoLens.Message QueryMissionControlResponse where
  messageName _
    = Data.Text.pack "routerrpc.QueryMissionControlResponse"
  fieldsByTag
    = let
        pairs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "pairs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor PairHistory)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"pairs")) ::
              Data.ProtoLens.FieldDescriptor QueryMissionControlResponse
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 2, pairs__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _QueryMissionControlResponse'_unknownFields
        (\ x__ y__
           -> x__ {_QueryMissionControlResponse'_unknownFields = y__})
  defMessage
    = QueryMissionControlResponse'_constructor
        {_QueryMissionControlResponse'pairs = Data.Vector.Generic.empty,
         _QueryMissionControlResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          QueryMissionControlResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld PairHistory
             -> Data.ProtoLens.Encoding.Bytes.Parser QueryMissionControlResponse
        loop x mutable'pairs
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'pairs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'pairs)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'pairs") frozen'pairs x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "pairs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'pairs y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'pairs
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'pairs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'pairs)
          "QueryMissionControlResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage
                           _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'pairs") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData QueryMissionControlResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_QueryMissionControlResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_QueryMissionControlResponse'pairs x__) ())
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.fromNode' @:: Lens' QueryProbabilityRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.toNode' @:: Lens' QueryProbabilityRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.amtMsat' @:: Lens' QueryProbabilityRequest Data.Int.Int64@ -}
data QueryProbabilityRequest
  = QueryProbabilityRequest'_constructor {_QueryProbabilityRequest'fromNode :: !Data.ByteString.ByteString,
                                          _QueryProbabilityRequest'toNode :: !Data.ByteString.ByteString,
                                          _QueryProbabilityRequest'amtMsat :: !Data.Int.Int64,
                                          _QueryProbabilityRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show QueryProbabilityRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField QueryProbabilityRequest "fromNode" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryProbabilityRequest'fromNode
           (\ x__ y__ -> x__ {_QueryProbabilityRequest'fromNode = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField QueryProbabilityRequest "toNode" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryProbabilityRequest'toNode
           (\ x__ y__ -> x__ {_QueryProbabilityRequest'toNode = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField QueryProbabilityRequest "amtMsat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryProbabilityRequest'amtMsat
           (\ x__ y__ -> x__ {_QueryProbabilityRequest'amtMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Message QueryProbabilityRequest where
  messageName _ = Data.Text.pack "routerrpc.QueryProbabilityRequest"
  fieldsByTag
    = let
        fromNode__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "from_node"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"fromNode")) ::
              Data.ProtoLens.FieldDescriptor QueryProbabilityRequest
        toNode__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "to_node"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"toNode")) ::
              Data.ProtoLens.FieldDescriptor QueryProbabilityRequest
        amtMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amt_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"amtMsat")) ::
              Data.ProtoLens.FieldDescriptor QueryProbabilityRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, fromNode__field_descriptor),
           (Data.ProtoLens.Tag 2, toNode__field_descriptor),
           (Data.ProtoLens.Tag 3, amtMsat__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _QueryProbabilityRequest'_unknownFields
        (\ x__ y__ -> x__ {_QueryProbabilityRequest'_unknownFields = y__})
  defMessage
    = QueryProbabilityRequest'_constructor
        {_QueryProbabilityRequest'fromNode = Data.ProtoLens.fieldDefault,
         _QueryProbabilityRequest'toNode = Data.ProtoLens.fieldDefault,
         _QueryProbabilityRequest'amtMsat = Data.ProtoLens.fieldDefault,
         _QueryProbabilityRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          QueryProbabilityRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser QueryProbabilityRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "from_node"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"fromNode") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "to_node"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"toNode") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "amt_msat"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"amtMsat") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "QueryProbabilityRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"fromNode") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"toNode") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"amtMsat") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData QueryProbabilityRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_QueryProbabilityRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_QueryProbabilityRequest'fromNode x__)
                (Control.DeepSeq.deepseq
                   (_QueryProbabilityRequest'toNode x__)
                   (Control.DeepSeq.deepseq
                      (_QueryProbabilityRequest'amtMsat x__) ())))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.probability' @:: Lens' QueryProbabilityResponse Prelude.Double@
         * 'Proto.RouterGrpc_Fields.history' @:: Lens' QueryProbabilityResponse PairData@
         * 'Proto.RouterGrpc_Fields.maybe'history' @:: Lens' QueryProbabilityResponse (Prelude.Maybe PairData)@ -}
data QueryProbabilityResponse
  = QueryProbabilityResponse'_constructor {_QueryProbabilityResponse'probability :: !Prelude.Double,
                                           _QueryProbabilityResponse'history :: !(Prelude.Maybe PairData),
                                           _QueryProbabilityResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show QueryProbabilityResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField QueryProbabilityResponse "probability" Prelude.Double where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryProbabilityResponse'probability
           (\ x__ y__ -> x__ {_QueryProbabilityResponse'probability = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField QueryProbabilityResponse "history" PairData where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryProbabilityResponse'history
           (\ x__ y__ -> x__ {_QueryProbabilityResponse'history = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField QueryProbabilityResponse "maybe'history" (Prelude.Maybe PairData) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryProbabilityResponse'history
           (\ x__ y__ -> x__ {_QueryProbabilityResponse'history = y__}))
        Prelude.id
instance Data.ProtoLens.Message QueryProbabilityResponse where
  messageName _ = Data.Text.pack "routerrpc.QueryProbabilityResponse"
  fieldsByTag
    = let
        probability__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "probability"
              (Data.ProtoLens.ScalarField Data.ProtoLens.DoubleField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"probability")) ::
              Data.ProtoLens.FieldDescriptor QueryProbabilityResponse
        history__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "history"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor PairData)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'history")) ::
              Data.ProtoLens.FieldDescriptor QueryProbabilityResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, probability__field_descriptor),
           (Data.ProtoLens.Tag 2, history__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _QueryProbabilityResponse'_unknownFields
        (\ x__ y__ -> x__ {_QueryProbabilityResponse'_unknownFields = y__})
  defMessage
    = QueryProbabilityResponse'_constructor
        {_QueryProbabilityResponse'probability = Data.ProtoLens.fieldDefault,
         _QueryProbabilityResponse'history = Prelude.Nothing,
         _QueryProbabilityResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          QueryProbabilityResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser QueryProbabilityResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        9 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToDouble
                                          Data.ProtoLens.Encoding.Bytes.getFixed64)
                                       "probability"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"probability") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "history"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"history") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "QueryProbabilityResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"probability") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 9)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putFixed64
                         Data.ProtoLens.Encoding.Bytes.doubleToWord
                         _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'history") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage
                             _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData QueryProbabilityResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_QueryProbabilityResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_QueryProbabilityResponse'probability x__)
                (Control.DeepSeq.deepseq
                   (_QueryProbabilityResponse'history x__) ()))
{- | Fields :
      -}
data ResetMissionControlRequest
  = ResetMissionControlRequest'_constructor {_ResetMissionControlRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ResetMissionControlRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message ResetMissionControlRequest where
  messageName _
    = Data.Text.pack "routerrpc.ResetMissionControlRequest"
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ResetMissionControlRequest'_unknownFields
        (\ x__ y__
           -> x__ {_ResetMissionControlRequest'_unknownFields = y__})
  defMessage
    = ResetMissionControlRequest'_constructor
        {_ResetMissionControlRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ResetMissionControlRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ResetMissionControlRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ResetMissionControlRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData ResetMissionControlRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ResetMissionControlRequest'_unknownFields x__) ()
{- | Fields :
      -}
data ResetMissionControlResponse
  = ResetMissionControlResponse'_constructor {_ResetMissionControlResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ResetMissionControlResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message ResetMissionControlResponse where
  messageName _
    = Data.Text.pack "routerrpc.ResetMissionControlResponse"
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ResetMissionControlResponse'_unknownFields
        (\ x__ y__
           -> x__ {_ResetMissionControlResponse'_unknownFields = y__})
  defMessage
    = ResetMissionControlResponse'_constructor
        {_ResetMissionControlResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ResetMissionControlResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser ResetMissionControlResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ResetMissionControlResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData ResetMissionControlResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ResetMissionControlResponse'_unknownFields x__) ()
newtype ResolveHoldForwardAction'UnrecognizedValue
  = ResolveHoldForwardAction'UnrecognizedValue Data.Int.Int32
  deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data ResolveHoldForwardAction
  = SETTLE |
    FAIL |
    RESUME |
    ResolveHoldForwardAction'Unrecognized !ResolveHoldForwardAction'UnrecognizedValue
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum ResolveHoldForwardAction where
  maybeToEnum 0 = Prelude.Just SETTLE
  maybeToEnum 1 = Prelude.Just FAIL
  maybeToEnum 2 = Prelude.Just RESUME
  maybeToEnum k
    = Prelude.Just
        (ResolveHoldForwardAction'Unrecognized
           (ResolveHoldForwardAction'UnrecognizedValue
              (Prelude.fromIntegral k)))
  showEnum SETTLE = "SETTLE"
  showEnum FAIL = "FAIL"
  showEnum RESUME = "RESUME"
  showEnum
    (ResolveHoldForwardAction'Unrecognized (ResolveHoldForwardAction'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "SETTLE" = Prelude.Just SETTLE
    | (Prelude.==) k "FAIL" = Prelude.Just FAIL
    | (Prelude.==) k "RESUME" = Prelude.Just RESUME
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded ResolveHoldForwardAction where
  minBound = SETTLE
  maxBound = RESUME
instance Prelude.Enum ResolveHoldForwardAction where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum ResolveHoldForwardAction: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum SETTLE = 0
  fromEnum FAIL = 1
  fromEnum RESUME = 2
  fromEnum
    (ResolveHoldForwardAction'Unrecognized (ResolveHoldForwardAction'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ RESUME
    = Prelude.error
        "ResolveHoldForwardAction.succ: bad argument RESUME. This value would be out of bounds."
  succ SETTLE = FAIL
  succ FAIL = RESUME
  succ (ResolveHoldForwardAction'Unrecognized _)
    = Prelude.error
        "ResolveHoldForwardAction.succ: bad argument: unrecognized value"
  pred SETTLE
    = Prelude.error
        "ResolveHoldForwardAction.pred: bad argument SETTLE. This value would be out of bounds."
  pred FAIL = SETTLE
  pred RESUME = FAIL
  pred (ResolveHoldForwardAction'Unrecognized _)
    = Prelude.error
        "ResolveHoldForwardAction.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault ResolveHoldForwardAction where
  fieldDefault = SETTLE
instance Control.DeepSeq.NFData ResolveHoldForwardAction where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.dest' @:: Lens' RouteFeeRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.amtSat' @:: Lens' RouteFeeRequest Data.Int.Int64@ -}
data RouteFeeRequest
  = RouteFeeRequest'_constructor {_RouteFeeRequest'dest :: !Data.ByteString.ByteString,
                                  _RouteFeeRequest'amtSat :: !Data.Int.Int64,
                                  _RouteFeeRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RouteFeeRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField RouteFeeRequest "dest" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RouteFeeRequest'dest
           (\ x__ y__ -> x__ {_RouteFeeRequest'dest = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RouteFeeRequest "amtSat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RouteFeeRequest'amtSat
           (\ x__ y__ -> x__ {_RouteFeeRequest'amtSat = y__}))
        Prelude.id
instance Data.ProtoLens.Message RouteFeeRequest where
  messageName _ = Data.Text.pack "routerrpc.RouteFeeRequest"
  fieldsByTag
    = let
        dest__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dest"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"dest")) ::
              Data.ProtoLens.FieldDescriptor RouteFeeRequest
        amtSat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amt_sat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"amtSat")) ::
              Data.ProtoLens.FieldDescriptor RouteFeeRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, dest__field_descriptor),
           (Data.ProtoLens.Tag 2, amtSat__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _RouteFeeRequest'_unknownFields
        (\ x__ y__ -> x__ {_RouteFeeRequest'_unknownFields = y__})
  defMessage
    = RouteFeeRequest'_constructor
        {_RouteFeeRequest'dest = Data.ProtoLens.fieldDefault,
         _RouteFeeRequest'amtSat = Data.ProtoLens.fieldDefault,
         _RouteFeeRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          RouteFeeRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser RouteFeeRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "dest"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"dest") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "amt_sat"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"amtSat") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "RouteFeeRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"dest") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"amtSat") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData RouteFeeRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_RouteFeeRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_RouteFeeRequest'dest x__)
                (Control.DeepSeq.deepseq (_RouteFeeRequest'amtSat x__) ()))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.routingFeeMsat' @:: Lens' RouteFeeResponse Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.timeLockDelay' @:: Lens' RouteFeeResponse Data.Int.Int64@ -}
data RouteFeeResponse
  = RouteFeeResponse'_constructor {_RouteFeeResponse'routingFeeMsat :: !Data.Int.Int64,
                                   _RouteFeeResponse'timeLockDelay :: !Data.Int.Int64,
                                   _RouteFeeResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RouteFeeResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField RouteFeeResponse "routingFeeMsat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RouteFeeResponse'routingFeeMsat
           (\ x__ y__ -> x__ {_RouteFeeResponse'routingFeeMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RouteFeeResponse "timeLockDelay" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RouteFeeResponse'timeLockDelay
           (\ x__ y__ -> x__ {_RouteFeeResponse'timeLockDelay = y__}))
        Prelude.id
instance Data.ProtoLens.Message RouteFeeResponse where
  messageName _ = Data.Text.pack "routerrpc.RouteFeeResponse"
  fieldsByTag
    = let
        routingFeeMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "routing_fee_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"routingFeeMsat")) ::
              Data.ProtoLens.FieldDescriptor RouteFeeResponse
        timeLockDelay__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "time_lock_delay"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"timeLockDelay")) ::
              Data.ProtoLens.FieldDescriptor RouteFeeResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, routingFeeMsat__field_descriptor),
           (Data.ProtoLens.Tag 2, timeLockDelay__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _RouteFeeResponse'_unknownFields
        (\ x__ y__ -> x__ {_RouteFeeResponse'_unknownFields = y__})
  defMessage
    = RouteFeeResponse'_constructor
        {_RouteFeeResponse'routingFeeMsat = Data.ProtoLens.fieldDefault,
         _RouteFeeResponse'timeLockDelay = Data.ProtoLens.fieldDefault,
         _RouteFeeResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          RouteFeeResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser RouteFeeResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "routing_fee_msat"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"routingFeeMsat") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "time_lock_delay"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"timeLockDelay") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "RouteFeeResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"routingFeeMsat") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"timeLockDelay") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData RouteFeeResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_RouteFeeResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_RouteFeeResponse'routingFeeMsat x__)
                (Control.DeepSeq.deepseq (_RouteFeeResponse'timeLockDelay x__) ()))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.dest' @:: Lens' SendPaymentRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.amt' @:: Lens' SendPaymentRequest Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.amtMsat' @:: Lens' SendPaymentRequest Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.paymentHash' @:: Lens' SendPaymentRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.finalCltvDelta' @:: Lens' SendPaymentRequest Data.Int.Int32@
         * 'Proto.RouterGrpc_Fields.paymentAddr' @:: Lens' SendPaymentRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.paymentRequest' @:: Lens' SendPaymentRequest Data.Text.Text@
         * 'Proto.RouterGrpc_Fields.timeoutSeconds' @:: Lens' SendPaymentRequest Data.Int.Int32@
         * 'Proto.RouterGrpc_Fields.feeLimitSat' @:: Lens' SendPaymentRequest Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.feeLimitMsat' @:: Lens' SendPaymentRequest Data.Int.Int64@
         * 'Proto.RouterGrpc_Fields.outgoingChanId' @:: Lens' SendPaymentRequest Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.outgoingChanIds' @:: Lens' SendPaymentRequest [Data.Word.Word64]@
         * 'Proto.RouterGrpc_Fields.vec'outgoingChanIds' @:: Lens' SendPaymentRequest (Data.Vector.Unboxed.Vector Data.Word.Word64)@
         * 'Proto.RouterGrpc_Fields.lastHopPubkey' @:: Lens' SendPaymentRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.cltvLimit' @:: Lens' SendPaymentRequest Data.Int.Int32@
         * 'Proto.RouterGrpc_Fields.routeHints' @:: Lens' SendPaymentRequest [Proto.LndGrpc.RouteHint]@
         * 'Proto.RouterGrpc_Fields.vec'routeHints' @:: Lens' SendPaymentRequest (Data.Vector.Vector Proto.LndGrpc.RouteHint)@
         * 'Proto.RouterGrpc_Fields.destCustomRecords' @:: Lens' SendPaymentRequest (Data.Map.Map Data.Word.Word64 Data.ByteString.ByteString)@
         * 'Proto.RouterGrpc_Fields.allowSelfPayment' @:: Lens' SendPaymentRequest Prelude.Bool@
         * 'Proto.RouterGrpc_Fields.destFeatures' @:: Lens' SendPaymentRequest [Proto.LndGrpc.FeatureBit]@
         * 'Proto.RouterGrpc_Fields.vec'destFeatures' @:: Lens' SendPaymentRequest (Data.Vector.Vector Proto.LndGrpc.FeatureBit)@
         * 'Proto.RouterGrpc_Fields.maxParts' @:: Lens' SendPaymentRequest Data.Word.Word32@
         * 'Proto.RouterGrpc_Fields.noInflightUpdates' @:: Lens' SendPaymentRequest Prelude.Bool@
         * 'Proto.RouterGrpc_Fields.maxShardSizeMsat' @:: Lens' SendPaymentRequest Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.amp' @:: Lens' SendPaymentRequest Prelude.Bool@ -}
data SendPaymentRequest
  = SendPaymentRequest'_constructor {_SendPaymentRequest'dest :: !Data.ByteString.ByteString,
                                     _SendPaymentRequest'amt :: !Data.Int.Int64,
                                     _SendPaymentRequest'amtMsat :: !Data.Int.Int64,
                                     _SendPaymentRequest'paymentHash :: !Data.ByteString.ByteString,
                                     _SendPaymentRequest'finalCltvDelta :: !Data.Int.Int32,
                                     _SendPaymentRequest'paymentAddr :: !Data.ByteString.ByteString,
                                     _SendPaymentRequest'paymentRequest :: !Data.Text.Text,
                                     _SendPaymentRequest'timeoutSeconds :: !Data.Int.Int32,
                                     _SendPaymentRequest'feeLimitSat :: !Data.Int.Int64,
                                     _SendPaymentRequest'feeLimitMsat :: !Data.Int.Int64,
                                     _SendPaymentRequest'outgoingChanId :: !Data.Word.Word64,
                                     _SendPaymentRequest'outgoingChanIds :: !(Data.Vector.Unboxed.Vector Data.Word.Word64),
                                     _SendPaymentRequest'lastHopPubkey :: !Data.ByteString.ByteString,
                                     _SendPaymentRequest'cltvLimit :: !Data.Int.Int32,
                                     _SendPaymentRequest'routeHints :: !(Data.Vector.Vector Proto.LndGrpc.RouteHint),
                                     _SendPaymentRequest'destCustomRecords :: !(Data.Map.Map Data.Word.Word64 Data.ByteString.ByteString),
                                     _SendPaymentRequest'allowSelfPayment :: !Prelude.Bool,
                                     _SendPaymentRequest'destFeatures :: !(Data.Vector.Vector Proto.LndGrpc.FeatureBit),
                                     _SendPaymentRequest'maxParts :: !Data.Word.Word32,
                                     _SendPaymentRequest'noInflightUpdates :: !Prelude.Bool,
                                     _SendPaymentRequest'maxShardSizeMsat :: !Data.Word.Word64,
                                     _SendPaymentRequest'amp :: !Prelude.Bool,
                                     _SendPaymentRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SendPaymentRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SendPaymentRequest "dest" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'dest
           (\ x__ y__ -> x__ {_SendPaymentRequest'dest = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "amt" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'amt
           (\ x__ y__ -> x__ {_SendPaymentRequest'amt = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "amtMsat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'amtMsat
           (\ x__ y__ -> x__ {_SendPaymentRequest'amtMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "paymentHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'paymentHash
           (\ x__ y__ -> x__ {_SendPaymentRequest'paymentHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "finalCltvDelta" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'finalCltvDelta
           (\ x__ y__ -> x__ {_SendPaymentRequest'finalCltvDelta = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "paymentAddr" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'paymentAddr
           (\ x__ y__ -> x__ {_SendPaymentRequest'paymentAddr = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "paymentRequest" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'paymentRequest
           (\ x__ y__ -> x__ {_SendPaymentRequest'paymentRequest = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "timeoutSeconds" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'timeoutSeconds
           (\ x__ y__ -> x__ {_SendPaymentRequest'timeoutSeconds = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "feeLimitSat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'feeLimitSat
           (\ x__ y__ -> x__ {_SendPaymentRequest'feeLimitSat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "feeLimitMsat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'feeLimitMsat
           (\ x__ y__ -> x__ {_SendPaymentRequest'feeLimitMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "outgoingChanId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'outgoingChanId
           (\ x__ y__ -> x__ {_SendPaymentRequest'outgoingChanId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "outgoingChanIds" [Data.Word.Word64] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'outgoingChanIds
           (\ x__ y__ -> x__ {_SendPaymentRequest'outgoingChanIds = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SendPaymentRequest "vec'outgoingChanIds" (Data.Vector.Unboxed.Vector Data.Word.Word64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'outgoingChanIds
           (\ x__ y__ -> x__ {_SendPaymentRequest'outgoingChanIds = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "lastHopPubkey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'lastHopPubkey
           (\ x__ y__ -> x__ {_SendPaymentRequest'lastHopPubkey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "cltvLimit" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'cltvLimit
           (\ x__ y__ -> x__ {_SendPaymentRequest'cltvLimit = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "routeHints" [Proto.LndGrpc.RouteHint] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'routeHints
           (\ x__ y__ -> x__ {_SendPaymentRequest'routeHints = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SendPaymentRequest "vec'routeHints" (Data.Vector.Vector Proto.LndGrpc.RouteHint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'routeHints
           (\ x__ y__ -> x__ {_SendPaymentRequest'routeHints = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "destCustomRecords" (Data.Map.Map Data.Word.Word64 Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'destCustomRecords
           (\ x__ y__ -> x__ {_SendPaymentRequest'destCustomRecords = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "allowSelfPayment" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'allowSelfPayment
           (\ x__ y__ -> x__ {_SendPaymentRequest'allowSelfPayment = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "destFeatures" [Proto.LndGrpc.FeatureBit] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'destFeatures
           (\ x__ y__ -> x__ {_SendPaymentRequest'destFeatures = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SendPaymentRequest "vec'destFeatures" (Data.Vector.Vector Proto.LndGrpc.FeatureBit) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'destFeatures
           (\ x__ y__ -> x__ {_SendPaymentRequest'destFeatures = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "maxParts" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'maxParts
           (\ x__ y__ -> x__ {_SendPaymentRequest'maxParts = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "noInflightUpdates" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'noInflightUpdates
           (\ x__ y__ -> x__ {_SendPaymentRequest'noInflightUpdates = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "maxShardSizeMsat" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'maxShardSizeMsat
           (\ x__ y__ -> x__ {_SendPaymentRequest'maxShardSizeMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest "amp" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'amp
           (\ x__ y__ -> x__ {_SendPaymentRequest'amp = y__}))
        Prelude.id
instance Data.ProtoLens.Message SendPaymentRequest where
  messageName _ = Data.Text.pack "routerrpc.SendPaymentRequest"
  fieldsByTag
    = let
        dest__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dest"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"dest")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        amt__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amt"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"amt")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        amtMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amt_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"amtMsat")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        paymentHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentHash")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        finalCltvDelta__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "final_cltv_delta"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"finalCltvDelta")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        paymentAddr__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_addr"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentAddr")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        paymentRequest__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_request"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentRequest")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        timeoutSeconds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "timeout_seconds"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"timeoutSeconds")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        feeLimitSat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fee_limit_sat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"feeLimitSat")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        feeLimitMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fee_limit_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"feeLimitMsat")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        outgoingChanId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_chan_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"outgoingChanId")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        outgoingChanIds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outgoing_chan_ids"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed
                 (Data.ProtoLens.Field.field @"outgoingChanIds")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        lastHopPubkey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "last_hop_pubkey"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"lastHopPubkey")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        cltvLimit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cltv_limit"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"cltvLimit")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        routeHints__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "route_hints"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.RouteHint)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"routeHints")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        destCustomRecords__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dest_custom_records"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SendPaymentRequest'DestCustomRecordsEntry)
              (Data.ProtoLens.MapField
                 (Data.ProtoLens.Field.field @"key")
                 (Data.ProtoLens.Field.field @"value")
                 (Data.ProtoLens.Field.field @"destCustomRecords")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        allowSelfPayment__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "allow_self_payment"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"allowSelfPayment")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        destFeatures__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dest_features"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.FeatureBit)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed
                 (Data.ProtoLens.Field.field @"destFeatures")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        maxParts__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "max_parts"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"maxParts")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        noInflightUpdates__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "no_inflight_updates"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"noInflightUpdates")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        maxShardSizeMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "max_shard_size_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"maxShardSizeMsat")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
        amp__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amp"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"amp")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, dest__field_descriptor),
           (Data.ProtoLens.Tag 2, amt__field_descriptor),
           (Data.ProtoLens.Tag 12, amtMsat__field_descriptor),
           (Data.ProtoLens.Tag 3, paymentHash__field_descriptor),
           (Data.ProtoLens.Tag 4, finalCltvDelta__field_descriptor),
           (Data.ProtoLens.Tag 20, paymentAddr__field_descriptor),
           (Data.ProtoLens.Tag 5, paymentRequest__field_descriptor),
           (Data.ProtoLens.Tag 6, timeoutSeconds__field_descriptor),
           (Data.ProtoLens.Tag 7, feeLimitSat__field_descriptor),
           (Data.ProtoLens.Tag 13, feeLimitMsat__field_descriptor),
           (Data.ProtoLens.Tag 8, outgoingChanId__field_descriptor),
           (Data.ProtoLens.Tag 19, outgoingChanIds__field_descriptor),
           (Data.ProtoLens.Tag 14, lastHopPubkey__field_descriptor),
           (Data.ProtoLens.Tag 9, cltvLimit__field_descriptor),
           (Data.ProtoLens.Tag 10, routeHints__field_descriptor),
           (Data.ProtoLens.Tag 11, destCustomRecords__field_descriptor),
           (Data.ProtoLens.Tag 15, allowSelfPayment__field_descriptor),
           (Data.ProtoLens.Tag 16, destFeatures__field_descriptor),
           (Data.ProtoLens.Tag 17, maxParts__field_descriptor),
           (Data.ProtoLens.Tag 18, noInflightUpdates__field_descriptor),
           (Data.ProtoLens.Tag 21, maxShardSizeMsat__field_descriptor),
           (Data.ProtoLens.Tag 22, amp__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SendPaymentRequest'_unknownFields
        (\ x__ y__ -> x__ {_SendPaymentRequest'_unknownFields = y__})
  defMessage
    = SendPaymentRequest'_constructor
        {_SendPaymentRequest'dest = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'amt = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'amtMsat = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'paymentHash = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'finalCltvDelta = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'paymentAddr = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'paymentRequest = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'timeoutSeconds = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'feeLimitSat = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'feeLimitMsat = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'outgoingChanId = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'outgoingChanIds = Data.Vector.Generic.empty,
         _SendPaymentRequest'lastHopPubkey = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'cltvLimit = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'routeHints = Data.Vector.Generic.empty,
         _SendPaymentRequest'destCustomRecords = Data.Map.empty,
         _SendPaymentRequest'allowSelfPayment = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'destFeatures = Data.Vector.Generic.empty,
         _SendPaymentRequest'maxParts = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'noInflightUpdates = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'maxShardSizeMsat = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'amp = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SendPaymentRequest
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.LndGrpc.FeatureBit
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Word.Word64
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.LndGrpc.RouteHint
                   -> Data.ProtoLens.Encoding.Bytes.Parser SendPaymentRequest
        loop
          x
          mutable'destFeatures
          mutable'outgoingChanIds
          mutable'routeHints
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'destFeatures <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                  mutable'destFeatures)
                      frozen'outgoingChanIds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                  (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                     mutable'outgoingChanIds)
                      frozen'routeHints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'routeHints)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'destFeatures")
                              frozen'destFeatures
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'outgoingChanIds")
                                 frozen'outgoingChanIds
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'routeHints")
                                    frozen'routeHints
                                    x))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "dest"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"dest") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "amt"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"amt") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        96
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "amt_msat"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"amtMsat") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "payment_hash"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"paymentHash") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "final_cltv_delta"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"finalCltvDelta") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        162
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "payment_addr"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"paymentAddr") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "payment_request"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"paymentRequest") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "timeout_seconds"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"timeoutSeconds") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "fee_limit_sat"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"feeLimitSat") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        104
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "fee_limit_msat"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"feeLimitMsat") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        64
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "outgoing_chan_id"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"outgoingChanId") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        152
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        Data.ProtoLens.Encoding.Bytes.getVarInt "outgoing_chan_ids"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'outgoingChanIds y)
                                loop x mutable'destFeatures v mutable'routeHints
                        154
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    Data.ProtoLens.Encoding.Bytes.getVarInt
                                                                    "outgoing_chan_ids"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'outgoingChanIds)
                                loop x mutable'destFeatures y mutable'routeHints
                        114
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "last_hop_pubkey"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"lastHopPubkey") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        72
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "cltv_limit"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"cltvLimit") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        82
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "route_hints"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'routeHints y)
                                loop x mutable'destFeatures mutable'outgoingChanIds v
                        90
                          -> do !(entry :: SendPaymentRequest'DestCustomRecordsEntry) <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                                           (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                                                               Data.ProtoLens.Encoding.Bytes.isolate
                                                                                                 (Prelude.fromIntegral
                                                                                                    len)
                                                                                                 Data.ProtoLens.parseMessage)
                                                                                           "dest_custom_records"
                                (let
                                   key = Lens.Family2.view (Data.ProtoLens.Field.field @"key") entry
                                   value
                                     = Lens.Family2.view (Data.ProtoLens.Field.field @"value") entry
                                 in
                                   loop
                                     (Lens.Family2.over
                                        (Data.ProtoLens.Field.field @"destCustomRecords")
                                        (\ !t -> Data.Map.insert key value t)
                                        x)
                                     mutable'destFeatures
                                     mutable'outgoingChanIds
                                     mutable'routeHints)
                        120
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "allow_self_payment"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"allowSelfPayment") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        128
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.toEnum
                                           (Prelude.fmap
                                              Prelude.fromIntegral
                                              Data.ProtoLens.Encoding.Bytes.getVarInt))
                                        "dest_features"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'destFeatures y)
                                loop x v mutable'outgoingChanIds mutable'routeHints
                        130
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.toEnum
                                                                       (Prelude.fmap
                                                                          Prelude.fromIntegral
                                                                          Data.ProtoLens.Encoding.Bytes.getVarInt))
                                                                    "dest_features"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'destFeatures)
                                loop x y mutable'outgoingChanIds mutable'routeHints
                        136
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "max_parts"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"maxParts") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        144
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "no_inflight_updates"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"noInflightUpdates") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        168
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "max_shard_size_msat"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"maxShardSizeMsat") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        176
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "amp"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"amp") y x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'destFeatures
                                  mutable'outgoingChanIds
                                  mutable'routeHints
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'destFeatures <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        Data.ProtoLens.Encoding.Growing.new
              mutable'outgoingChanIds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           Data.ProtoLens.Encoding.Growing.new
              mutable'routeHints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage
                mutable'destFeatures
                mutable'outgoingChanIds
                mutable'routeHints)
          "SendPaymentRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"dest") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"amt") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"amtMsat") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 96)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view (Data.ProtoLens.Field.field @"paymentHash") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                               ((\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"finalCltvDelta") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                     Prelude.fromIntegral
                                     _v))
                         ((Data.Monoid.<>)
                            (let
                               _v
                                 = Lens.Family2.view (Data.ProtoLens.Field.field @"paymentAddr") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 162)
                                     ((\ bs
                                         -> (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                              (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                        _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"paymentRequest") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                        ((Prelude..)
                                           (\ bs
                                              -> (Data.Monoid.<>)
                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                      (Prelude.fromIntegral
                                                         (Data.ByteString.length bs)))
                                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                           Data.Text.Encoding.encodeUtf8
                                           _v))
                               ((Data.Monoid.<>)
                                  (let
                                     _v
                                       = Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"timeoutSeconds") _x
                                   in
                                     if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                         Data.Monoid.mempty
                                     else
                                         (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                           ((Prelude..)
                                              Data.ProtoLens.Encoding.Bytes.putVarInt
                                              Prelude.fromIntegral
                                              _v))
                                  ((Data.Monoid.<>)
                                     (let
                                        _v
                                          = Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"feeLimitSat") _x
                                      in
                                        if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                            Data.Monoid.mempty
                                        else
                                            (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                              ((Prelude..)
                                                 Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 Prelude.fromIntegral
                                                 _v))
                                     ((Data.Monoid.<>)
                                        (let
                                           _v
                                             = Lens.Family2.view
                                                 (Data.ProtoLens.Field.field @"feeLimitMsat") _x
                                         in
                                           if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                               Data.Monoid.mempty
                                           else
                                               (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 104)
                                                 ((Prelude..)
                                                    Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    Prelude.fromIntegral
                                                    _v))
                                        ((Data.Monoid.<>)
                                           (let
                                              _v
                                                = Lens.Family2.view
                                                    (Data.ProtoLens.Field.field @"outgoingChanId")
                                                    _x
                                            in
                                              if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                                  Data.Monoid.mempty
                                              else
                                                  (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 64)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                                           ((Data.Monoid.<>)
                                              (let
                                                 p = Lens.Family2.view
                                                       (Data.ProtoLens.Field.field
                                                          @"vec'outgoingChanIds")
                                                       _x
                                               in
                                                 if Data.Vector.Generic.null p then
                                                     Data.Monoid.mempty
                                                 else
                                                     (Data.Monoid.<>)
                                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 154)
                                                       ((\ bs
                                                           -> (Data.Monoid.<>)
                                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                   (Prelude.fromIntegral
                                                                      (Data.ByteString.length bs)))
                                                                (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                   bs))
                                                          (Data.ProtoLens.Encoding.Bytes.runBuilder
                                                             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                                                Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                p))))
                                              ((Data.Monoid.<>)
                                                 (let
                                                    _v
                                                      = Lens.Family2.view
                                                          (Data.ProtoLens.Field.field
                                                             @"lastHopPubkey")
                                                          _x
                                                  in
                                                    if (Prelude.==)
                                                         _v Data.ProtoLens.fieldDefault then
                                                        Data.Monoid.mempty
                                                    else
                                                        (Data.Monoid.<>)
                                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                             114)
                                                          ((\ bs
                                                              -> (Data.Monoid.<>)
                                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                      (Prelude.fromIntegral
                                                                         (Data.ByteString.length
                                                                            bs)))
                                                                   (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                      bs))
                                                             _v))
                                                 ((Data.Monoid.<>)
                                                    (let
                                                       _v
                                                         = Lens.Family2.view
                                                             (Data.ProtoLens.Field.field
                                                                @"cltvLimit")
                                                             _x
                                                     in
                                                       if (Prelude.==)
                                                            _v Data.ProtoLens.fieldDefault then
                                                           Data.Monoid.mempty
                                                       else
                                                           (Data.Monoid.<>)
                                                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                72)
                                                             ((Prelude..)
                                                                Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                Prelude.fromIntegral
                                                                _v))
                                                    ((Data.Monoid.<>)
                                                       (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                                          (\ _v
                                                             -> (Data.Monoid.<>)
                                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                     82)
                                                                  ((Prelude..)
                                                                     (\ bs
                                                                        -> (Data.Monoid.<>)
                                                                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                (Prelude.fromIntegral
                                                                                   (Data.ByteString.length
                                                                                      bs)))
                                                                             (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                                bs))
                                                                     Data.ProtoLens.encodeMessage
                                                                     _v))
                                                          (Lens.Family2.view
                                                             (Data.ProtoLens.Field.field
                                                                @"vec'routeHints")
                                                             _x))
                                                       ((Data.Monoid.<>)
                                                          (Data.Monoid.mconcat
                                                             (Prelude.map
                                                                (\ _v
                                                                   -> (Data.Monoid.<>)
                                                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                           90)
                                                                        ((Prelude..)
                                                                           (\ bs
                                                                              -> (Data.Monoid.<>)
                                                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                      (Prelude.fromIntegral
                                                                                         (Data.ByteString.length
                                                                                            bs)))
                                                                                   (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                                      bs))
                                                                           Data.ProtoLens.encodeMessage
                                                                           (Lens.Family2.set
                                                                              (Data.ProtoLens.Field.field
                                                                                 @"key")
                                                                              (Prelude.fst _v)
                                                                              (Lens.Family2.set
                                                                                 (Data.ProtoLens.Field.field
                                                                                    @"value")
                                                                                 (Prelude.snd _v)
                                                                                 (Data.ProtoLens.defMessage ::
                                                                                    SendPaymentRequest'DestCustomRecordsEntry)))))
                                                                (Data.Map.toList
                                                                   (Lens.Family2.view
                                                                      (Data.ProtoLens.Field.field
                                                                         @"destCustomRecords")
                                                                      _x))))
                                                          ((Data.Monoid.<>)
                                                             (let
                                                                _v
                                                                  = Lens.Family2.view
                                                                      (Data.ProtoLens.Field.field
                                                                         @"allowSelfPayment")
                                                                      _x
                                                              in
                                                                if (Prelude.==)
                                                                     _v
                                                                     Data.ProtoLens.fieldDefault then
                                                                    Data.Monoid.mempty
                                                                else
                                                                    (Data.Monoid.<>)
                                                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                         120)
                                                                      ((Prelude..)
                                                                         Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                         (\ b -> if b then 1 else 0)
                                                                         _v))
                                                             ((Data.Monoid.<>)
                                                                (let
                                                                   p = Lens.Family2.view
                                                                         (Data.ProtoLens.Field.field
                                                                            @"vec'destFeatures")
                                                                         _x
                                                                 in
                                                                   if Data.Vector.Generic.null
                                                                        p then
                                                                       Data.Monoid.mempty
                                                                   else
                                                                       (Data.Monoid.<>)
                                                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                            130)
                                                                         ((\ bs
                                                                             -> (Data.Monoid.<>)
                                                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                     (Prelude.fromIntegral
                                                                                        (Data.ByteString.length
                                                                                           bs)))
                                                                                  (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                                     bs))
                                                                            (Data.ProtoLens.Encoding.Bytes.runBuilder
                                                                               (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                                                                  ((Prelude..)
                                                                                     ((Prelude..)
                                                                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                        Prelude.fromIntegral)
                                                                                     Prelude.fromEnum)
                                                                                  p))))
                                                                ((Data.Monoid.<>)
                                                                   (let
                                                                      _v
                                                                        = Lens.Family2.view
                                                                            (Data.ProtoLens.Field.field
                                                                               @"maxParts")
                                                                            _x
                                                                    in
                                                                      if (Prelude.==)
                                                                           _v
                                                                           Data.ProtoLens.fieldDefault then
                                                                          Data.Monoid.mempty
                                                                      else
                                                                          (Data.Monoid.<>)
                                                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                               136)
                                                                            ((Prelude..)
                                                                               Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                               Prelude.fromIntegral
                                                                               _v))
                                                                   ((Data.Monoid.<>)
                                                                      (let
                                                                         _v
                                                                           = Lens.Family2.view
                                                                               (Data.ProtoLens.Field.field
                                                                                  @"noInflightUpdates")
                                                                               _x
                                                                       in
                                                                         if (Prelude.==)
                                                                              _v
                                                                              Data.ProtoLens.fieldDefault then
                                                                             Data.Monoid.mempty
                                                                         else
                                                                             (Data.Monoid.<>)
                                                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                  144)
                                                                               ((Prelude..)
                                                                                  Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                  (\ b
                                                                                     -> if b then
                                                                                            1
                                                                                        else
                                                                                            0)
                                                                                  _v))
                                                                      ((Data.Monoid.<>)
                                                                         (let
                                                                            _v
                                                                              = Lens.Family2.view
                                                                                  (Data.ProtoLens.Field.field
                                                                                     @"maxShardSizeMsat")
                                                                                  _x
                                                                          in
                                                                            if (Prelude.==)
                                                                                 _v
                                                                                 Data.ProtoLens.fieldDefault then
                                                                                Data.Monoid.mempty
                                                                            else
                                                                                (Data.Monoid.<>)
                                                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                     168)
                                                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                     _v))
                                                                         ((Data.Monoid.<>)
                                                                            (let
                                                                               _v
                                                                                 = Lens.Family2.view
                                                                                     (Data.ProtoLens.Field.field
                                                                                        @"amp")
                                                                                     _x
                                                                             in
                                                                               if (Prelude.==)
                                                                                    _v
                                                                                    Data.ProtoLens.fieldDefault then
                                                                                   Data.Monoid.mempty
                                                                               else
                                                                                   (Data.Monoid.<>)
                                                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                        176)
                                                                                     ((Prelude..)
                                                                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                        (\ b
                                                                                           -> if b then
                                                                                                  1
                                                                                              else
                                                                                                  0)
                                                                                        _v))
                                                                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                                                               (Lens.Family2.view
                                                                                  Data.ProtoLens.unknownFields
                                                                                  _x)))))))))))))))))))))))
instance Control.DeepSeq.NFData SendPaymentRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SendPaymentRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SendPaymentRequest'dest x__)
                (Control.DeepSeq.deepseq
                   (_SendPaymentRequest'amt x__)
                   (Control.DeepSeq.deepseq
                      (_SendPaymentRequest'amtMsat x__)
                      (Control.DeepSeq.deepseq
                         (_SendPaymentRequest'paymentHash x__)
                         (Control.DeepSeq.deepseq
                            (_SendPaymentRequest'finalCltvDelta x__)
                            (Control.DeepSeq.deepseq
                               (_SendPaymentRequest'paymentAddr x__)
                               (Control.DeepSeq.deepseq
                                  (_SendPaymentRequest'paymentRequest x__)
                                  (Control.DeepSeq.deepseq
                                     (_SendPaymentRequest'timeoutSeconds x__)
                                     (Control.DeepSeq.deepseq
                                        (_SendPaymentRequest'feeLimitSat x__)
                                        (Control.DeepSeq.deepseq
                                           (_SendPaymentRequest'feeLimitMsat x__)
                                           (Control.DeepSeq.deepseq
                                              (_SendPaymentRequest'outgoingChanId x__)
                                              (Control.DeepSeq.deepseq
                                                 (_SendPaymentRequest'outgoingChanIds x__)
                                                 (Control.DeepSeq.deepseq
                                                    (_SendPaymentRequest'lastHopPubkey x__)
                                                    (Control.DeepSeq.deepseq
                                                       (_SendPaymentRequest'cltvLimit x__)
                                                       (Control.DeepSeq.deepseq
                                                          (_SendPaymentRequest'routeHints x__)
                                                          (Control.DeepSeq.deepseq
                                                             (_SendPaymentRequest'destCustomRecords
                                                                x__)
                                                             (Control.DeepSeq.deepseq
                                                                (_SendPaymentRequest'allowSelfPayment
                                                                   x__)
                                                                (Control.DeepSeq.deepseq
                                                                   (_SendPaymentRequest'destFeatures
                                                                      x__)
                                                                   (Control.DeepSeq.deepseq
                                                                      (_SendPaymentRequest'maxParts
                                                                         x__)
                                                                      (Control.DeepSeq.deepseq
                                                                         (_SendPaymentRequest'noInflightUpdates
                                                                            x__)
                                                                         (Control.DeepSeq.deepseq
                                                                            (_SendPaymentRequest'maxShardSizeMsat
                                                                               x__)
                                                                            (Control.DeepSeq.deepseq
                                                                               (_SendPaymentRequest'amp
                                                                                  x__)
                                                                               ()))))))))))))))))))))))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.key' @:: Lens' SendPaymentRequest'DestCustomRecordsEntry Data.Word.Word64@
         * 'Proto.RouterGrpc_Fields.value' @:: Lens' SendPaymentRequest'DestCustomRecordsEntry Data.ByteString.ByteString@ -}
data SendPaymentRequest'DestCustomRecordsEntry
  = SendPaymentRequest'DestCustomRecordsEntry'_constructor {_SendPaymentRequest'DestCustomRecordsEntry'key :: !Data.Word.Word64,
                                                            _SendPaymentRequest'DestCustomRecordsEntry'value :: !Data.ByteString.ByteString,
                                                            _SendPaymentRequest'DestCustomRecordsEntry'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SendPaymentRequest'DestCustomRecordsEntry where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SendPaymentRequest'DestCustomRecordsEntry "key" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'DestCustomRecordsEntry'key
           (\ x__ y__
              -> x__ {_SendPaymentRequest'DestCustomRecordsEntry'key = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendPaymentRequest'DestCustomRecordsEntry "value" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendPaymentRequest'DestCustomRecordsEntry'value
           (\ x__ y__
              -> x__ {_SendPaymentRequest'DestCustomRecordsEntry'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message SendPaymentRequest'DestCustomRecordsEntry where
  messageName _
    = Data.Text.pack
        "routerrpc.SendPaymentRequest.DestCustomRecordsEntry"
  fieldsByTag
    = let
        key__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"key")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest'DestCustomRecordsEntry
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor SendPaymentRequest'DestCustomRecordsEntry
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, key__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SendPaymentRequest'DestCustomRecordsEntry'_unknownFields
        (\ x__ y__
           -> x__
                {_SendPaymentRequest'DestCustomRecordsEntry'_unknownFields = y__})
  defMessage
    = SendPaymentRequest'DestCustomRecordsEntry'_constructor
        {_SendPaymentRequest'DestCustomRecordsEntry'key = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'DestCustomRecordsEntry'value = Data.ProtoLens.fieldDefault,
         _SendPaymentRequest'DestCustomRecordsEntry'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SendPaymentRequest'DestCustomRecordsEntry
          -> Data.ProtoLens.Encoding.Bytes.Parser SendPaymentRequest'DestCustomRecordsEntry
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "key"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "DestCustomRecordsEntry"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData SendPaymentRequest'DestCustomRecordsEntry where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SendPaymentRequest'DestCustomRecordsEntry'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SendPaymentRequest'DestCustomRecordsEntry'key x__)
                (Control.DeepSeq.deepseq
                   (_SendPaymentRequest'DestCustomRecordsEntry'value x__) ()))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.paymentHash' @:: Lens' SendToRouteRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.route' @:: Lens' SendToRouteRequest Proto.LndGrpc.Route@
         * 'Proto.RouterGrpc_Fields.maybe'route' @:: Lens' SendToRouteRequest (Prelude.Maybe Proto.LndGrpc.Route)@ -}
data SendToRouteRequest
  = SendToRouteRequest'_constructor {_SendToRouteRequest'paymentHash :: !Data.ByteString.ByteString,
                                     _SendToRouteRequest'route :: !(Prelude.Maybe Proto.LndGrpc.Route),
                                     _SendToRouteRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SendToRouteRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SendToRouteRequest "paymentHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendToRouteRequest'paymentHash
           (\ x__ y__ -> x__ {_SendToRouteRequest'paymentHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendToRouteRequest "route" Proto.LndGrpc.Route where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendToRouteRequest'route
           (\ x__ y__ -> x__ {_SendToRouteRequest'route = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SendToRouteRequest "maybe'route" (Prelude.Maybe Proto.LndGrpc.Route) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendToRouteRequest'route
           (\ x__ y__ -> x__ {_SendToRouteRequest'route = y__}))
        Prelude.id
instance Data.ProtoLens.Message SendToRouteRequest where
  messageName _ = Data.Text.pack "routerrpc.SendToRouteRequest"
  fieldsByTag
    = let
        paymentHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentHash")) ::
              Data.ProtoLens.FieldDescriptor SendToRouteRequest
        route__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "route"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.Route)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'route")) ::
              Data.ProtoLens.FieldDescriptor SendToRouteRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, paymentHash__field_descriptor),
           (Data.ProtoLens.Tag 2, route__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SendToRouteRequest'_unknownFields
        (\ x__ y__ -> x__ {_SendToRouteRequest'_unknownFields = y__})
  defMessage
    = SendToRouteRequest'_constructor
        {_SendToRouteRequest'paymentHash = Data.ProtoLens.fieldDefault,
         _SendToRouteRequest'route = Prelude.Nothing,
         _SendToRouteRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SendToRouteRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SendToRouteRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "payment_hash"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"paymentHash") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "route"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"route") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SendToRouteRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"paymentHash") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'route") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage
                             _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData SendToRouteRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SendToRouteRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SendToRouteRequest'paymentHash x__)
                (Control.DeepSeq.deepseq (_SendToRouteRequest'route x__) ()))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.preimage' @:: Lens' SendToRouteResponse Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.failure' @:: Lens' SendToRouteResponse Proto.LndGrpc.Failure@
         * 'Proto.RouterGrpc_Fields.maybe'failure' @:: Lens' SendToRouteResponse (Prelude.Maybe Proto.LndGrpc.Failure)@ -}
data SendToRouteResponse
  = SendToRouteResponse'_constructor {_SendToRouteResponse'preimage :: !Data.ByteString.ByteString,
                                      _SendToRouteResponse'failure :: !(Prelude.Maybe Proto.LndGrpc.Failure),
                                      _SendToRouteResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SendToRouteResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SendToRouteResponse "preimage" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendToRouteResponse'preimage
           (\ x__ y__ -> x__ {_SendToRouteResponse'preimage = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendToRouteResponse "failure" Proto.LndGrpc.Failure where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendToRouteResponse'failure
           (\ x__ y__ -> x__ {_SendToRouteResponse'failure = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SendToRouteResponse "maybe'failure" (Prelude.Maybe Proto.LndGrpc.Failure) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendToRouteResponse'failure
           (\ x__ y__ -> x__ {_SendToRouteResponse'failure = y__}))
        Prelude.id
instance Data.ProtoLens.Message SendToRouteResponse where
  messageName _ = Data.Text.pack "routerrpc.SendToRouteResponse"
  fieldsByTag
    = let
        preimage__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "preimage"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"preimage")) ::
              Data.ProtoLens.FieldDescriptor SendToRouteResponse
        failure__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "failure"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.Failure)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'failure")) ::
              Data.ProtoLens.FieldDescriptor SendToRouteResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, preimage__field_descriptor),
           (Data.ProtoLens.Tag 2, failure__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SendToRouteResponse'_unknownFields
        (\ x__ y__ -> x__ {_SendToRouteResponse'_unknownFields = y__})
  defMessage
    = SendToRouteResponse'_constructor
        {_SendToRouteResponse'preimage = Data.ProtoLens.fieldDefault,
         _SendToRouteResponse'failure = Prelude.Nothing,
         _SendToRouteResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SendToRouteResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser SendToRouteResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "preimage"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"preimage") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "failure"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"failure") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SendToRouteResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"preimage") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'failure") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage
                             _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData SendToRouteResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SendToRouteResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SendToRouteResponse'preimage x__)
                (Control.DeepSeq.deepseq (_SendToRouteResponse'failure x__) ()))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.config' @:: Lens' SetMissionControlConfigRequest MissionControlConfig@
         * 'Proto.RouterGrpc_Fields.maybe'config' @:: Lens' SetMissionControlConfigRequest (Prelude.Maybe MissionControlConfig)@ -}
data SetMissionControlConfigRequest
  = SetMissionControlConfigRequest'_constructor {_SetMissionControlConfigRequest'config :: !(Prelude.Maybe MissionControlConfig),
                                                 _SetMissionControlConfigRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetMissionControlConfigRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SetMissionControlConfigRequest "config" MissionControlConfig where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetMissionControlConfigRequest'config
           (\ x__ y__ -> x__ {_SetMissionControlConfigRequest'config = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SetMissionControlConfigRequest "maybe'config" (Prelude.Maybe MissionControlConfig) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetMissionControlConfigRequest'config
           (\ x__ y__ -> x__ {_SetMissionControlConfigRequest'config = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetMissionControlConfigRequest where
  messageName _
    = Data.Text.pack "routerrpc.SetMissionControlConfigRequest"
  fieldsByTag
    = let
        config__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "config"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor MissionControlConfig)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'config")) ::
              Data.ProtoLens.FieldDescriptor SetMissionControlConfigRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, config__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetMissionControlConfigRequest'_unknownFields
        (\ x__ y__
           -> x__ {_SetMissionControlConfigRequest'_unknownFields = y__})
  defMessage
    = SetMissionControlConfigRequest'_constructor
        {_SetMissionControlConfigRequest'config = Prelude.Nothing,
         _SetMissionControlConfigRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetMissionControlConfigRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SetMissionControlConfigRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "config"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"config") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage)
          "SetMissionControlConfigRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'config") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SetMissionControlConfigRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetMissionControlConfigRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SetMissionControlConfigRequest'config x__) ())
{- | Fields :
      -}
data SetMissionControlConfigResponse
  = SetMissionControlConfigResponse'_constructor {_SetMissionControlConfigResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetMissionControlConfigResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message SetMissionControlConfigResponse where
  messageName _
    = Data.Text.pack "routerrpc.SetMissionControlConfigResponse"
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetMissionControlConfigResponse'_unknownFields
        (\ x__ y__
           -> x__ {_SetMissionControlConfigResponse'_unknownFields = y__})
  defMessage
    = SetMissionControlConfigResponse'_constructor
        {_SetMissionControlConfigResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetMissionControlConfigResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser SetMissionControlConfigResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage)
          "SetMissionControlConfigResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData SetMissionControlConfigResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetMissionControlConfigResponse'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.preimage' @:: Lens' SettleEvent Data.ByteString.ByteString@ -}
data SettleEvent
  = SettleEvent'_constructor {_SettleEvent'preimage :: !Data.ByteString.ByteString,
                              _SettleEvent'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SettleEvent where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SettleEvent "preimage" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SettleEvent'preimage
           (\ x__ y__ -> x__ {_SettleEvent'preimage = y__}))
        Prelude.id
instance Data.ProtoLens.Message SettleEvent where
  messageName _ = Data.Text.pack "routerrpc.SettleEvent"
  fieldsByTag
    = let
        preimage__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "preimage"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"preimage")) ::
              Data.ProtoLens.FieldDescriptor SettleEvent
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, preimage__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SettleEvent'_unknownFields
        (\ x__ y__ -> x__ {_SettleEvent'_unknownFields = y__})
  defMessage
    = SettleEvent'_constructor
        {_SettleEvent'preimage = Data.ProtoLens.fieldDefault,
         _SettleEvent'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SettleEvent -> Data.ProtoLens.Encoding.Bytes.Parser SettleEvent
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "preimage"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"preimage") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SettleEvent"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"preimage") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SettleEvent where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SettleEvent'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SettleEvent'preimage x__) ())
{- | Fields :
      -}
data SubscribeHtlcEventsRequest
  = SubscribeHtlcEventsRequest'_constructor {_SubscribeHtlcEventsRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SubscribeHtlcEventsRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message SubscribeHtlcEventsRequest where
  messageName _
    = Data.Text.pack "routerrpc.SubscribeHtlcEventsRequest"
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SubscribeHtlcEventsRequest'_unknownFields
        (\ x__ y__
           -> x__ {_SubscribeHtlcEventsRequest'_unknownFields = y__})
  defMessage
    = SubscribeHtlcEventsRequest'_constructor
        {_SubscribeHtlcEventsRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SubscribeHtlcEventsRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SubscribeHtlcEventsRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SubscribeHtlcEventsRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData SubscribeHtlcEventsRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SubscribeHtlcEventsRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.paymentHash' @:: Lens' TrackPaymentRequest Data.ByteString.ByteString@
         * 'Proto.RouterGrpc_Fields.noInflightUpdates' @:: Lens' TrackPaymentRequest Prelude.Bool@ -}
data TrackPaymentRequest
  = TrackPaymentRequest'_constructor {_TrackPaymentRequest'paymentHash :: !Data.ByteString.ByteString,
                                      _TrackPaymentRequest'noInflightUpdates :: !Prelude.Bool,
                                      _TrackPaymentRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TrackPaymentRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField TrackPaymentRequest "paymentHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TrackPaymentRequest'paymentHash
           (\ x__ y__ -> x__ {_TrackPaymentRequest'paymentHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TrackPaymentRequest "noInflightUpdates" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TrackPaymentRequest'noInflightUpdates
           (\ x__ y__ -> x__ {_TrackPaymentRequest'noInflightUpdates = y__}))
        Prelude.id
instance Data.ProtoLens.Message TrackPaymentRequest where
  messageName _ = Data.Text.pack "routerrpc.TrackPaymentRequest"
  fieldsByTag
    = let
        paymentHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentHash")) ::
              Data.ProtoLens.FieldDescriptor TrackPaymentRequest
        noInflightUpdates__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "no_inflight_updates"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"noInflightUpdates")) ::
              Data.ProtoLens.FieldDescriptor TrackPaymentRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, paymentHash__field_descriptor),
           (Data.ProtoLens.Tag 2, noInflightUpdates__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _TrackPaymentRequest'_unknownFields
        (\ x__ y__ -> x__ {_TrackPaymentRequest'_unknownFields = y__})
  defMessage
    = TrackPaymentRequest'_constructor
        {_TrackPaymentRequest'paymentHash = Data.ProtoLens.fieldDefault,
         _TrackPaymentRequest'noInflightUpdates = Data.ProtoLens.fieldDefault,
         _TrackPaymentRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          TrackPaymentRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser TrackPaymentRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "payment_hash"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"paymentHash") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "no_inflight_updates"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"noInflightUpdates") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "TrackPaymentRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"paymentHash") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"noInflightUpdates") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt
                            (\ b -> if b then 1 else 0)
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData TrackPaymentRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_TrackPaymentRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_TrackPaymentRequest'paymentHash x__)
                (Control.DeepSeq.deepseq
                   (_TrackPaymentRequest'noInflightUpdates x__) ()))
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.chanPoint' @:: Lens' UpdateChanStatusRequest Proto.LndGrpc.ChannelPoint@
         * 'Proto.RouterGrpc_Fields.maybe'chanPoint' @:: Lens' UpdateChanStatusRequest (Prelude.Maybe Proto.LndGrpc.ChannelPoint)@
         * 'Proto.RouterGrpc_Fields.action' @:: Lens' UpdateChanStatusRequest ChanStatusAction@ -}
data UpdateChanStatusRequest
  = UpdateChanStatusRequest'_constructor {_UpdateChanStatusRequest'chanPoint :: !(Prelude.Maybe Proto.LndGrpc.ChannelPoint),
                                          _UpdateChanStatusRequest'action :: !ChanStatusAction,
                                          _UpdateChanStatusRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UpdateChanStatusRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UpdateChanStatusRequest "chanPoint" Proto.LndGrpc.ChannelPoint where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UpdateChanStatusRequest'chanPoint
           (\ x__ y__ -> x__ {_UpdateChanStatusRequest'chanPoint = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField UpdateChanStatusRequest "maybe'chanPoint" (Prelude.Maybe Proto.LndGrpc.ChannelPoint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UpdateChanStatusRequest'chanPoint
           (\ x__ y__ -> x__ {_UpdateChanStatusRequest'chanPoint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UpdateChanStatusRequest "action" ChanStatusAction where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UpdateChanStatusRequest'action
           (\ x__ y__ -> x__ {_UpdateChanStatusRequest'action = y__}))
        Prelude.id
instance Data.ProtoLens.Message UpdateChanStatusRequest where
  messageName _ = Data.Text.pack "routerrpc.UpdateChanStatusRequest"
  fieldsByTag
    = let
        chanPoint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "chan_point"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.ChannelPoint)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'chanPoint")) ::
              Data.ProtoLens.FieldDescriptor UpdateChanStatusRequest
        action__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "action"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor ChanStatusAction)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"action")) ::
              Data.ProtoLens.FieldDescriptor UpdateChanStatusRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, chanPoint__field_descriptor),
           (Data.ProtoLens.Tag 2, action__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UpdateChanStatusRequest'_unknownFields
        (\ x__ y__ -> x__ {_UpdateChanStatusRequest'_unknownFields = y__})
  defMessage
    = UpdateChanStatusRequest'_constructor
        {_UpdateChanStatusRequest'chanPoint = Prelude.Nothing,
         _UpdateChanStatusRequest'action = Data.ProtoLens.fieldDefault,
         _UpdateChanStatusRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UpdateChanStatusRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser UpdateChanStatusRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "chan_point"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"chanPoint") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "action"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"action") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UpdateChanStatusRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'chanPoint") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"action") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                            Prelude.fromEnum
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData UpdateChanStatusRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UpdateChanStatusRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UpdateChanStatusRequest'chanPoint x__)
                (Control.DeepSeq.deepseq (_UpdateChanStatusRequest'action x__) ()))
{- | Fields :
      -}
data UpdateChanStatusResponse
  = UpdateChanStatusResponse'_constructor {_UpdateChanStatusResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UpdateChanStatusResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message UpdateChanStatusResponse where
  messageName _ = Data.Text.pack "routerrpc.UpdateChanStatusResponse"
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UpdateChanStatusResponse'_unknownFields
        (\ x__ y__ -> x__ {_UpdateChanStatusResponse'_unknownFields = y__})
  defMessage
    = UpdateChanStatusResponse'_constructor
        {_UpdateChanStatusResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UpdateChanStatusResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser UpdateChanStatusResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UpdateChanStatusResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData UpdateChanStatusResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UpdateChanStatusResponse'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.RouterGrpc_Fields.pairs' @:: Lens' XImportMissionControlRequest [PairHistory]@
         * 'Proto.RouterGrpc_Fields.vec'pairs' @:: Lens' XImportMissionControlRequest (Data.Vector.Vector PairHistory)@ -}
data XImportMissionControlRequest
  = XImportMissionControlRequest'_constructor {_XImportMissionControlRequest'pairs :: !(Data.Vector.Vector PairHistory),
                                               _XImportMissionControlRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show XImportMissionControlRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField XImportMissionControlRequest "pairs" [PairHistory] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _XImportMissionControlRequest'pairs
           (\ x__ y__ -> x__ {_XImportMissionControlRequest'pairs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField XImportMissionControlRequest "vec'pairs" (Data.Vector.Vector PairHistory) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _XImportMissionControlRequest'pairs
           (\ x__ y__ -> x__ {_XImportMissionControlRequest'pairs = y__}))
        Prelude.id
instance Data.ProtoLens.Message XImportMissionControlRequest where
  messageName _
    = Data.Text.pack "routerrpc.XImportMissionControlRequest"
  fieldsByTag
    = let
        pairs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "pairs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor PairHistory)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"pairs")) ::
              Data.ProtoLens.FieldDescriptor XImportMissionControlRequest
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, pairs__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _XImportMissionControlRequest'_unknownFields
        (\ x__ y__
           -> x__ {_XImportMissionControlRequest'_unknownFields = y__})
  defMessage
    = XImportMissionControlRequest'_constructor
        {_XImportMissionControlRequest'pairs = Data.Vector.Generic.empty,
         _XImportMissionControlRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          XImportMissionControlRequest
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld PairHistory
             -> Data.ProtoLens.Encoding.Bytes.Parser XImportMissionControlRequest
        loop x mutable'pairs
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'pairs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'pairs)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'pairs") frozen'pairs x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "pairs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'pairs y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'pairs
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'pairs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'pairs)
          "XImportMissionControlRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage
                           _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'pairs") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData XImportMissionControlRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_XImportMissionControlRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_XImportMissionControlRequest'pairs x__) ())
{- | Fields :
      -}
data XImportMissionControlResponse
  = XImportMissionControlResponse'_constructor {_XImportMissionControlResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show XImportMissionControlResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message XImportMissionControlResponse where
  messageName _
    = Data.Text.pack "routerrpc.XImportMissionControlResponse"
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _XImportMissionControlResponse'_unknownFields
        (\ x__ y__
           -> x__ {_XImportMissionControlResponse'_unknownFields = y__})
  defMessage
    = XImportMissionControlResponse'_constructor
        {_XImportMissionControlResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          XImportMissionControlResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser XImportMissionControlResponse
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "XImportMissionControlResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData XImportMissionControlResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_XImportMissionControlResponse'_unknownFields x__) ()
data Router = Router {}
instance Data.ProtoLens.Service.Types.Service Router where
  type ServiceName Router = "Router"
  type ServicePackage Router = "routerrpc"
  type ServiceMethods Router = '["buildRoute",
                                 "estimateRouteFee",
                                 "getMissionControlConfig",
                                 "htlcInterceptor",
                                 "queryMissionControl",
                                 "queryProbability",
                                 "resetMissionControl",
                                 "sendPayment",
                                 "sendPaymentV2",
                                 "sendToRoute",
                                 "sendToRouteV2",
                                 "setMissionControlConfig",
                                 "subscribeHtlcEvents",
                                 "trackPayment",
                                 "trackPaymentV2",
                                 "updateChanStatus",
                                 "ximportMissionControl"]
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "sendPaymentV2" where
  type MethodName Router "sendPaymentV2" = "SendPaymentV2"
  type MethodInput Router "sendPaymentV2" = SendPaymentRequest
  type MethodOutput Router "sendPaymentV2" = Proto.LndGrpc.Payment
  type MethodStreamingType Router "sendPaymentV2" =  'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "trackPaymentV2" where
  type MethodName Router "trackPaymentV2" = "TrackPaymentV2"
  type MethodInput Router "trackPaymentV2" = TrackPaymentRequest
  type MethodOutput Router "trackPaymentV2" = Proto.LndGrpc.Payment
  type MethodStreamingType Router "trackPaymentV2" =  'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "estimateRouteFee" where
  type MethodName Router "estimateRouteFee" = "EstimateRouteFee"
  type MethodInput Router "estimateRouteFee" = RouteFeeRequest
  type MethodOutput Router "estimateRouteFee" = RouteFeeResponse
  type MethodStreamingType Router "estimateRouteFee" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "sendToRoute" where
  type MethodName Router "sendToRoute" = "SendToRoute"
  type MethodInput Router "sendToRoute" = SendToRouteRequest
  type MethodOutput Router "sendToRoute" = SendToRouteResponse
  type MethodStreamingType Router "sendToRoute" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "sendToRouteV2" where
  type MethodName Router "sendToRouteV2" = "SendToRouteV2"
  type MethodInput Router "sendToRouteV2" = SendToRouteRequest
  type MethodOutput Router "sendToRouteV2" = Proto.LndGrpc.HTLCAttempt
  type MethodStreamingType Router "sendToRouteV2" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "resetMissionControl" where
  type MethodName Router "resetMissionControl" = "ResetMissionControl"
  type MethodInput Router "resetMissionControl" = ResetMissionControlRequest
  type MethodOutput Router "resetMissionControl" = ResetMissionControlResponse
  type MethodStreamingType Router "resetMissionControl" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "queryMissionControl" where
  type MethodName Router "queryMissionControl" = "QueryMissionControl"
  type MethodInput Router "queryMissionControl" = QueryMissionControlRequest
  type MethodOutput Router "queryMissionControl" = QueryMissionControlResponse
  type MethodStreamingType Router "queryMissionControl" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "ximportMissionControl" where
  type MethodName Router "ximportMissionControl" = "XImportMissionControl"
  type MethodInput Router "ximportMissionControl" = XImportMissionControlRequest
  type MethodOutput Router "ximportMissionControl" = XImportMissionControlResponse
  type MethodStreamingType Router "ximportMissionControl" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "getMissionControlConfig" where
  type MethodName Router "getMissionControlConfig" = "GetMissionControlConfig"
  type MethodInput Router "getMissionControlConfig" = GetMissionControlConfigRequest
  type MethodOutput Router "getMissionControlConfig" = GetMissionControlConfigResponse
  type MethodStreamingType Router "getMissionControlConfig" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "setMissionControlConfig" where
  type MethodName Router "setMissionControlConfig" = "SetMissionControlConfig"
  type MethodInput Router "setMissionControlConfig" = SetMissionControlConfigRequest
  type MethodOutput Router "setMissionControlConfig" = SetMissionControlConfigResponse
  type MethodStreamingType Router "setMissionControlConfig" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "queryProbability" where
  type MethodName Router "queryProbability" = "QueryProbability"
  type MethodInput Router "queryProbability" = QueryProbabilityRequest
  type MethodOutput Router "queryProbability" = QueryProbabilityResponse
  type MethodStreamingType Router "queryProbability" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "buildRoute" where
  type MethodName Router "buildRoute" = "BuildRoute"
  type MethodInput Router "buildRoute" = BuildRouteRequest
  type MethodOutput Router "buildRoute" = BuildRouteResponse
  type MethodStreamingType Router "buildRoute" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "subscribeHtlcEvents" where
  type MethodName Router "subscribeHtlcEvents" = "SubscribeHtlcEvents"
  type MethodInput Router "subscribeHtlcEvents" = SubscribeHtlcEventsRequest
  type MethodOutput Router "subscribeHtlcEvents" = HtlcEvent
  type MethodStreamingType Router "subscribeHtlcEvents" =  'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "sendPayment" where
  type MethodName Router "sendPayment" = "SendPayment"
  type MethodInput Router "sendPayment" = SendPaymentRequest
  type MethodOutput Router "sendPayment" = PaymentStatus
  type MethodStreamingType Router "sendPayment" =  'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "trackPayment" where
  type MethodName Router "trackPayment" = "TrackPayment"
  type MethodInput Router "trackPayment" = TrackPaymentRequest
  type MethodOutput Router "trackPayment" = PaymentStatus
  type MethodStreamingType Router "trackPayment" =  'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "htlcInterceptor" where
  type MethodName Router "htlcInterceptor" = "HtlcInterceptor"
  type MethodInput Router "htlcInterceptor" = ForwardHtlcInterceptResponse
  type MethodOutput Router "htlcInterceptor" = ForwardHtlcInterceptRequest
  type MethodStreamingType Router "htlcInterceptor" =  'Data.ProtoLens.Service.Types.BiDiStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Router "updateChanStatus" where
  type MethodName Router "updateChanStatus" = "UpdateChanStatus"
  type MethodInput Router "updateChanStatus" = UpdateChanStatusRequest
  type MethodOutput Router "updateChanStatus" = UpdateChanStatusResponse
  type MethodStreamingType Router "updateChanStatus" =  'Data.ProtoLens.Service.Types.NonStreaming