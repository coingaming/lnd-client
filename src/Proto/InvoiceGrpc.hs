{- This file was auto-generated from invoice_grpc.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.InvoiceGrpc (
        Invoices(..), AddHoldInvoiceRequest(), AddHoldInvoiceResp(),
        CancelInvoiceMsg(), CancelInvoiceResp(), SettleInvoiceMsg(),
        SettleInvoiceResp(), SubscribeSingleInvoiceRequest()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
import qualified Text.PrettyPrint.GenericPretty.Instance
import qualified GHC.Generics
import qualified Text.PrettyPrint.GenericPretty
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
     
         * 'Proto.InvoiceGrpc_Fields.memo' @:: Lens' AddHoldInvoiceRequest Data.Text.Text@
         * 'Proto.InvoiceGrpc_Fields.hash' @:: Lens' AddHoldInvoiceRequest Data.ByteString.ByteString@
         * 'Proto.InvoiceGrpc_Fields.value' @:: Lens' AddHoldInvoiceRequest Data.Int.Int64@
         * 'Proto.InvoiceGrpc_Fields.valueMsat' @:: Lens' AddHoldInvoiceRequest Data.Int.Int64@
         * 'Proto.InvoiceGrpc_Fields.descriptionHash' @:: Lens' AddHoldInvoiceRequest Data.ByteString.ByteString@
         * 'Proto.InvoiceGrpc_Fields.expiry' @:: Lens' AddHoldInvoiceRequest Data.Int.Int64@
         * 'Proto.InvoiceGrpc_Fields.fallbackAddr' @:: Lens' AddHoldInvoiceRequest Data.Text.Text@
         * 'Proto.InvoiceGrpc_Fields.cltvExpiry' @:: Lens' AddHoldInvoiceRequest Data.Word.Word64@
         * 'Proto.InvoiceGrpc_Fields.routeHints' @:: Lens' AddHoldInvoiceRequest [Proto.LndGrpc.RouteHint]@
         * 'Proto.InvoiceGrpc_Fields.vec'routeHints' @:: Lens' AddHoldInvoiceRequest (Data.Vector.Vector Proto.LndGrpc.RouteHint)@
         * 'Proto.InvoiceGrpc_Fields.private' @:: Lens' AddHoldInvoiceRequest Prelude.Bool@ -}
data AddHoldInvoiceRequest
  = AddHoldInvoiceRequest'_constructor {_AddHoldInvoiceRequest'memo :: !Data.Text.Text,
                                        _AddHoldInvoiceRequest'hash :: !Data.ByteString.ByteString,
                                        _AddHoldInvoiceRequest'value :: !Data.Int.Int64,
                                        _AddHoldInvoiceRequest'valueMsat :: !Data.Int.Int64,
                                        _AddHoldInvoiceRequest'descriptionHash :: !Data.ByteString.ByteString,
                                        _AddHoldInvoiceRequest'expiry :: !Data.Int.Int64,
                                        _AddHoldInvoiceRequest'fallbackAddr :: !Data.Text.Text,
                                        _AddHoldInvoiceRequest'cltvExpiry :: !Data.Word.Word64,
                                        _AddHoldInvoiceRequest'routeHints :: !(Data.Vector.Vector Proto.LndGrpc.RouteHint),
                                        _AddHoldInvoiceRequest'private :: !Prelude.Bool,
                                        _AddHoldInvoiceRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show AddHoldInvoiceRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out AddHoldInvoiceRequest
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "memo" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'memo
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'memo = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "hash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'hash
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'hash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "value" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'value
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'value = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "valueMsat" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'valueMsat
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'valueMsat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "descriptionHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'descriptionHash
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'descriptionHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "expiry" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'expiry
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'expiry = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "fallbackAddr" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'fallbackAddr
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'fallbackAddr = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "cltvExpiry" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'cltvExpiry
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'cltvExpiry = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "routeHints" [Proto.LndGrpc.RouteHint] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'routeHints
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'routeHints = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "vec'routeHints" (Data.Vector.Vector Proto.LndGrpc.RouteHint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'routeHints
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'routeHints = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "private" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'private
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'private = y__}))
        Prelude.id
instance Data.ProtoLens.Message AddHoldInvoiceRequest where
  messageName _ = Data.Text.pack "invoicesrpc.AddHoldInvoiceRequest"
  packedMessageDescriptor _
    = "\n\
      \\NAKAddHoldInvoiceRequest\DC2\DC2\n\
      \\EOTmemo\CAN\SOH \SOH(\tR\EOTmemo\DC2\DC2\n\
      \\EOThash\CAN\STX \SOH(\fR\EOThash\DC2\DC4\n\
      \\ENQvalue\CAN\ETX \SOH(\ETXR\ENQvalue\DC2\GS\n\
      \\n\
      \value_msat\CAN\n\
      \ \SOH(\ETXR\tvalueMsat\DC2)\n\
      \\DLEdescription_hash\CAN\EOT \SOH(\fR\SIdescriptionHash\DC2\SYN\n\
      \\ACKexpiry\CAN\ENQ \SOH(\ETXR\ACKexpiry\DC2#\n\
      \\rfallback_addr\CAN\ACK \SOH(\tR\ffallbackAddr\DC2\US\n\
      \\vcltv_expiry\CAN\a \SOH(\EOTR\n\
      \cltvExpiry\DC21\n\
      \\vroute_hints\CAN\b \ETX(\v2\DLE.lnrpc.RouteHintR\n\
      \routeHints\DC2\CAN\n\
      \\aprivate\CAN\t \SOH(\bR\aprivate"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        memo__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "memo"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"memo")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
        hash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"hash")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
        valueMsat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value_msat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"valueMsat")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
        descriptionHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "description_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"descriptionHash")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
        expiry__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "expiry"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"expiry")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
        fallbackAddr__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fallback_addr"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"fallbackAddr")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
        cltvExpiry__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cltv_expiry"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"cltvExpiry")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
        routeHints__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "route_hints"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.RouteHint)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"routeHints")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
        private__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "private"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"private")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, memo__field_descriptor),
           (Data.ProtoLens.Tag 2, hash__field_descriptor),
           (Data.ProtoLens.Tag 3, value__field_descriptor),
           (Data.ProtoLens.Tag 10, valueMsat__field_descriptor),
           (Data.ProtoLens.Tag 4, descriptionHash__field_descriptor),
           (Data.ProtoLens.Tag 5, expiry__field_descriptor),
           (Data.ProtoLens.Tag 6, fallbackAddr__field_descriptor),
           (Data.ProtoLens.Tag 7, cltvExpiry__field_descriptor),
           (Data.ProtoLens.Tag 8, routeHints__field_descriptor),
           (Data.ProtoLens.Tag 9, private__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AddHoldInvoiceRequest'_unknownFields
        (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'_unknownFields = y__})
  defMessage
    = AddHoldInvoiceRequest'_constructor
        {_AddHoldInvoiceRequest'memo = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceRequest'hash = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceRequest'value = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceRequest'valueMsat = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceRequest'descriptionHash = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceRequest'expiry = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceRequest'fallbackAddr = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceRequest'cltvExpiry = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceRequest'routeHints = Data.Vector.Generic.empty,
         _AddHoldInvoiceRequest'private = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          AddHoldInvoiceRequest
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.LndGrpc.RouteHint
             -> Data.ProtoLens.Encoding.Bytes.Parser AddHoldInvoiceRequest
        loop x mutable'routeHints
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'routeHints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
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
                              (Data.ProtoLens.Field.field @"vec'routeHints")
                              frozen'routeHints
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "memo"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"memo") y x)
                                  mutable'routeHints
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "hash"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"hash") y x)
                                  mutable'routeHints
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "value"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                                  mutable'routeHints
                        80
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "value_msat"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"valueMsat") y x)
                                  mutable'routeHints
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "description_hash"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"descriptionHash") y x)
                                  mutable'routeHints
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "expiry"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"expiry") y x)
                                  mutable'routeHints
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "fallback_addr"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"fallbackAddr") y x)
                                  mutable'routeHints
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "cltv_expiry"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"cltvExpiry") y x)
                                  mutable'routeHints
                        66
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "route_hints"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'routeHints y)
                                loop x v
                        72
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "private"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"private") y x)
                                  mutable'routeHints
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'routeHints
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'routeHints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'routeHints)
          "AddHoldInvoiceRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"memo") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8
                         _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"hash") _x
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
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"valueMsat") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 80)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"descriptionHash") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                  ((\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                     _v))
                         ((Data.Monoid.<>)
                            (let
                               _v = Lens.Family2.view (Data.ProtoLens.Field.field @"expiry") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                        Prelude.fromIntegral
                                        _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"fallbackAddr") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
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
                                           (Data.ProtoLens.Field.field @"cltvExpiry") _x
                                   in
                                     if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                         Data.Monoid.mempty
                                     else
                                         (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                                  ((Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
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
                                                   _v))
                                        (Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"vec'routeHints") _x))
                                     ((Data.Monoid.<>)
                                        (let
                                           _v
                                             = Lens.Family2.view
                                                 (Data.ProtoLens.Field.field @"private") _x
                                         in
                                           if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                               Data.Monoid.mempty
                                           else
                                               (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 72)
                                                 ((Prelude..)
                                                    Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (\ b -> if b then 1 else 0)
                                                    _v))
                                        (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                           (Lens.Family2.view
                                              Data.ProtoLens.unknownFields _x)))))))))))
