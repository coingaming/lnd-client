{- This file was auto-generated from autopilotrpc/autopilot.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Autopilotrpc.Autopilot (
        Autopilot(..), ModifyStatusRequest(), ModifyStatusResponse(),
        QueryScoresRequest(), QueryScoresResponse(),
        QueryScoresResponse'HeuristicResult(),
        QueryScoresResponse'HeuristicResult'ScoresEntry(),
        SetScoresRequest(), SetScoresRequest'ScoresEntry(),
        SetScoresResponse(), StatusRequest(), StatusResponse()
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
{- | Fields :
     
         * 'Proto.Autopilotrpc.Autopilot_Fields.enable' @:: Lens' ModifyStatusRequest Prelude.Bool@ -}
data ModifyStatusRequest
  = ModifyStatusRequest'_constructor {_ModifyStatusRequest'enable :: !Prelude.Bool,
                                      _ModifyStatusRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ModifyStatusRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ModifyStatusRequest
instance Data.ProtoLens.Field.HasField ModifyStatusRequest "enable" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ModifyStatusRequest'enable
           (\ x__ y__ -> x__ {_ModifyStatusRequest'enable = y__}))
        Prelude.id
instance Data.ProtoLens.Message ModifyStatusRequest where
  messageName _ = Data.Text.pack "autopilotrpc.ModifyStatusRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC3ModifyStatusRequest\DC2\SYN\n\
      \\ACKenable\CAN\SOH \SOH(\bR\ACKenable"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        enable__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enable"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"enable")) ::
              Data.ProtoLens.FieldDescriptor ModifyStatusRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, enable__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ModifyStatusRequest'_unknownFields
        (\ x__ y__ -> x__ {_ModifyStatusRequest'_unknownFields = y__})
  defMessage
    = ModifyStatusRequest'_constructor
        {_ModifyStatusRequest'enable = Data.ProtoLens.fieldDefault,
         _ModifyStatusRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ModifyStatusRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ModifyStatusRequest
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
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "enable"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"enable") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ModifyStatusRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"enable") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ModifyStatusRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ModifyStatusRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ModifyStatusRequest'enable x__) ())
{- | Fields :
      -}
data ModifyStatusResponse
  = ModifyStatusResponse'_constructor {_ModifyStatusResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ModifyStatusResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ModifyStatusResponse
instance Data.ProtoLens.Message ModifyStatusResponse where
  messageName _ = Data.Text.pack "autopilotrpc.ModifyStatusResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC4ModifyStatusResponse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ModifyStatusResponse'_unknownFields
        (\ x__ y__ -> x__ {_ModifyStatusResponse'_unknownFields = y__})
  defMessage
    = ModifyStatusResponse'_constructor
        {_ModifyStatusResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ModifyStatusResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser ModifyStatusResponse
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
          (do loop Data.ProtoLens.defMessage) "ModifyStatusResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData ModifyStatusResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ModifyStatusResponse'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Autopilotrpc.Autopilot_Fields.pubkeys' @:: Lens' QueryScoresRequest [Data.Text.Text]@
         * 'Proto.Autopilotrpc.Autopilot_Fields.vec'pubkeys' @:: Lens' QueryScoresRequest (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Autopilotrpc.Autopilot_Fields.ignoreLocalState' @:: Lens' QueryScoresRequest Prelude.Bool@ -}
data QueryScoresRequest
  = QueryScoresRequest'_constructor {_QueryScoresRequest'pubkeys :: !(Data.Vector.Vector Data.Text.Text),
                                     _QueryScoresRequest'ignoreLocalState :: !Prelude.Bool,
                                     _QueryScoresRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show QueryScoresRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out QueryScoresRequest
instance Data.ProtoLens.Field.HasField QueryScoresRequest "pubkeys" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryScoresRequest'pubkeys
           (\ x__ y__ -> x__ {_QueryScoresRequest'pubkeys = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField QueryScoresRequest "vec'pubkeys" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryScoresRequest'pubkeys
           (\ x__ y__ -> x__ {_QueryScoresRequest'pubkeys = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField QueryScoresRequest "ignoreLocalState" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryScoresRequest'ignoreLocalState
           (\ x__ y__ -> x__ {_QueryScoresRequest'ignoreLocalState = y__}))
        Prelude.id
instance Data.ProtoLens.Message QueryScoresRequest where
  messageName _ = Data.Text.pack "autopilotrpc.QueryScoresRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC2QueryScoresRequest\DC2\CAN\n\
      \\apubkeys\CAN\SOH \ETX(\tR\apubkeys\DC2,\n\
      \\DC2ignore_local_state\CAN\STX \SOH(\bR\DLEignoreLocalState"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        pubkeys__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "pubkeys"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"pubkeys")) ::
              Data.ProtoLens.FieldDescriptor QueryScoresRequest
        ignoreLocalState__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "ignore_local_state"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"ignoreLocalState")) ::
              Data.ProtoLens.FieldDescriptor QueryScoresRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, pubkeys__field_descriptor),
           (Data.ProtoLens.Tag 2, ignoreLocalState__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _QueryScoresRequest'_unknownFields
        (\ x__ y__ -> x__ {_QueryScoresRequest'_unknownFields = y__})
  defMessage
    = QueryScoresRequest'_constructor
        {_QueryScoresRequest'pubkeys = Data.Vector.Generic.empty,
         _QueryScoresRequest'ignoreLocalState = Data.ProtoLens.fieldDefault,
         _QueryScoresRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          QueryScoresRequest
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Bytes.Parser QueryScoresRequest
        loop x mutable'pubkeys
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'pubkeys <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'pubkeys)
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
                              (Data.ProtoLens.Field.field @"vec'pubkeys") frozen'pubkeys x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "pubkeys"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'pubkeys y)
                                loop x v
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "ignore_local_state"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"ignoreLocalState") y x)
                                  mutable'pubkeys
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'pubkeys
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'pubkeys <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'pubkeys)
          "QueryScoresRequest"
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
                           Data.Text.Encoding.encodeUtf8 _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'pubkeys") _x))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"ignoreLocalState") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData QueryScoresRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_QueryScoresRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_QueryScoresRequest'pubkeys x__)
                (Control.DeepSeq.deepseq
                   (_QueryScoresRequest'ignoreLocalState x__) ()))
{- | Fields :
     
         * 'Proto.Autopilotrpc.Autopilot_Fields.results' @:: Lens' QueryScoresResponse [QueryScoresResponse'HeuristicResult]@
         * 'Proto.Autopilotrpc.Autopilot_Fields.vec'results' @:: Lens' QueryScoresResponse (Data.Vector.Vector QueryScoresResponse'HeuristicResult)@ -}
data QueryScoresResponse
  = QueryScoresResponse'_constructor {_QueryScoresResponse'results :: !(Data.Vector.Vector QueryScoresResponse'HeuristicResult),
                                      _QueryScoresResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show QueryScoresResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out QueryScoresResponse
instance Data.ProtoLens.Field.HasField QueryScoresResponse "results" [QueryScoresResponse'HeuristicResult] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryScoresResponse'results
           (\ x__ y__ -> x__ {_QueryScoresResponse'results = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField QueryScoresResponse "vec'results" (Data.Vector.Vector QueryScoresResponse'HeuristicResult) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryScoresResponse'results
           (\ x__ y__ -> x__ {_QueryScoresResponse'results = y__}))
        Prelude.id
instance Data.ProtoLens.Message QueryScoresResponse where
  messageName _ = Data.Text.pack "autopilotrpc.QueryScoresResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC3QueryScoresResponse\DC2K\n\
      \\aresults\CAN\SOH \ETX(\v21.autopilotrpc.QueryScoresResponse.HeuristicResultR\aresults\SUB\193\SOH\n\
      \\SIHeuristicResult\DC2\FS\n\
      \\theuristic\CAN\SOH \SOH(\tR\theuristic\DC2U\n\
      \\ACKscores\CAN\STX \ETX(\v2=.autopilotrpc.QueryScoresResponse.HeuristicResult.ScoresEntryR\ACKscores\SUB9\n\
      \\vScoresEntry\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\SOHR\ENQvalue:\STX8\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        results__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "results"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor QueryScoresResponse'HeuristicResult)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"results")) ::
              Data.ProtoLens.FieldDescriptor QueryScoresResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, results__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _QueryScoresResponse'_unknownFields
        (\ x__ y__ -> x__ {_QueryScoresResponse'_unknownFields = y__})
  defMessage
    = QueryScoresResponse'_constructor
        {_QueryScoresResponse'results = Data.Vector.Generic.empty,
         _QueryScoresResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          QueryScoresResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld QueryScoresResponse'HeuristicResult
             -> Data.ProtoLens.Encoding.Bytes.Parser QueryScoresResponse
        loop x mutable'results
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'results <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'results)
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
                              (Data.ProtoLens.Field.field @"vec'results") frozen'results x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "results"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'results y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'results
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'results <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'results)
          "QueryScoresResponse"
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
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'results") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData QueryScoresResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_QueryScoresResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_QueryScoresResponse'results x__) ())
{- | Fields :
     
         * 'Proto.Autopilotrpc.Autopilot_Fields.heuristic' @:: Lens' QueryScoresResponse'HeuristicResult Data.Text.Text@
         * 'Proto.Autopilotrpc.Autopilot_Fields.scores' @:: Lens' QueryScoresResponse'HeuristicResult (Data.Map.Map Data.Text.Text Prelude.Double)@ -}
data QueryScoresResponse'HeuristicResult
  = QueryScoresResponse'HeuristicResult'_constructor {_QueryScoresResponse'HeuristicResult'heuristic :: !Data.Text.Text,
                                                      _QueryScoresResponse'HeuristicResult'scores :: !(Data.Map.Map Data.Text.Text Prelude.Double),
                                                      _QueryScoresResponse'HeuristicResult'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show QueryScoresResponse'HeuristicResult where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out QueryScoresResponse'HeuristicResult
instance Data.ProtoLens.Field.HasField QueryScoresResponse'HeuristicResult "heuristic" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryScoresResponse'HeuristicResult'heuristic
           (\ x__ y__
              -> x__ {_QueryScoresResponse'HeuristicResult'heuristic = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField QueryScoresResponse'HeuristicResult "scores" (Data.Map.Map Data.Text.Text Prelude.Double) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryScoresResponse'HeuristicResult'scores
           (\ x__ y__
              -> x__ {_QueryScoresResponse'HeuristicResult'scores = y__}))
        Prelude.id
instance Data.ProtoLens.Message QueryScoresResponse'HeuristicResult where
  messageName _
    = Data.Text.pack "autopilotrpc.QueryScoresResponse.HeuristicResult"
  packedMessageDescriptor _
    = "\n\
      \\SIHeuristicResult\DC2\FS\n\
      \\theuristic\CAN\SOH \SOH(\tR\theuristic\DC2U\n\
      \\ACKscores\CAN\STX \ETX(\v2=.autopilotrpc.QueryScoresResponse.HeuristicResult.ScoresEntryR\ACKscores\SUB9\n\
      \\vScoresEntry\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\SOHR\ENQvalue:\STX8\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        heuristic__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "heuristic"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"heuristic")) ::
              Data.ProtoLens.FieldDescriptor QueryScoresResponse'HeuristicResult
        scores__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "scores"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor QueryScoresResponse'HeuristicResult'ScoresEntry)
              (Data.ProtoLens.MapField
                 (Data.ProtoLens.Field.field @"key")
                 (Data.ProtoLens.Field.field @"value")
                 (Data.ProtoLens.Field.field @"scores")) ::
              Data.ProtoLens.FieldDescriptor QueryScoresResponse'HeuristicResult
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, heuristic__field_descriptor),
           (Data.ProtoLens.Tag 2, scores__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _QueryScoresResponse'HeuristicResult'_unknownFields
        (\ x__ y__
           -> x__ {_QueryScoresResponse'HeuristicResult'_unknownFields = y__})
  defMessage
    = QueryScoresResponse'HeuristicResult'_constructor
        {_QueryScoresResponse'HeuristicResult'heuristic = Data.ProtoLens.fieldDefault,
         _QueryScoresResponse'HeuristicResult'scores = Data.Map.empty,
         _QueryScoresResponse'HeuristicResult'_unknownFields = []}
  parseMessage
    = let
        loop ::
          QueryScoresResponse'HeuristicResult
          -> Data.ProtoLens.Encoding.Bytes.Parser QueryScoresResponse'HeuristicResult
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
                                       "heuristic"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"heuristic") y x)
                        18
                          -> do !(entry :: QueryScoresResponse'HeuristicResult'ScoresEntry) <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                                                 (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                                                                     Data.ProtoLens.Encoding.Bytes.isolate
                                                                                                       (Prelude.fromIntegral
                                                                                                          len)
                                                                                                       Data.ProtoLens.parseMessage)
                                                                                                 "scores"
                                (let
                                   key = Lens.Family2.view (Data.ProtoLens.Field.field @"key") entry
                                   value
                                     = Lens.Family2.view (Data.ProtoLens.Field.field @"value") entry
                                 in
                                   loop
                                     (Lens.Family2.over
                                        (Data.ProtoLens.Field.field @"scores")
                                        (\ !t -> Data.Map.insert key value t) x))
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "HeuristicResult"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"heuristic") _x
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
                (Data.Monoid.mconcat
                   (Prelude.map
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
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"key") (Prelude.fst _v)
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"value") (Prelude.snd _v)
                                       (Data.ProtoLens.defMessage ::
                                          QueryScoresResponse'HeuristicResult'ScoresEntry)))))
                      (Data.Map.toList
                         (Lens.Family2.view (Data.ProtoLens.Field.field @"scores") _x))))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData QueryScoresResponse'HeuristicResult where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_QueryScoresResponse'HeuristicResult'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_QueryScoresResponse'HeuristicResult'heuristic x__)
                (Control.DeepSeq.deepseq
                   (_QueryScoresResponse'HeuristicResult'scores x__) ()))
{- | Fields :
     
         * 'Proto.Autopilotrpc.Autopilot_Fields.key' @:: Lens' QueryScoresResponse'HeuristicResult'ScoresEntry Data.Text.Text@
         * 'Proto.Autopilotrpc.Autopilot_Fields.value' @:: Lens' QueryScoresResponse'HeuristicResult'ScoresEntry Prelude.Double@ -}
data QueryScoresResponse'HeuristicResult'ScoresEntry
  = QueryScoresResponse'HeuristicResult'ScoresEntry'_constructor {_QueryScoresResponse'HeuristicResult'ScoresEntry'key :: !Data.Text.Text,
                                                                  _QueryScoresResponse'HeuristicResult'ScoresEntry'value :: !Prelude.Double,
                                                                  _QueryScoresResponse'HeuristicResult'ScoresEntry'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show QueryScoresResponse'HeuristicResult'ScoresEntry where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out QueryScoresResponse'HeuristicResult'ScoresEntry
instance Data.ProtoLens.Field.HasField QueryScoresResponse'HeuristicResult'ScoresEntry "key" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryScoresResponse'HeuristicResult'ScoresEntry'key
           (\ x__ y__
              -> x__
                   {_QueryScoresResponse'HeuristicResult'ScoresEntry'key = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField QueryScoresResponse'HeuristicResult'ScoresEntry "value" Prelude.Double where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _QueryScoresResponse'HeuristicResult'ScoresEntry'value
           (\ x__ y__
              -> x__
                   {_QueryScoresResponse'HeuristicResult'ScoresEntry'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message QueryScoresResponse'HeuristicResult'ScoresEntry where
  messageName _
    = Data.Text.pack
        "autopilotrpc.QueryScoresResponse.HeuristicResult.ScoresEntry"
  packedMessageDescriptor _
    = "\n\
      \\vScoresEntry\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\SOHR\ENQvalue:\STX8\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        key__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"key")) ::
              Data.ProtoLens.FieldDescriptor QueryScoresResponse'HeuristicResult'ScoresEntry
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.DoubleField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor QueryScoresResponse'HeuristicResult'ScoresEntry
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, key__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _QueryScoresResponse'HeuristicResult'ScoresEntry'_unknownFields
        (\ x__ y__
           -> x__
                {_QueryScoresResponse'HeuristicResult'ScoresEntry'_unknownFields = y__})
  defMessage
    = QueryScoresResponse'HeuristicResult'ScoresEntry'_constructor
        {_QueryScoresResponse'HeuristicResult'ScoresEntry'key = Data.ProtoLens.fieldDefault,
         _QueryScoresResponse'HeuristicResult'ScoresEntry'value = Data.ProtoLens.fieldDefault,
         _QueryScoresResponse'HeuristicResult'ScoresEntry'_unknownFields = []}
  parseMessage
    = let
        loop ::
          QueryScoresResponse'HeuristicResult'ScoresEntry
          -> Data.ProtoLens.Encoding.Bytes.Parser QueryScoresResponse'HeuristicResult'ScoresEntry
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
                                       "key"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y x)
                        17
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToDouble
                                          Data.ProtoLens.Encoding.Bytes.getFixed64)
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
          (do loop Data.ProtoLens.defMessage) "ScoresEntry"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 17)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putFixed64
                            Data.ProtoLens.Encoding.Bytes.doubleToWord _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData QueryScoresResponse'HeuristicResult'ScoresEntry where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_QueryScoresResponse'HeuristicResult'ScoresEntry'_unknownFields
                x__)
             (Control.DeepSeq.deepseq
                (_QueryScoresResponse'HeuristicResult'ScoresEntry'key x__)
                (Control.DeepSeq.deepseq
                   (_QueryScoresResponse'HeuristicResult'ScoresEntry'value x__) ()))
{- | Fields :
     
         * 'Proto.Autopilotrpc.Autopilot_Fields.heuristic' @:: Lens' SetScoresRequest Data.Text.Text@
         * 'Proto.Autopilotrpc.Autopilot_Fields.scores' @:: Lens' SetScoresRequest (Data.Map.Map Data.Text.Text Prelude.Double)@ -}
data SetScoresRequest
  = SetScoresRequest'_constructor {_SetScoresRequest'heuristic :: !Data.Text.Text,
                                   _SetScoresRequest'scores :: !(Data.Map.Map Data.Text.Text Prelude.Double),
                                   _SetScoresRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SetScoresRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SetScoresRequest
instance Data.ProtoLens.Field.HasField SetScoresRequest "heuristic" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetScoresRequest'heuristic
           (\ x__ y__ -> x__ {_SetScoresRequest'heuristic = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetScoresRequest "scores" (Data.Map.Map Data.Text.Text Prelude.Double) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetScoresRequest'scores
           (\ x__ y__ -> x__ {_SetScoresRequest'scores = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetScoresRequest where
  messageName _ = Data.Text.pack "autopilotrpc.SetScoresRequest"
  packedMessageDescriptor _
    = "\n\
      \\DLESetScoresRequest\DC2\FS\n\
      \\theuristic\CAN\SOH \SOH(\tR\theuristic\DC2B\n\
      \\ACKscores\CAN\STX \ETX(\v2*.autopilotrpc.SetScoresRequest.ScoresEntryR\ACKscores\SUB9\n\
      \\vScoresEntry\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\SOHR\ENQvalue:\STX8\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        heuristic__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "heuristic"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"heuristic")) ::
              Data.ProtoLens.FieldDescriptor SetScoresRequest
        scores__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "scores"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SetScoresRequest'ScoresEntry)
              (Data.ProtoLens.MapField
                 (Data.ProtoLens.Field.field @"key")
                 (Data.ProtoLens.Field.field @"value")
                 (Data.ProtoLens.Field.field @"scores")) ::
              Data.ProtoLens.FieldDescriptor SetScoresRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, heuristic__field_descriptor),
           (Data.ProtoLens.Tag 2, scores__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetScoresRequest'_unknownFields
        (\ x__ y__ -> x__ {_SetScoresRequest'_unknownFields = y__})
  defMessage
    = SetScoresRequest'_constructor
        {_SetScoresRequest'heuristic = Data.ProtoLens.fieldDefault,
         _SetScoresRequest'scores = Data.Map.empty,
         _SetScoresRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetScoresRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SetScoresRequest
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
                                       "heuristic"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"heuristic") y x)
                        18
                          -> do !(entry :: SetScoresRequest'ScoresEntry) <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                              (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                                                  Data.ProtoLens.Encoding.Bytes.isolate
                                                                                    (Prelude.fromIntegral
                                                                                       len)
                                                                                    Data.ProtoLens.parseMessage)
                                                                              "scores"
                                (let
                                   key = Lens.Family2.view (Data.ProtoLens.Field.field @"key") entry
                                   value
                                     = Lens.Family2.view (Data.ProtoLens.Field.field @"value") entry
                                 in
                                   loop
                                     (Lens.Family2.over
                                        (Data.ProtoLens.Field.field @"scores")
                                        (\ !t -> Data.Map.insert key value t) x))
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SetScoresRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"heuristic") _x
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
                (Data.Monoid.mconcat
                   (Prelude.map
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
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"key") (Prelude.fst _v)
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"value") (Prelude.snd _v)
                                       (Data.ProtoLens.defMessage ::
                                          SetScoresRequest'ScoresEntry)))))
                      (Data.Map.toList
                         (Lens.Family2.view (Data.ProtoLens.Field.field @"scores") _x))))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData SetScoresRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetScoresRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SetScoresRequest'heuristic x__)
                (Control.DeepSeq.deepseq (_SetScoresRequest'scores x__) ()))
{- | Fields :
     
         * 'Proto.Autopilotrpc.Autopilot_Fields.key' @:: Lens' SetScoresRequest'ScoresEntry Data.Text.Text@
         * 'Proto.Autopilotrpc.Autopilot_Fields.value' @:: Lens' SetScoresRequest'ScoresEntry Prelude.Double@ -}
data SetScoresRequest'ScoresEntry
  = SetScoresRequest'ScoresEntry'_constructor {_SetScoresRequest'ScoresEntry'key :: !Data.Text.Text,
                                               _SetScoresRequest'ScoresEntry'value :: !Prelude.Double,
                                               _SetScoresRequest'ScoresEntry'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SetScoresRequest'ScoresEntry where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SetScoresRequest'ScoresEntry
instance Data.ProtoLens.Field.HasField SetScoresRequest'ScoresEntry "key" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetScoresRequest'ScoresEntry'key
           (\ x__ y__ -> x__ {_SetScoresRequest'ScoresEntry'key = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetScoresRequest'ScoresEntry "value" Prelude.Double where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetScoresRequest'ScoresEntry'value
           (\ x__ y__ -> x__ {_SetScoresRequest'ScoresEntry'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetScoresRequest'ScoresEntry where
  messageName _
    = Data.Text.pack "autopilotrpc.SetScoresRequest.ScoresEntry"
  packedMessageDescriptor _
    = "\n\
      \\vScoresEntry\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\SOHR\ENQvalue:\STX8\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        key__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"key")) ::
              Data.ProtoLens.FieldDescriptor SetScoresRequest'ScoresEntry
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.DoubleField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor SetScoresRequest'ScoresEntry
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, key__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetScoresRequest'ScoresEntry'_unknownFields
        (\ x__ y__
           -> x__ {_SetScoresRequest'ScoresEntry'_unknownFields = y__})
  defMessage
    = SetScoresRequest'ScoresEntry'_constructor
        {_SetScoresRequest'ScoresEntry'key = Data.ProtoLens.fieldDefault,
         _SetScoresRequest'ScoresEntry'value = Data.ProtoLens.fieldDefault,
         _SetScoresRequest'ScoresEntry'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetScoresRequest'ScoresEntry
          -> Data.ProtoLens.Encoding.Bytes.Parser SetScoresRequest'ScoresEntry
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
                                       "key"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y x)
                        17
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToDouble
                                          Data.ProtoLens.Encoding.Bytes.getFixed64)
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
          (do loop Data.ProtoLens.defMessage) "ScoresEntry"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 17)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putFixed64
                            Data.ProtoLens.Encoding.Bytes.doubleToWord _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData SetScoresRequest'ScoresEntry where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetScoresRequest'ScoresEntry'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SetScoresRequest'ScoresEntry'key x__)
                (Control.DeepSeq.deepseq
                   (_SetScoresRequest'ScoresEntry'value x__) ()))
{- | Fields :
      -}
data SetScoresResponse
  = SetScoresResponse'_constructor {_SetScoresResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SetScoresResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SetScoresResponse
instance Data.ProtoLens.Message SetScoresResponse where
  messageName _ = Data.Text.pack "autopilotrpc.SetScoresResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC1SetScoresResponse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetScoresResponse'_unknownFields
        (\ x__ y__ -> x__ {_SetScoresResponse'_unknownFields = y__})
  defMessage
    = SetScoresResponse'_constructor
        {_SetScoresResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetScoresResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser SetScoresResponse
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
          (do loop Data.ProtoLens.defMessage) "SetScoresResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData SetScoresResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetScoresResponse'_unknownFields x__) ()
{- | Fields :
      -}
data StatusRequest
  = StatusRequest'_constructor {_StatusRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show StatusRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out StatusRequest
instance Data.ProtoLens.Message StatusRequest where
  messageName _ = Data.Text.pack "autopilotrpc.StatusRequest"
  packedMessageDescriptor _
    = "\n\
      \\rStatusRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _StatusRequest'_unknownFields
        (\ x__ y__ -> x__ {_StatusRequest'_unknownFields = y__})
  defMessage
    = StatusRequest'_constructor {_StatusRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          StatusRequest -> Data.ProtoLens.Encoding.Bytes.Parser StatusRequest
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
          (do loop Data.ProtoLens.defMessage) "StatusRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData StatusRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq (_StatusRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Autopilotrpc.Autopilot_Fields.active' @:: Lens' StatusResponse Prelude.Bool@ -}
data StatusResponse
  = StatusResponse'_constructor {_StatusResponse'active :: !Prelude.Bool,
                                 _StatusResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show StatusResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out StatusResponse
instance Data.ProtoLens.Field.HasField StatusResponse "active" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StatusResponse'active
           (\ x__ y__ -> x__ {_StatusResponse'active = y__}))
        Prelude.id
instance Data.ProtoLens.Message StatusResponse where
  messageName _ = Data.Text.pack "autopilotrpc.StatusResponse"
  packedMessageDescriptor _
    = "\n\
      \\SOStatusResponse\DC2\SYN\n\
      \\ACKactive\CAN\SOH \SOH(\bR\ACKactive"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        active__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "active"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"active")) ::
              Data.ProtoLens.FieldDescriptor StatusResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, active__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _StatusResponse'_unknownFields
        (\ x__ y__ -> x__ {_StatusResponse'_unknownFields = y__})
  defMessage
    = StatusResponse'_constructor
        {_StatusResponse'active = Data.ProtoLens.fieldDefault,
         _StatusResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          StatusResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser StatusResponse
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
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "active"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"active") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "StatusResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"active") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData StatusResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_StatusResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_StatusResponse'active x__) ())
data Autopilot = Autopilot {}
instance Data.ProtoLens.Service.Types.Service Autopilot where
  type ServiceName Autopilot = "Autopilot"
  type ServicePackage Autopilot = "autopilotrpc"
  type ServiceMethods Autopilot = '["modifyStatus",
                                    "queryScores",
                                    "setScores",
                                    "status"]
  packedServiceDescriptor _
    = "\n\
      \\tAutopilot\DC2C\n\
      \\ACKStatus\DC2\ESC.autopilotrpc.StatusRequest\SUB\FS.autopilotrpc.StatusResponse\DC2U\n\
      \\fModifyStatus\DC2!.autopilotrpc.ModifyStatusRequest\SUB\".autopilotrpc.ModifyStatusResponse\DC2R\n\
      \\vQueryScores\DC2 .autopilotrpc.QueryScoresRequest\SUB!.autopilotrpc.QueryScoresResponse\DC2L\n\
      \\tSetScores\DC2\RS.autopilotrpc.SetScoresRequest\SUB\US.autopilotrpc.SetScoresResponse"
instance Data.ProtoLens.Service.Types.HasMethodImpl Autopilot "status" where
  type MethodName Autopilot "status" = "Status"
  type MethodInput Autopilot "status" = StatusRequest
  type MethodOutput Autopilot "status" = StatusResponse
  type MethodStreamingType Autopilot "status" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Autopilot "modifyStatus" where
  type MethodName Autopilot "modifyStatus" = "ModifyStatus"
  type MethodInput Autopilot "modifyStatus" = ModifyStatusRequest
  type MethodOutput Autopilot "modifyStatus" = ModifyStatusResponse
  type MethodStreamingType Autopilot "modifyStatus" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Autopilot "queryScores" where
  type MethodName Autopilot "queryScores" = "QueryScores"
  type MethodInput Autopilot "queryScores" = QueryScoresRequest
  type MethodOutput Autopilot "queryScores" = QueryScoresResponse
  type MethodStreamingType Autopilot "queryScores" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Autopilot "setScores" where
  type MethodName Autopilot "setScores" = "SetScores"
  type MethodInput Autopilot "setScores" = SetScoresRequest
  type MethodOutput Autopilot "setScores" = SetScoresResponse
  type MethodStreamingType Autopilot "setScores" = 'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\FSautopilotrpc/autopilot.proto\DC2\fautopilotrpc\"\SI\n\
    \\rStatusRequest\"(\n\
    \\SOStatusResponse\DC2\SYN\n\
    \\ACKactive\CAN\SOH \SOH(\bR\ACKactive\"-\n\
    \\DC3ModifyStatusRequest\DC2\SYN\n\
    \\ACKenable\CAN\SOH \SOH(\bR\ACKenable\"\SYN\n\
    \\DC4ModifyStatusResponse\"\\\n\
    \\DC2QueryScoresRequest\DC2\CAN\n\
    \\apubkeys\CAN\SOH \ETX(\tR\apubkeys\DC2,\n\
    \\DC2ignore_local_state\CAN\STX \SOH(\bR\DLEignoreLocalState\"\166\STX\n\
    \\DC3QueryScoresResponse\DC2K\n\
    \\aresults\CAN\SOH \ETX(\v21.autopilotrpc.QueryScoresResponse.HeuristicResultR\aresults\SUB\193\SOH\n\
    \\SIHeuristicResult\DC2\FS\n\
    \\theuristic\CAN\SOH \SOH(\tR\theuristic\DC2U\n\
    \\ACKscores\CAN\STX \ETX(\v2=.autopilotrpc.QueryScoresResponse.HeuristicResult.ScoresEntryR\ACKscores\SUB9\n\
    \\vScoresEntry\DC2\DLE\n\
    \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
    \\ENQvalue\CAN\STX \SOH(\SOHR\ENQvalue:\STX8\SOH\"\175\SOH\n\
    \\DLESetScoresRequest\DC2\FS\n\
    \\theuristic\CAN\SOH \SOH(\tR\theuristic\DC2B\n\
    \\ACKscores\CAN\STX \ETX(\v2*.autopilotrpc.SetScoresRequest.ScoresEntryR\ACKscores\SUB9\n\
    \\vScoresEntry\DC2\DLE\n\
    \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
    \\ENQvalue\CAN\STX \SOH(\SOHR\ENQvalue:\STX8\SOH\"\DC3\n\
    \\DC1SetScoresResponse2\201\STX\n\
    \\tAutopilot\DC2C\n\
    \\ACKStatus\DC2\ESC.autopilotrpc.StatusRequest\SUB\FS.autopilotrpc.StatusResponse\DC2U\n\
    \\fModifyStatus\DC2!.autopilotrpc.ModifyStatusRequest\SUB\".autopilotrpc.ModifyStatusResponse\DC2R\n\
    \\vQueryScores\DC2 .autopilotrpc.QueryScoresRequest\SUB!.autopilotrpc.QueryScoresResponse\DC2L\n\
    \\tSetScores\DC2\RS.autopilotrpc.SetScoresRequest\SUB\US.autopilotrpc.SetScoresResponseB4Z2github.com/lightningnetwork/lnd/lnrpc/autopilotrpcJ\133\DLE\n\
    \\ACK\DC2\EOT\NUL\NULO\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\STX\NUL\NAK\n\
    \\b\n\
    \\SOH\b\DC2\ETX\EOT\NULI\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\EOT\NULI\n\
    \\223\SOH\n\
    \\STX\ACK\NUL\DC2\EOT\t\NUL!\SOH\SUB\210\SOH Autopilot is a service that can be used to get information about the current\n\
    \ state of the daemon's autopilot agent, and also supply it with information\n\
    \ that can be used when deciding where to open channels.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\t\b\DC1\n\
    \M\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\ETX\r\EOT8\SUB@\n\
    \Status returns whether the daemon's autopilot agent is active.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\r\b\SO\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\r\DLE\GS\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\r(6\n\
    \o\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX\DC3\EOTJ\SUBb\n\
    \ModifyStatus is used to modify the status of the autopilot agent, like\n\
    \enabling or disabling it.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX\DC3\b\DC4\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX\DC3\SYN)\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX\DC34H\n\
    \\182\SOH\n\
    \\EOT\ACK\NUL\STX\STX\DC2\ETX\SUB\EOTG\SUB\168\SOH\n\
    \QueryScores queries all available autopilot heuristics, in addition to any\n\
    \active combination of these heruristics, for the scores they would give to\n\
    \the given nodes.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\SOH\DC2\ETX\SUB\b\DC3\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\STX\DC2\ETX\SUB\NAK'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ETX\DC2\ETX\SUB2E\n\
    \\134\SOH\n\
    \\EOT\ACK\NUL\STX\ETX\DC2\ETX \EOTA\SUBy\n\
    \SetScores attempts to set the scores used by the running autopilot agent,\n\
    \if the external scoring heuristic is enabled.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\SOH\DC2\ETX \b\DC1\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\STX\DC2\ETX \DC3#\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\ETX\DC2\ETX .?\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT#\NUL$\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX#\b\NAK\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT&\NUL)\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX&\b\SYN\n\
    \@\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX(\EOT\DC4\SUB3 Indicates whether the autopilot is active or not.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX(\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX(\t\SI\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX(\DC2\DC3\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT+\NUL.\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX+\b\ESC\n\
    \D\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX-\EOT\DC4\SUB7 Whether the autopilot agent should be enabled or not.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX-\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX-\t\SI\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX-\DC2\DC3\n\
    \\n\
    \\n\
    \\STX\EOT\ETX\DC2\EOT0\NUL1\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETX0\b\FS\n\
    \\n\
    \\n\
    \\STX\EOT\EOT\DC2\EOT3\NUL8\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\EOT\SOH\DC2\ETX3\b\SUB\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\ETX4\EOT \n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\EOT\DC2\ETX4\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\ETX4\r\DC3\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\ETX4\DC4\ESC\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\ETX4\RS\US\n\
    \V\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\ETX7\EOT \SUBI If set, we will ignore the local channel state when calculating scores.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ENQ\DC2\ETX7\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\ETX7\t\ESC\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\ETX7\RS\US\n\
    \\n\
    \\n\
    \\STX\EOT\ENQ\DC2\EOT:\NULA\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ENQ\SOH\DC2\ETX:\b\ESC\n\
    \\f\n\
    \\EOT\EOT\ENQ\ETX\NUL\DC2\EOT;\EOT>\ENQ\n\
    \\f\n\
    \\ENQ\EOT\ENQ\ETX\NUL\SOH\DC2\ETX;\f\ESC\n\
    \\r\n\
    \\ACK\EOT\ENQ\ETX\NUL\STX\NUL\DC2\ETX<\b\GS\n\
    \\SO\n\
    \\a\EOT\ENQ\ETX\NUL\STX\NUL\ENQ\DC2\ETX<\b\SO\n\
    \\SO\n\
    \\a\EOT\ENQ\ETX\NUL\STX\NUL\SOH\DC2\ETX<\SI\CAN\n\
    \\SO\n\
    \\a\EOT\ENQ\ETX\NUL\STX\NUL\ETX\DC2\ETX<\ESC\FS\n\
    \\r\n\
    \\ACK\EOT\ENQ\ETX\NUL\STX\SOH\DC2\ETX=\b'\n\
    \\SO\n\
    \\a\EOT\ENQ\ETX\NUL\STX\SOH\ACK\DC2\ETX=\b\ESC\n\
    \\SO\n\
    \\a\EOT\ENQ\ETX\NUL\STX\SOH\SOH\DC2\ETX=\FS\"\n\
    \\SO\n\
    \\a\EOT\ENQ\ETX\NUL\STX\SOH\ETX\DC2\ETX=%&\n\
    \\v\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\ETX@\EOT)\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\EOT\DC2\ETX@\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ACK\DC2\ETX@\r\FS\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\ETX@\GS$\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\ETX@'(\n\
    \\n\
    \\n\
    \\STX\EOT\ACK\DC2\EOTC\NULL\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ACK\SOH\DC2\ETXC\b\CAN\n\
    \>\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\ETXE\EOT\EM\SUB1 The name of the heuristic to provide scores to.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\ETXE\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\ETXE\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\ETXE\ETB\CAN\n\
    \d\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\ETXK\EOT#\SUBW\n\
    \A map from hex-encoded public keys to scores. Scores must be in the range\n\
    \[0.0, 1.0].\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\ACK\DC2\ETXK\EOT\ETB\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\ETXK\CAN\RS\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\ETXK!\"\n\
    \\n\
    \\n\
    \\STX\EOT\a\DC2\EOTN\NULO\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\a\SOH\DC2\ETXN\b\EMb\ACKproto3"