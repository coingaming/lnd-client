{- This file was auto-generated from invoicesrpc/invoices.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Invoicesrpc.Invoices (
        Invoices(..), AddHoldInvoiceRequest(), AddHoldInvoiceResp(),
        CancelInvoiceMsg(), CancelInvoiceResp(), LookupInvoiceMsg(),
        LookupInvoiceMsg'InvoiceRef(..), _LookupInvoiceMsg'PaymentHash,
        _LookupInvoiceMsg'PaymentAddr, _LookupInvoiceMsg'SetId,
        LookupModifier(..), LookupModifier(),
        LookupModifier'UnrecognizedValue, SettleInvoiceMsg(),
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
import qualified Proto.Lnrpc.Ln0
import qualified Proto.Lnrpc.Ln1
{- | Fields :
     
         * 'Proto.Invoicesrpc.Invoices_Fields.memo' @:: Lens' AddHoldInvoiceRequest Data.Text.Text@
         * 'Proto.Invoicesrpc.Invoices_Fields.hash' @:: Lens' AddHoldInvoiceRequest Data.ByteString.ByteString@
         * 'Proto.Invoicesrpc.Invoices_Fields.value' @:: Lens' AddHoldInvoiceRequest Data.Int.Int64@
         * 'Proto.Invoicesrpc.Invoices_Fields.valueMsat' @:: Lens' AddHoldInvoiceRequest Data.Int.Int64@
         * 'Proto.Invoicesrpc.Invoices_Fields.descriptionHash' @:: Lens' AddHoldInvoiceRequest Data.ByteString.ByteString@
         * 'Proto.Invoicesrpc.Invoices_Fields.expiry' @:: Lens' AddHoldInvoiceRequest Data.Int.Int64@
         * 'Proto.Invoicesrpc.Invoices_Fields.fallbackAddr' @:: Lens' AddHoldInvoiceRequest Data.Text.Text@
         * 'Proto.Invoicesrpc.Invoices_Fields.cltvExpiry' @:: Lens' AddHoldInvoiceRequest Data.Word.Word64@
         * 'Proto.Invoicesrpc.Invoices_Fields.routeHints' @:: Lens' AddHoldInvoiceRequest [Proto.Lnrpc.Ln0.RouteHint]@
         * 'Proto.Invoicesrpc.Invoices_Fields.vec'routeHints' @:: Lens' AddHoldInvoiceRequest (Data.Vector.Vector Proto.Lnrpc.Ln0.RouteHint)@
         * 'Proto.Invoicesrpc.Invoices_Fields.private' @:: Lens' AddHoldInvoiceRequest Prelude.Bool@ -}
data AddHoldInvoiceRequest
  = AddHoldInvoiceRequest'_constructor {_AddHoldInvoiceRequest'memo :: !Data.Text.Text,
                                        _AddHoldInvoiceRequest'hash :: !Data.ByteString.ByteString,
                                        _AddHoldInvoiceRequest'value :: !Data.Int.Int64,
                                        _AddHoldInvoiceRequest'valueMsat :: !Data.Int.Int64,
                                        _AddHoldInvoiceRequest'descriptionHash :: !Data.ByteString.ByteString,
                                        _AddHoldInvoiceRequest'expiry :: !Data.Int.Int64,
                                        _AddHoldInvoiceRequest'fallbackAddr :: !Data.Text.Text,
                                        _AddHoldInvoiceRequest'cltvExpiry :: !Data.Word.Word64,
                                        _AddHoldInvoiceRequest'routeHints :: !(Data.Vector.Vector Proto.Lnrpc.Ln0.RouteHint),
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
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "routeHints" [Proto.Lnrpc.Ln0.RouteHint] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceRequest'routeHints
           (\ x__ y__ -> x__ {_AddHoldInvoiceRequest'routeHints = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField AddHoldInvoiceRequest "vec'routeHints" (Data.Vector.Vector Proto.Lnrpc.Ln0.RouteHint) where
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
                 Data.ProtoLens.FieldTypeDescriptor Proto.Lnrpc.Ln0.RouteHint)
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
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.Lnrpc.Ln0.RouteHint
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'routeHints") frozen'routeHints
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
                         Data.Text.Encoding.encodeUtf8 _v))
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
                                        Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
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
                                           Data.Text.Encoding.encodeUtf8 _v))
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
                                                   Data.ProtoLens.encodeMessage _v))
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
                                                    (\ b -> if b then 1 else 0) _v))
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
     
         * 'Proto.Invoicesrpc.Invoices_Fields.paymentRequest' @:: Lens' AddHoldInvoiceResp Data.Text.Text@
         * 'Proto.Invoicesrpc.Invoices_Fields.addIndex' @:: Lens' AddHoldInvoiceResp Data.Word.Word64@
         * 'Proto.Invoicesrpc.Invoices_Fields.paymentAddr' @:: Lens' AddHoldInvoiceResp Data.ByteString.ByteString@ -}