instance Control.DeepSeq.NFData AddHoldInvoiceRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AddHoldInvoiceRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_AddHoldInvoiceRequest'memo x__)
                (Control.DeepSeq.deepseq
                   (_AddHoldInvoiceRequest'hash x__)
                   (Control.DeepSeq.deepseq
                      (_AddHoldInvoiceRequest'value x__)
                      (Control.DeepSeq.deepseq
                         (_AddHoldInvoiceRequest'valueMsat x__)
                         (Control.DeepSeq.deepseq
                            (_AddHoldInvoiceRequest'descriptionHash x__)
                            (Control.DeepSeq.deepseq
                               (_AddHoldInvoiceRequest'expiry x__)
                               (Control.DeepSeq.deepseq
                                  (_AddHoldInvoiceRequest'fallbackAddr x__)
                                  (Control.DeepSeq.deepseq
                                     (_AddHoldInvoiceRequest'cltvExpiry x__)
                                     (Control.DeepSeq.deepseq
                                        (_AddHoldInvoiceRequest'routeHints x__)
                                        (Control.DeepSeq.deepseq
                                           (_AddHoldInvoiceRequest'private x__) ()))))))))))
{- | Fields :
     
         * 'Proto.InvoiceGrpc_Fields.paymentRequest' @:: Lens' AddHoldInvoiceResp Data.Text.Text@ -}
data AddHoldInvoiceResp
  = AddHoldInvoiceResp'_constructor {_AddHoldInvoiceResp'paymentRequest :: !Data.Text.Text,
                                     _AddHoldInvoiceResp'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show AddHoldInvoiceResp where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out AddHoldInvoiceResp
instance Data.ProtoLens.Field.HasField AddHoldInvoiceResp "paymentRequest" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceResp'paymentRequest
           (\ x__ y__ -> x__ {_AddHoldInvoiceResp'paymentRequest = y__}))
        Prelude.id
instance Data.ProtoLens.Message AddHoldInvoiceResp where
  messageName _ = Data.Text.pack "invoicesrpc.AddHoldInvoiceResp"
  packedMessageDescriptor _
    = "\n\
      \\DC2AddHoldInvoiceResp\DC2'\n\
      \\SIpayment_request\CAN\SOH \SOH(\tR\SOpaymentRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        paymentRequest__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_request"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentRequest")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceResp
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, paymentRequest__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AddHoldInvoiceResp'_unknownFields
        (\ x__ y__ -> x__ {_AddHoldInvoiceResp'_unknownFields = y__})
  defMessage
    = AddHoldInvoiceResp'_constructor
        {_AddHoldInvoiceResp'paymentRequest = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceResp'_unknownFields = []}
  parseMessage
    = let
        loop ::
          AddHoldInvoiceResp
          -> Data.ProtoLens.Encoding.Bytes.Parser AddHoldInvoiceResp
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
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "AddHoldInvoiceResp"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"paymentRequest") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData AddHoldInvoiceResp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AddHoldInvoiceResp'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_AddHoldInvoiceResp'paymentRequest x__) ())
{- | Fields :
     
         * 'Proto.InvoiceGrpc_Fields.paymentHash' @:: Lens' CancelInvoiceMsg Data.ByteString.ByteString@ -}
data CancelInvoiceMsg
  = CancelInvoiceMsg'_constructor {_CancelInvoiceMsg'paymentHash :: !Data.ByteString.ByteString,
                                   _CancelInvoiceMsg'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show CancelInvoiceMsg where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out CancelInvoiceMsg
instance Data.ProtoLens.Field.HasField CancelInvoiceMsg "paymentHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CancelInvoiceMsg'paymentHash
           (\ x__ y__ -> x__ {_CancelInvoiceMsg'paymentHash = y__}))
        Prelude.id
instance Data.ProtoLens.Message CancelInvoiceMsg where
  messageName _ = Data.Text.pack "invoicesrpc.CancelInvoiceMsg"
  packedMessageDescriptor _
    = "\n\
      \\DLECancelInvoiceMsg\DC2!\n\
      \\fpayment_hash\CAN\SOH \SOH(\fR\vpaymentHash"
  packedFileDescriptor _ = packedFileDescriptor
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
              Data.ProtoLens.FieldDescriptor CancelInvoiceMsg
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, paymentHash__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CancelInvoiceMsg'_unknownFields
        (\ x__ y__ -> x__ {_CancelInvoiceMsg'_unknownFields = y__})
  defMessage
    = CancelInvoiceMsg'_constructor
        {_CancelInvoiceMsg'paymentHash = Data.ProtoLens.fieldDefault,
         _CancelInvoiceMsg'_unknownFields = []}
  parseMessage
    = let
        loop ::
          CancelInvoiceMsg
          -> Data.ProtoLens.Encoding.Bytes.Parser CancelInvoiceMsg
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
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "CancelInvoiceMsg"
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
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData CancelInvoiceMsg where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_CancelInvoiceMsg'_unknownFields x__)
             (Control.DeepSeq.deepseq (_CancelInvoiceMsg'paymentHash x__) ())
{- | Fields :
      -}
data CancelInvoiceResp
  = CancelInvoiceResp'_constructor {_CancelInvoiceResp'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show CancelInvoiceResp where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out CancelInvoiceResp
instance Data.ProtoLens.Message CancelInvoiceResp where
  messageName _ = Data.Text.pack "invoicesrpc.CancelInvoiceResp"
  packedMessageDescriptor _
    = "\n\
      \\DC1CancelInvoiceResp"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CancelInvoiceResp'_unknownFields
        (\ x__ y__ -> x__ {_CancelInvoiceResp'_unknownFields = y__})
  defMessage
    = CancelInvoiceResp'_constructor
        {_CancelInvoiceResp'_unknownFields = []}
  parseMessage
    = let
        loop ::
          CancelInvoiceResp
          -> Data.ProtoLens.Encoding.Bytes.Parser CancelInvoiceResp
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
          (do loop Data.ProtoLens.defMessage) "CancelInvoiceResp"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData CancelInvoiceResp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_CancelInvoiceResp'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.InvoiceGrpc_Fields.preimage' @:: Lens' SettleInvoiceMsg Data.ByteString.ByteString@ -}
data SettleInvoiceMsg
  = SettleInvoiceMsg'_constructor {_SettleInvoiceMsg'preimage :: !Data.ByteString.ByteString,
                                   _SettleInvoiceMsg'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SettleInvoiceMsg where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SettleInvoiceMsg
instance Data.ProtoLens.Field.HasField SettleInvoiceMsg "preimage" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SettleInvoiceMsg'preimage
           (\ x__ y__ -> x__ {_SettleInvoiceMsg'preimage = y__}))
        Prelude.id
instance Data.ProtoLens.Message SettleInvoiceMsg where
  messageName _ = Data.Text.pack "invoicesrpc.SettleInvoiceMsg"
  packedMessageDescriptor _
    = "\n\
      \\DLESettleInvoiceMsg\DC2\SUB\n\
      \\bpreimage\CAN\SOH \SOH(\fR\bpreimage"
  packedFileDescriptor _ = packedFileDescriptor
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
              Data.ProtoLens.FieldDescriptor SettleInvoiceMsg
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, preimage__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SettleInvoiceMsg'_unknownFields
        (\ x__ y__ -> x__ {_SettleInvoiceMsg'_unknownFields = y__})
  defMessage
    = SettleInvoiceMsg'_constructor
        {_SettleInvoiceMsg'preimage = Data.ProtoLens.fieldDefault,
         _SettleInvoiceMsg'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SettleInvoiceMsg
          -> Data.ProtoLens.Encoding.Bytes.Parser SettleInvoiceMsg
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
          (do loop Data.ProtoLens.defMessage) "SettleInvoiceMsg"
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
instance Control.DeepSeq.NFData SettleInvoiceMsg where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SettleInvoiceMsg'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SettleInvoiceMsg'preimage x__) ())
{- | Fields :
      -}
data SettleInvoiceResp
  = SettleInvoiceResp'_constructor {_SettleInvoiceResp'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SettleInvoiceResp where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SettleInvoiceResp
instance Data.ProtoLens.Message SettleInvoiceResp where
  messageName _ = Data.Text.pack "invoicesrpc.SettleInvoiceResp"
  packedMessageDescriptor _
    = "\n\
      \\DC1SettleInvoiceResp"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SettleInvoiceResp'_unknownFields
        (\ x__ y__ -> x__ {_SettleInvoiceResp'_unknownFields = y__})
  defMessage
    = SettleInvoiceResp'_constructor
        {_SettleInvoiceResp'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SettleInvoiceResp
          -> Data.ProtoLens.Encoding.Bytes.Parser SettleInvoiceResp
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
          (do loop Data.ProtoLens.defMessage) "SettleInvoiceResp"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData SettleInvoiceResp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SettleInvoiceResp'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.InvoiceGrpc_Fields.rHash' @:: Lens' SubscribeSingleInvoiceRequest Data.ByteString.ByteString@ -}
data SubscribeSingleInvoiceRequest
  = SubscribeSingleInvoiceRequest'_constructor {_SubscribeSingleInvoiceRequest'rHash :: !Data.ByteString.ByteString,
                                                _SubscribeSingleInvoiceRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SubscribeSingleInvoiceRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SubscribeSingleInvoiceRequest
instance Data.ProtoLens.Field.HasField SubscribeSingleInvoiceRequest "rHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SubscribeSingleInvoiceRequest'rHash
           (\ x__ y__ -> x__ {_SubscribeSingleInvoiceRequest'rHash = y__}))
        Prelude.id
instance Data.ProtoLens.Message SubscribeSingleInvoiceRequest where
  messageName _
    = Data.Text.pack "invoicesrpc.SubscribeSingleInvoiceRequest"
  packedMessageDescriptor _
    = "\n\
      \\GSSubscribeSingleInvoiceRequest\DC2\NAK\n\
      \\ACKr_hash\CAN\STX \SOH(\fR\ENQrHashJ\EOT\b\SOH\DLE\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        rHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "r_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"rHash")) ::
              Data.ProtoLens.FieldDescriptor SubscribeSingleInvoiceRequest
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 2, rHash__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SubscribeSingleInvoiceRequest'_unknownFields
        (\ x__ y__
           -> x__ {_SubscribeSingleInvoiceRequest'_unknownFields = y__})
  defMessage
    = SubscribeSingleInvoiceRequest'_constructor
        {_SubscribeSingleInvoiceRequest'rHash = Data.ProtoLens.fieldDefault,
         _SubscribeSingleInvoiceRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SubscribeSingleInvoiceRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SubscribeSingleInvoiceRequest
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
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "r_hash"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"rHash") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SubscribeSingleInvoiceRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"rHash") _x
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
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SubscribeSingleInvoiceRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SubscribeSingleInvoiceRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SubscribeSingleInvoiceRequest'rHash x__) ())
data Invoices = Invoices {}
instance Data.ProtoLens.Service.Types.Service Invoices where
  type ServiceName Invoices = "Invoices"
  type ServicePackage Invoices = "invoicesrpc"
  type ServiceMethods Invoices = '["addHoldInvoice",
                                   "cancelInvoice",
                                   "settleInvoice",
                                   "subscribeSingleInvoice"]
  packedServiceDescriptor _
    = "\n\
      \\bInvoices\DC2V\n\
      \\SYNSubscribeSingleInvoice\DC2*.invoicesrpc.SubscribeSingleInvoiceRequest\SUB\SO.lnrpc.Invoice0\SOH\DC2N\n\
      \\rCancelInvoice\DC2\GS.invoicesrpc.CancelInvoiceMsg\SUB\RS.invoicesrpc.CancelInvoiceResp\DC2U\n\
      \\SOAddHoldInvoice\DC2\".invoicesrpc.AddHoldInvoiceRequest\SUB\US.invoicesrpc.AddHoldInvoiceResp\DC2N\n\
      \\rSettleInvoice\DC2\GS.invoicesrpc.SettleInvoiceMsg\SUB\RS.invoicesrpc.SettleInvoiceResp"
instance Data.ProtoLens.Service.Types.HasMethodImpl Invoices "subscribeSingleInvoice" where
  type MethodName Invoices "subscribeSingleInvoice" = "SubscribeSingleInvoice"
  type MethodInput Invoices "subscribeSingleInvoice" = SubscribeSingleInvoiceRequest
  type MethodOutput Invoices "subscribeSingleInvoice" = Proto.LndGrpc.Invoice
  type MethodStreamingType Invoices "subscribeSingleInvoice" =  'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Invoices "cancelInvoice" where
  type MethodName Invoices "cancelInvoice" = "CancelInvoice"
  type MethodInput Invoices "cancelInvoice" = CancelInvoiceMsg
  type MethodOutput Invoices "cancelInvoice" = CancelInvoiceResp
  type MethodStreamingType Invoices "cancelInvoice" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Invoices "addHoldInvoice" where
  type MethodName Invoices "addHoldInvoice" = "AddHoldInvoice"
  type MethodInput Invoices "addHoldInvoice" = AddHoldInvoiceRequest
  type MethodOutput Invoices "addHoldInvoice" = AddHoldInvoiceResp
  type MethodStreamingType Invoices "addHoldInvoice" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Invoices "settleInvoice" where
  type MethodName Invoices "settleInvoice" = "SettleInvoice"
  type MethodInput Invoices "settleInvoice" = SettleInvoiceMsg
  type MethodOutput Invoices "settleInvoice" = SettleInvoiceResp
  type MethodStreamingType Invoices "settleInvoice" =  'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\DC2invoice_grpc.proto\DC2\vinvoicesrpc\SUB\SOlnd_grpc.proto\"5\n\
    \\DLECancelInvoiceMsg\DC2!\n\
    \\fpayment_hash\CAN\SOH \SOH(\fR\vpaymentHash\"\DC3\n\
    \\DC1CancelInvoiceResp\"\202\STX\n\
    \\NAKAddHoldInvoiceRequest\DC2\DC2\n\
    \\EOTmemo\CAN\SOH \SOH(\tR\EOTmemo\DC2\DC2\n\
    \\EOThash\CAN\STX \SOH(\fR\EOThash\DC2\DC4\n\
    \\ENQvalue\CAN\ETX \SOH(\ETXR\ENQvalue\DC2\GS\n\
    \\n\
    \value_msat\CAN\n\
    \ \SOH(\ETXR\tvalueMsat\DC2)\n\
    \\DLEdescription_hash\CAN\EOT \SOH(\fR\SIdescriptionHash\DC2\SYN\n\
    \\ACKexpiry\CAN\ENQ \SOH(\ETXR\ACKexpiry\DC2#\n\
    \\rfallback_addr\CAN\ACK \SOH(\tR\ffallbackAddr\DC2\US\n\
    \\vcltv_expiry\CAN\a \SOH(\EOTR\n\
    \cltvExpiry\DC21\n\
    \\vroute_hints\CAN\b \ETX(\v2\DLE.lnrpc.RouteHintR\n\
    \routeHints\DC2\CAN\n\
    \\aprivate\CAN\t \SOH(\bR\aprivate\"=\n\
    \\DC2AddHoldInvoiceResp\DC2'\n\
    \\SIpayment_request\CAN\SOH \SOH(\tR\SOpaymentRequest\".\n\
    \\DLESettleInvoiceMsg\DC2\SUB\n\
    \\bpreimage\CAN\SOH \SOH(\fR\bpreimage\"\DC3\n\
    \\DC1SettleInvoiceResp\"<\n\
    \\GSSubscribeSingleInvoiceRequest\DC2\NAK\n\
    \\ACKr_hash\CAN\STX \SOH(\fR\ENQrHashJ\EOT\b\SOH\DLE\STX2\217\STX\n\
    \\bInvoices\DC2V\n\
    \\SYNSubscribeSingleInvoice\DC2*.invoicesrpc.SubscribeSingleInvoiceRequest\SUB\SO.lnrpc.Invoice0\SOH\DC2N\n\
    \\rCancelInvoice\DC2\GS.invoicesrpc.CancelInvoiceMsg\SUB\RS.invoicesrpc.CancelInvoiceResp\DC2U\n\
    \\SOAddHoldInvoice\DC2\".invoicesrpc.AddHoldInvoiceRequest\SUB\US.invoicesrpc.AddHoldInvoiceResp\DC2N\n\
    \\rSettleInvoice\DC2\GS.invoicesrpc.SettleInvoiceMsg\SUB\RS.invoicesrpc.SettleInvoiceRespB3Z1github.com/lightningnetwork/lnd/lnrpc/invoicesrpcJ\175\ESC\n\
    \\ACK\DC2\EOT\STX\NUL{\SOH\n\
    \\147\SOH\n\
    \\SOH\f\DC2\ETX\STX\NUL\DC22\136\SOHsource https://raw.githubusercontent.com/lightningnetwork/lnd/c733c139e95a6ef4e5f9ac88b43328ac96c333ef/lnrpc/invoicesrpc/invoices.proto\n\
    \\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\EOT\NUL\CAN\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ACK\NUL\DC4\n\
    \\b\n\
    \\SOH\b\DC2\ETX\b\NULH\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\b\NULH\n\
    \d\n\
    \\STX\ACK\NUL\DC2\EOT\f\NUL'\SOH\SUBX Invoices is a service that can be used to create, accept, settle and cancel\n\
    \ invoices.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\f\b\DLE\n\
    \\215\SOH\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\EOT\DC2\EOT\DC3'\SUB\200\SOH\n\
    \SubscribeSingleInvoice returns a uni-directional stream (server -> client)\n\
    \to notify the client of state transitions of the specified invoice.\n\
    \Initially the current invoice state is always sent out.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\DC2\b\RS\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\DC2 =\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ACK\DC2\ETX\DC3\DC1\ETB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\DC3\CAN%\n\
    \\172\SOH\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX\SUB\EOTE\SUB\158\SOH\n\
    \CancelInvoice cancels a currently open invoice. If the invoice is already\n\
    \canceled, this call will succeed. If the invoice is already settled, it will\n\
    \fail.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX\SUB\b\NAK\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX\SUB\ETB'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX\SUB2C\n\
    \n\n\
    \\EOT\ACK\NUL\STX\STX\DC2\ETX \EOTL\SUBa\n\
    \AddHoldInvoice creates a hold invoice. It ties the invoice to the hash\n\
    \supplied in the request.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\SOH\DC2\ETX \b\SYN\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\STX\DC2\ETX \CAN-\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ETX\DC2\ETX 8J\n\
    \t\n\
    \\EOT\ACK\NUL\STX\ETX\DC2\ETX&\EOTE\SUBg\n\
    \SettleInvoice settles an accepted invoice. If the invoice is already\n\
    \settled, this call will succeed.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\SOH\DC2\ETX&\b\NAK\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\STX\DC2\ETX&\ETB'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\ETX\DC2\ETX&2C\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT)\NUL,\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX)\b\CAN\n\
    \B\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX+\EOT\ESC\SUB5 Hash corresponding to the (hold) invoice to cancel.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX+\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX+\n\
    \\SYN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX+\EM\SUB\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT-\NUL.\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX-\b\EM\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT0\NULb\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX0\b\GS\n\
    \\252\SOH\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX7\EOT\DC4\SUB\238\SOH\n\
    \An optional memo to attach along with the invoice. Used for record keeping\n\
    \purposes for the invoice's creator, and will also be set in the description\n\
    \field of the encoded payment request if the description_hash field is not\n\
    \being used.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX7\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX7\v\SI\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX7\DC2\DC3\n\
    \'\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX:\EOT\DC3\SUB\SUB The hash of the preimage\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETX:\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX:\n\
    \\SO\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX:\DC1\DC2\n\
    \m\n\
    \\EOT\EOT\STX\STX\STX\DC2\ETXA\EOT\DC4\SUB`\n\
    \The value of this invoice in satoshis\n\
    \\n\
    \The fields value and value_msat are mutually exclusive.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ENQ\DC2\ETXA\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\ETXA\n\
    \\SI\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\ETXA\DC2\DC3\n\
    \r\n\
    \\EOT\EOT\STX\STX\ETX\DC2\ETXH\EOT\SUB\SUBe\n\
    \The value of this invoice in millisatoshis\n\
    \\n\
    \The fields value and value_msat are mutually exclusive.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ENQ\DC2\ETXH\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\SOH\DC2\ETXH\n\
    \\DC4\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ETX\DC2\ETXH\ETB\EM\n\
    \\194\SOH\n\
    \\EOT\EOT\STX\STX\EOT\DC2\ETXO\EOT\US\SUB\180\SOH\n\
    \Hash (SHA-256) of a description of the payment. Used if the description of\n\
    \payment (memo) is too long to naturally fit within the description field\n\
    \of an encoded payment request.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ENQ\DC2\ETXO\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\SOH\DC2\ETXO\n\
    \\SUB\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ETX\DC2\ETXO\GS\RS\n\
    \P\n\
    \\EOT\EOT\STX\STX\ENQ\DC2\ETXR\EOT\NAK\SUBC Payment request expiry time in seconds. Default is 3600 (1 hour).\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\ENQ\DC2\ETXR\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\SOH\DC2\ETXR\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\ETX\DC2\ETXR\DC3\DC4\n\
    \)\n\
    \\EOT\EOT\STX\STX\ACK\DC2\ETXU\EOT\GS\SUB\FS Fallback on-chain address.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\ENQ\DC2\ETXU\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\SOH\DC2\ETXU\v\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\ETX\DC2\ETXU\ESC\FS\n\
    \T\n\
    \\EOT\EOT\STX\STX\a\DC2\ETXX\EOT\ESC\SUBG Delta to use for the time-lock of the CLTV extended to the final hop.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\a\ENQ\DC2\ETXX\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\a\SOH\DC2\ETXX\v\SYN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\a\ETX\DC2\ETXX\EM\SUB\n\
    \n\n\
    \\EOT\EOT\STX\STX\b\DC2\ETX^\EOT-\SUBa\n\
    \Route hints that can each be individually used to assist in reaching the\n\
    \invoice's destination.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\b\EOT\DC2\ETX^\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\b\ACK\DC2\ETX^\r\FS\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\b\SOH\DC2\ETX^\GS(\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\b\ETX\DC2\ETX^+,\n\
    \V\n\
    \\EOT\EOT\STX\STX\t\DC2\ETXa\EOT\NAK\SUBI Whether this invoice should include routing hints for private channels.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\t\ENQ\DC2\ETXa\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\t\SOH\DC2\ETXa\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\t\ETX\DC2\ETXa\DC3\DC4\n\
    \\n\
    \\n\
    \\STX\EOT\ETX\DC2\EOTd\NULk\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETXd\b\SUB\n\
    \\188\SOH\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETXj\EOT\US\SUB\174\SOH\n\
    \A bare-bones invoice for a payment within the Lightning Network.  With the\n\
    \details of the invoice, the sender has all the data necessary to send a\n\
    \payment to the recipient.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\ETXj\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETXj\v\SUB\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETXj\GS\RS\n\
    \\n\
    \\n\
    \\STX\EOT\EOT\DC2\EOTm\NULq\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\EOT\SOH\DC2\ETXm\b\CAN\n\
    \_\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\ETXp\EOT\ETB\SUBR Externally discovered pre-image that should be used to settle the hold\n\
    \ invoice.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\ETXp\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\ETXp\n\
    \\DC2\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\ETXp\NAK\SYN\n\
    \\n\
    \\n\
    \\STX\EOT\ENQ\DC2\EOTs\NULt\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ENQ\SOH\DC2\ETXs\b\EM\n\
    \\n\
    \\n\
    \\STX\EOT\ACK\DC2\EOTv\NUL{\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ACK\SOH\DC2\ETXv\b%\n\
    \\n\
    \\n\
    \\ETX\EOT\ACK\t\DC2\ETXw\EOT\SI\n\
    \\v\n\
    \\EOT\EOT\ACK\t\NUL\DC2\ETXw\r\SO\n\
    \\f\n\
    \\ENQ\EOT\ACK\t\NUL\SOH\DC2\ETXw\r\SO\n\
    \\f\n\
    \\ENQ\EOT\ACK\t\NUL\STX\DC2\ETXw\r\SO\n\
    \H\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\ETXz\EOT\NAK\SUB; Hash corresponding to the (hold) invoice to subscribe to.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\ETXz\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\ETXz\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\ETXz\DC3\DC4b\ACKproto3"