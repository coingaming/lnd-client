{- This file was auto-generated from chainrpc/chainnotifier.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Chainrpc.Chainnotifier (
        ChainNotifier(..), BlockEpoch(), ConfDetails(), ConfEvent(),
        ConfEvent'Event(..), _ConfEvent'Conf, _ConfEvent'Reorg,
        ConfRequest(), Outpoint(), Reorg(), SpendDetails(), SpendEvent(),
        SpendEvent'Event(..), _SpendEvent'Spend, _SpendEvent'Reorg,
        SpendRequest()
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
     
         * 'Proto.Chainrpc.Chainnotifier_Fields.hash' @:: Lens' BlockEpoch Data.ByteString.ByteString@
         * 'Proto.Chainrpc.Chainnotifier_Fields.height' @:: Lens' BlockEpoch Data.Word.Word32@ -}
data BlockEpoch
  = BlockEpoch'_constructor {_BlockEpoch'hash :: !Data.ByteString.ByteString,
                             _BlockEpoch'height :: !Data.Word.Word32,
                             _BlockEpoch'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show BlockEpoch where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out BlockEpoch
instance Data.ProtoLens.Field.HasField BlockEpoch "hash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BlockEpoch'hash (\ x__ y__ -> x__ {_BlockEpoch'hash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField BlockEpoch "height" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BlockEpoch'height (\ x__ y__ -> x__ {_BlockEpoch'height = y__}))
        Prelude.id
instance Data.ProtoLens.Message BlockEpoch where
  messageName _ = Data.Text.pack "chainrpc.BlockEpoch"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \BlockEpoch\DC2\DC2\n\
      \\EOThash\CAN\SOH \SOH(\fR\EOThash\DC2\SYN\n\
      \\ACKheight\CAN\STX \SOH(\rR\ACKheight"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        hash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"hash")) ::
              Data.ProtoLens.FieldDescriptor BlockEpoch
        height__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "height"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"height")) ::
              Data.ProtoLens.FieldDescriptor BlockEpoch
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, hash__field_descriptor),
           (Data.ProtoLens.Tag 2, height__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _BlockEpoch'_unknownFields
        (\ x__ y__ -> x__ {_BlockEpoch'_unknownFields = y__})
  defMessage
    = BlockEpoch'_constructor
        {_BlockEpoch'hash = Data.ProtoLens.fieldDefault,
         _BlockEpoch'height = Data.ProtoLens.fieldDefault,
         _BlockEpoch'_unknownFields = []}
  parseMessage
    = let
        loop ::
          BlockEpoch -> Data.ProtoLens.Encoding.Bytes.Parser BlockEpoch
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
                                       "hash"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"hash") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "height"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"height") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "BlockEpoch"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"hash") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"height") _x
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
instance Control.DeepSeq.NFData BlockEpoch where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_BlockEpoch'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_BlockEpoch'hash x__)
                (Control.DeepSeq.deepseq (_BlockEpoch'height x__) ()))
{- | Fields :
     
         * 'Proto.Chainrpc.Chainnotifier_Fields.rawTx' @:: Lens' ConfDetails Data.ByteString.ByteString@
         * 'Proto.Chainrpc.Chainnotifier_Fields.blockHash' @:: Lens' ConfDetails Data.ByteString.ByteString@
         * 'Proto.Chainrpc.Chainnotifier_Fields.blockHeight' @:: Lens' ConfDetails Data.Word.Word32@
         * 'Proto.Chainrpc.Chainnotifier_Fields.txIndex' @:: Lens' ConfDetails Data.Word.Word32@ -}
data ConfDetails
  = ConfDetails'_constructor {_ConfDetails'rawTx :: !Data.ByteString.ByteString,
                              _ConfDetails'blockHash :: !Data.ByteString.ByteString,
                              _ConfDetails'blockHeight :: !Data.Word.Word32,
                              _ConfDetails'txIndex :: !Data.Word.Word32,
                              _ConfDetails'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ConfDetails where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ConfDetails
instance Data.ProtoLens.Field.HasField ConfDetails "rawTx" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfDetails'rawTx (\ x__ y__ -> x__ {_ConfDetails'rawTx = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ConfDetails "blockHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfDetails'blockHash
           (\ x__ y__ -> x__ {_ConfDetails'blockHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ConfDetails "blockHeight" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfDetails'blockHeight
           (\ x__ y__ -> x__ {_ConfDetails'blockHeight = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ConfDetails "txIndex" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfDetails'txIndex
           (\ x__ y__ -> x__ {_ConfDetails'txIndex = y__}))
        Prelude.id
instance Data.ProtoLens.Message ConfDetails where
  messageName _ = Data.Text.pack "chainrpc.ConfDetails"
  packedMessageDescriptor _
    = "\n\
      \\vConfDetails\DC2\NAK\n\
      \\ACKraw_tx\CAN\SOH \SOH(\fR\ENQrawTx\DC2\GS\n\
      \\n\
      \block_hash\CAN\STX \SOH(\fR\tblockHash\DC2!\n\
      \\fblock_height\CAN\ETX \SOH(\rR\vblockHeight\DC2\EM\n\
      \\btx_index\CAN\EOT \SOH(\rR\atxIndex"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        rawTx__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "raw_tx"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"rawTx")) ::
              Data.ProtoLens.FieldDescriptor ConfDetails
        blockHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "block_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"blockHash")) ::
              Data.ProtoLens.FieldDescriptor ConfDetails
        blockHeight__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "block_height"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"blockHeight")) ::
              Data.ProtoLens.FieldDescriptor ConfDetails
        txIndex__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tx_index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"txIndex")) ::
              Data.ProtoLens.FieldDescriptor ConfDetails
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, rawTx__field_descriptor),
           (Data.ProtoLens.Tag 2, blockHash__field_descriptor),
           (Data.ProtoLens.Tag 3, blockHeight__field_descriptor),
           (Data.ProtoLens.Tag 4, txIndex__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ConfDetails'_unknownFields
        (\ x__ y__ -> x__ {_ConfDetails'_unknownFields = y__})
  defMessage
    = ConfDetails'_constructor
        {_ConfDetails'rawTx = Data.ProtoLens.fieldDefault,
         _ConfDetails'blockHash = Data.ProtoLens.fieldDefault,
         _ConfDetails'blockHeight = Data.ProtoLens.fieldDefault,
         _ConfDetails'txIndex = Data.ProtoLens.fieldDefault,
         _ConfDetails'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ConfDetails -> Data.ProtoLens.Encoding.Bytes.Parser ConfDetails
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
                                       "raw_tx"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"rawTx") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "block_hash"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"blockHash") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "block_height"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"blockHeight") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "tx_index"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"txIndex") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ConfDetails"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"rawTx") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"blockHash") _x
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
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"blockHeight") _x
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
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"txIndex") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData ConfDetails where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ConfDetails'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ConfDetails'rawTx x__)
                (Control.DeepSeq.deepseq
                   (_ConfDetails'blockHash x__)
                   (Control.DeepSeq.deepseq
                      (_ConfDetails'blockHeight x__)
                      (Control.DeepSeq.deepseq (_ConfDetails'txIndex x__) ()))))
{- | Fields :
     
         * 'Proto.Chainrpc.Chainnotifier_Fields.maybe'event' @:: Lens' ConfEvent (Prelude.Maybe ConfEvent'Event)@
         * 'Proto.Chainrpc.Chainnotifier_Fields.maybe'conf' @:: Lens' ConfEvent (Prelude.Maybe ConfDetails)@
         * 'Proto.Chainrpc.Chainnotifier_Fields.conf' @:: Lens' ConfEvent ConfDetails@
         * 'Proto.Chainrpc.Chainnotifier_Fields.maybe'reorg' @:: Lens' ConfEvent (Prelude.Maybe Reorg)@
         * 'Proto.Chainrpc.Chainnotifier_Fields.reorg' @:: Lens' ConfEvent Reorg@ -}
data ConfEvent
  = ConfEvent'_constructor {_ConfEvent'event :: !(Prelude.Maybe ConfEvent'Event),
                            _ConfEvent'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ConfEvent where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ConfEvent
data ConfEvent'Event
  = ConfEvent'Conf !ConfDetails | ConfEvent'Reorg !Reorg
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out ConfEvent'Event
instance Data.ProtoLens.Field.HasField ConfEvent "maybe'event" (Prelude.Maybe ConfEvent'Event) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfEvent'event (\ x__ y__ -> x__ {_ConfEvent'event = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ConfEvent "maybe'conf" (Prelude.Maybe ConfDetails) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfEvent'event (\ x__ y__ -> x__ {_ConfEvent'event = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (ConfEvent'Conf x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap ConfEvent'Conf y__))
instance Data.ProtoLens.Field.HasField ConfEvent "conf" ConfDetails where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfEvent'event (\ x__ y__ -> x__ {_ConfEvent'event = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (ConfEvent'Conf x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap ConfEvent'Conf y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField ConfEvent "maybe'reorg" (Prelude.Maybe Reorg) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfEvent'event (\ x__ y__ -> x__ {_ConfEvent'event = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (ConfEvent'Reorg x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap ConfEvent'Reorg y__))
instance Data.ProtoLens.Field.HasField ConfEvent "reorg" Reorg where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfEvent'event (\ x__ y__ -> x__ {_ConfEvent'event = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (ConfEvent'Reorg x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap ConfEvent'Reorg y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message ConfEvent where
  messageName _ = Data.Text.pack "chainrpc.ConfEvent"
  packedMessageDescriptor _
    = "\n\
      \\tConfEvent\DC2+\n\
      \\EOTconf\CAN\SOH \SOH(\v2\NAK.chainrpc.ConfDetailsH\NULR\EOTconf\DC2'\n\
      \\ENQreorg\CAN\STX \SOH(\v2\SI.chainrpc.ReorgH\NULR\ENQreorgB\a\n\
      \\ENQevent"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        conf__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "conf"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ConfDetails)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'conf")) ::
              Data.ProtoLens.FieldDescriptor ConfEvent
        reorg__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reorg"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Reorg)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'reorg")) ::
              Data.ProtoLens.FieldDescriptor ConfEvent
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, conf__field_descriptor),
           (Data.ProtoLens.Tag 2, reorg__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ConfEvent'_unknownFields
        (\ x__ y__ -> x__ {_ConfEvent'_unknownFields = y__})
  defMessage
    = ConfEvent'_constructor
        {_ConfEvent'event = Prelude.Nothing,
         _ConfEvent'_unknownFields = []}
  parseMessage
    = let
        loop :: ConfEvent -> Data.ProtoLens.Encoding.Bytes.Parser ConfEvent
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
                                       "conf"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"conf") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "reorg"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"reorg") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ConfEvent"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'event") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (ConfEvent'Conf v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (ConfEvent'Reorg v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ConfEvent where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ConfEvent'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ConfEvent'event x__) ())
instance Control.DeepSeq.NFData ConfEvent'Event where
  rnf (ConfEvent'Conf x__) = Control.DeepSeq.rnf x__
  rnf (ConfEvent'Reorg x__) = Control.DeepSeq.rnf x__
_ConfEvent'Conf ::
  Data.ProtoLens.Prism.Prism' ConfEvent'Event ConfDetails
_ConfEvent'Conf
  = Data.ProtoLens.Prism.prism'
      ConfEvent'Conf
      (\ p__
         -> case p__ of
              (ConfEvent'Conf p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_ConfEvent'Reorg ::
  Data.ProtoLens.Prism.Prism' ConfEvent'Event Reorg
_ConfEvent'Reorg
  = Data.ProtoLens.Prism.prism'
      ConfEvent'Reorg
      (\ p__
         -> case p__ of
              (ConfEvent'Reorg p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Chainrpc.Chainnotifier_Fields.txid' @:: Lens' ConfRequest Data.ByteString.ByteString@
         * 'Proto.Chainrpc.Chainnotifier_Fields.script' @:: Lens' ConfRequest Data.ByteString.ByteString@
         * 'Proto.Chainrpc.Chainnotifier_Fields.numConfs' @:: Lens' ConfRequest Data.Word.Word32@
         * 'Proto.Chainrpc.Chainnotifier_Fields.heightHint' @:: Lens' ConfRequest Data.Word.Word32@ -}
data ConfRequest
  = ConfRequest'_constructor {_ConfRequest'txid :: !Data.ByteString.ByteString,
                              _ConfRequest'script :: !Data.ByteString.ByteString,
                              _ConfRequest'numConfs :: !Data.Word.Word32,
                              _ConfRequest'heightHint :: !Data.Word.Word32,
                              _ConfRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ConfRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ConfRequest
instance Data.ProtoLens.Field.HasField ConfRequest "txid" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfRequest'txid (\ x__ y__ -> x__ {_ConfRequest'txid = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ConfRequest "script" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfRequest'script (\ x__ y__ -> x__ {_ConfRequest'script = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ConfRequest "numConfs" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfRequest'numConfs
           (\ x__ y__ -> x__ {_ConfRequest'numConfs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ConfRequest "heightHint" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConfRequest'heightHint
           (\ x__ y__ -> x__ {_ConfRequest'heightHint = y__}))
        Prelude.id
instance Data.ProtoLens.Message ConfRequest where
  messageName _ = Data.Text.pack "chainrpc.ConfRequest"
  packedMessageDescriptor _
    = "\n\
      \\vConfRequest\DC2\DC2\n\
      \\EOTtxid\CAN\SOH \SOH(\fR\EOTtxid\DC2\SYN\n\
      \\ACKscript\CAN\STX \SOH(\fR\ACKscript\DC2\ESC\n\
      \\tnum_confs\CAN\ETX \SOH(\rR\bnumConfs\DC2\US\n\
      \\vheight_hint\CAN\EOT \SOH(\rR\n\
      \heightHint"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        txid__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "txid"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"txid")) ::
              Data.ProtoLens.FieldDescriptor ConfRequest
        script__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "script"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"script")) ::
              Data.ProtoLens.FieldDescriptor ConfRequest
        numConfs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_confs"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"numConfs")) ::
              Data.ProtoLens.FieldDescriptor ConfRequest
        heightHint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "height_hint"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"heightHint")) ::
              Data.ProtoLens.FieldDescriptor ConfRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, txid__field_descriptor),
           (Data.ProtoLens.Tag 2, script__field_descriptor),
           (Data.ProtoLens.Tag 3, numConfs__field_descriptor),
           (Data.ProtoLens.Tag 4, heightHint__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ConfRequest'_unknownFields
        (\ x__ y__ -> x__ {_ConfRequest'_unknownFields = y__})
  defMessage
    = ConfRequest'_constructor
        {_ConfRequest'txid = Data.ProtoLens.fieldDefault,
         _ConfRequest'script = Data.ProtoLens.fieldDefault,
         _ConfRequest'numConfs = Data.ProtoLens.fieldDefault,
         _ConfRequest'heightHint = Data.ProtoLens.fieldDefault,
         _ConfRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ConfRequest -> Data.ProtoLens.Encoding.Bytes.Parser ConfRequest
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
                                       "txid"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"txid") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "script"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"script") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "num_confs"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"numConfs") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "height_hint"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"heightHint") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ConfRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"txid") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"script") _x
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
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"numConfs") _x
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
                         _v
                           = Lens.Family2.view (Data.ProtoLens.Field.field @"heightHint") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData ConfRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ConfRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ConfRequest'txid x__)
                (Control.DeepSeq.deepseq
                   (_ConfRequest'script x__)
                   (Control.DeepSeq.deepseq
                      (_ConfRequest'numConfs x__)
                      (Control.DeepSeq.deepseq (_ConfRequest'heightHint x__) ()))))
{- | Fields :
     
         * 'Proto.Chainrpc.Chainnotifier_Fields.hash' @:: Lens' Outpoint Data.ByteString.ByteString@
         * 'Proto.Chainrpc.Chainnotifier_Fields.index' @:: Lens' Outpoint Data.Word.Word32@ -}
data Outpoint
  = Outpoint'_constructor {_Outpoint'hash :: !Data.ByteString.ByteString,
                           _Outpoint'index :: !Data.Word.Word32,
                           _Outpoint'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show Outpoint where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out Outpoint
instance Data.ProtoLens.Field.HasField Outpoint "hash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Outpoint'hash (\ x__ y__ -> x__ {_Outpoint'hash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Outpoint "index" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Outpoint'index (\ x__ y__ -> x__ {_Outpoint'index = y__}))
        Prelude.id
instance Data.ProtoLens.Message Outpoint where
  messageName _ = Data.Text.pack "chainrpc.Outpoint"
  packedMessageDescriptor _
    = "\n\
      \\bOutpoint\DC2\DC2\n\
      \\EOThash\CAN\SOH \SOH(\fR\EOThash\DC2\DC4\n\
      \\ENQindex\CAN\STX \SOH(\rR\ENQindex"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        hash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"hash")) ::
              Data.ProtoLens.FieldDescriptor Outpoint
        index__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"index")) ::
              Data.ProtoLens.FieldDescriptor Outpoint
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, hash__field_descriptor),
           (Data.ProtoLens.Tag 2, index__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Outpoint'_unknownFields
        (\ x__ y__ -> x__ {_Outpoint'_unknownFields = y__})
  defMessage
    = Outpoint'_constructor
        {_Outpoint'hash = Data.ProtoLens.fieldDefault,
         _Outpoint'index = Data.ProtoLens.fieldDefault,
         _Outpoint'_unknownFields = []}
  parseMessage
    = let
        loop :: Outpoint -> Data.ProtoLens.Encoding.Bytes.Parser Outpoint
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
                                       "hash"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"hash") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "index"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"index") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Outpoint"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"hash") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"index") _x
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
instance Control.DeepSeq.NFData Outpoint where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Outpoint'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Outpoint'hash x__)
                (Control.DeepSeq.deepseq (_Outpoint'index x__) ()))
{- | Fields :
      -}
data Reorg
  = Reorg'_constructor {_Reorg'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show Reorg where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out Reorg
instance Data.ProtoLens.Message Reorg where
  messageName _ = Data.Text.pack "chainrpc.Reorg"
  packedMessageDescriptor _
    = "\n\
      \\ENQReorg"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Reorg'_unknownFields
        (\ x__ y__ -> x__ {_Reorg'_unknownFields = y__})
  defMessage = Reorg'_constructor {_Reorg'_unknownFields = []}
  parseMessage
    = let
        loop :: Reorg -> Data.ProtoLens.Encoding.Bytes.Parser Reorg
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
          (do loop Data.ProtoLens.defMessage) "Reorg"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData Reorg where
  rnf
    = \ x__ -> Control.DeepSeq.deepseq (_Reorg'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Chainrpc.Chainnotifier_Fields.spendingOutpoint' @:: Lens' SpendDetails Outpoint@
         * 'Proto.Chainrpc.Chainnotifier_Fields.maybe'spendingOutpoint' @:: Lens' SpendDetails (Prelude.Maybe Outpoint)@
         * 'Proto.Chainrpc.Chainnotifier_Fields.rawSpendingTx' @:: Lens' SpendDetails Data.ByteString.ByteString@
         * 'Proto.Chainrpc.Chainnotifier_Fields.spendingTxHash' @:: Lens' SpendDetails Data.ByteString.ByteString@
         * 'Proto.Chainrpc.Chainnotifier_Fields.spendingInputIndex' @:: Lens' SpendDetails Data.Word.Word32@
         * 'Proto.Chainrpc.Chainnotifier_Fields.spendingHeight' @:: Lens' SpendDetails Data.Word.Word32@ -}
data SpendDetails
  = SpendDetails'_constructor {_SpendDetails'spendingOutpoint :: !(Prelude.Maybe Outpoint),
                               _SpendDetails'rawSpendingTx :: !Data.ByteString.ByteString,
                               _SpendDetails'spendingTxHash :: !Data.ByteString.ByteString,
                               _SpendDetails'spendingInputIndex :: !Data.Word.Word32,
                               _SpendDetails'spendingHeight :: !Data.Word.Word32,
                               _SpendDetails'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SpendDetails where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SpendDetails
instance Data.ProtoLens.Field.HasField SpendDetails "spendingOutpoint" Outpoint where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendDetails'spendingOutpoint
           (\ x__ y__ -> x__ {_SpendDetails'spendingOutpoint = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SpendDetails "maybe'spendingOutpoint" (Prelude.Maybe Outpoint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendDetails'spendingOutpoint
           (\ x__ y__ -> x__ {_SpendDetails'spendingOutpoint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SpendDetails "rawSpendingTx" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendDetails'rawSpendingTx
           (\ x__ y__ -> x__ {_SpendDetails'rawSpendingTx = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SpendDetails "spendingTxHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendDetails'spendingTxHash
           (\ x__ y__ -> x__ {_SpendDetails'spendingTxHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SpendDetails "spendingInputIndex" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendDetails'spendingInputIndex
           (\ x__ y__ -> x__ {_SpendDetails'spendingInputIndex = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SpendDetails "spendingHeight" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendDetails'spendingHeight
           (\ x__ y__ -> x__ {_SpendDetails'spendingHeight = y__}))
        Prelude.id
instance Data.ProtoLens.Message SpendDetails where
  messageName _ = Data.Text.pack "chainrpc.SpendDetails"
  packedMessageDescriptor _
    = "\n\
      \\fSpendDetails\DC2?\n\
      \\DC1spending_outpoint\CAN\SOH \SOH(\v2\DC2.chainrpc.OutpointR\DLEspendingOutpoint\DC2&\n\
      \\SIraw_spending_tx\CAN\STX \SOH(\fR\rrawSpendingTx\DC2(\n\
      \\DLEspending_tx_hash\CAN\ETX \SOH(\fR\SOspendingTxHash\DC20\n\
      \\DC4spending_input_index\CAN\EOT \SOH(\rR\DC2spendingInputIndex\DC2'\n\
      \\SIspending_height\CAN\ENQ \SOH(\rR\SOspendingHeight"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        spendingOutpoint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "spending_outpoint"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Outpoint)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'spendingOutpoint")) ::
              Data.ProtoLens.FieldDescriptor SpendDetails
        rawSpendingTx__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "raw_spending_tx"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"rawSpendingTx")) ::
              Data.ProtoLens.FieldDescriptor SpendDetails
        spendingTxHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "spending_tx_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"spendingTxHash")) ::
              Data.ProtoLens.FieldDescriptor SpendDetails
        spendingInputIndex__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "spending_input_index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"spendingInputIndex")) ::
              Data.ProtoLens.FieldDescriptor SpendDetails
        spendingHeight__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "spending_height"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"spendingHeight")) ::
              Data.ProtoLens.FieldDescriptor SpendDetails
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, spendingOutpoint__field_descriptor),
           (Data.ProtoLens.Tag 2, rawSpendingTx__field_descriptor),
           (Data.ProtoLens.Tag 3, spendingTxHash__field_descriptor),
           (Data.ProtoLens.Tag 4, spendingInputIndex__field_descriptor),
           (Data.ProtoLens.Tag 5, spendingHeight__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SpendDetails'_unknownFields
        (\ x__ y__ -> x__ {_SpendDetails'_unknownFields = y__})
  defMessage
    = SpendDetails'_constructor
        {_SpendDetails'spendingOutpoint = Prelude.Nothing,
         _SpendDetails'rawSpendingTx = Data.ProtoLens.fieldDefault,
         _SpendDetails'spendingTxHash = Data.ProtoLens.fieldDefault,
         _SpendDetails'spendingInputIndex = Data.ProtoLens.fieldDefault,
         _SpendDetails'spendingHeight = Data.ProtoLens.fieldDefault,
         _SpendDetails'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SpendDetails -> Data.ProtoLens.Encoding.Bytes.Parser SpendDetails
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
                                       "spending_outpoint"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"spendingOutpoint") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "raw_spending_tx"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"rawSpendingTx") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "spending_tx_hash"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"spendingTxHash") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "spending_input_index"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"spendingInputIndex") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "spending_height"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"spendingHeight") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SpendDetails"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'spendingOutpoint") _x
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
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"rawSpendingTx") _x
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
                            (Data.ProtoLens.Field.field @"spendingTxHash") _x
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
                               (Data.ProtoLens.Field.field @"spendingInputIndex") _x
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
                                  (Data.ProtoLens.Field.field @"spendingHeight") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                     _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData SpendDetails where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SpendDetails'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SpendDetails'spendingOutpoint x__)
                (Control.DeepSeq.deepseq
                   (_SpendDetails'rawSpendingTx x__)
                   (Control.DeepSeq.deepseq
                      (_SpendDetails'spendingTxHash x__)
                      (Control.DeepSeq.deepseq
                         (_SpendDetails'spendingInputIndex x__)
                         (Control.DeepSeq.deepseq (_SpendDetails'spendingHeight x__) ())))))
{- | Fields :
     
         * 'Proto.Chainrpc.Chainnotifier_Fields.maybe'event' @:: Lens' SpendEvent (Prelude.Maybe SpendEvent'Event)@
         * 'Proto.Chainrpc.Chainnotifier_Fields.maybe'spend' @:: Lens' SpendEvent (Prelude.Maybe SpendDetails)@
         * 'Proto.Chainrpc.Chainnotifier_Fields.spend' @:: Lens' SpendEvent SpendDetails@
         * 'Proto.Chainrpc.Chainnotifier_Fields.maybe'reorg' @:: Lens' SpendEvent (Prelude.Maybe Reorg)@
         * 'Proto.Chainrpc.Chainnotifier_Fields.reorg' @:: Lens' SpendEvent Reorg@ -}
data SpendEvent
  = SpendEvent'_constructor {_SpendEvent'event :: !(Prelude.Maybe SpendEvent'Event),
                             _SpendEvent'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SpendEvent where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SpendEvent
data SpendEvent'Event
  = SpendEvent'Spend !SpendDetails | SpendEvent'Reorg !Reorg
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out SpendEvent'Event
instance Data.ProtoLens.Field.HasField SpendEvent "maybe'event" (Prelude.Maybe SpendEvent'Event) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendEvent'event (\ x__ y__ -> x__ {_SpendEvent'event = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SpendEvent "maybe'spend" (Prelude.Maybe SpendDetails) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendEvent'event (\ x__ y__ -> x__ {_SpendEvent'event = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (SpendEvent'Spend x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap SpendEvent'Spend y__))
instance Data.ProtoLens.Field.HasField SpendEvent "spend" SpendDetails where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendEvent'event (\ x__ y__ -> x__ {_SpendEvent'event = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (SpendEvent'Spend x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap SpendEvent'Spend y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField SpendEvent "maybe'reorg" (Prelude.Maybe Reorg) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendEvent'event (\ x__ y__ -> x__ {_SpendEvent'event = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (SpendEvent'Reorg x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap SpendEvent'Reorg y__))
instance Data.ProtoLens.Field.HasField SpendEvent "reorg" Reorg where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendEvent'event (\ x__ y__ -> x__ {_SpendEvent'event = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (SpendEvent'Reorg x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap SpendEvent'Reorg y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message SpendEvent where
  messageName _ = Data.Text.pack "chainrpc.SpendEvent"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \SpendEvent\DC2.\n\
      \\ENQspend\CAN\SOH \SOH(\v2\SYN.chainrpc.SpendDetailsH\NULR\ENQspend\DC2'\n\
      \\ENQreorg\CAN\STX \SOH(\v2\SI.chainrpc.ReorgH\NULR\ENQreorgB\a\n\
      \\ENQevent"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        spend__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "spend"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SpendDetails)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'spend")) ::
              Data.ProtoLens.FieldDescriptor SpendEvent
        reorg__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reorg"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Reorg)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'reorg")) ::
              Data.ProtoLens.FieldDescriptor SpendEvent
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, spend__field_descriptor),
           (Data.ProtoLens.Tag 2, reorg__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SpendEvent'_unknownFields
        (\ x__ y__ -> x__ {_SpendEvent'_unknownFields = y__})
  defMessage
    = SpendEvent'_constructor
        {_SpendEvent'event = Prelude.Nothing,
         _SpendEvent'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SpendEvent -> Data.ProtoLens.Encoding.Bytes.Parser SpendEvent
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
                                       "spend"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"spend") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "reorg"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"reorg") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SpendEvent"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'event") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (SpendEvent'Spend v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (SpendEvent'Reorg v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SpendEvent where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SpendEvent'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SpendEvent'event x__) ())
instance Control.DeepSeq.NFData SpendEvent'Event where
  rnf (SpendEvent'Spend x__) = Control.DeepSeq.rnf x__
  rnf (SpendEvent'Reorg x__) = Control.DeepSeq.rnf x__
_SpendEvent'Spend ::
  Data.ProtoLens.Prism.Prism' SpendEvent'Event SpendDetails
_SpendEvent'Spend
  = Data.ProtoLens.Prism.prism'
      SpendEvent'Spend
      (\ p__
         -> case p__ of
              (SpendEvent'Spend p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_SpendEvent'Reorg ::
  Data.ProtoLens.Prism.Prism' SpendEvent'Event Reorg
_SpendEvent'Reorg
  = Data.ProtoLens.Prism.prism'
      SpendEvent'Reorg
      (\ p__
         -> case p__ of
              (SpendEvent'Reorg p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Chainrpc.Chainnotifier_Fields.outpoint' @:: Lens' SpendRequest Outpoint@
         * 'Proto.Chainrpc.Chainnotifier_Fields.maybe'outpoint' @:: Lens' SpendRequest (Prelude.Maybe Outpoint)@
         * 'Proto.Chainrpc.Chainnotifier_Fields.script' @:: Lens' SpendRequest Data.ByteString.ByteString@
         * 'Proto.Chainrpc.Chainnotifier_Fields.heightHint' @:: Lens' SpendRequest Data.Word.Word32@ -}
data SpendRequest
  = SpendRequest'_constructor {_SpendRequest'outpoint :: !(Prelude.Maybe Outpoint),
                               _SpendRequest'script :: !Data.ByteString.ByteString,
                               _SpendRequest'heightHint :: !Data.Word.Word32,
                               _SpendRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SpendRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SpendRequest
instance Data.ProtoLens.Field.HasField SpendRequest "outpoint" Outpoint where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendRequest'outpoint
           (\ x__ y__ -> x__ {_SpendRequest'outpoint = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SpendRequest "maybe'outpoint" (Prelude.Maybe Outpoint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendRequest'outpoint
           (\ x__ y__ -> x__ {_SpendRequest'outpoint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SpendRequest "script" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendRequest'script
           (\ x__ y__ -> x__ {_SpendRequest'script = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SpendRequest "heightHint" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SpendRequest'heightHint
           (\ x__ y__ -> x__ {_SpendRequest'heightHint = y__}))
        Prelude.id
instance Data.ProtoLens.Message SpendRequest where
  messageName _ = Data.Text.pack "chainrpc.SpendRequest"
  packedMessageDescriptor _
    = "\n\
      \\fSpendRequest\DC2.\n\
      \\boutpoint\CAN\SOH \SOH(\v2\DC2.chainrpc.OutpointR\boutpoint\DC2\SYN\n\
      \\ACKscript\CAN\STX \SOH(\fR\ACKscript\DC2\US\n\
      \\vheight_hint\CAN\ETX \SOH(\rR\n\
      \heightHint"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        outpoint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outpoint"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Outpoint)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'outpoint")) ::
              Data.ProtoLens.FieldDescriptor SpendRequest
        script__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "script"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"script")) ::
              Data.ProtoLens.FieldDescriptor SpendRequest
        heightHint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "height_hint"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"heightHint")) ::
              Data.ProtoLens.FieldDescriptor SpendRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, outpoint__field_descriptor),
           (Data.ProtoLens.Tag 2, script__field_descriptor),
           (Data.ProtoLens.Tag 3, heightHint__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SpendRequest'_unknownFields
        (\ x__ y__ -> x__ {_SpendRequest'_unknownFields = y__})
  defMessage
    = SpendRequest'_constructor
        {_SpendRequest'outpoint = Prelude.Nothing,
         _SpendRequest'script = Data.ProtoLens.fieldDefault,
         _SpendRequest'heightHint = Data.ProtoLens.fieldDefault,
         _SpendRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SpendRequest -> Data.ProtoLens.Encoding.Bytes.Parser SpendRequest
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
                                       "outpoint"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"outpoint") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "script"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"script") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "height_hint"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"heightHint") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SpendRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'outpoint") _x
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
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"script") _x
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
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"heightHint") _x
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
instance Control.DeepSeq.NFData SpendRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SpendRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SpendRequest'outpoint x__)
                (Control.DeepSeq.deepseq
                   (_SpendRequest'script x__)
                   (Control.DeepSeq.deepseq (_SpendRequest'heightHint x__) ())))
data ChainNotifier = ChainNotifier {}
instance Data.ProtoLens.Service.Types.Service ChainNotifier where
  type ServiceName ChainNotifier = "ChainNotifier"
  type ServicePackage ChainNotifier = "chainrpc"
  type ServiceMethods ChainNotifier = '["registerBlockEpochNtfn",
                                        "registerConfirmationsNtfn",
                                        "registerSpendNtfn"]
  packedServiceDescriptor _
    = "\n\
      \\rChainNotifier\DC2I\n\
      \\EMRegisterConfirmationsNtfn\DC2\NAK.chainrpc.ConfRequest\SUB\DC3.chainrpc.ConfEvent0\SOH\DC2C\n\
      \\DC1RegisterSpendNtfn\DC2\SYN.chainrpc.SpendRequest\SUB\DC4.chainrpc.SpendEvent0\SOH\DC2F\n\
      \\SYNRegisterBlockEpochNtfn\DC2\DC4.chainrpc.BlockEpoch\SUB\DC4.chainrpc.BlockEpoch0\SOH"
instance Data.ProtoLens.Service.Types.HasMethodImpl ChainNotifier "registerConfirmationsNtfn" where
  type MethodName ChainNotifier "registerConfirmationsNtfn" = "RegisterConfirmationsNtfn"
  type MethodInput ChainNotifier "registerConfirmationsNtfn" = ConfRequest
  type MethodOutput ChainNotifier "registerConfirmationsNtfn" = ConfEvent
  type MethodStreamingType ChainNotifier "registerConfirmationsNtfn" = 'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl ChainNotifier "registerSpendNtfn" where
  type MethodName ChainNotifier "registerSpendNtfn" = "RegisterSpendNtfn"
  type MethodInput ChainNotifier "registerSpendNtfn" = SpendRequest
  type MethodOutput ChainNotifier "registerSpendNtfn" = SpendEvent
  type MethodStreamingType ChainNotifier "registerSpendNtfn" = 'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl ChainNotifier "registerBlockEpochNtfn" where
  type MethodName ChainNotifier "registerBlockEpochNtfn" = "RegisterBlockEpochNtfn"
  type MethodInput ChainNotifier "registerBlockEpochNtfn" = BlockEpoch
  type MethodOutput ChainNotifier "registerBlockEpochNtfn" = BlockEpoch
  type MethodStreamingType ChainNotifier "registerBlockEpochNtfn" = 'Data.ProtoLens.Service.Types.ServerStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\FSchainrpc/chainnotifier.proto\DC2\bchainrpc\"w\n\
    \\vConfRequest\DC2\DC2\n\
    \\EOTtxid\CAN\SOH \SOH(\fR\EOTtxid\DC2\SYN\n\
    \\ACKscript\CAN\STX \SOH(\fR\ACKscript\DC2\ESC\n\
    \\tnum_confs\CAN\ETX \SOH(\rR\bnumConfs\DC2\US\n\
    \\vheight_hint\CAN\EOT \SOH(\rR\n\
    \heightHint\"\129\SOH\n\
    \\vConfDetails\DC2\NAK\n\
    \\ACKraw_tx\CAN\SOH \SOH(\fR\ENQrawTx\DC2\GS\n\
    \\n\
    \block_hash\CAN\STX \SOH(\fR\tblockHash\DC2!\n\
    \\fblock_height\CAN\ETX \SOH(\rR\vblockHeight\DC2\EM\n\
    \\btx_index\CAN\EOT \SOH(\rR\atxIndex\"\a\n\
    \\ENQReorg\"j\n\
    \\tConfEvent\DC2+\n\
    \\EOTconf\CAN\SOH \SOH(\v2\NAK.chainrpc.ConfDetailsH\NULR\EOTconf\DC2'\n\
    \\ENQreorg\CAN\STX \SOH(\v2\SI.chainrpc.ReorgH\NULR\ENQreorgB\a\n\
    \\ENQevent\"4\n\
    \\bOutpoint\DC2\DC2\n\
    \\EOThash\CAN\SOH \SOH(\fR\EOThash\DC2\DC4\n\
    \\ENQindex\CAN\STX \SOH(\rR\ENQindex\"w\n\
    \\fSpendRequest\DC2.\n\
    \\boutpoint\CAN\SOH \SOH(\v2\DC2.chainrpc.OutpointR\boutpoint\DC2\SYN\n\
    \\ACKscript\CAN\STX \SOH(\fR\ACKscript\DC2\US\n\
    \\vheight_hint\CAN\ETX \SOH(\rR\n\
    \heightHint\"\252\SOH\n\
    \\fSpendDetails\DC2?\n\
    \\DC1spending_outpoint\CAN\SOH \SOH(\v2\DC2.chainrpc.OutpointR\DLEspendingOutpoint\DC2&\n\
    \\SIraw_spending_tx\CAN\STX \SOH(\fR\rrawSpendingTx\DC2(\n\
    \\DLEspending_tx_hash\CAN\ETX \SOH(\fR\SOspendingTxHash\DC20\n\
    \\DC4spending_input_index\CAN\EOT \SOH(\rR\DC2spendingInputIndex\DC2'\n\
    \\SIspending_height\CAN\ENQ \SOH(\rR\SOspendingHeight\"n\n\
    \\n\
    \SpendEvent\DC2.\n\
    \\ENQspend\CAN\SOH \SOH(\v2\SYN.chainrpc.SpendDetailsH\NULR\ENQspend\DC2'\n\
    \\ENQreorg\CAN\STX \SOH(\v2\SI.chainrpc.ReorgH\NULR\ENQreorgB\a\n\
    \\ENQevent\"8\n\
    \\n\
    \BlockEpoch\DC2\DC2\n\
    \\EOThash\CAN\SOH \SOH(\fR\EOThash\DC2\SYN\n\
    \\ACKheight\CAN\STX \SOH(\rR\ACKheight2\231\SOH\n\
    \\rChainNotifier\DC2I\n\
    \\EMRegisterConfirmationsNtfn\DC2\NAK.chainrpc.ConfRequest\SUB\DC3.chainrpc.ConfEvent0\SOH\DC2C\n\
    \\DC1RegisterSpendNtfn\DC2\SYN.chainrpc.SpendRequest\SUB\DC4.chainrpc.SpendEvent0\SOH\DC2F\n\
    \\SYNRegisterBlockEpochNtfn\DC2\DC4.chainrpc.BlockEpoch\SUB\DC4.chainrpc.BlockEpoch0\SOHB0Z.github.com/lightningnetwork/lnd/lnrpc/chainrpcJ\171-\n\
    \\a\DC2\ENQ\NUL\NUL\181\SOH\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\STX\NUL\DC1\n\
    \\b\n\
    \\SOH\b\DC2\ETX\EOT\NULE\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\EOT\NULE\n\
    \\145\SOH\n\
    \\STX\ACK\NUL\DC2\EOT\b\NUL*\SOH\SUB\132\SOH ChainNotifier is a service that can be used to get information about the\n\
    \ chain backend by registering notifiers for chain events.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\b\b\NAK\n\
    \\250\STX\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\ETX\DC2\EOTK\SUB\236\STX\n\
    \RegisterConfirmationsNtfn is a synchronous response-streaming RPC that\n\
    \registers an intent for a client to be notified once a confirmation request\n\
    \has reached its required number of confirmations on-chain.\n\
    \\n\
    \A client can specify whether the confirmation request should be for a\n\
    \particular transaction by its hash or for an output script by specifying a\n\
    \zero hash.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\DC2\b!\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\DC2#.\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ACK\DC2\ETX\DC29?\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\DC2@I\n\
    \\224\STX\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX\FS\EOTE\SUB\210\STX\n\
    \RegisterSpendNtfn is a synchronous response-streaming RPC that registers an\n\
    \intent for a client to be notification once a spend request has been spent\n\
    \by a transaction that has confirmed on-chain.\n\
    \\n\
    \A client can specify whether the spend request should be for a particular\n\
    \outpoint  or for an output script by specifying a zero outpoint.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX\FS\b\EM\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX\FS\ESC'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ACK\DC2\ETX\FS28\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX\FS9C\n\
    \\185\EOT\n\
    \\EOT\ACK\NUL\STX\STX\DC2\ETX)\EOTH\SUB\171\EOT\n\
    \RegisterBlockEpochNtfn is a synchronous response-streaming RPC that\n\
    \registers an intent for a client to be notified of blocks in the chain. The\n\
    \stream will return a hash and height tuple of a block for each new/stale\n\
    \block in the chain. It is the client's responsibility to determine whether\n\
    \the tuple returned is for a new or stale block in the chain.\n\
    \\n\
    \A client can also request a historical backlog of blocks from a particular\n\
    \point. This allows clients to be idempotent by ensuring that they do not\n\
    \missing processing a single block within the chain.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\SOH\DC2\ETX)\b\RS\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\STX\DC2\ETX) *\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ACK\DC2\ETX)5;\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ETX\DC2\ETX)<F\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT,\NULH\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX,\b\DC3\n\
    \\205\SOH\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX2\EOT\DC3\SUB\191\SOH\n\
    \The transaction hash for which we should request a confirmation notification\n\
    \for. If set to a hash of all zeros, then the confirmation notification will\n\
    \be requested for the script instead.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX2\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX2\n\
    \\SO\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX2\DC1\DC2\n\
    \\136\STX\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX:\EOT\NAK\SUB\250\SOH\n\
    \An output script within a transaction with the hash above which will be used\n\
    \by light clients to match block filters. If the transaction hash is set to a\n\
    \hash of all zeros, then a confirmation notification will be requested for\n\
    \this script instead.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETX:\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX:\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX:\DC3\DC4\n\
    \\142\SOH\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX@\EOT\EM\SUB\128\SOH\n\
    \The number of desired confirmations the transaction/output script should\n\
    \reach before dispatching a confirmation notification.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ENQ\DC2\ETX@\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX@\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX@\ETB\CAN\n\
    \\216\SOH\n\
    \\EOT\EOT\NUL\STX\ETX\DC2\ETXG\EOT\ESC\SUB\202\SOH\n\
    \The earliest height in the chain for which the transaction/output script\n\
    \could have been included in a block. This should in most cases be set to the\n\
    \broadcast height of the transaction/output script.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ENQ\DC2\ETXG\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\SOH\DC2\ETXG\v\SYN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ETX\DC2\ETXG\EM\SUB\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOTJ\NULW\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETXJ\b\DC3\n\
    \:\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETXL\EOT\NAK\SUB- The raw bytes of the confirmed transaction.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETXL\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETXL\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETXL\DC3\DC4\n\
    \X\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETXO\EOT\EM\SUBK The hash of the block in which the confirmed transaction was included in.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETXO\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETXO\n\
    \\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETXO\ETB\CAN\n\
    \[\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETXS\EOT\FS\SUBN The height of the block in which the confirmed transaction was included\n\
    \ in.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETXS\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETXS\v\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETXS\SUB\ESC\n\
    \M\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETXV\EOT\CAN\SUB@ The index of the confirmed transaction within the transaction.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ENQ\DC2\ETXV\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETXV\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETXV\SYN\ETB\n\
    \L\n\
    \\STX\EOT\STX\DC2\EOTY\NUL[\SOH\"@ TODO(wilmer): need to know how the client will use this first.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETXY\b\r\n\
    \\n\
    \\n\
    \\STX\EOT\ETX\DC2\EOT]\NULk\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETX]\b\DC1\n\
    \\f\n\
    \\EOT\EOT\ETX\b\NUL\DC2\EOT^\EOTj\ENQ\n\
    \\f\n\
    \\ENQ\EOT\ETX\b\NUL\SOH\DC2\ETX^\n\
    \\SI\n\
    \b\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETXc\b\GS\SUBU\n\
    \An event that includes the confirmation details of the request\n\
    \(txid/ouput script).\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ACK\DC2\ETXc\b\DC3\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETXc\DC4\CAN\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETXc\ESC\FS\n\
    \]\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\ETXi\b\CAN\SUBP\n\
    \An event send when the transaction of the request is reorged out of the\n\
    \chain.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ACK\DC2\ETXi\b\r\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\ETXi\SO\DC3\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\ETXi\SYN\ETB\n\
    \\n\
    \\n\
    \\STX\EOT\EOT\DC2\EOTm\NULs\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\EOT\SOH\DC2\ETXm\b\DLE\n\
    \+\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\ETXo\EOT\DC3\SUB\RS The hash of the transaction.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\ETXo\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\ETXo\n\
    \\SO\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\ETXo\DC1\DC2\n\
    \>\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\ETXr\EOT\NAK\SUB1 The index of the output within the transaction.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ENQ\DC2\ETXr\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\ETXr\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\ETXr\DC3\DC4\n\
    \\v\n\
    \\STX\EOT\ENQ\DC2\ENQu\NUL\140\SOH\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ENQ\SOH\DC2\ETXu\b\DC4\n\
    \\179\SOH\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\ETX{\EOT\SUB\SUB\165\SOH\n\
    \The outpoint for which we should request a spend notification for. If set to\n\
    \a zero outpoint, then the spend notification will be requested for the\n\
    \script instead.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ACK\DC2\ETX{\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\ETX{\r\NAK\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\ETX{\CAN\EM\n\
    \\229\SOH\n\
    \\EOT\EOT\ENQ\STX\SOH\DC2\EOT\130\SOH\EOT\NAK\SUB\214\SOH\n\
    \The output script for the outpoint above. This will be used by light clients\n\
    \to match block filters. If the outpoint is set to a zero outpoint, then a\n\
    \spend notification will be requested for this script instead.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\ENQ\DC2\EOT\130\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\SOH\DC2\EOT\130\SOH\n\
    \\DLE\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\ETX\DC2\EOT\130\SOH\DC3\DC4\n\
    \\197\SOH\n\
    \\EOT\EOT\ENQ\STX\STX\DC2\EOT\137\SOH\EOT\ESC\SUB\182\SOH\n\
    \The earliest height in the chain for which the outpoint/output script could\n\
    \have been spent. This should in most cases be set to the broadcast height of\n\
    \the outpoint/output script.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\STX\ENQ\DC2\EOT\137\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\STX\SOH\DC2\EOT\137\SOH\v\SYN\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\STX\ETX\DC2\EOT\137\SOH\EM\SUB\n\
    \\f\n\
    \\STX\EOT\ACK\DC2\ACK\142\SOH\NUL\157\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ACK\SOH\DC2\EOT\142\SOH\b\DC4\n\
    \,\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\EOT\144\SOH\EOT#\SUB\RS The outpoint was that spent.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ACK\DC2\EOT\144\SOH\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\EOT\144\SOH\r\RS\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\EOT\144\SOH!\"\n\
    \:\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\EOT\147\SOH\EOT\RS\SUB, The raw bytes of the spending transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ENQ\DC2\EOT\147\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\EOT\147\SOH\n\
    \\EM\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\EOT\147\SOH\FS\GS\n\
    \5\n\
    \\EOT\EOT\ACK\STX\STX\DC2\EOT\150\SOH\EOT\US\SUB' The hash of the spending transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ENQ\DC2\EOT\150\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\SOH\DC2\EOT\150\SOH\n\
    \\SUB\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ETX\DC2\EOT\150\SOH\GS\RS\n\
    \W\n\
    \\EOT\EOT\ACK\STX\ETX\DC2\EOT\153\SOH\EOT$\SUBI The input of the spending transaction that fulfilled the spend request.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\ENQ\DC2\EOT\153\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\SOH\DC2\EOT\153\SOH\v\US\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\ETX\DC2\EOT\153\SOH\"#\n\
    \U\n\
    \\EOT\EOT\ACK\STX\EOT\DC2\EOT\156\SOH\EOT\US\SUBG The height at which the spending transaction was included in a block.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\EOT\ENQ\DC2\EOT\156\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\EOT\SOH\DC2\EOT\156\SOH\v\SUB\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\EOT\ETX\DC2\EOT\156\SOH\GS\RS\n\
    \\f\n\
    \\STX\EOT\a\DC2\ACK\159\SOH\NUL\173\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\a\SOH\DC2\EOT\159\SOH\b\DC2\n\
    \\SO\n\
    \\EOT\EOT\a\b\NUL\DC2\ACK\160\SOH\EOT\172\SOH\ENQ\n\
    \\r\n\
    \\ENQ\EOT\a\b\NUL\SOH\DC2\EOT\160\SOH\n\
    \\SI\n\
    \w\n\
    \\EOT\EOT\a\STX\NUL\DC2\EOT\165\SOH\b\US\SUBi\n\
    \An event that includes the details of the spending transaction of the\n\
    \request (outpoint/output script).\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ACK\DC2\EOT\165\SOH\b\DC4\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\EOT\165\SOH\NAK\SUB\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\EOT\165\SOH\GS\RS\n\
    \h\n\
    \\EOT\EOT\a\STX\SOH\DC2\EOT\171\SOH\b\CAN\SUBZ\n\
    \An event sent when the spending transaction of the request was\n\
    \reorged out of the chain.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ACK\DC2\EOT\171\SOH\b\r\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\SOH\DC2\EOT\171\SOH\SO\DC3\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ETX\DC2\EOT\171\SOH\SYN\ETB\n\
    \\f\n\
    \\STX\EOT\b\DC2\ACK\175\SOH\NUL\181\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\b\SOH\DC2\EOT\175\SOH\b\DC2\n\
    \&\n\
    \\EOT\EOT\b\STX\NUL\DC2\EOT\177\SOH\EOT\DC3\SUB\CAN The hash of the block.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ENQ\DC2\EOT\177\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\SOH\DC2\EOT\177\SOH\n\
    \\SO\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ETX\DC2\EOT\177\SOH\DC1\DC2\n\
    \(\n\
    \\EOT\EOT\b\STX\SOH\DC2\EOT\180\SOH\EOT\SYN\SUB\SUB The height of the block.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\ENQ\DC2\EOT\180\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\SOH\DC2\EOT\180\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\ETX\DC2\EOT\180\SOH\DC4\NAKb\ACKproto3"