data AddHoldInvoiceResp
  = AddHoldInvoiceResp'_constructor {_AddHoldInvoiceResp'paymentRequest :: !Data.Text.Text,
                                     _AddHoldInvoiceResp'addIndex :: !Data.Word.Word64,
                                     _AddHoldInvoiceResp'paymentAddr :: !Data.ByteString.ByteString,
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
instance Data.ProtoLens.Field.HasField AddHoldInvoiceResp "addIndex" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceResp'addIndex
           (\ x__ y__ -> x__ {_AddHoldInvoiceResp'addIndex = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddHoldInvoiceResp "paymentAddr" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddHoldInvoiceResp'paymentAddr
           (\ x__ y__ -> x__ {_AddHoldInvoiceResp'paymentAddr = y__}))
        Prelude.id
instance Data.ProtoLens.Message AddHoldInvoiceResp where
  messageName _ = Data.Text.pack "invoicesrpc.AddHoldInvoiceResp"
  packedMessageDescriptor _
    = "\n\
      \\DC2AddHoldInvoiceResp\DC2'\n\
      \\SIpayment_request\CAN\SOH \SOH(\tR\SOpaymentRequest\DC2\ESC\n\
      \\tadd_index\CAN\STX \SOH(\EOTR\baddIndex\DC2!\n\
      \\fpayment_addr\CAN\ETX \SOH(\fR\vpaymentAddr"
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
        addIndex__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "add_index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"addIndex")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceResp
        paymentAddr__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_addr"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentAddr")) ::
              Data.ProtoLens.FieldDescriptor AddHoldInvoiceResp
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, paymentRequest__field_descriptor),
           (Data.ProtoLens.Tag 2, addIndex__field_descriptor),
           (Data.ProtoLens.Tag 3, paymentAddr__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AddHoldInvoiceResp'_unknownFields
        (\ x__ y__ -> x__ {_AddHoldInvoiceResp'_unknownFields = y__})
  defMessage
    = AddHoldInvoiceResp'_constructor
        {_AddHoldInvoiceResp'paymentRequest = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceResp'addIndex = Data.ProtoLens.fieldDefault,
         _AddHoldInvoiceResp'paymentAddr = Data.ProtoLens.fieldDefault,
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
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "add_index"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"addIndex") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "payment_addr"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"paymentAddr") y x)
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
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"addIndex") _x
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
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"paymentAddr") _x
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
instance Control.DeepSeq.NFData AddHoldInvoiceResp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AddHoldInvoiceResp'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_AddHoldInvoiceResp'paymentRequest x__)
                (Control.DeepSeq.deepseq
                   (_AddHoldInvoiceResp'addIndex x__)
                   (Control.DeepSeq.deepseq
                      (_AddHoldInvoiceResp'paymentAddr x__) ())))
{- | Fields :
     
         * 'Proto.Invoicesrpc.Invoices_Fields.paymentHash' @:: Lens' CancelInvoiceMsg Data.ByteString.ByteString@ -}
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
     
         * 'Proto.Invoicesrpc.Invoices_Fields.lookupModifier' @:: Lens' LookupInvoiceMsg LookupModifier@
         * 'Proto.Invoicesrpc.Invoices_Fields.maybe'invoiceRef' @:: Lens' LookupInvoiceMsg (Prelude.Maybe LookupInvoiceMsg'InvoiceRef)@
         * 'Proto.Invoicesrpc.Invoices_Fields.maybe'paymentHash' @:: Lens' LookupInvoiceMsg (Prelude.Maybe Data.ByteString.ByteString)@
         * 'Proto.Invoicesrpc.Invoices_Fields.paymentHash' @:: Lens' LookupInvoiceMsg Data.ByteString.ByteString@
         * 'Proto.Invoicesrpc.Invoices_Fields.maybe'paymentAddr' @:: Lens' LookupInvoiceMsg (Prelude.Maybe Data.ByteString.ByteString)@
         * 'Proto.Invoicesrpc.Invoices_Fields.paymentAddr' @:: Lens' LookupInvoiceMsg Data.ByteString.ByteString@
         * 'Proto.Invoicesrpc.Invoices_Fields.maybe'setId' @:: Lens' LookupInvoiceMsg (Prelude.Maybe Data.ByteString.ByteString)@
         * 'Proto.Invoicesrpc.Invoices_Fields.setId' @:: Lens' LookupInvoiceMsg Data.ByteString.ByteString@ -}
data LookupInvoiceMsg
  = LookupInvoiceMsg'_constructor {_LookupInvoiceMsg'lookupModifier :: !LookupModifier,
                                   _LookupInvoiceMsg'invoiceRef :: !(Prelude.Maybe LookupInvoiceMsg'InvoiceRef),
                                   _LookupInvoiceMsg'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show LookupInvoiceMsg where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out LookupInvoiceMsg
data LookupInvoiceMsg'InvoiceRef
  = LookupInvoiceMsg'PaymentHash !Data.ByteString.ByteString |
    LookupInvoiceMsg'PaymentAddr !Data.ByteString.ByteString |
    LookupInvoiceMsg'SetId !Data.ByteString.ByteString
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out LookupInvoiceMsg'InvoiceRef
instance Data.ProtoLens.Field.HasField LookupInvoiceMsg "lookupModifier" LookupModifier where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LookupInvoiceMsg'lookupModifier
           (\ x__ y__ -> x__ {_LookupInvoiceMsg'lookupModifier = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LookupInvoiceMsg "maybe'invoiceRef" (Prelude.Maybe LookupInvoiceMsg'InvoiceRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LookupInvoiceMsg'invoiceRef
           (\ x__ y__ -> x__ {_LookupInvoiceMsg'invoiceRef = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LookupInvoiceMsg "maybe'paymentHash" (Prelude.Maybe Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LookupInvoiceMsg'invoiceRef
           (\ x__ y__ -> x__ {_LookupInvoiceMsg'invoiceRef = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (LookupInvoiceMsg'PaymentHash x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap LookupInvoiceMsg'PaymentHash y__))
instance Data.ProtoLens.Field.HasField LookupInvoiceMsg "paymentHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LookupInvoiceMsg'invoiceRef
           (\ x__ y__ -> x__ {_LookupInvoiceMsg'invoiceRef = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (LookupInvoiceMsg'PaymentHash x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap LookupInvoiceMsg'PaymentHash y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField LookupInvoiceMsg "maybe'paymentAddr" (Prelude.Maybe Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LookupInvoiceMsg'invoiceRef
           (\ x__ y__ -> x__ {_LookupInvoiceMsg'invoiceRef = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (LookupInvoiceMsg'PaymentAddr x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap LookupInvoiceMsg'PaymentAddr y__))
instance Data.ProtoLens.Field.HasField LookupInvoiceMsg "paymentAddr" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LookupInvoiceMsg'invoiceRef
           (\ x__ y__ -> x__ {_LookupInvoiceMsg'invoiceRef = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (LookupInvoiceMsg'PaymentAddr x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap LookupInvoiceMsg'PaymentAddr y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField LookupInvoiceMsg "maybe'setId" (Prelude.Maybe Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LookupInvoiceMsg'invoiceRef
           (\ x__ y__ -> x__ {_LookupInvoiceMsg'invoiceRef = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (LookupInvoiceMsg'SetId x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap LookupInvoiceMsg'SetId y__))
instance Data.ProtoLens.Field.HasField LookupInvoiceMsg "setId" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LookupInvoiceMsg'invoiceRef
           (\ x__ y__ -> x__ {_LookupInvoiceMsg'invoiceRef = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (LookupInvoiceMsg'SetId x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap LookupInvoiceMsg'SetId y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Message LookupInvoiceMsg where
  messageName _ = Data.Text.pack "invoicesrpc.LookupInvoiceMsg"
  packedMessageDescriptor _
    = "\n\
      \\DLELookupInvoiceMsg\DC2#\n\
      \\fpayment_hash\CAN\SOH \SOH(\fH\NULR\vpaymentHash\DC2#\n\
      \\fpayment_addr\CAN\STX \SOH(\fH\NULR\vpaymentAddr\DC2\ETB\n\
      \\ACKset_id\CAN\ETX \SOH(\fH\NULR\ENQsetId\DC2D\n\
      \\SIlookup_modifier\CAN\EOT \SOH(\SO2\ESC.invoicesrpc.LookupModifierR\SOlookupModifierB\r\n\
      \\vinvoice_ref"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        lookupModifier__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "lookup_modifier"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor LookupModifier)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"lookupModifier")) ::
              Data.ProtoLens.FieldDescriptor LookupInvoiceMsg
        paymentHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'paymentHash")) ::
              Data.ProtoLens.FieldDescriptor LookupInvoiceMsg
        paymentAddr__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_addr"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'paymentAddr")) ::
              Data.ProtoLens.FieldDescriptor LookupInvoiceMsg
        setId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "set_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'setId")) ::
              Data.ProtoLens.FieldDescriptor LookupInvoiceMsg
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 4, lookupModifier__field_descriptor),
           (Data.ProtoLens.Tag 1, paymentHash__field_descriptor),
           (Data.ProtoLens.Tag 2, paymentAddr__field_descriptor),
           (Data.ProtoLens.Tag 3, setId__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _LookupInvoiceMsg'_unknownFields
        (\ x__ y__ -> x__ {_LookupInvoiceMsg'_unknownFields = y__})
  defMessage
    = LookupInvoiceMsg'_constructor
        {_LookupInvoiceMsg'lookupModifier = Data.ProtoLens.fieldDefault,
         _LookupInvoiceMsg'invoiceRef = Prelude.Nothing,
         _LookupInvoiceMsg'_unknownFields = []}
  parseMessage
    = let
        loop ::
          LookupInvoiceMsg
          -> Data.ProtoLens.Encoding.Bytes.Parser LookupInvoiceMsg
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
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "lookup_modifier"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"lookupModifier") y x)
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
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "payment_addr"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"paymentAddr") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "set_id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"setId") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "LookupInvoiceMsg"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"lookupModifier") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'invoiceRef") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just (LookupInvoiceMsg'PaymentHash v))
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                          ((\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             v)
                   (Prelude.Just (LookupInvoiceMsg'PaymentAddr v))
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             v)
                   (Prelude.Just (LookupInvoiceMsg'SetId v))
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                          ((\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData LookupInvoiceMsg where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_LookupInvoiceMsg'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_LookupInvoiceMsg'lookupModifier x__)
                (Control.DeepSeq.deepseq (_LookupInvoiceMsg'invoiceRef x__) ()))
instance Control.DeepSeq.NFData LookupInvoiceMsg'InvoiceRef where
  rnf (LookupInvoiceMsg'PaymentHash x__) = Control.DeepSeq.rnf x__
  rnf (LookupInvoiceMsg'PaymentAddr x__) = Control.DeepSeq.rnf x__
  rnf (LookupInvoiceMsg'SetId x__) = Control.DeepSeq.rnf x__
_LookupInvoiceMsg'PaymentHash ::
  Data.ProtoLens.Prism.Prism' LookupInvoiceMsg'InvoiceRef Data.ByteString.ByteString
_LookupInvoiceMsg'PaymentHash
  = Data.ProtoLens.Prism.prism'
      LookupInvoiceMsg'PaymentHash
      (\ p__
         -> case p__ of
              (LookupInvoiceMsg'PaymentHash p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_LookupInvoiceMsg'PaymentAddr ::
  Data.ProtoLens.Prism.Prism' LookupInvoiceMsg'InvoiceRef Data.ByteString.ByteString
_LookupInvoiceMsg'PaymentAddr
  = Data.ProtoLens.Prism.prism'
      LookupInvoiceMsg'PaymentAddr
      (\ p__
         -> case p__ of
              (LookupInvoiceMsg'PaymentAddr p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_LookupInvoiceMsg'SetId ::
  Data.ProtoLens.Prism.Prism' LookupInvoiceMsg'InvoiceRef Data.ByteString.ByteString
_LookupInvoiceMsg'SetId
  = Data.ProtoLens.Prism.prism'
      LookupInvoiceMsg'SetId
      (\ p__
         -> case p__ of
              (LookupInvoiceMsg'SetId p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
newtype LookupModifier'UnrecognizedValue
  = LookupModifier'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq,
                  Prelude.Ord,
                  Prelude.Show,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out LookupModifier'UnrecognizedValue
data LookupModifier
  = DEFAULT |
    HTLC_SET_ONLY |
    HTLC_SET_BLANK |
    LookupModifier'Unrecognized !LookupModifier'UnrecognizedValue
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Data.ProtoLens.MessageEnum LookupModifier where
  maybeToEnum 0 = Prelude.Just DEFAULT
  maybeToEnum 1 = Prelude.Just HTLC_SET_ONLY
  maybeToEnum 2 = Prelude.Just HTLC_SET_BLANK
  maybeToEnum k
    = Prelude.Just
        (LookupModifier'Unrecognized
           (LookupModifier'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum DEFAULT = "DEFAULT"
  showEnum HTLC_SET_ONLY = "HTLC_SET_ONLY"
  showEnum HTLC_SET_BLANK = "HTLC_SET_BLANK"
  showEnum
    (LookupModifier'Unrecognized (LookupModifier'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "DEFAULT" = Prelude.Just DEFAULT
    | (Prelude.==) k "HTLC_SET_ONLY" = Prelude.Just HTLC_SET_ONLY
    | (Prelude.==) k "HTLC_SET_BLANK" = Prelude.Just HTLC_SET_BLANK
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded LookupModifier where
  minBound = DEFAULT
  maxBound = HTLC_SET_BLANK
instance Prelude.Enum LookupModifier where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum LookupModifier: "
              (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum DEFAULT = 0
  fromEnum HTLC_SET_ONLY = 1
  fromEnum HTLC_SET_BLANK = 2
  fromEnum
    (LookupModifier'Unrecognized (LookupModifier'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ HTLC_SET_BLANK
    = Prelude.error
        "LookupModifier.succ: bad argument HTLC_SET_BLANK. This value would be out of bounds."
  succ DEFAULT = HTLC_SET_ONLY
  succ HTLC_SET_ONLY = HTLC_SET_BLANK
  succ (LookupModifier'Unrecognized _)
    = Prelude.error
        "LookupModifier.succ: bad argument: unrecognized value"
  pred DEFAULT
    = Prelude.error
        "LookupModifier.pred: bad argument DEFAULT. This value would be out of bounds."
  pred HTLC_SET_ONLY = DEFAULT
  pred HTLC_SET_BLANK = HTLC_SET_ONLY
  pred (LookupModifier'Unrecognized _)
    = Prelude.error
        "LookupModifier.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault LookupModifier where
  fieldDefault = DEFAULT
instance Control.DeepSeq.NFData LookupModifier where
  rnf x__ = Prelude.seq x__ ()
instance Text.PrettyPrint.GenericPretty.Out LookupModifier
{- | Fields :
     
         * 'Proto.Invoicesrpc.Invoices_Fields.preimage' @:: Lens' SettleInvoiceMsg Data.ByteString.ByteString@ -}
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
     
         * 'Proto.Invoicesrpc.Invoices_Fields.rHash' @:: Lens' SubscribeSingleInvoiceRequest Data.ByteString.ByteString@ -}
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
                                   "lookupInvoiceV2",
                                   "settleInvoice",
                                   "subscribeSingleInvoice"]
  packedServiceDescriptor _
    = "\n\
      \\bInvoices\DC2V\n\
      \\SYNSubscribeSingleInvoice\DC2*.invoicesrpc.SubscribeSingleInvoiceRequest\SUB\SO.lnrpc.Invoice0\SOH\DC2N\n\
      \\rCancelInvoice\DC2\GS.invoicesrpc.CancelInvoiceMsg\SUB\RS.invoicesrpc.CancelInvoiceResp\DC2U\n\
      \\SOAddHoldInvoice\DC2\".invoicesrpc.AddHoldInvoiceRequest\SUB\US.invoicesrpc.AddHoldInvoiceResp\DC2N\n\
      \\rSettleInvoice\DC2\GS.invoicesrpc.SettleInvoiceMsg\SUB\RS.invoicesrpc.SettleInvoiceResp\DC2@\n\
      \\SILookupInvoiceV2\DC2\GS.invoicesrpc.LookupInvoiceMsg\SUB\SO.lnrpc.Invoice"
instance Data.ProtoLens.Service.Types.HasMethodImpl Invoices "subscribeSingleInvoice" where
  type MethodName Invoices "subscribeSingleInvoice" = "SubscribeSingleInvoice"
  type MethodInput Invoices "subscribeSingleInvoice" = SubscribeSingleInvoiceRequest
  type MethodOutput Invoices "subscribeSingleInvoice" = Proto.Lnrpc.Ln1.Invoice
  type MethodStreamingType Invoices "subscribeSingleInvoice" = 'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Invoices "cancelInvoice" where
  type MethodName Invoices "cancelInvoice" = "CancelInvoice"
  type MethodInput Invoices "cancelInvoice" = CancelInvoiceMsg
  type MethodOutput Invoices "cancelInvoice" = CancelInvoiceResp
  type MethodStreamingType Invoices "cancelInvoice" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Invoices "addHoldInvoice" where
  type MethodName Invoices "addHoldInvoice" = "AddHoldInvoice"
  type MethodInput Invoices "addHoldInvoice" = AddHoldInvoiceRequest
  type MethodOutput Invoices "addHoldInvoice" = AddHoldInvoiceResp
  type MethodStreamingType Invoices "addHoldInvoice" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Invoices "settleInvoice" where
  type MethodName Invoices "settleInvoice" = "SettleInvoice"
  type MethodInput Invoices "settleInvoice" = SettleInvoiceMsg
  type MethodOutput Invoices "settleInvoice" = SettleInvoiceResp
  type MethodStreamingType Invoices "settleInvoice" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Invoices "lookupInvoiceV2" where
  type MethodName Invoices "lookupInvoiceV2" = "LookupInvoiceV2"
  type MethodInput Invoices "lookupInvoiceV2" = LookupInvoiceMsg
  type MethodOutput Invoices "lookupInvoiceV2" = Proto.Lnrpc.Ln1.Invoice
  type MethodStreamingType Invoices "lookupInvoiceV2" = 'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SUBinvoicesrpc/invoices.proto\DC2\vinvoicesrpc\SUB\SIlnrpc/ln0.proto\SUB\SIlnrpc/ln1.proto\"5\n\
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
    \\aprivate\CAN\t \SOH(\bR\aprivate\"}\n\
    \\DC2AddHoldInvoiceResp\DC2'\n\
    \\SIpayment_request\CAN\SOH \SOH(\tR\SOpaymentRequest\DC2\ESC\n\
    \\tadd_index\CAN\STX \SOH(\EOTR\baddIndex\DC2!\n\
    \\fpayment_addr\CAN\ETX \SOH(\fR\vpaymentAddr\".\n\
    \\DLESettleInvoiceMsg\DC2\SUB\n\
    \\bpreimage\CAN\SOH \SOH(\fR\bpreimage\"\DC3\n\
    \\DC1SettleInvoiceResp\"<\n\
    \\GSSubscribeSingleInvoiceRequest\DC2\NAK\n\
    \\ACKr_hash\CAN\STX \SOH(\fR\ENQrHashJ\EOT\b\SOH\DLE\STX\"\202\SOH\n\
    \\DLELookupInvoiceMsg\DC2#\n\
    \\fpayment_hash\CAN\SOH \SOH(\fH\NULR\vpaymentHash\DC2#\n\
    \\fpayment_addr\CAN\STX \SOH(\fH\NULR\vpaymentAddr\DC2\ETB\n\
    \\ACKset_id\CAN\ETX \SOH(\fH\NULR\ENQsetId\DC2D\n\
    \\SIlookup_modifier\CAN\EOT \SOH(\SO2\ESC.invoicesrpc.LookupModifierR\SOlookupModifierB\r\n\
    \\vinvoice_ref*D\n\
    \\SOLookupModifier\DC2\v\n\
    \\aDEFAULT\DLE\NUL\DC2\DC1\n\
    \\rHTLC_SET_ONLY\DLE\SOH\DC2\DC2\n\
    \\SO\&HTLC_SET_BLANK\DLE\STX2\155\ETX\n\
    \\bInvoices\DC2V\n\
    \\SYNSubscribeSingleInvoice\DC2*.invoicesrpc.SubscribeSingleInvoiceRequest\SUB\SO.lnrpc.Invoice0\SOH\DC2N\n\
    \\rCancelInvoice\DC2\GS.invoicesrpc.CancelInvoiceMsg\SUB\RS.invoicesrpc.CancelInvoiceResp\DC2U\n\
    \\SOAddHoldInvoice\DC2\".invoicesrpc.AddHoldInvoiceRequest\SUB\US.invoicesrpc.AddHoldInvoiceResp\DC2N\n\
    \\rSettleInvoice\DC2\GS.invoicesrpc.SettleInvoiceMsg\SUB\RS.invoicesrpc.SettleInvoiceResp\DC2@\n\
    \\SILookupInvoiceV2\DC2\GS.invoicesrpc.LookupInvoiceMsg\SUB\SO.lnrpc.InvoiceB3Z1github.com/lightningnetwork/lnd/lnrpc/invoicesrpcJ\193'\n\
    \\a\DC2\ENQ\NUL\NUL\172\SOH\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\STX\NUL\EM\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX\ETX\NUL\EM\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ENQ\NUL\DC4\n\
    \\b\n\
    \\SOH\b\DC2\ETX\a\NULH\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\a\NULH\n\
    \d\n\
    \\STX\ACK\NUL\DC2\EOT\v\NUL,\SOH\SUBX Invoices is a service that can be used to create, accept, settle and cancel\n\
    \ invoices.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\v\b\DLE\n\
    \\215\SOH\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\EOT\DC1\EOT\DC2'\SUB\200\SOH\n\
    \SubscribeSingleInvoice returns a uni-directional stream (server -> client)\n\
    \to notify the client of state transitions of the specified invoice.\n\
    \Initially the current invoice state is always sent out.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\DC1\b\RS\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\DC1 =\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ACK\DC2\ETX\DC2\DC1\ETB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\DC2\CAN%\n\
    \\172\SOH\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX\EM\EOTE\SUB\158\SOH\n\
    \CancelInvoice cancels a currently open invoice. If the invoice is already\n\
    \canceled, this call will succeed. If the invoice is already settled, it will\n\
    \fail.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX\EM\b\NAK\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX\EM\ETB'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX\EM2C\n\
    \n\n\
    \\EOT\ACK\NUL\STX\STX\DC2\ETX\US\EOTL\SUBa\n\
    \AddHoldInvoice creates a hold invoice. It ties the invoice to the hash\n\
    \supplied in the request.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\SOH\DC2\ETX\US\b\SYN\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\STX\DC2\ETX\US\CAN-\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ETX\DC2\ETX\US8J\n\
    \t\n\
    \\EOT\ACK\NUL\STX\ETX\DC2\ETX%\EOTE\SUBg\n\
    \SettleInvoice settles an accepted invoice. If the invoice is already\n\
    \settled, this call will succeed.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\SOH\DC2\ETX%\b\NAK\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\STX\DC2\ETX%\ETB'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\ETX\DC2\ETX%2C\n\
    \\150\SOH\n\
    \\EOT\ACK\NUL\STX\EOT\DC2\ETX+\EOTC\SUB\136\SOH\n\
    \LookupInvoiceV2 attempts to look up at invoice. An invoice can be refrenced\n\
    \using either its payment hash, payment address, or set ID.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\SOH\DC2\ETX+\b\ETB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\STX\DC2\ETX+\EM)\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\ETX\DC2\ETX+4A\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT.\NUL1\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX.\b\CAN\n\
    \B\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX0\EOT\ESC\SUB5 Hash corresponding to the (hold) invoice to cancel.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX0\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX0\n\
    \\SYN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX0\EM\SUB\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT2\NUL3\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX2\b\EM\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT5\NULg\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX5\b\GS\n\
    \\252\SOH\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX<\EOT\DC4\SUB\238\SOH\n\
    \An optional memo to attach along with the invoice. Used for record keeping\n\
    \purposes for the invoice's creator, and will also be set in the description\n\
    \field of the encoded payment request if the description_hash field is not\n\
    \being used.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX<\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX<\v\SI\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX<\DC2\DC3\n\
    \'\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX?\EOT\DC3\SUB\SUB The hash of the preimage\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETX?\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX?\n\
    \\SO\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX?\DC1\DC2\n\
    \m\n\
    \\EOT\EOT\STX\STX\STX\DC2\ETXF\EOT\DC4\SUB`\n\
    \The value of this invoice in satoshis\n\
    \\n\
    \The fields value and value_msat are mutually exclusive.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ENQ\DC2\ETXF\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\ETXF\n\
    \\SI\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\ETXF\DC2\DC3\n\
    \r\n\
    \\EOT\EOT\STX\STX\ETX\DC2\ETXM\EOT\SUB\SUBe\n\
    \The value of this invoice in millisatoshis\n\
    \\n\
    \The fields value and value_msat are mutually exclusive.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ENQ\DC2\ETXM\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\SOH\DC2\ETXM\n\
    \\DC4\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ETX\DC2\ETXM\ETB\EM\n\
    \\194\SOH\n\
    \\EOT\EOT\STX\STX\EOT\DC2\ETXT\EOT\US\SUB\180\SOH\n\
    \Hash (SHA-256) of a description of the payment. Used if the description of\n\
    \payment (memo) is too long to naturally fit within the description field\n\
    \of an encoded payment request.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ENQ\DC2\ETXT\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\SOH\DC2\ETXT\n\
    \\SUB\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ETX\DC2\ETXT\GS\RS\n\
    \P\n\
    \\EOT\EOT\STX\STX\ENQ\DC2\ETXW\EOT\NAK\SUBC Payment request expiry time in seconds. Default is 3600 (1 hour).\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\ENQ\DC2\ETXW\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\SOH\DC2\ETXW\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\ETX\DC2\ETXW\DC3\DC4\n\
    \)\n\
    \\EOT\EOT\STX\STX\ACK\DC2\ETXZ\EOT\GS\SUB\FS Fallback on-chain address.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\ENQ\DC2\ETXZ\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\SOH\DC2\ETXZ\v\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\ETX\DC2\ETXZ\ESC\FS\n\
    \T\n\
    \\EOT\EOT\STX\STX\a\DC2\ETX]\EOT\ESC\SUBG Delta to use for the time-lock of the CLTV extended to the final hop.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\a\ENQ\DC2\ETX]\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\a\SOH\DC2\ETX]\v\SYN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\a\ETX\DC2\ETX]\EM\SUB\n\
    \n\n\
    \\EOT\EOT\STX\STX\b\DC2\ETXc\EOT-\SUBa\n\
    \Route hints that can each be individually used to assist in reaching the\n\
    \invoice's destination.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\b\EOT\DC2\ETXc\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\b\ACK\DC2\ETXc\r\FS\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\b\SOH\DC2\ETXc\GS(\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\b\ETX\DC2\ETXc+,\n\
    \V\n\
    \\EOT\EOT\STX\STX\t\DC2\ETXf\EOT\NAK\SUBI Whether this invoice should include routing hints for private channels.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\t\ENQ\DC2\ETXf\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\t\SOH\DC2\ETXf\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\t\ETX\DC2\ETXf\DC3\DC4\n\
    \\n\
    \\n\
    \\STX\EOT\ETX\DC2\EOTi\NUL\DEL\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETXi\b\SUB\n\
    \\187\SOH\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETXo\EOT\US\SUB\173\SOH\n\
    \A bare-bones invoice for a payment within the Lightning Network. With the\n\
    \details of the invoice, the sender has all the data necessary to send a\n\
    \payment to the recipient.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\ETXo\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETXo\v\SUB\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETXo\GS\RS\n\
    \\149\STX\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\ETXw\EOT\EM\SUB\135\STX\n\
    \The \"add\" index of this invoice. Each newly created invoice will increment\n\
    \this index making it monotonically increasing. Callers to the\n\
    \SubscribeInvoices call can use this to instantly get notified of all added\n\
    \invoices with an add_index greater than this one.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ENQ\DC2\ETXw\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\ETXw\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\ETXw\ETB\CAN\n\
    \\162\SOH\n\
    \\EOT\EOT\ETX\STX\STX\DC2\ETX~\EOT\ESC\SUB\148\SOH\n\
    \The payment address of the generated invoice. This value should be used\n\
    \in all payments for this invoice as we require it for end to end\n\
    \security.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\ENQ\DC2\ETX~\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\SOH\DC2\ETX~\n\
    \\SYN\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\ETX\DC2\ETX~\EM\SUB\n\
    \\f\n\
    \\STX\EOT\EOT\DC2\ACK\129\SOH\NUL\133\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\EOT\SOH\DC2\EOT\129\SOH\b\CAN\n\
    \`\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\EOT\132\SOH\EOT\ETB\SUBR Externally discovered pre-image that should be used to settle the hold\n\
    \ invoice.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\EOT\132\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\EOT\132\SOH\n\
    \\DC2\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\EOT\132\SOH\NAK\SYN\n\
    \\f\n\
    \\STX\EOT\ENQ\DC2\ACK\135\SOH\NUL\136\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ENQ\SOH\DC2\EOT\135\SOH\b\EM\n\
    \\f\n\
    \\STX\EOT\ACK\DC2\ACK\138\SOH\NUL\143\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ACK\SOH\DC2\EOT\138\SOH\b%\n\
    \\v\n\
    \\ETX\EOT\ACK\t\DC2\EOT\139\SOH\EOT\SI\n\
    \\f\n\
    \\EOT\EOT\ACK\t\NUL\DC2\EOT\139\SOH\r\SO\n\
    \\r\n\
    \\ENQ\EOT\ACK\t\NUL\SOH\DC2\EOT\139\SOH\r\SO\n\
    \\r\n\
    \\ENQ\EOT\ACK\t\NUL\STX\DC2\EOT\139\SOH\r\SO\n\
    \I\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\EOT\142\SOH\EOT\NAK\SUB; Hash corresponding to the (hold) invoice to subscribe to.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\EOT\142\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\EOT\142\SOH\n\
    \\DLE\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\EOT\142\SOH\DC3\DC4\n\
    \\f\n\
    \\STX\ENQ\NUL\DC2\ACK\145\SOH\NUL\162\SOH\SOH\n\
    \\v\n\
    \\ETX\ENQ\NUL\SOH\DC2\EOT\145\SOH\ENQ\DC3\n\
    \M\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\EOT\147\SOH\EOT\DLE\SUB? The default look up modifier, no look up behavior is changed.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\EOT\147\SOH\EOT\v\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\EOT\147\SOH\SO\SI\n\
    \\144\SOH\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\EOT\153\SOH\EOT\SYN\SUB\129\SOH\n\
    \Indicates that when a look up is done based on a set_id, then only that set\n\
    \of HTLCs related to that set ID should be returned.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\EOT\153\SOH\EOT\DC1\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\EOT\153\SOH\DC4\NAK\n\
    \\170\STX\n\
    \\EOT\ENQ\NUL\STX\STX\DC2\EOT\161\SOH\EOT\ETB\SUB\155\STX\n\
    \Indicates that when a look up is done using a payment_addr, then no HTLCs\n\
    \related to the payment_addr should be returned. This is useful when one\n\
    \wants to be able to obtain the set of associated setIDs with a given\n\
    \invoice, then look up the sub-invoices \"projected\" by that set ID.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\SOH\DC2\EOT\161\SOH\EOT\DC2\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\STX\DC2\EOT\161\SOH\NAK\SYN\n\
    \\f\n\
    \\STX\EOT\a\DC2\ACK\164\SOH\NUL\172\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\a\SOH\DC2\EOT\164\SOH\b\CAN\n\
    \\SO\n\
    \\EOT\EOT\a\b\NUL\DC2\ACK\165\SOH\EOT\169\SOH\ENQ\n\
    \\r\n\
    \\ENQ\EOT\a\b\NUL\SOH\DC2\EOT\165\SOH\n\
    \\NAK\n\
    \\f\n\
    \\EOT\EOT\a\STX\NUL\DC2\EOT\166\SOH\b\US\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ENQ\DC2\EOT\166\SOH\b\r\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\EOT\166\SOH\SO\SUB\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\EOT\166\SOH\GS\RS\n\
    \\f\n\
    \\EOT\EOT\a\STX\SOH\DC2\EOT\167\SOH\b\US\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ENQ\DC2\EOT\167\SOH\b\r\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\SOH\DC2\EOT\167\SOH\SO\SUB\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ETX\DC2\EOT\167\SOH\GS\RS\n\
    \\f\n\
    \\EOT\EOT\a\STX\STX\DC2\EOT\168\SOH\b\EM\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ENQ\DC2\EOT\168\SOH\b\r\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\SOH\DC2\EOT\168\SOH\SO\DC4\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ETX\DC2\EOT\168\SOH\ETB\CAN\n\
    \\f\n\
    \\EOT\EOT\a\STX\ETX\DC2\EOT\171\SOH\EOT'\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ETX\ACK\DC2\EOT\171\SOH\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ETX\SOH\DC2\EOT\171\SOH\DC3\"\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ETX\ETX\DC2\EOT\171\SOH%&b\ACKproto3"