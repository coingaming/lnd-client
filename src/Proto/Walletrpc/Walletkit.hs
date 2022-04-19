{- This file was auto-generated from walletrpc/walletkit.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Walletrpc.Walletkit (
        WalletKit(..), Account(), AddrRequest(), AddrResponse(),
        AddressType(..), AddressType(), AddressType'UnrecognizedValue,
        BumpFeeRequest(), BumpFeeResponse(), EstimateFeeRequest(),
        EstimateFeeResponse(), FinalizePsbtRequest(),
        FinalizePsbtResponse(), FundPsbtRequest(),
        FundPsbtRequest'Template(..), FundPsbtRequest'Fees(..),
        _FundPsbtRequest'Psbt, _FundPsbtRequest'Raw,
        _FundPsbtRequest'TargetConf, _FundPsbtRequest'SatPerVbyte,
        FundPsbtResponse(), ImportAccountRequest(),
        ImportAccountResponse(), ImportPublicKeyRequest(),
        ImportPublicKeyResponse(), KeyReq(), LabelTransactionRequest(),
        LabelTransactionResponse(), LeaseOutputRequest(),
        LeaseOutputResponse(), ListAccountsRequest(),
        ListAccountsResponse(), ListLeasesRequest(), ListLeasesResponse(),
        ListSweepsRequest(), ListSweepsResponse(),
        ListSweepsResponse'Sweeps(..),
        _ListSweepsResponse'TransactionDetails,
        _ListSweepsResponse'TransactionIds,
        ListSweepsResponse'TransactionIDs(), ListUnspentRequest(),
        ListUnspentResponse(), PendingSweep(), PendingSweepsRequest(),
        PendingSweepsResponse(), PublishResponse(), ReleaseOutputRequest(),
        ReleaseOutputResponse(), SendOutputsRequest(),
        SendOutputsResponse(), Transaction(), TxTemplate(),
        TxTemplate'OutputsEntry(), UtxoLease(), WitnessType(..),
        WitnessType(), WitnessType'UnrecognizedValue
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
import qualified Proto.Lightning
import qualified Proto.Lnrpc.Ln0
import qualified Proto.Signrpc.Signer
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.name' @:: Lens' Account Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.addressType' @:: Lens' Account AddressType@
         * 'Proto.Walletrpc.Walletkit_Fields.extendedPublicKey' @:: Lens' Account Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.masterKeyFingerprint' @:: Lens' Account Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.derivationPath' @:: Lens' Account Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.externalKeyCount' @:: Lens' Account Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.internalKeyCount' @:: Lens' Account Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.watchOnly' @:: Lens' Account Prelude.Bool@ -}
data Account
  = Account'_constructor {_Account'name :: !Data.Text.Text,
                          _Account'addressType :: !AddressType,
                          _Account'extendedPublicKey :: !Data.Text.Text,
                          _Account'masterKeyFingerprint :: !Data.ByteString.ByteString,
                          _Account'derivationPath :: !Data.Text.Text,
                          _Account'externalKeyCount :: !Data.Word.Word32,
                          _Account'internalKeyCount :: !Data.Word.Word32,
                          _Account'watchOnly :: !Prelude.Bool,
                          _Account'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show Account where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out Account
instance Data.ProtoLens.Field.HasField Account "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Account'name (\ x__ y__ -> x__ {_Account'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Account "addressType" AddressType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Account'addressType
           (\ x__ y__ -> x__ {_Account'addressType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Account "extendedPublicKey" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Account'extendedPublicKey
           (\ x__ y__ -> x__ {_Account'extendedPublicKey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Account "masterKeyFingerprint" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Account'masterKeyFingerprint
           (\ x__ y__ -> x__ {_Account'masterKeyFingerprint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Account "derivationPath" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Account'derivationPath
           (\ x__ y__ -> x__ {_Account'derivationPath = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Account "externalKeyCount" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Account'externalKeyCount
           (\ x__ y__ -> x__ {_Account'externalKeyCount = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Account "internalKeyCount" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Account'internalKeyCount
           (\ x__ y__ -> x__ {_Account'internalKeyCount = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Account "watchOnly" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Account'watchOnly (\ x__ y__ -> x__ {_Account'watchOnly = y__}))
        Prelude.id
instance Data.ProtoLens.Message Account where
  messageName _ = Data.Text.pack "walletrpc.Account"
  packedMessageDescriptor _
    = "\n\
      \\aAccount\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC29\n\
      \\faddress_type\CAN\STX \SOH(\SO2\SYN.walletrpc.AddressTypeR\vaddressType\DC2.\n\
      \\DC3extended_public_key\CAN\ETX \SOH(\tR\DC1extendedPublicKey\DC24\n\
      \\SYNmaster_key_fingerprint\CAN\EOT \SOH(\fR\DC4masterKeyFingerprint\DC2'\n\
      \\SIderivation_path\CAN\ENQ \SOH(\tR\SOderivationPath\DC2,\n\
      \\DC2external_key_count\CAN\ACK \SOH(\rR\DLEexternalKeyCount\DC2,\n\
      \\DC2internal_key_count\CAN\a \SOH(\rR\DLEinternalKeyCount\DC2\GS\n\
      \\n\
      \watch_only\CAN\b \SOH(\bR\twatchOnly"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Account
        addressType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "address_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor AddressType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"addressType")) ::
              Data.ProtoLens.FieldDescriptor Account
        extendedPublicKey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "extended_public_key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"extendedPublicKey")) ::
              Data.ProtoLens.FieldDescriptor Account
        masterKeyFingerprint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "master_key_fingerprint"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"masterKeyFingerprint")) ::
              Data.ProtoLens.FieldDescriptor Account
        derivationPath__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "derivation_path"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"derivationPath")) ::
              Data.ProtoLens.FieldDescriptor Account
        externalKeyCount__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "external_key_count"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"externalKeyCount")) ::
              Data.ProtoLens.FieldDescriptor Account
        internalKeyCount__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "internal_key_count"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"internalKeyCount")) ::
              Data.ProtoLens.FieldDescriptor Account
        watchOnly__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "watch_only"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"watchOnly")) ::
              Data.ProtoLens.FieldDescriptor Account
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, addressType__field_descriptor),
           (Data.ProtoLens.Tag 3, extendedPublicKey__field_descriptor),
           (Data.ProtoLens.Tag 4, masterKeyFingerprint__field_descriptor),
           (Data.ProtoLens.Tag 5, derivationPath__field_descriptor),
           (Data.ProtoLens.Tag 6, externalKeyCount__field_descriptor),
           (Data.ProtoLens.Tag 7, internalKeyCount__field_descriptor),
           (Data.ProtoLens.Tag 8, watchOnly__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Account'_unknownFields
        (\ x__ y__ -> x__ {_Account'_unknownFields = y__})
  defMessage
    = Account'_constructor
        {_Account'name = Data.ProtoLens.fieldDefault,
         _Account'addressType = Data.ProtoLens.fieldDefault,
         _Account'extendedPublicKey = Data.ProtoLens.fieldDefault,
         _Account'masterKeyFingerprint = Data.ProtoLens.fieldDefault,
         _Account'derivationPath = Data.ProtoLens.fieldDefault,
         _Account'externalKeyCount = Data.ProtoLens.fieldDefault,
         _Account'internalKeyCount = Data.ProtoLens.fieldDefault,
         _Account'watchOnly = Data.ProtoLens.fieldDefault,
         _Account'_unknownFields = []}
  parseMessage
    = let
        loop :: Account -> Data.ProtoLens.Encoding.Bytes.Parser Account
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
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "address_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"addressType") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "extended_public_key"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"extendedPublicKey") y x)
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "master_key_fingerprint"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"masterKeyFingerprint") y x)
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
                                       "derivation_path"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"derivationPath") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "external_key_count"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"externalKeyCount") y x)
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "internal_key_count"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"internalKeyCount") y x)
                        64
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "watch_only"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"watchOnly") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Account"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
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
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"addressType") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                            Prelude.fromEnum _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"extendedPublicKey") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"masterKeyFingerprint") _x
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
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"derivationPath") _x
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
                                                (Prelude.fromIntegral (Data.ByteString.length bs)))
                                             (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                     Data.Text.Encoding.encodeUtf8 _v))
                         ((Data.Monoid.<>)
                            (let
                               _v
                                 = Lens.Family2.view
                                     (Data.ProtoLens.Field.field @"externalKeyCount") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                        _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"internalKeyCount") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           Prelude.fromIntegral _v))
                               ((Data.Monoid.<>)
                                  (let
                                     _v
                                       = Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"watchOnly") _x
                                   in
                                     if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                         Data.Monoid.mempty
                                     else
                                         (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt 64)
                                           ((Prelude..)
                                              Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (\ b -> if b then 1 else 0) _v))
                                  (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                     (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))))
instance Control.DeepSeq.NFData Account where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Account'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Account'name x__)
                (Control.DeepSeq.deepseq
                   (_Account'addressType x__)
                   (Control.DeepSeq.deepseq
                      (_Account'extendedPublicKey x__)
                      (Control.DeepSeq.deepseq
                         (_Account'masterKeyFingerprint x__)
                         (Control.DeepSeq.deepseq
                            (_Account'derivationPath x__)
                            (Control.DeepSeq.deepseq
                               (_Account'externalKeyCount x__)
                               (Control.DeepSeq.deepseq
                                  (_Account'internalKeyCount x__)
                                  (Control.DeepSeq.deepseq (_Account'watchOnly x__) ()))))))))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.account' @:: Lens' AddrRequest Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.type'' @:: Lens' AddrRequest AddressType@
         * 'Proto.Walletrpc.Walletkit_Fields.change' @:: Lens' AddrRequest Prelude.Bool@ -}
data AddrRequest
  = AddrRequest'_constructor {_AddrRequest'account :: !Data.Text.Text,
                              _AddrRequest'type' :: !AddressType,
                              _AddrRequest'change :: !Prelude.Bool,
                              _AddrRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show AddrRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out AddrRequest
instance Data.ProtoLens.Field.HasField AddrRequest "account" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddrRequest'account
           (\ x__ y__ -> x__ {_AddrRequest'account = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddrRequest "type'" AddressType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddrRequest'type' (\ x__ y__ -> x__ {_AddrRequest'type' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddrRequest "change" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddrRequest'change (\ x__ y__ -> x__ {_AddrRequest'change = y__}))
        Prelude.id
instance Data.ProtoLens.Message AddrRequest where
  messageName _ = Data.Text.pack "walletrpc.AddrRequest"
  packedMessageDescriptor _
    = "\n\
      \\vAddrRequest\DC2\CAN\n\
      \\aaccount\CAN\SOH \SOH(\tR\aaccount\DC2*\n\
      \\EOTtype\CAN\STX \SOH(\SO2\SYN.walletrpc.AddressTypeR\EOTtype\DC2\SYN\n\
      \\ACKchange\CAN\ETX \SOH(\bR\ACKchange"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        account__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "account"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"account")) ::
              Data.ProtoLens.FieldDescriptor AddrRequest
        type'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor AddressType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"type'")) ::
              Data.ProtoLens.FieldDescriptor AddrRequest
        change__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "change"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"change")) ::
              Data.ProtoLens.FieldDescriptor AddrRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, account__field_descriptor),
           (Data.ProtoLens.Tag 2, type'__field_descriptor),
           (Data.ProtoLens.Tag 3, change__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AddrRequest'_unknownFields
        (\ x__ y__ -> x__ {_AddrRequest'_unknownFields = y__})
  defMessage
    = AddrRequest'_constructor
        {_AddrRequest'account = Data.ProtoLens.fieldDefault,
         _AddrRequest'type' = Data.ProtoLens.fieldDefault,
         _AddrRequest'change = Data.ProtoLens.fieldDefault,
         _AddrRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          AddrRequest -> Data.ProtoLens.Encoding.Bytes.Parser AddrRequest
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
                                       "account"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"account") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "type"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"type'") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "change"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"change") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "AddrRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"account") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"type'") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                            Prelude.fromEnum _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"change") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                               _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData AddrRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AddrRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_AddrRequest'account x__)
                (Control.DeepSeq.deepseq
                   (_AddrRequest'type' x__)
                   (Control.DeepSeq.deepseq (_AddrRequest'change x__) ())))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.addr' @:: Lens' AddrResponse Data.Text.Text@ -}
data AddrResponse
  = AddrResponse'_constructor {_AddrResponse'addr :: !Data.Text.Text,
                               _AddrResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show AddrResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out AddrResponse
instance Data.ProtoLens.Field.HasField AddrResponse "addr" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddrResponse'addr (\ x__ y__ -> x__ {_AddrResponse'addr = y__}))
        Prelude.id
instance Data.ProtoLens.Message AddrResponse where
  messageName _ = Data.Text.pack "walletrpc.AddrResponse"
  packedMessageDescriptor _
    = "\n\
      \\fAddrResponse\DC2\DC2\n\
      \\EOTaddr\CAN\SOH \SOH(\tR\EOTaddr"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        addr__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "addr"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"addr")) ::
              Data.ProtoLens.FieldDescriptor AddrResponse
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, addr__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AddrResponse'_unknownFields
        (\ x__ y__ -> x__ {_AddrResponse'_unknownFields = y__})
  defMessage
    = AddrResponse'_constructor
        {_AddrResponse'addr = Data.ProtoLens.fieldDefault,
         _AddrResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          AddrResponse -> Data.ProtoLens.Encoding.Bytes.Parser AddrResponse
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
                                       "addr"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"addr") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "AddrResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"addr") _x
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
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData AddrResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AddrResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_AddrResponse'addr x__) ())
newtype AddressType'UnrecognizedValue
  = AddressType'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq,
                  Prelude.Ord,
                  Prelude.Show,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out AddressType'UnrecognizedValue
data AddressType
  = UNKNOWN |
    WITNESS_PUBKEY_HASH |
    NESTED_WITNESS_PUBKEY_HASH |
    HYBRID_NESTED_WITNESS_PUBKEY_HASH |
    AddressType'Unrecognized !AddressType'UnrecognizedValue
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Data.ProtoLens.MessageEnum AddressType where
  maybeToEnum 0 = Prelude.Just UNKNOWN
  maybeToEnum 1 = Prelude.Just WITNESS_PUBKEY_HASH
  maybeToEnum 2 = Prelude.Just NESTED_WITNESS_PUBKEY_HASH
  maybeToEnum 3 = Prelude.Just HYBRID_NESTED_WITNESS_PUBKEY_HASH
  maybeToEnum k
    = Prelude.Just
        (AddressType'Unrecognized
           (AddressType'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UNKNOWN = "UNKNOWN"
  showEnum WITNESS_PUBKEY_HASH = "WITNESS_PUBKEY_HASH"
  showEnum NESTED_WITNESS_PUBKEY_HASH = "NESTED_WITNESS_PUBKEY_HASH"
  showEnum HYBRID_NESTED_WITNESS_PUBKEY_HASH
    = "HYBRID_NESTED_WITNESS_PUBKEY_HASH"
  showEnum
    (AddressType'Unrecognized (AddressType'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UNKNOWN" = Prelude.Just UNKNOWN
    | (Prelude.==) k "WITNESS_PUBKEY_HASH"
    = Prelude.Just WITNESS_PUBKEY_HASH
    | (Prelude.==) k "NESTED_WITNESS_PUBKEY_HASH"
    = Prelude.Just NESTED_WITNESS_PUBKEY_HASH
    | (Prelude.==) k "HYBRID_NESTED_WITNESS_PUBKEY_HASH"
    = Prelude.Just HYBRID_NESTED_WITNESS_PUBKEY_HASH
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded AddressType where
  minBound = UNKNOWN
  maxBound = HYBRID_NESTED_WITNESS_PUBKEY_HASH
instance Prelude.Enum AddressType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum AddressType: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UNKNOWN = 0
  fromEnum WITNESS_PUBKEY_HASH = 1
  fromEnum NESTED_WITNESS_PUBKEY_HASH = 2
  fromEnum HYBRID_NESTED_WITNESS_PUBKEY_HASH = 3
  fromEnum
    (AddressType'Unrecognized (AddressType'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ HYBRID_NESTED_WITNESS_PUBKEY_HASH
    = Prelude.error
        "AddressType.succ: bad argument HYBRID_NESTED_WITNESS_PUBKEY_HASH. This value would be out of bounds."
  succ UNKNOWN = WITNESS_PUBKEY_HASH
  succ WITNESS_PUBKEY_HASH = NESTED_WITNESS_PUBKEY_HASH
  succ NESTED_WITNESS_PUBKEY_HASH = HYBRID_NESTED_WITNESS_PUBKEY_HASH
  succ (AddressType'Unrecognized _)
    = Prelude.error
        "AddressType.succ: bad argument: unrecognized value"
  pred UNKNOWN
    = Prelude.error
        "AddressType.pred: bad argument UNKNOWN. This value would be out of bounds."
  pred WITNESS_PUBKEY_HASH = UNKNOWN
  pred NESTED_WITNESS_PUBKEY_HASH = WITNESS_PUBKEY_HASH
  pred HYBRID_NESTED_WITNESS_PUBKEY_HASH = NESTED_WITNESS_PUBKEY_HASH
  pred (AddressType'Unrecognized _)
    = Prelude.error
        "AddressType.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault AddressType where
  fieldDefault = UNKNOWN
instance Control.DeepSeq.NFData AddressType where
  rnf x__ = Prelude.seq x__ ()
instance Text.PrettyPrint.GenericPretty.Out AddressType
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.outpoint' @:: Lens' BumpFeeRequest Proto.Lnrpc.Ln0.OutPoint@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'outpoint' @:: Lens' BumpFeeRequest (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint)@
         * 'Proto.Walletrpc.Walletkit_Fields.targetConf' @:: Lens' BumpFeeRequest Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.satPerByte' @:: Lens' BumpFeeRequest Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.force' @:: Lens' BumpFeeRequest Prelude.Bool@
         * 'Proto.Walletrpc.Walletkit_Fields.satPerVbyte' @:: Lens' BumpFeeRequest Data.Word.Word64@ -}
data BumpFeeRequest
  = BumpFeeRequest'_constructor {_BumpFeeRequest'outpoint :: !(Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint),
                                 _BumpFeeRequest'targetConf :: !Data.Word.Word32,
                                 _BumpFeeRequest'satPerByte :: !Data.Word.Word32,
                                 _BumpFeeRequest'force :: !Prelude.Bool,
                                 _BumpFeeRequest'satPerVbyte :: !Data.Word.Word64,
                                 _BumpFeeRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show BumpFeeRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out BumpFeeRequest
instance Data.ProtoLens.Field.HasField BumpFeeRequest "outpoint" Proto.Lnrpc.Ln0.OutPoint where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BumpFeeRequest'outpoint
           (\ x__ y__ -> x__ {_BumpFeeRequest'outpoint = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField BumpFeeRequest "maybe'outpoint" (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BumpFeeRequest'outpoint
           (\ x__ y__ -> x__ {_BumpFeeRequest'outpoint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField BumpFeeRequest "targetConf" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BumpFeeRequest'targetConf
           (\ x__ y__ -> x__ {_BumpFeeRequest'targetConf = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField BumpFeeRequest "satPerByte" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BumpFeeRequest'satPerByte
           (\ x__ y__ -> x__ {_BumpFeeRequest'satPerByte = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField BumpFeeRequest "force" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BumpFeeRequest'force
           (\ x__ y__ -> x__ {_BumpFeeRequest'force = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField BumpFeeRequest "satPerVbyte" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BumpFeeRequest'satPerVbyte
           (\ x__ y__ -> x__ {_BumpFeeRequest'satPerVbyte = y__}))
        Prelude.id
instance Data.ProtoLens.Message BumpFeeRequest where
  messageName _ = Data.Text.pack "walletrpc.BumpFeeRequest"
  packedMessageDescriptor _
    = "\n\
      \\SOBumpFeeRequest\DC2+\n\
      \\boutpoint\CAN\SOH \SOH(\v2\SI.lnrpc.OutPointR\boutpoint\DC2\US\n\
      \\vtarget_conf\CAN\STX \SOH(\rR\n\
      \targetConf\DC2$\n\
      \\fsat_per_byte\CAN\ETX \SOH(\rR\n\
      \satPerByteB\STX\CAN\SOH\DC2\DC4\n\
      \\ENQforce\CAN\EOT \SOH(\bR\ENQforce\DC2\"\n\
      \\rsat_per_vbyte\CAN\ENQ \SOH(\EOTR\vsatPerVbyte"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        outpoint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outpoint"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Lnrpc.Ln0.OutPoint)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'outpoint")) ::
              Data.ProtoLens.FieldDescriptor BumpFeeRequest
        targetConf__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "target_conf"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"targetConf")) ::
              Data.ProtoLens.FieldDescriptor BumpFeeRequest
        satPerByte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sat_per_byte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"satPerByte")) ::
              Data.ProtoLens.FieldDescriptor BumpFeeRequest
        force__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "force"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"force")) ::
              Data.ProtoLens.FieldDescriptor BumpFeeRequest
        satPerVbyte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sat_per_vbyte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"satPerVbyte")) ::
              Data.ProtoLens.FieldDescriptor BumpFeeRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, outpoint__field_descriptor),
           (Data.ProtoLens.Tag 2, targetConf__field_descriptor),
           (Data.ProtoLens.Tag 3, satPerByte__field_descriptor),
           (Data.ProtoLens.Tag 4, force__field_descriptor),
           (Data.ProtoLens.Tag 5, satPerVbyte__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _BumpFeeRequest'_unknownFields
        (\ x__ y__ -> x__ {_BumpFeeRequest'_unknownFields = y__})
  defMessage
    = BumpFeeRequest'_constructor
        {_BumpFeeRequest'outpoint = Prelude.Nothing,
         _BumpFeeRequest'targetConf = Data.ProtoLens.fieldDefault,
         _BumpFeeRequest'satPerByte = Data.ProtoLens.fieldDefault,
         _BumpFeeRequest'force = Data.ProtoLens.fieldDefault,
         _BumpFeeRequest'satPerVbyte = Data.ProtoLens.fieldDefault,
         _BumpFeeRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          BumpFeeRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser BumpFeeRequest
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
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "target_conf"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"targetConf") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sat_per_byte"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"satPerByte") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "force"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"force") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "sat_per_vbyte"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"satPerVbyte") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "BumpFeeRequest"
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
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"targetConf") _x
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
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"satPerByte") _x
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
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"force") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (\ b -> if b then 1 else 0) _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view (Data.ProtoLens.Field.field @"satPerVbyte") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData BumpFeeRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_BumpFeeRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_BumpFeeRequest'outpoint x__)
                (Control.DeepSeq.deepseq
                   (_BumpFeeRequest'targetConf x__)
                   (Control.DeepSeq.deepseq
                      (_BumpFeeRequest'satPerByte x__)
                      (Control.DeepSeq.deepseq
                         (_BumpFeeRequest'force x__)
                         (Control.DeepSeq.deepseq (_BumpFeeRequest'satPerVbyte x__) ())))))
{- | Fields :
      -}
data BumpFeeResponse
  = BumpFeeResponse'_constructor {_BumpFeeResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show BumpFeeResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out BumpFeeResponse
instance Data.ProtoLens.Message BumpFeeResponse where
  messageName _ = Data.Text.pack "walletrpc.BumpFeeResponse"
  packedMessageDescriptor _
    = "\n\
      \\SIBumpFeeResponse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _BumpFeeResponse'_unknownFields
        (\ x__ y__ -> x__ {_BumpFeeResponse'_unknownFields = y__})
  defMessage
    = BumpFeeResponse'_constructor
        {_BumpFeeResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          BumpFeeResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser BumpFeeResponse
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
          (do loop Data.ProtoLens.defMessage) "BumpFeeResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData BumpFeeResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq (_BumpFeeResponse'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.confTarget' @:: Lens' EstimateFeeRequest Data.Int.Int32@ -}
data EstimateFeeRequest
  = EstimateFeeRequest'_constructor {_EstimateFeeRequest'confTarget :: !Data.Int.Int32,
                                     _EstimateFeeRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show EstimateFeeRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out EstimateFeeRequest
instance Data.ProtoLens.Field.HasField EstimateFeeRequest "confTarget" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EstimateFeeRequest'confTarget
           (\ x__ y__ -> x__ {_EstimateFeeRequest'confTarget = y__}))
        Prelude.id
instance Data.ProtoLens.Message EstimateFeeRequest where
  messageName _ = Data.Text.pack "walletrpc.EstimateFeeRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC2EstimateFeeRequest\DC2\US\n\
      \\vconf_target\CAN\SOH \SOH(\ENQR\n\
      \confTarget"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        confTarget__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "conf_target"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"confTarget")) ::
              Data.ProtoLens.FieldDescriptor EstimateFeeRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, confTarget__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _EstimateFeeRequest'_unknownFields
        (\ x__ y__ -> x__ {_EstimateFeeRequest'_unknownFields = y__})
  defMessage
    = EstimateFeeRequest'_constructor
        {_EstimateFeeRequest'confTarget = Data.ProtoLens.fieldDefault,
         _EstimateFeeRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          EstimateFeeRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser EstimateFeeRequest
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
                                       "conf_target"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"confTarget") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "EstimateFeeRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"confTarget") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData EstimateFeeRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_EstimateFeeRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq (_EstimateFeeRequest'confTarget x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.satPerKw' @:: Lens' EstimateFeeResponse Data.Int.Int64@ -}
data EstimateFeeResponse
  = EstimateFeeResponse'_constructor {_EstimateFeeResponse'satPerKw :: !Data.Int.Int64,
                                      _EstimateFeeResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show EstimateFeeResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out EstimateFeeResponse
instance Data.ProtoLens.Field.HasField EstimateFeeResponse "satPerKw" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EstimateFeeResponse'satPerKw
           (\ x__ y__ -> x__ {_EstimateFeeResponse'satPerKw = y__}))
        Prelude.id
instance Data.ProtoLens.Message EstimateFeeResponse where
  messageName _ = Data.Text.pack "walletrpc.EstimateFeeResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC3EstimateFeeResponse\DC2\FS\n\
      \\n\
      \sat_per_kw\CAN\SOH \SOH(\ETXR\bsatPerKw"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        satPerKw__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sat_per_kw"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"satPerKw")) ::
              Data.ProtoLens.FieldDescriptor EstimateFeeResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, satPerKw__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _EstimateFeeResponse'_unknownFields
        (\ x__ y__ -> x__ {_EstimateFeeResponse'_unknownFields = y__})
  defMessage
    = EstimateFeeResponse'_constructor
        {_EstimateFeeResponse'satPerKw = Data.ProtoLens.fieldDefault,
         _EstimateFeeResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          EstimateFeeResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser EstimateFeeResponse
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
                                       "sat_per_kw"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"satPerKw") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "EstimateFeeResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"satPerKw") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData EstimateFeeResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_EstimateFeeResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_EstimateFeeResponse'satPerKw x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.fundedPsbt' @:: Lens' FinalizePsbtRequest Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.account' @:: Lens' FinalizePsbtRequest Data.Text.Text@ -}
data FinalizePsbtRequest
  = FinalizePsbtRequest'_constructor {_FinalizePsbtRequest'fundedPsbt :: !Data.ByteString.ByteString,
                                      _FinalizePsbtRequest'account :: !Data.Text.Text,
                                      _FinalizePsbtRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show FinalizePsbtRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out FinalizePsbtRequest
instance Data.ProtoLens.Field.HasField FinalizePsbtRequest "fundedPsbt" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FinalizePsbtRequest'fundedPsbt
           (\ x__ y__ -> x__ {_FinalizePsbtRequest'fundedPsbt = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FinalizePsbtRequest "account" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FinalizePsbtRequest'account
           (\ x__ y__ -> x__ {_FinalizePsbtRequest'account = y__}))
        Prelude.id
instance Data.ProtoLens.Message FinalizePsbtRequest where
  messageName _ = Data.Text.pack "walletrpc.FinalizePsbtRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC3FinalizePsbtRequest\DC2\US\n\
      \\vfunded_psbt\CAN\SOH \SOH(\fR\n\
      \fundedPsbt\DC2\CAN\n\
      \\aaccount\CAN\ENQ \SOH(\tR\aaccount"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        fundedPsbt__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "funded_psbt"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"fundedPsbt")) ::
              Data.ProtoLens.FieldDescriptor FinalizePsbtRequest
        account__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "account"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"account")) ::
              Data.ProtoLens.FieldDescriptor FinalizePsbtRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, fundedPsbt__field_descriptor),
           (Data.ProtoLens.Tag 5, account__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FinalizePsbtRequest'_unknownFields
        (\ x__ y__ -> x__ {_FinalizePsbtRequest'_unknownFields = y__})
  defMessage
    = FinalizePsbtRequest'_constructor
        {_FinalizePsbtRequest'fundedPsbt = Data.ProtoLens.fieldDefault,
         _FinalizePsbtRequest'account = Data.ProtoLens.fieldDefault,
         _FinalizePsbtRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FinalizePsbtRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser FinalizePsbtRequest
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
                                       "funded_psbt"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"fundedPsbt") y x)
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
                                       "account"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"account") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "FinalizePsbtRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"fundedPsbt") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"account") _x
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
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData FinalizePsbtRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FinalizePsbtRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FinalizePsbtRequest'fundedPsbt x__)
                (Control.DeepSeq.deepseq (_FinalizePsbtRequest'account x__) ()))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.signedPsbt' @:: Lens' FinalizePsbtResponse Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.rawFinalTx' @:: Lens' FinalizePsbtResponse Data.ByteString.ByteString@ -}
data FinalizePsbtResponse
  = FinalizePsbtResponse'_constructor {_FinalizePsbtResponse'signedPsbt :: !Data.ByteString.ByteString,
                                       _FinalizePsbtResponse'rawFinalTx :: !Data.ByteString.ByteString,
                                       _FinalizePsbtResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show FinalizePsbtResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out FinalizePsbtResponse
instance Data.ProtoLens.Field.HasField FinalizePsbtResponse "signedPsbt" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FinalizePsbtResponse'signedPsbt
           (\ x__ y__ -> x__ {_FinalizePsbtResponse'signedPsbt = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FinalizePsbtResponse "rawFinalTx" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FinalizePsbtResponse'rawFinalTx
           (\ x__ y__ -> x__ {_FinalizePsbtResponse'rawFinalTx = y__}))
        Prelude.id
instance Data.ProtoLens.Message FinalizePsbtResponse where
  messageName _ = Data.Text.pack "walletrpc.FinalizePsbtResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC4FinalizePsbtResponse\DC2\US\n\
      \\vsigned_psbt\CAN\SOH \SOH(\fR\n\
      \signedPsbt\DC2 \n\
      \\fraw_final_tx\CAN\STX \SOH(\fR\n\
      \rawFinalTx"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        signedPsbt__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "signed_psbt"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"signedPsbt")) ::
              Data.ProtoLens.FieldDescriptor FinalizePsbtResponse
        rawFinalTx__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "raw_final_tx"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"rawFinalTx")) ::
              Data.ProtoLens.FieldDescriptor FinalizePsbtResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, signedPsbt__field_descriptor),
           (Data.ProtoLens.Tag 2, rawFinalTx__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FinalizePsbtResponse'_unknownFields
        (\ x__ y__ -> x__ {_FinalizePsbtResponse'_unknownFields = y__})
  defMessage
    = FinalizePsbtResponse'_constructor
        {_FinalizePsbtResponse'signedPsbt = Data.ProtoLens.fieldDefault,
         _FinalizePsbtResponse'rawFinalTx = Data.ProtoLens.fieldDefault,
         _FinalizePsbtResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FinalizePsbtResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser FinalizePsbtResponse
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
                                       "signed_psbt"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"signedPsbt") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "raw_final_tx"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"rawFinalTx") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "FinalizePsbtResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"signedPsbt") _x
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
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"rawFinalTx") _x
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
instance Control.DeepSeq.NFData FinalizePsbtResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FinalizePsbtResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FinalizePsbtResponse'signedPsbt x__)
                (Control.DeepSeq.deepseq
                   (_FinalizePsbtResponse'rawFinalTx x__) ()))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.account' @:: Lens' FundPsbtRequest Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.minConfs' @:: Lens' FundPsbtRequest Data.Int.Int32@
         * 'Proto.Walletrpc.Walletkit_Fields.spendUnconfirmed' @:: Lens' FundPsbtRequest Prelude.Bool@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'template' @:: Lens' FundPsbtRequest (Prelude.Maybe FundPsbtRequest'Template)@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'psbt' @:: Lens' FundPsbtRequest (Prelude.Maybe Data.ByteString.ByteString)@
         * 'Proto.Walletrpc.Walletkit_Fields.psbt' @:: Lens' FundPsbtRequest Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'raw' @:: Lens' FundPsbtRequest (Prelude.Maybe TxTemplate)@
         * 'Proto.Walletrpc.Walletkit_Fields.raw' @:: Lens' FundPsbtRequest TxTemplate@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'fees' @:: Lens' FundPsbtRequest (Prelude.Maybe FundPsbtRequest'Fees)@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'targetConf' @:: Lens' FundPsbtRequest (Prelude.Maybe Data.Word.Word32)@
         * 'Proto.Walletrpc.Walletkit_Fields.targetConf' @:: Lens' FundPsbtRequest Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'satPerVbyte' @:: Lens' FundPsbtRequest (Prelude.Maybe Data.Word.Word64)@
         * 'Proto.Walletrpc.Walletkit_Fields.satPerVbyte' @:: Lens' FundPsbtRequest Data.Word.Word64@ -}
data FundPsbtRequest
  = FundPsbtRequest'_constructor {_FundPsbtRequest'account :: !Data.Text.Text,
                                  _FundPsbtRequest'minConfs :: !Data.Int.Int32,
                                  _FundPsbtRequest'spendUnconfirmed :: !Prelude.Bool,
                                  _FundPsbtRequest'template :: !(Prelude.Maybe FundPsbtRequest'Template),
                                  _FundPsbtRequest'fees :: !(Prelude.Maybe FundPsbtRequest'Fees),
                                  _FundPsbtRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show FundPsbtRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out FundPsbtRequest
data FundPsbtRequest'Template
  = FundPsbtRequest'Psbt !Data.ByteString.ByteString |
    FundPsbtRequest'Raw !TxTemplate
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
data FundPsbtRequest'Fees
  = FundPsbtRequest'TargetConf !Data.Word.Word32 |
    FundPsbtRequest'SatPerVbyte !Data.Word.Word64
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out FundPsbtRequest'Template
instance Text.PrettyPrint.GenericPretty.Out FundPsbtRequest'Fees
instance Data.ProtoLens.Field.HasField FundPsbtRequest "account" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'account
           (\ x__ y__ -> x__ {_FundPsbtRequest'account = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FundPsbtRequest "minConfs" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'minConfs
           (\ x__ y__ -> x__ {_FundPsbtRequest'minConfs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FundPsbtRequest "spendUnconfirmed" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'spendUnconfirmed
           (\ x__ y__ -> x__ {_FundPsbtRequest'spendUnconfirmed = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FundPsbtRequest "maybe'template" (Prelude.Maybe FundPsbtRequest'Template) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'template
           (\ x__ y__ -> x__ {_FundPsbtRequest'template = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FundPsbtRequest "maybe'psbt" (Prelude.Maybe Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'template
           (\ x__ y__ -> x__ {_FundPsbtRequest'template = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (FundPsbtRequest'Psbt x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap FundPsbtRequest'Psbt y__))
instance Data.ProtoLens.Field.HasField FundPsbtRequest "psbt" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'template
           (\ x__ y__ -> x__ {_FundPsbtRequest'template = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (FundPsbtRequest'Psbt x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap FundPsbtRequest'Psbt y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField FundPsbtRequest "maybe'raw" (Prelude.Maybe TxTemplate) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'template
           (\ x__ y__ -> x__ {_FundPsbtRequest'template = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (FundPsbtRequest'Raw x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap FundPsbtRequest'Raw y__))
instance Data.ProtoLens.Field.HasField FundPsbtRequest "raw" TxTemplate where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'template
           (\ x__ y__ -> x__ {_FundPsbtRequest'template = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (FundPsbtRequest'Raw x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap FundPsbtRequest'Raw y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField FundPsbtRequest "maybe'fees" (Prelude.Maybe FundPsbtRequest'Fees) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'fees
           (\ x__ y__ -> x__ {_FundPsbtRequest'fees = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FundPsbtRequest "maybe'targetConf" (Prelude.Maybe Data.Word.Word32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'fees
           (\ x__ y__ -> x__ {_FundPsbtRequest'fees = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (FundPsbtRequest'TargetConf x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap FundPsbtRequest'TargetConf y__))
instance Data.ProtoLens.Field.HasField FundPsbtRequest "targetConf" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'fees
           (\ x__ y__ -> x__ {_FundPsbtRequest'fees = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (FundPsbtRequest'TargetConf x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap FundPsbtRequest'TargetConf y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField FundPsbtRequest "maybe'satPerVbyte" (Prelude.Maybe Data.Word.Word64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'fees
           (\ x__ y__ -> x__ {_FundPsbtRequest'fees = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (FundPsbtRequest'SatPerVbyte x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap FundPsbtRequest'SatPerVbyte y__))
instance Data.ProtoLens.Field.HasField FundPsbtRequest "satPerVbyte" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtRequest'fees
           (\ x__ y__ -> x__ {_FundPsbtRequest'fees = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (FundPsbtRequest'SatPerVbyte x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap FundPsbtRequest'SatPerVbyte y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Message FundPsbtRequest where
  messageName _ = Data.Text.pack "walletrpc.FundPsbtRequest"
  packedMessageDescriptor _
    = "\n\
      \\SIFundPsbtRequest\DC2\DC4\n\
      \\EOTpsbt\CAN\SOH \SOH(\fH\NULR\EOTpsbt\DC2)\n\
      \\ETXraw\CAN\STX \SOH(\v2\NAK.walletrpc.TxTemplateH\NULR\ETXraw\DC2!\n\
      \\vtarget_conf\CAN\ETX \SOH(\rH\SOHR\n\
      \targetConf\DC2$\n\
      \\rsat_per_vbyte\CAN\EOT \SOH(\EOTH\SOHR\vsatPerVbyte\DC2\CAN\n\
      \\aaccount\CAN\ENQ \SOH(\tR\aaccount\DC2\ESC\n\
      \\tmin_confs\CAN\ACK \SOH(\ENQR\bminConfs\DC2+\n\
      \\DC1spend_unconfirmed\CAN\a \SOH(\bR\DLEspendUnconfirmedB\n\
      \\n\
      \\btemplateB\ACK\n\
      \\EOTfees"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        account__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "account"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"account")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtRequest
        minConfs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "min_confs"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"minConfs")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtRequest
        spendUnconfirmed__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "spend_unconfirmed"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"spendUnconfirmed")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtRequest
        psbt__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "psbt"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'psbt")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtRequest
        raw__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "raw"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor TxTemplate)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'raw")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtRequest
        targetConf__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "target_conf"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'targetConf")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtRequest
        satPerVbyte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sat_per_vbyte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'satPerVbyte")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 5, account__field_descriptor),
           (Data.ProtoLens.Tag 6, minConfs__field_descriptor),
           (Data.ProtoLens.Tag 7, spendUnconfirmed__field_descriptor),
           (Data.ProtoLens.Tag 1, psbt__field_descriptor),
           (Data.ProtoLens.Tag 2, raw__field_descriptor),
           (Data.ProtoLens.Tag 3, targetConf__field_descriptor),
           (Data.ProtoLens.Tag 4, satPerVbyte__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FundPsbtRequest'_unknownFields
        (\ x__ y__ -> x__ {_FundPsbtRequest'_unknownFields = y__})
  defMessage
    = FundPsbtRequest'_constructor
        {_FundPsbtRequest'account = Data.ProtoLens.fieldDefault,
         _FundPsbtRequest'minConfs = Data.ProtoLens.fieldDefault,
         _FundPsbtRequest'spendUnconfirmed = Data.ProtoLens.fieldDefault,
         _FundPsbtRequest'template = Prelude.Nothing,
         _FundPsbtRequest'fees = Prelude.Nothing,
         _FundPsbtRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FundPsbtRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser FundPsbtRequest
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
                                       "account"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"account") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "min_confs"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"minConfs") y x)
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "spend_unconfirmed"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"spendUnconfirmed") y x)
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "psbt"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"psbt") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "raw"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"raw") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "target_conf"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"targetConf") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "sat_per_vbyte"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"satPerVbyte") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "FundPsbtRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"account") _x
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
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"minConfs") _x
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
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"spendUnconfirmed") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                               _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'template") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just (FundPsbtRequest'Psbt v))
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                                ((\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   v)
                         (Prelude.Just (FundPsbtRequest'Raw v))
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'fees") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just (FundPsbtRequest'TargetConf v))
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                      v)
                            (Prelude.Just (FundPsbtRequest'SatPerVbyte v))
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData FundPsbtRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FundPsbtRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FundPsbtRequest'account x__)
                (Control.DeepSeq.deepseq
                   (_FundPsbtRequest'minConfs x__)
                   (Control.DeepSeq.deepseq
                      (_FundPsbtRequest'spendUnconfirmed x__)
                      (Control.DeepSeq.deepseq
                         (_FundPsbtRequest'template x__)
                         (Control.DeepSeq.deepseq (_FundPsbtRequest'fees x__) ())))))
instance Control.DeepSeq.NFData FundPsbtRequest'Template where
  rnf (FundPsbtRequest'Psbt x__) = Control.DeepSeq.rnf x__
  rnf (FundPsbtRequest'Raw x__) = Control.DeepSeq.rnf x__
instance Control.DeepSeq.NFData FundPsbtRequest'Fees where
  rnf (FundPsbtRequest'TargetConf x__) = Control.DeepSeq.rnf x__
  rnf (FundPsbtRequest'SatPerVbyte x__) = Control.DeepSeq.rnf x__
_FundPsbtRequest'Psbt ::
  Data.ProtoLens.Prism.Prism' FundPsbtRequest'Template Data.ByteString.ByteString
_FundPsbtRequest'Psbt
  = Data.ProtoLens.Prism.prism'
      FundPsbtRequest'Psbt
      (\ p__
         -> case p__ of
              (FundPsbtRequest'Psbt p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_FundPsbtRequest'Raw ::
  Data.ProtoLens.Prism.Prism' FundPsbtRequest'Template TxTemplate
_FundPsbtRequest'Raw
  = Data.ProtoLens.Prism.prism'
      FundPsbtRequest'Raw
      (\ p__
         -> case p__ of
              (FundPsbtRequest'Raw p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_FundPsbtRequest'TargetConf ::
  Data.ProtoLens.Prism.Prism' FundPsbtRequest'Fees Data.Word.Word32
_FundPsbtRequest'TargetConf
  = Data.ProtoLens.Prism.prism'
      FundPsbtRequest'TargetConf
      (\ p__
         -> case p__ of
              (FundPsbtRequest'TargetConf p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_FundPsbtRequest'SatPerVbyte ::
  Data.ProtoLens.Prism.Prism' FundPsbtRequest'Fees Data.Word.Word64
_FundPsbtRequest'SatPerVbyte
  = Data.ProtoLens.Prism.prism'
      FundPsbtRequest'SatPerVbyte
      (\ p__
         -> case p__ of
              (FundPsbtRequest'SatPerVbyte p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.fundedPsbt' @:: Lens' FundPsbtResponse Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.changeOutputIndex' @:: Lens' FundPsbtResponse Data.Int.Int32@
         * 'Proto.Walletrpc.Walletkit_Fields.lockedUtxos' @:: Lens' FundPsbtResponse [UtxoLease]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'lockedUtxos' @:: Lens' FundPsbtResponse (Data.Vector.Vector UtxoLease)@ -}
data FundPsbtResponse
  = FundPsbtResponse'_constructor {_FundPsbtResponse'fundedPsbt :: !Data.ByteString.ByteString,
                                   _FundPsbtResponse'changeOutputIndex :: !Data.Int.Int32,
                                   _FundPsbtResponse'lockedUtxos :: !(Data.Vector.Vector UtxoLease),
                                   _FundPsbtResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show FundPsbtResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out FundPsbtResponse
instance Data.ProtoLens.Field.HasField FundPsbtResponse "fundedPsbt" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtResponse'fundedPsbt
           (\ x__ y__ -> x__ {_FundPsbtResponse'fundedPsbt = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FundPsbtResponse "changeOutputIndex" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtResponse'changeOutputIndex
           (\ x__ y__ -> x__ {_FundPsbtResponse'changeOutputIndex = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FundPsbtResponse "lockedUtxos" [UtxoLease] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtResponse'lockedUtxos
           (\ x__ y__ -> x__ {_FundPsbtResponse'lockedUtxos = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FundPsbtResponse "vec'lockedUtxos" (Data.Vector.Vector UtxoLease) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FundPsbtResponse'lockedUtxos
           (\ x__ y__ -> x__ {_FundPsbtResponse'lockedUtxos = y__}))
        Prelude.id
instance Data.ProtoLens.Message FundPsbtResponse where
  messageName _ = Data.Text.pack "walletrpc.FundPsbtResponse"
  packedMessageDescriptor _
    = "\n\
      \\DLEFundPsbtResponse\DC2\US\n\
      \\vfunded_psbt\CAN\SOH \SOH(\fR\n\
      \fundedPsbt\DC2.\n\
      \\DC3change_output_index\CAN\STX \SOH(\ENQR\DC1changeOutputIndex\DC27\n\
      \\flocked_utxos\CAN\ETX \ETX(\v2\DC4.walletrpc.UtxoLeaseR\vlockedUtxos"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        fundedPsbt__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "funded_psbt"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"fundedPsbt")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtResponse
        changeOutputIndex__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "change_output_index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"changeOutputIndex")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtResponse
        lockedUtxos__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "locked_utxos"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UtxoLease)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"lockedUtxos")) ::
              Data.ProtoLens.FieldDescriptor FundPsbtResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, fundedPsbt__field_descriptor),
           (Data.ProtoLens.Tag 2, changeOutputIndex__field_descriptor),
           (Data.ProtoLens.Tag 3, lockedUtxos__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FundPsbtResponse'_unknownFields
        (\ x__ y__ -> x__ {_FundPsbtResponse'_unknownFields = y__})
  defMessage
    = FundPsbtResponse'_constructor
        {_FundPsbtResponse'fundedPsbt = Data.ProtoLens.fieldDefault,
         _FundPsbtResponse'changeOutputIndex = Data.ProtoLens.fieldDefault,
         _FundPsbtResponse'lockedUtxos = Data.Vector.Generic.empty,
         _FundPsbtResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FundPsbtResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UtxoLease
             -> Data.ProtoLens.Encoding.Bytes.Parser FundPsbtResponse
        loop x mutable'lockedUtxos
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'lockedUtxos <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'lockedUtxos)
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
                              (Data.ProtoLens.Field.field @"vec'lockedUtxos") frozen'lockedUtxos
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "funded_psbt"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"fundedPsbt") y x)
                                  mutable'lockedUtxos
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "change_output_index"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"changeOutputIndex") y x)
                                  mutable'lockedUtxos
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "locked_utxos"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'lockedUtxos y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'lockedUtxos
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'lockedUtxos <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'lockedUtxos)
          "FundPsbtResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"fundedPsbt") _x
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
                         (Data.ProtoLens.Field.field @"changeOutputIndex") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'lockedUtxos") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData FundPsbtResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FundPsbtResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FundPsbtResponse'fundedPsbt x__)
                (Control.DeepSeq.deepseq
                   (_FundPsbtResponse'changeOutputIndex x__)
                   (Control.DeepSeq.deepseq (_FundPsbtResponse'lockedUtxos x__) ())))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.name' @:: Lens' ImportAccountRequest Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.extendedPublicKey' @:: Lens' ImportAccountRequest Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.masterKeyFingerprint' @:: Lens' ImportAccountRequest Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.addressType' @:: Lens' ImportAccountRequest AddressType@
         * 'Proto.Walletrpc.Walletkit_Fields.dryRun' @:: Lens' ImportAccountRequest Prelude.Bool@ -}
data ImportAccountRequest
  = ImportAccountRequest'_constructor {_ImportAccountRequest'name :: !Data.Text.Text,
                                       _ImportAccountRequest'extendedPublicKey :: !Data.Text.Text,
                                       _ImportAccountRequest'masterKeyFingerprint :: !Data.ByteString.ByteString,
                                       _ImportAccountRequest'addressType :: !AddressType,
                                       _ImportAccountRequest'dryRun :: !Prelude.Bool,
                                       _ImportAccountRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ImportAccountRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ImportAccountRequest
instance Data.ProtoLens.Field.HasField ImportAccountRequest "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountRequest'name
           (\ x__ y__ -> x__ {_ImportAccountRequest'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ImportAccountRequest "extendedPublicKey" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountRequest'extendedPublicKey
           (\ x__ y__ -> x__ {_ImportAccountRequest'extendedPublicKey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ImportAccountRequest "masterKeyFingerprint" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountRequest'masterKeyFingerprint
           (\ x__ y__
              -> x__ {_ImportAccountRequest'masterKeyFingerprint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ImportAccountRequest "addressType" AddressType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountRequest'addressType
           (\ x__ y__ -> x__ {_ImportAccountRequest'addressType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ImportAccountRequest "dryRun" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountRequest'dryRun
           (\ x__ y__ -> x__ {_ImportAccountRequest'dryRun = y__}))
        Prelude.id
instance Data.ProtoLens.Message ImportAccountRequest where
  messageName _ = Data.Text.pack "walletrpc.ImportAccountRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC4ImportAccountRequest\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2.\n\
      \\DC3extended_public_key\CAN\STX \SOH(\tR\DC1extendedPublicKey\DC24\n\
      \\SYNmaster_key_fingerprint\CAN\ETX \SOH(\fR\DC4masterKeyFingerprint\DC29\n\
      \\faddress_type\CAN\EOT \SOH(\SO2\SYN.walletrpc.AddressTypeR\vaddressType\DC2\ETB\n\
      \\adry_run\CAN\ENQ \SOH(\bR\ACKdryRun"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor ImportAccountRequest
        extendedPublicKey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "extended_public_key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"extendedPublicKey")) ::
              Data.ProtoLens.FieldDescriptor ImportAccountRequest
        masterKeyFingerprint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "master_key_fingerprint"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"masterKeyFingerprint")) ::
              Data.ProtoLens.FieldDescriptor ImportAccountRequest
        addressType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "address_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor AddressType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"addressType")) ::
              Data.ProtoLens.FieldDescriptor ImportAccountRequest
        dryRun__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dry_run"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"dryRun")) ::
              Data.ProtoLens.FieldDescriptor ImportAccountRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, extendedPublicKey__field_descriptor),
           (Data.ProtoLens.Tag 3, masterKeyFingerprint__field_descriptor),
           (Data.ProtoLens.Tag 4, addressType__field_descriptor),
           (Data.ProtoLens.Tag 5, dryRun__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ImportAccountRequest'_unknownFields
        (\ x__ y__ -> x__ {_ImportAccountRequest'_unknownFields = y__})
  defMessage
    = ImportAccountRequest'_constructor
        {_ImportAccountRequest'name = Data.ProtoLens.fieldDefault,
         _ImportAccountRequest'extendedPublicKey = Data.ProtoLens.fieldDefault,
         _ImportAccountRequest'masterKeyFingerprint = Data.ProtoLens.fieldDefault,
         _ImportAccountRequest'addressType = Data.ProtoLens.fieldDefault,
         _ImportAccountRequest'dryRun = Data.ProtoLens.fieldDefault,
         _ImportAccountRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ImportAccountRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ImportAccountRequest
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
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "extended_public_key"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"extendedPublicKey") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "master_key_fingerprint"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"masterKeyFingerprint") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "address_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"addressType") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "dry_run"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"dryRun") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ImportAccountRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
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
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"extendedPublicKey") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"masterKeyFingerprint") _x
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
                           = Lens.Family2.view (Data.ProtoLens.Field.field @"addressType") _x
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
                         (let
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"dryRun") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (\ b -> if b then 1 else 0) _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData ImportAccountRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ImportAccountRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ImportAccountRequest'name x__)
                (Control.DeepSeq.deepseq
                   (_ImportAccountRequest'extendedPublicKey x__)
                   (Control.DeepSeq.deepseq
                      (_ImportAccountRequest'masterKeyFingerprint x__)
                      (Control.DeepSeq.deepseq
                         (_ImportAccountRequest'addressType x__)
                         (Control.DeepSeq.deepseq (_ImportAccountRequest'dryRun x__) ())))))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.account' @:: Lens' ImportAccountResponse Account@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'account' @:: Lens' ImportAccountResponse (Prelude.Maybe Account)@
         * 'Proto.Walletrpc.Walletkit_Fields.dryRunExternalAddrs' @:: Lens' ImportAccountResponse [Data.Text.Text]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'dryRunExternalAddrs' @:: Lens' ImportAccountResponse (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Walletrpc.Walletkit_Fields.dryRunInternalAddrs' @:: Lens' ImportAccountResponse [Data.Text.Text]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'dryRunInternalAddrs' @:: Lens' ImportAccountResponse (Data.Vector.Vector Data.Text.Text)@ -}
data ImportAccountResponse
  = ImportAccountResponse'_constructor {_ImportAccountResponse'account :: !(Prelude.Maybe Account),
                                        _ImportAccountResponse'dryRunExternalAddrs :: !(Data.Vector.Vector Data.Text.Text),
                                        _ImportAccountResponse'dryRunInternalAddrs :: !(Data.Vector.Vector Data.Text.Text),
                                        _ImportAccountResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ImportAccountResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ImportAccountResponse
instance Data.ProtoLens.Field.HasField ImportAccountResponse "account" Account where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountResponse'account
           (\ x__ y__ -> x__ {_ImportAccountResponse'account = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ImportAccountResponse "maybe'account" (Prelude.Maybe Account) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountResponse'account
           (\ x__ y__ -> x__ {_ImportAccountResponse'account = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ImportAccountResponse "dryRunExternalAddrs" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountResponse'dryRunExternalAddrs
           (\ x__ y__
              -> x__ {_ImportAccountResponse'dryRunExternalAddrs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ImportAccountResponse "vec'dryRunExternalAddrs" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountResponse'dryRunExternalAddrs
           (\ x__ y__
              -> x__ {_ImportAccountResponse'dryRunExternalAddrs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ImportAccountResponse "dryRunInternalAddrs" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountResponse'dryRunInternalAddrs
           (\ x__ y__
              -> x__ {_ImportAccountResponse'dryRunInternalAddrs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ImportAccountResponse "vec'dryRunInternalAddrs" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportAccountResponse'dryRunInternalAddrs
           (\ x__ y__
              -> x__ {_ImportAccountResponse'dryRunInternalAddrs = y__}))
        Prelude.id
instance Data.ProtoLens.Message ImportAccountResponse where
  messageName _ = Data.Text.pack "walletrpc.ImportAccountResponse"
  packedMessageDescriptor _
    = "\n\
      \\NAKImportAccountResponse\DC2,\n\
      \\aaccount\CAN\SOH \SOH(\v2\DC2.walletrpc.AccountR\aaccount\DC23\n\
      \\SYNdry_run_external_addrs\CAN\STX \ETX(\tR\DC3dryRunExternalAddrs\DC23\n\
      \\SYNdry_run_internal_addrs\CAN\ETX \ETX(\tR\DC3dryRunInternalAddrs"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        account__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "account"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Account)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'account")) ::
              Data.ProtoLens.FieldDescriptor ImportAccountResponse
        dryRunExternalAddrs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dry_run_external_addrs"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"dryRunExternalAddrs")) ::
              Data.ProtoLens.FieldDescriptor ImportAccountResponse
        dryRunInternalAddrs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dry_run_internal_addrs"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"dryRunInternalAddrs")) ::
              Data.ProtoLens.FieldDescriptor ImportAccountResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, account__field_descriptor),
           (Data.ProtoLens.Tag 2, dryRunExternalAddrs__field_descriptor),
           (Data.ProtoLens.Tag 3, dryRunInternalAddrs__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ImportAccountResponse'_unknownFields
        (\ x__ y__ -> x__ {_ImportAccountResponse'_unknownFields = y__})
  defMessage
    = ImportAccountResponse'_constructor
        {_ImportAccountResponse'account = Prelude.Nothing,
         _ImportAccountResponse'dryRunExternalAddrs = Data.Vector.Generic.empty,
         _ImportAccountResponse'dryRunInternalAddrs = Data.Vector.Generic.empty,
         _ImportAccountResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ImportAccountResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                -> Data.ProtoLens.Encoding.Bytes.Parser ImportAccountResponse
        loop x mutable'dryRunExternalAddrs mutable'dryRunInternalAddrs
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'dryRunExternalAddrs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'dryRunExternalAddrs)
                      frozen'dryRunInternalAddrs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'dryRunInternalAddrs)
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
                              (Data.ProtoLens.Field.field @"vec'dryRunExternalAddrs")
                              frozen'dryRunExternalAddrs
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'dryRunInternalAddrs")
                                 frozen'dryRunInternalAddrs x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "account"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"account") y x)
                                  mutable'dryRunExternalAddrs mutable'dryRunInternalAddrs
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "dry_run_external_addrs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'dryRunExternalAddrs y)
                                loop x v mutable'dryRunInternalAddrs
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "dry_run_internal_addrs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'dryRunInternalAddrs y)
                                loop x mutable'dryRunExternalAddrs v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'dryRunExternalAddrs mutable'dryRunInternalAddrs
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'dryRunExternalAddrs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              mutable'dryRunInternalAddrs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'dryRunExternalAddrs
                mutable'dryRunInternalAddrs)
          "ImportAccountResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'account") _x
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
                              Data.Text.Encoding.encodeUtf8 _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'dryRunExternalAddrs") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.Text.Encoding.encodeUtf8 _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'dryRunInternalAddrs") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData ImportAccountResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ImportAccountResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ImportAccountResponse'account x__)
                (Control.DeepSeq.deepseq
                   (_ImportAccountResponse'dryRunExternalAddrs x__)
                   (Control.DeepSeq.deepseq
                      (_ImportAccountResponse'dryRunInternalAddrs x__) ())))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.publicKey' @:: Lens' ImportPublicKeyRequest Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.addressType' @:: Lens' ImportPublicKeyRequest AddressType@ -}
data ImportPublicKeyRequest
  = ImportPublicKeyRequest'_constructor {_ImportPublicKeyRequest'publicKey :: !Data.ByteString.ByteString,
                                         _ImportPublicKeyRequest'addressType :: !AddressType,
                                         _ImportPublicKeyRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ImportPublicKeyRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ImportPublicKeyRequest
instance Data.ProtoLens.Field.HasField ImportPublicKeyRequest "publicKey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportPublicKeyRequest'publicKey
           (\ x__ y__ -> x__ {_ImportPublicKeyRequest'publicKey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ImportPublicKeyRequest "addressType" AddressType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ImportPublicKeyRequest'addressType
           (\ x__ y__ -> x__ {_ImportPublicKeyRequest'addressType = y__}))
        Prelude.id
instance Data.ProtoLens.Message ImportPublicKeyRequest where
  messageName _ = Data.Text.pack "walletrpc.ImportPublicKeyRequest"
  packedMessageDescriptor _
    = "\n\
      \\SYNImportPublicKeyRequest\DC2\GS\n\
      \\n\
      \public_key\CAN\SOH \SOH(\fR\tpublicKey\DC29\n\
      \\faddress_type\CAN\STX \SOH(\SO2\SYN.walletrpc.AddressTypeR\vaddressType"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        publicKey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "public_key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"publicKey")) ::
              Data.ProtoLens.FieldDescriptor ImportPublicKeyRequest
        addressType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "address_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor AddressType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"addressType")) ::
              Data.ProtoLens.FieldDescriptor ImportPublicKeyRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, publicKey__field_descriptor),
           (Data.ProtoLens.Tag 2, addressType__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ImportPublicKeyRequest'_unknownFields
        (\ x__ y__ -> x__ {_ImportPublicKeyRequest'_unknownFields = y__})
  defMessage
    = ImportPublicKeyRequest'_constructor
        {_ImportPublicKeyRequest'publicKey = Data.ProtoLens.fieldDefault,
         _ImportPublicKeyRequest'addressType = Data.ProtoLens.fieldDefault,
         _ImportPublicKeyRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ImportPublicKeyRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ImportPublicKeyRequest
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
                                       "public_key"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"publicKey") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "address_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"addressType") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ImportPublicKeyRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"publicKey") _x
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
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"addressType") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                            Prelude.fromEnum _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData ImportPublicKeyRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ImportPublicKeyRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ImportPublicKeyRequest'publicKey x__)
                (Control.DeepSeq.deepseq
                   (_ImportPublicKeyRequest'addressType x__) ()))
{- | Fields :
      -}
data ImportPublicKeyResponse
  = ImportPublicKeyResponse'_constructor {_ImportPublicKeyResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ImportPublicKeyResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ImportPublicKeyResponse
instance Data.ProtoLens.Message ImportPublicKeyResponse where
  messageName _ = Data.Text.pack "walletrpc.ImportPublicKeyResponse"
  packedMessageDescriptor _
    = "\n\
      \\ETBImportPublicKeyResponse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ImportPublicKeyResponse'_unknownFields
        (\ x__ y__ -> x__ {_ImportPublicKeyResponse'_unknownFields = y__})
  defMessage
    = ImportPublicKeyResponse'_constructor
        {_ImportPublicKeyResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ImportPublicKeyResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser ImportPublicKeyResponse
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
          (do loop Data.ProtoLens.defMessage) "ImportPublicKeyResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData ImportPublicKeyResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ImportPublicKeyResponse'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.keyFingerPrint' @:: Lens' KeyReq Data.Int.Int32@
         * 'Proto.Walletrpc.Walletkit_Fields.keyFamily' @:: Lens' KeyReq Data.Int.Int32@ -}
data KeyReq
  = KeyReq'_constructor {_KeyReq'keyFingerPrint :: !Data.Int.Int32,
                         _KeyReq'keyFamily :: !Data.Int.Int32,
                         _KeyReq'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show KeyReq where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out KeyReq
instance Data.ProtoLens.Field.HasField KeyReq "keyFingerPrint" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _KeyReq'keyFingerPrint
           (\ x__ y__ -> x__ {_KeyReq'keyFingerPrint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField KeyReq "keyFamily" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _KeyReq'keyFamily (\ x__ y__ -> x__ {_KeyReq'keyFamily = y__}))
        Prelude.id
instance Data.ProtoLens.Message KeyReq where
  messageName _ = Data.Text.pack "walletrpc.KeyReq"
  packedMessageDescriptor _
    = "\n\
      \\ACKKeyReq\DC2(\n\
      \\DLEkey_finger_print\CAN\SOH \SOH(\ENQR\SOkeyFingerPrint\DC2\GS\n\
      \\n\
      \key_family\CAN\STX \SOH(\ENQR\tkeyFamily"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        keyFingerPrint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key_finger_print"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"keyFingerPrint")) ::
              Data.ProtoLens.FieldDescriptor KeyReq
        keyFamily__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key_family"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"keyFamily")) ::
              Data.ProtoLens.FieldDescriptor KeyReq
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, keyFingerPrint__field_descriptor),
           (Data.ProtoLens.Tag 2, keyFamily__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _KeyReq'_unknownFields
        (\ x__ y__ -> x__ {_KeyReq'_unknownFields = y__})
  defMessage
    = KeyReq'_constructor
        {_KeyReq'keyFingerPrint = Data.ProtoLens.fieldDefault,
         _KeyReq'keyFamily = Data.ProtoLens.fieldDefault,
         _KeyReq'_unknownFields = []}
  parseMessage
    = let
        loop :: KeyReq -> Data.ProtoLens.Encoding.Bytes.Parser KeyReq
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
                                       "key_finger_print"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"keyFingerPrint") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "key_family"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"keyFamily") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "KeyReq"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"keyFingerPrint") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"keyFamily") _x
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
instance Control.DeepSeq.NFData KeyReq where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_KeyReq'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_KeyReq'keyFingerPrint x__)
                (Control.DeepSeq.deepseq (_KeyReq'keyFamily x__) ()))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.txid' @:: Lens' LabelTransactionRequest Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.label' @:: Lens' LabelTransactionRequest Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.overwrite' @:: Lens' LabelTransactionRequest Prelude.Bool@ -}
data LabelTransactionRequest
  = LabelTransactionRequest'_constructor {_LabelTransactionRequest'txid :: !Data.ByteString.ByteString,
                                          _LabelTransactionRequest'label :: !Data.Text.Text,
                                          _LabelTransactionRequest'overwrite :: !Prelude.Bool,
                                          _LabelTransactionRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show LabelTransactionRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out LabelTransactionRequest
instance Data.ProtoLens.Field.HasField LabelTransactionRequest "txid" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LabelTransactionRequest'txid
           (\ x__ y__ -> x__ {_LabelTransactionRequest'txid = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LabelTransactionRequest "label" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LabelTransactionRequest'label
           (\ x__ y__ -> x__ {_LabelTransactionRequest'label = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LabelTransactionRequest "overwrite" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LabelTransactionRequest'overwrite
           (\ x__ y__ -> x__ {_LabelTransactionRequest'overwrite = y__}))
        Prelude.id
instance Data.ProtoLens.Message LabelTransactionRequest where
  messageName _ = Data.Text.pack "walletrpc.LabelTransactionRequest"
  packedMessageDescriptor _
    = "\n\
      \\ETBLabelTransactionRequest\DC2\DC2\n\
      \\EOTtxid\CAN\SOH \SOH(\fR\EOTtxid\DC2\DC4\n\
      \\ENQlabel\CAN\STX \SOH(\tR\ENQlabel\DC2\FS\n\
      \\toverwrite\CAN\ETX \SOH(\bR\toverwrite"
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
              Data.ProtoLens.FieldDescriptor LabelTransactionRequest
        label__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "label"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"label")) ::
              Data.ProtoLens.FieldDescriptor LabelTransactionRequest
        overwrite__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "overwrite"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"overwrite")) ::
              Data.ProtoLens.FieldDescriptor LabelTransactionRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, txid__field_descriptor),
           (Data.ProtoLens.Tag 2, label__field_descriptor),
           (Data.ProtoLens.Tag 3, overwrite__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _LabelTransactionRequest'_unknownFields
        (\ x__ y__ -> x__ {_LabelTransactionRequest'_unknownFields = y__})
  defMessage
    = LabelTransactionRequest'_constructor
        {_LabelTransactionRequest'txid = Data.ProtoLens.fieldDefault,
         _LabelTransactionRequest'label = Data.ProtoLens.fieldDefault,
         _LabelTransactionRequest'overwrite = Data.ProtoLens.fieldDefault,
         _LabelTransactionRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          LabelTransactionRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser LabelTransactionRequest
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
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "label"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"label") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "overwrite"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"overwrite") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "LabelTransactionRequest"
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"label") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"overwrite") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                               _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData LabelTransactionRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_LabelTransactionRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_LabelTransactionRequest'txid x__)
                (Control.DeepSeq.deepseq
                   (_LabelTransactionRequest'label x__)
                   (Control.DeepSeq.deepseq
                      (_LabelTransactionRequest'overwrite x__) ())))
{- | Fields :
      -}
data LabelTransactionResponse
  = LabelTransactionResponse'_constructor {_LabelTransactionResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show LabelTransactionResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out LabelTransactionResponse
instance Data.ProtoLens.Message LabelTransactionResponse where
  messageName _ = Data.Text.pack "walletrpc.LabelTransactionResponse"
  packedMessageDescriptor _
    = "\n\
      \\CANLabelTransactionResponse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _LabelTransactionResponse'_unknownFields
        (\ x__ y__ -> x__ {_LabelTransactionResponse'_unknownFields = y__})
  defMessage
    = LabelTransactionResponse'_constructor
        {_LabelTransactionResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          LabelTransactionResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser LabelTransactionResponse
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
          (do loop Data.ProtoLens.defMessage) "LabelTransactionResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData LabelTransactionResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_LabelTransactionResponse'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.id' @:: Lens' LeaseOutputRequest Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.outpoint' @:: Lens' LeaseOutputRequest Proto.Lnrpc.Ln0.OutPoint@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'outpoint' @:: Lens' LeaseOutputRequest (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint)@
         * 'Proto.Walletrpc.Walletkit_Fields.expirationSeconds' @:: Lens' LeaseOutputRequest Data.Word.Word64@ -}
data LeaseOutputRequest
  = LeaseOutputRequest'_constructor {_LeaseOutputRequest'id :: !Data.ByteString.ByteString,
                                     _LeaseOutputRequest'outpoint :: !(Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint),
                                     _LeaseOutputRequest'expirationSeconds :: !Data.Word.Word64,
                                     _LeaseOutputRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show LeaseOutputRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out LeaseOutputRequest
instance Data.ProtoLens.Field.HasField LeaseOutputRequest "id" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LeaseOutputRequest'id
           (\ x__ y__ -> x__ {_LeaseOutputRequest'id = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LeaseOutputRequest "outpoint" Proto.Lnrpc.Ln0.OutPoint where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LeaseOutputRequest'outpoint
           (\ x__ y__ -> x__ {_LeaseOutputRequest'outpoint = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField LeaseOutputRequest "maybe'outpoint" (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LeaseOutputRequest'outpoint
           (\ x__ y__ -> x__ {_LeaseOutputRequest'outpoint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LeaseOutputRequest "expirationSeconds" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LeaseOutputRequest'expirationSeconds
           (\ x__ y__ -> x__ {_LeaseOutputRequest'expirationSeconds = y__}))
        Prelude.id
instance Data.ProtoLens.Message LeaseOutputRequest where
  messageName _ = Data.Text.pack "walletrpc.LeaseOutputRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC2LeaseOutputRequest\DC2\SO\n\
      \\STXid\CAN\SOH \SOH(\fR\STXid\DC2+\n\
      \\boutpoint\CAN\STX \SOH(\v2\SI.lnrpc.OutPointR\boutpoint\DC2-\n\
      \\DC2expiration_seconds\CAN\ETX \SOH(\EOTR\DC1expirationSeconds"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        id__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"id")) ::
              Data.ProtoLens.FieldDescriptor LeaseOutputRequest
        outpoint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outpoint"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Lnrpc.Ln0.OutPoint)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'outpoint")) ::
              Data.ProtoLens.FieldDescriptor LeaseOutputRequest
        expirationSeconds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "expiration_seconds"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"expirationSeconds")) ::
              Data.ProtoLens.FieldDescriptor LeaseOutputRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, id__field_descriptor),
           (Data.ProtoLens.Tag 2, outpoint__field_descriptor),
           (Data.ProtoLens.Tag 3, expirationSeconds__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _LeaseOutputRequest'_unknownFields
        (\ x__ y__ -> x__ {_LeaseOutputRequest'_unknownFields = y__})
  defMessage
    = LeaseOutputRequest'_constructor
        {_LeaseOutputRequest'id = Data.ProtoLens.fieldDefault,
         _LeaseOutputRequest'outpoint = Prelude.Nothing,
         _LeaseOutputRequest'expirationSeconds = Data.ProtoLens.fieldDefault,
         _LeaseOutputRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          LeaseOutputRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser LeaseOutputRequest
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
                                       "id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"id") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "outpoint"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"outpoint") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "expiration_seconds"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"expirationSeconds") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "LeaseOutputRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"id") _x
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
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'outpoint") _x
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
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"expirationSeconds") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData LeaseOutputRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_LeaseOutputRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_LeaseOutputRequest'id x__)
                (Control.DeepSeq.deepseq
                   (_LeaseOutputRequest'outpoint x__)
                   (Control.DeepSeq.deepseq
                      (_LeaseOutputRequest'expirationSeconds x__) ())))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.expiration' @:: Lens' LeaseOutputResponse Data.Word.Word64@ -}
data LeaseOutputResponse
  = LeaseOutputResponse'_constructor {_LeaseOutputResponse'expiration :: !Data.Word.Word64,
                                      _LeaseOutputResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show LeaseOutputResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out LeaseOutputResponse
instance Data.ProtoLens.Field.HasField LeaseOutputResponse "expiration" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LeaseOutputResponse'expiration
           (\ x__ y__ -> x__ {_LeaseOutputResponse'expiration = y__}))
        Prelude.id
instance Data.ProtoLens.Message LeaseOutputResponse where
  messageName _ = Data.Text.pack "walletrpc.LeaseOutputResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC3LeaseOutputResponse\DC2\RS\n\
      \\n\
      \expiration\CAN\SOH \SOH(\EOTR\n\
      \expiration"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        expiration__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "expiration"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"expiration")) ::
              Data.ProtoLens.FieldDescriptor LeaseOutputResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, expiration__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _LeaseOutputResponse'_unknownFields
        (\ x__ y__ -> x__ {_LeaseOutputResponse'_unknownFields = y__})
  defMessage
    = LeaseOutputResponse'_constructor
        {_LeaseOutputResponse'expiration = Data.ProtoLens.fieldDefault,
         _LeaseOutputResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          LeaseOutputResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser LeaseOutputResponse
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
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "expiration"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"expiration") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "LeaseOutputResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"expiration") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData LeaseOutputResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_LeaseOutputResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_LeaseOutputResponse'expiration x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.name' @:: Lens' ListAccountsRequest Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.addressType' @:: Lens' ListAccountsRequest AddressType@ -}
data ListAccountsRequest
  = ListAccountsRequest'_constructor {_ListAccountsRequest'name :: !Data.Text.Text,
                                      _ListAccountsRequest'addressType :: !AddressType,
                                      _ListAccountsRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListAccountsRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListAccountsRequest
instance Data.ProtoLens.Field.HasField ListAccountsRequest "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListAccountsRequest'name
           (\ x__ y__ -> x__ {_ListAccountsRequest'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ListAccountsRequest "addressType" AddressType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListAccountsRequest'addressType
           (\ x__ y__ -> x__ {_ListAccountsRequest'addressType = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListAccountsRequest where
  messageName _ = Data.Text.pack "walletrpc.ListAccountsRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC3ListAccountsRequest\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC29\n\
      \\faddress_type\CAN\STX \SOH(\SO2\SYN.walletrpc.AddressTypeR\vaddressType"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor ListAccountsRequest
        addressType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "address_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor AddressType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"addressType")) ::
              Data.ProtoLens.FieldDescriptor ListAccountsRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, addressType__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListAccountsRequest'_unknownFields
        (\ x__ y__ -> x__ {_ListAccountsRequest'_unknownFields = y__})
  defMessage
    = ListAccountsRequest'_constructor
        {_ListAccountsRequest'name = Data.ProtoLens.fieldDefault,
         _ListAccountsRequest'addressType = Data.ProtoLens.fieldDefault,
         _ListAccountsRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListAccountsRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ListAccountsRequest
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
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "address_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"addressType") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ListAccountsRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
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
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"addressType") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                            Prelude.fromEnum _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData ListAccountsRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListAccountsRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ListAccountsRequest'name x__)
                (Control.DeepSeq.deepseq
                   (_ListAccountsRequest'addressType x__) ()))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.accounts' @:: Lens' ListAccountsResponse [Account]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'accounts' @:: Lens' ListAccountsResponse (Data.Vector.Vector Account)@ -}
data ListAccountsResponse
  = ListAccountsResponse'_constructor {_ListAccountsResponse'accounts :: !(Data.Vector.Vector Account),
                                       _ListAccountsResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListAccountsResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListAccountsResponse
instance Data.ProtoLens.Field.HasField ListAccountsResponse "accounts" [Account] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListAccountsResponse'accounts
           (\ x__ y__ -> x__ {_ListAccountsResponse'accounts = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ListAccountsResponse "vec'accounts" (Data.Vector.Vector Account) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListAccountsResponse'accounts
           (\ x__ y__ -> x__ {_ListAccountsResponse'accounts = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListAccountsResponse where
  messageName _ = Data.Text.pack "walletrpc.ListAccountsResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC4ListAccountsResponse\DC2.\n\
      \\baccounts\CAN\SOH \ETX(\v2\DC2.walletrpc.AccountR\baccounts"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        accounts__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "accounts"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Account)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"accounts")) ::
              Data.ProtoLens.FieldDescriptor ListAccountsResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, accounts__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListAccountsResponse'_unknownFields
        (\ x__ y__ -> x__ {_ListAccountsResponse'_unknownFields = y__})
  defMessage
    = ListAccountsResponse'_constructor
        {_ListAccountsResponse'accounts = Data.Vector.Generic.empty,
         _ListAccountsResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListAccountsResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Account
             -> Data.ProtoLens.Encoding.Bytes.Parser ListAccountsResponse
        loop x mutable'accounts
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'accounts <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'accounts)
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
                              (Data.ProtoLens.Field.field @"vec'accounts") frozen'accounts x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "accounts"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'accounts y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'accounts
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'accounts <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'accounts)
          "ListAccountsResponse"
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
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'accounts") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ListAccountsResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListAccountsResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ListAccountsResponse'accounts x__) ())
{- | Fields :
      -}
data ListLeasesRequest
  = ListLeasesRequest'_constructor {_ListLeasesRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListLeasesRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListLeasesRequest
instance Data.ProtoLens.Message ListLeasesRequest where
  messageName _ = Data.Text.pack "walletrpc.ListLeasesRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC1ListLeasesRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListLeasesRequest'_unknownFields
        (\ x__ y__ -> x__ {_ListLeasesRequest'_unknownFields = y__})
  defMessage
    = ListLeasesRequest'_constructor
        {_ListLeasesRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListLeasesRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ListLeasesRequest
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
          (do loop Data.ProtoLens.defMessage) "ListLeasesRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData ListLeasesRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListLeasesRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.lockedUtxos' @:: Lens' ListLeasesResponse [UtxoLease]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'lockedUtxos' @:: Lens' ListLeasesResponse (Data.Vector.Vector UtxoLease)@ -}
data ListLeasesResponse
  = ListLeasesResponse'_constructor {_ListLeasesResponse'lockedUtxos :: !(Data.Vector.Vector UtxoLease),
                                     _ListLeasesResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListLeasesResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListLeasesResponse
instance Data.ProtoLens.Field.HasField ListLeasesResponse "lockedUtxos" [UtxoLease] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListLeasesResponse'lockedUtxos
           (\ x__ y__ -> x__ {_ListLeasesResponse'lockedUtxos = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ListLeasesResponse "vec'lockedUtxos" (Data.Vector.Vector UtxoLease) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListLeasesResponse'lockedUtxos
           (\ x__ y__ -> x__ {_ListLeasesResponse'lockedUtxos = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListLeasesResponse where
  messageName _ = Data.Text.pack "walletrpc.ListLeasesResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC2ListLeasesResponse\DC27\n\
      \\flocked_utxos\CAN\SOH \ETX(\v2\DC4.walletrpc.UtxoLeaseR\vlockedUtxos"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        lockedUtxos__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "locked_utxos"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UtxoLease)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"lockedUtxos")) ::
              Data.ProtoLens.FieldDescriptor ListLeasesResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, lockedUtxos__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListLeasesResponse'_unknownFields
        (\ x__ y__ -> x__ {_ListLeasesResponse'_unknownFields = y__})
  defMessage
    = ListLeasesResponse'_constructor
        {_ListLeasesResponse'lockedUtxos = Data.Vector.Generic.empty,
         _ListLeasesResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListLeasesResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UtxoLease
             -> Data.ProtoLens.Encoding.Bytes.Parser ListLeasesResponse
        loop x mutable'lockedUtxos
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'lockedUtxos <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'lockedUtxos)
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
                              (Data.ProtoLens.Field.field @"vec'lockedUtxos") frozen'lockedUtxos
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "locked_utxos"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'lockedUtxos y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'lockedUtxos
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'lockedUtxos <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'lockedUtxos)
          "ListLeasesResponse"
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
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'lockedUtxos") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ListLeasesResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListLeasesResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ListLeasesResponse'lockedUtxos x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.verbose' @:: Lens' ListSweepsRequest Prelude.Bool@ -}
data ListSweepsRequest
  = ListSweepsRequest'_constructor {_ListSweepsRequest'verbose :: !Prelude.Bool,
                                    _ListSweepsRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListSweepsRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListSweepsRequest
instance Data.ProtoLens.Field.HasField ListSweepsRequest "verbose" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListSweepsRequest'verbose
           (\ x__ y__ -> x__ {_ListSweepsRequest'verbose = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListSweepsRequest where
  messageName _ = Data.Text.pack "walletrpc.ListSweepsRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC1ListSweepsRequest\DC2\CAN\n\
      \\averbose\CAN\SOH \SOH(\bR\averbose"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        verbose__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "verbose"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"verbose")) ::
              Data.ProtoLens.FieldDescriptor ListSweepsRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, verbose__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListSweepsRequest'_unknownFields
        (\ x__ y__ -> x__ {_ListSweepsRequest'_unknownFields = y__})
  defMessage
    = ListSweepsRequest'_constructor
        {_ListSweepsRequest'verbose = Data.ProtoLens.fieldDefault,
         _ListSweepsRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListSweepsRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ListSweepsRequest
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
                                       "verbose"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"verbose") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ListSweepsRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"verbose") _x
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
instance Control.DeepSeq.NFData ListSweepsRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListSweepsRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ListSweepsRequest'verbose x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'sweeps' @:: Lens' ListSweepsResponse (Prelude.Maybe ListSweepsResponse'Sweeps)@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'transactionDetails' @:: Lens' ListSweepsResponse (Prelude.Maybe Proto.Lightning.TransactionDetails)@
         * 'Proto.Walletrpc.Walletkit_Fields.transactionDetails' @:: Lens' ListSweepsResponse Proto.Lightning.TransactionDetails@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'transactionIds' @:: Lens' ListSweepsResponse (Prelude.Maybe ListSweepsResponse'TransactionIDs)@
         * 'Proto.Walletrpc.Walletkit_Fields.transactionIds' @:: Lens' ListSweepsResponse ListSweepsResponse'TransactionIDs@ -}
data ListSweepsResponse
  = ListSweepsResponse'_constructor {_ListSweepsResponse'sweeps :: !(Prelude.Maybe ListSweepsResponse'Sweeps),
                                     _ListSweepsResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListSweepsResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListSweepsResponse
data ListSweepsResponse'Sweeps
  = ListSweepsResponse'TransactionDetails !Proto.Lightning.TransactionDetails |
    ListSweepsResponse'TransactionIds !ListSweepsResponse'TransactionIDs
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out ListSweepsResponse'Sweeps
instance Data.ProtoLens.Field.HasField ListSweepsResponse "maybe'sweeps" (Prelude.Maybe ListSweepsResponse'Sweeps) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListSweepsResponse'sweeps
           (\ x__ y__ -> x__ {_ListSweepsResponse'sweeps = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ListSweepsResponse "maybe'transactionDetails" (Prelude.Maybe Proto.Lightning.TransactionDetails) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListSweepsResponse'sweeps
           (\ x__ y__ -> x__ {_ListSweepsResponse'sweeps = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (ListSweepsResponse'TransactionDetails x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__
              -> Prelude.fmap ListSweepsResponse'TransactionDetails y__))
instance Data.ProtoLens.Field.HasField ListSweepsResponse "transactionDetails" Proto.Lightning.TransactionDetails where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListSweepsResponse'sweeps
           (\ x__ y__ -> x__ {_ListSweepsResponse'sweeps = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (ListSweepsResponse'TransactionDetails x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__
                 -> Prelude.fmap ListSweepsResponse'TransactionDetails y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField ListSweepsResponse "maybe'transactionIds" (Prelude.Maybe ListSweepsResponse'TransactionIDs) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListSweepsResponse'sweeps
           (\ x__ y__ -> x__ {_ListSweepsResponse'sweeps = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (ListSweepsResponse'TransactionIds x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap ListSweepsResponse'TransactionIds y__))
instance Data.ProtoLens.Field.HasField ListSweepsResponse "transactionIds" ListSweepsResponse'TransactionIDs where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListSweepsResponse'sweeps
           (\ x__ y__ -> x__ {_ListSweepsResponse'sweeps = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (ListSweepsResponse'TransactionIds x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap ListSweepsResponse'TransactionIds y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message ListSweepsResponse where
  messageName _ = Data.Text.pack "walletrpc.ListSweepsResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC2ListSweepsResponse\DC2L\n\
      \\DC3transaction_details\CAN\SOH \SOH(\v2\EM.lnrpc.TransactionDetailsH\NULR\DC2transactionDetails\DC2W\n\
      \\SItransaction_ids\CAN\STX \SOH(\v2,.walletrpc.ListSweepsResponse.TransactionIDsH\NULR\SOtransactionIds\SUB9\n\
      \\SOTransactionIDs\DC2'\n\
      \\SItransaction_ids\CAN\SOH \ETX(\tR\SOtransactionIdsB\b\n\
      \\ACKsweeps"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        transactionDetails__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "transaction_details"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Lightning.TransactionDetails)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'transactionDetails")) ::
              Data.ProtoLens.FieldDescriptor ListSweepsResponse
        transactionIds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "transaction_ids"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ListSweepsResponse'TransactionIDs)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'transactionIds")) ::
              Data.ProtoLens.FieldDescriptor ListSweepsResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, transactionDetails__field_descriptor),
           (Data.ProtoLens.Tag 2, transactionIds__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListSweepsResponse'_unknownFields
        (\ x__ y__ -> x__ {_ListSweepsResponse'_unknownFields = y__})
  defMessage
    = ListSweepsResponse'_constructor
        {_ListSweepsResponse'sweeps = Prelude.Nothing,
         _ListSweepsResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListSweepsResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser ListSweepsResponse
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
                                       "transaction_details"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"transactionDetails") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "transaction_ids"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"transactionIds") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ListSweepsResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'sweeps") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (ListSweepsResponse'TransactionDetails v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (ListSweepsResponse'TransactionIds v))
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
instance Control.DeepSeq.NFData ListSweepsResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListSweepsResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ListSweepsResponse'sweeps x__) ())
instance Control.DeepSeq.NFData ListSweepsResponse'Sweeps where
  rnf (ListSweepsResponse'TransactionDetails x__)
    = Control.DeepSeq.rnf x__
  rnf (ListSweepsResponse'TransactionIds x__)
    = Control.DeepSeq.rnf x__
_ListSweepsResponse'TransactionDetails ::
  Data.ProtoLens.Prism.Prism' ListSweepsResponse'Sweeps Proto.Lightning.TransactionDetails
_ListSweepsResponse'TransactionDetails
  = Data.ProtoLens.Prism.prism'
      ListSweepsResponse'TransactionDetails
      (\ p__
         -> case p__ of
              (ListSweepsResponse'TransactionDetails p__val)
                -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_ListSweepsResponse'TransactionIds ::
  Data.ProtoLens.Prism.Prism' ListSweepsResponse'Sweeps ListSweepsResponse'TransactionIDs
_ListSweepsResponse'TransactionIds
  = Data.ProtoLens.Prism.prism'
      ListSweepsResponse'TransactionIds
      (\ p__
         -> case p__ of
              (ListSweepsResponse'TransactionIds p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.transactionIds' @:: Lens' ListSweepsResponse'TransactionIDs [Data.Text.Text]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'transactionIds' @:: Lens' ListSweepsResponse'TransactionIDs (Data.Vector.Vector Data.Text.Text)@ -}
data ListSweepsResponse'TransactionIDs
  = ListSweepsResponse'TransactionIDs'_constructor {_ListSweepsResponse'TransactionIDs'transactionIds :: !(Data.Vector.Vector Data.Text.Text),
                                                    _ListSweepsResponse'TransactionIDs'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListSweepsResponse'TransactionIDs where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListSweepsResponse'TransactionIDs
instance Data.ProtoLens.Field.HasField ListSweepsResponse'TransactionIDs "transactionIds" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListSweepsResponse'TransactionIDs'transactionIds
           (\ x__ y__
              -> x__ {_ListSweepsResponse'TransactionIDs'transactionIds = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ListSweepsResponse'TransactionIDs "vec'transactionIds" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListSweepsResponse'TransactionIDs'transactionIds
           (\ x__ y__
              -> x__ {_ListSweepsResponse'TransactionIDs'transactionIds = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListSweepsResponse'TransactionIDs where
  messageName _
    = Data.Text.pack "walletrpc.ListSweepsResponse.TransactionIDs"
  packedMessageDescriptor _
    = "\n\
      \\SOTransactionIDs\DC2'\n\
      \\SItransaction_ids\CAN\SOH \ETX(\tR\SOtransactionIds"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        transactionIds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "transaction_ids"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"transactionIds")) ::
              Data.ProtoLens.FieldDescriptor ListSweepsResponse'TransactionIDs
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, transactionIds__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListSweepsResponse'TransactionIDs'_unknownFields
        (\ x__ y__
           -> x__ {_ListSweepsResponse'TransactionIDs'_unknownFields = y__})
  defMessage
    = ListSweepsResponse'TransactionIDs'_constructor
        {_ListSweepsResponse'TransactionIDs'transactionIds = Data.Vector.Generic.empty,
         _ListSweepsResponse'TransactionIDs'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListSweepsResponse'TransactionIDs
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Bytes.Parser ListSweepsResponse'TransactionIDs
        loop x mutable'transactionIds
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'transactionIds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                 (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                    mutable'transactionIds)
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
                              (Data.ProtoLens.Field.field @"vec'transactionIds")
                              frozen'transactionIds x))
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
                                        "transaction_ids"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'transactionIds y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'transactionIds
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'transactionIds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'transactionIds)
          "TransactionIDs"
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
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'transactionIds") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ListSweepsResponse'TransactionIDs where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListSweepsResponse'TransactionIDs'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ListSweepsResponse'TransactionIDs'transactionIds x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.minConfs' @:: Lens' ListUnspentRequest Data.Int.Int32@
         * 'Proto.Walletrpc.Walletkit_Fields.maxConfs' @:: Lens' ListUnspentRequest Data.Int.Int32@
         * 'Proto.Walletrpc.Walletkit_Fields.account' @:: Lens' ListUnspentRequest Data.Text.Text@ -}
data ListUnspentRequest
  = ListUnspentRequest'_constructor {_ListUnspentRequest'minConfs :: !Data.Int.Int32,
                                     _ListUnspentRequest'maxConfs :: !Data.Int.Int32,
                                     _ListUnspentRequest'account :: !Data.Text.Text,
                                     _ListUnspentRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListUnspentRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListUnspentRequest
instance Data.ProtoLens.Field.HasField ListUnspentRequest "minConfs" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListUnspentRequest'minConfs
           (\ x__ y__ -> x__ {_ListUnspentRequest'minConfs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ListUnspentRequest "maxConfs" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListUnspentRequest'maxConfs
           (\ x__ y__ -> x__ {_ListUnspentRequest'maxConfs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ListUnspentRequest "account" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListUnspentRequest'account
           (\ x__ y__ -> x__ {_ListUnspentRequest'account = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListUnspentRequest where
  messageName _ = Data.Text.pack "walletrpc.ListUnspentRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC2ListUnspentRequest\DC2\ESC\n\
      \\tmin_confs\CAN\SOH \SOH(\ENQR\bminConfs\DC2\ESC\n\
      \\tmax_confs\CAN\STX \SOH(\ENQR\bmaxConfs\DC2\CAN\n\
      \\aaccount\CAN\ETX \SOH(\tR\aaccount"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        minConfs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "min_confs"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"minConfs")) ::
              Data.ProtoLens.FieldDescriptor ListUnspentRequest
        maxConfs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "max_confs"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"maxConfs")) ::
              Data.ProtoLens.FieldDescriptor ListUnspentRequest
        account__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "account"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"account")) ::
              Data.ProtoLens.FieldDescriptor ListUnspentRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, minConfs__field_descriptor),
           (Data.ProtoLens.Tag 2, maxConfs__field_descriptor),
           (Data.ProtoLens.Tag 3, account__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListUnspentRequest'_unknownFields
        (\ x__ y__ -> x__ {_ListUnspentRequest'_unknownFields = y__})
  defMessage
    = ListUnspentRequest'_constructor
        {_ListUnspentRequest'minConfs = Data.ProtoLens.fieldDefault,
         _ListUnspentRequest'maxConfs = Data.ProtoLens.fieldDefault,
         _ListUnspentRequest'account = Data.ProtoLens.fieldDefault,
         _ListUnspentRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListUnspentRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ListUnspentRequest
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
                                       "min_confs"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"minConfs") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "max_confs"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"maxConfs") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "account"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"account") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ListUnspentRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"minConfs") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"maxConfs") _x
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
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"account") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData ListUnspentRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListUnspentRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ListUnspentRequest'minConfs x__)
                (Control.DeepSeq.deepseq
                   (_ListUnspentRequest'maxConfs x__)
                   (Control.DeepSeq.deepseq (_ListUnspentRequest'account x__) ())))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.utxos' @:: Lens' ListUnspentResponse [Proto.Lightning.Utxo]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'utxos' @:: Lens' ListUnspentResponse (Data.Vector.Vector Proto.Lightning.Utxo)@ -}
data ListUnspentResponse
  = ListUnspentResponse'_constructor {_ListUnspentResponse'utxos :: !(Data.Vector.Vector Proto.Lightning.Utxo),
                                      _ListUnspentResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListUnspentResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListUnspentResponse
instance Data.ProtoLens.Field.HasField ListUnspentResponse "utxos" [Proto.Lightning.Utxo] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListUnspentResponse'utxos
           (\ x__ y__ -> x__ {_ListUnspentResponse'utxos = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ListUnspentResponse "vec'utxos" (Data.Vector.Vector Proto.Lightning.Utxo) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListUnspentResponse'utxos
           (\ x__ y__ -> x__ {_ListUnspentResponse'utxos = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListUnspentResponse where
  messageName _ = Data.Text.pack "walletrpc.ListUnspentResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC3ListUnspentResponse\DC2!\n\
      \\ENQutxos\CAN\SOH \ETX(\v2\v.lnrpc.UtxoR\ENQutxos"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        utxos__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "utxos"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Lightning.Utxo)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"utxos")) ::
              Data.ProtoLens.FieldDescriptor ListUnspentResponse
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, utxos__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListUnspentResponse'_unknownFields
        (\ x__ y__ -> x__ {_ListUnspentResponse'_unknownFields = y__})
  defMessage
    = ListUnspentResponse'_constructor
        {_ListUnspentResponse'utxos = Data.Vector.Generic.empty,
         _ListUnspentResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListUnspentResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.Lightning.Utxo
             -> Data.ProtoLens.Encoding.Bytes.Parser ListUnspentResponse
        loop x mutable'utxos
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'utxos <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'utxos)
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
                              (Data.ProtoLens.Field.field @"vec'utxos") frozen'utxos x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "utxos"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'utxos y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'utxos
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'utxos <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'utxos)
          "ListUnspentResponse"
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
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'utxos") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ListUnspentResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListUnspentResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ListUnspentResponse'utxos x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.outpoint' @:: Lens' PendingSweep Proto.Lnrpc.Ln0.OutPoint@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'outpoint' @:: Lens' PendingSweep (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint)@
         * 'Proto.Walletrpc.Walletkit_Fields.witnessType' @:: Lens' PendingSweep WitnessType@
         * 'Proto.Walletrpc.Walletkit_Fields.amountSat' @:: Lens' PendingSweep Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.satPerByte' @:: Lens' PendingSweep Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.broadcastAttempts' @:: Lens' PendingSweep Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.nextBroadcastHeight' @:: Lens' PendingSweep Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.requestedConfTarget' @:: Lens' PendingSweep Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.requestedSatPerByte' @:: Lens' PendingSweep Data.Word.Word32@
         * 'Proto.Walletrpc.Walletkit_Fields.satPerVbyte' @:: Lens' PendingSweep Data.Word.Word64@
         * 'Proto.Walletrpc.Walletkit_Fields.requestedSatPerVbyte' @:: Lens' PendingSweep Data.Word.Word64@
         * 'Proto.Walletrpc.Walletkit_Fields.force' @:: Lens' PendingSweep Prelude.Bool@ -}
data PendingSweep
  = PendingSweep'_constructor {_PendingSweep'outpoint :: !(Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint),
                               _PendingSweep'witnessType :: !WitnessType,
                               _PendingSweep'amountSat :: !Data.Word.Word32,
                               _PendingSweep'satPerByte :: !Data.Word.Word32,
                               _PendingSweep'broadcastAttempts :: !Data.Word.Word32,
                               _PendingSweep'nextBroadcastHeight :: !Data.Word.Word32,
                               _PendingSweep'requestedConfTarget :: !Data.Word.Word32,
                               _PendingSweep'requestedSatPerByte :: !Data.Word.Word32,
                               _PendingSweep'satPerVbyte :: !Data.Word.Word64,
                               _PendingSweep'requestedSatPerVbyte :: !Data.Word.Word64,
                               _PendingSweep'force :: !Prelude.Bool,
                               _PendingSweep'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show PendingSweep where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out PendingSweep
instance Data.ProtoLens.Field.HasField PendingSweep "outpoint" Proto.Lnrpc.Ln0.OutPoint where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'outpoint
           (\ x__ y__ -> x__ {_PendingSweep'outpoint = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField PendingSweep "maybe'outpoint" (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'outpoint
           (\ x__ y__ -> x__ {_PendingSweep'outpoint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "witnessType" WitnessType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'witnessType
           (\ x__ y__ -> x__ {_PendingSweep'witnessType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "amountSat" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'amountSat
           (\ x__ y__ -> x__ {_PendingSweep'amountSat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "satPerByte" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'satPerByte
           (\ x__ y__ -> x__ {_PendingSweep'satPerByte = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "broadcastAttempts" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'broadcastAttempts
           (\ x__ y__ -> x__ {_PendingSweep'broadcastAttempts = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "nextBroadcastHeight" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'nextBroadcastHeight
           (\ x__ y__ -> x__ {_PendingSweep'nextBroadcastHeight = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "requestedConfTarget" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'requestedConfTarget
           (\ x__ y__ -> x__ {_PendingSweep'requestedConfTarget = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "requestedSatPerByte" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'requestedSatPerByte
           (\ x__ y__ -> x__ {_PendingSweep'requestedSatPerByte = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "satPerVbyte" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'satPerVbyte
           (\ x__ y__ -> x__ {_PendingSweep'satPerVbyte = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "requestedSatPerVbyte" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'requestedSatPerVbyte
           (\ x__ y__ -> x__ {_PendingSweep'requestedSatPerVbyte = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PendingSweep "force" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweep'force (\ x__ y__ -> x__ {_PendingSweep'force = y__}))
        Prelude.id
instance Data.ProtoLens.Message PendingSweep where
  messageName _ = Data.Text.pack "walletrpc.PendingSweep"
  packedMessageDescriptor _
    = "\n\
      \\fPendingSweep\DC2+\n\
      \\boutpoint\CAN\SOH \SOH(\v2\SI.lnrpc.OutPointR\boutpoint\DC29\n\
      \\fwitness_type\CAN\STX \SOH(\SO2\SYN.walletrpc.WitnessTypeR\vwitnessType\DC2\GS\n\
      \\n\
      \amount_sat\CAN\ETX \SOH(\rR\tamountSat\DC2$\n\
      \\fsat_per_byte\CAN\EOT \SOH(\rR\n\
      \satPerByteB\STX\CAN\SOH\DC2-\n\
      \\DC2broadcast_attempts\CAN\ENQ \SOH(\rR\DC1broadcastAttempts\DC22\n\
      \\NAKnext_broadcast_height\CAN\ACK \SOH(\rR\DC3nextBroadcastHeight\DC22\n\
      \\NAKrequested_conf_target\CAN\b \SOH(\rR\DC3requestedConfTarget\DC27\n\
      \\SYNrequested_sat_per_byte\CAN\t \SOH(\rR\DC3requestedSatPerByteB\STX\CAN\SOH\DC2\"\n\
      \\rsat_per_vbyte\CAN\n\
      \ \SOH(\EOTR\vsatPerVbyte\DC25\n\
      \\ETBrequested_sat_per_vbyte\CAN\v \SOH(\EOTR\DC4requestedSatPerVbyte\DC2\DC4\n\
      \\ENQforce\CAN\a \SOH(\bR\ENQforce"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        outpoint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outpoint"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Lnrpc.Ln0.OutPoint)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'outpoint")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        witnessType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "witness_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor WitnessType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"witnessType")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        amountSat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amount_sat"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"amountSat")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        satPerByte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sat_per_byte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"satPerByte")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        broadcastAttempts__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "broadcast_attempts"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"broadcastAttempts")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        nextBroadcastHeight__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "next_broadcast_height"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"nextBroadcastHeight")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        requestedConfTarget__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "requested_conf_target"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"requestedConfTarget")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        requestedSatPerByte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "requested_sat_per_byte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"requestedSatPerByte")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        satPerVbyte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sat_per_vbyte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"satPerVbyte")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        requestedSatPerVbyte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "requested_sat_per_vbyte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"requestedSatPerVbyte")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
        force__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "force"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"force")) ::
              Data.ProtoLens.FieldDescriptor PendingSweep
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, outpoint__field_descriptor),
           (Data.ProtoLens.Tag 2, witnessType__field_descriptor),
           (Data.ProtoLens.Tag 3, amountSat__field_descriptor),
           (Data.ProtoLens.Tag 4, satPerByte__field_descriptor),
           (Data.ProtoLens.Tag 5, broadcastAttempts__field_descriptor),
           (Data.ProtoLens.Tag 6, nextBroadcastHeight__field_descriptor),
           (Data.ProtoLens.Tag 8, requestedConfTarget__field_descriptor),
           (Data.ProtoLens.Tag 9, requestedSatPerByte__field_descriptor),
           (Data.ProtoLens.Tag 10, satPerVbyte__field_descriptor),
           (Data.ProtoLens.Tag 11, requestedSatPerVbyte__field_descriptor),
           (Data.ProtoLens.Tag 7, force__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _PendingSweep'_unknownFields
        (\ x__ y__ -> x__ {_PendingSweep'_unknownFields = y__})
  defMessage
    = PendingSweep'_constructor
        {_PendingSweep'outpoint = Prelude.Nothing,
         _PendingSweep'witnessType = Data.ProtoLens.fieldDefault,
         _PendingSweep'amountSat = Data.ProtoLens.fieldDefault,
         _PendingSweep'satPerByte = Data.ProtoLens.fieldDefault,
         _PendingSweep'broadcastAttempts = Data.ProtoLens.fieldDefault,
         _PendingSweep'nextBroadcastHeight = Data.ProtoLens.fieldDefault,
         _PendingSweep'requestedConfTarget = Data.ProtoLens.fieldDefault,
         _PendingSweep'requestedSatPerByte = Data.ProtoLens.fieldDefault,
         _PendingSweep'satPerVbyte = Data.ProtoLens.fieldDefault,
         _PendingSweep'requestedSatPerVbyte = Data.ProtoLens.fieldDefault,
         _PendingSweep'force = Data.ProtoLens.fieldDefault,
         _PendingSweep'_unknownFields = []}
  parseMessage
    = let
        loop ::
          PendingSweep -> Data.ProtoLens.Encoding.Bytes.Parser PendingSweep
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
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "witness_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"witnessType") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "amount_sat"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"amountSat") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sat_per_byte"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"satPerByte") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "broadcast_attempts"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"broadcastAttempts") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "next_broadcast_height"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"nextBroadcastHeight") y x)
                        64
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "requested_conf_target"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"requestedConfTarget") y x)
                        72
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "requested_sat_per_byte"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"requestedSatPerByte") y x)
                        80
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "sat_per_vbyte"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"satPerVbyte") y x)
                        88
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt
                                       "requested_sat_per_vbyte"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"requestedSatPerVbyte") y x)
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "force"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"force") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "PendingSweep"
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
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"witnessType") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                            Prelude.fromEnum _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"amountSat") _x
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
                           = Lens.Family2.view (Data.ProtoLens.Field.field @"satPerByte") _x
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
                                  (Data.ProtoLens.Field.field @"broadcastAttempts") _x
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
                                     (Data.ProtoLens.Field.field @"nextBroadcastHeight") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                        _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"requestedConfTarget") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 64)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           Prelude.fromIntegral _v))
                               ((Data.Monoid.<>)
                                  (let
                                     _v
                                       = Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"requestedSatPerByte") _x
                                   in
                                     if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                         Data.Monoid.mempty
                                     else
                                         (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt 72)
                                           ((Prelude..)
                                              Data.ProtoLens.Encoding.Bytes.putVarInt
                                              Prelude.fromIntegral _v))
                                  ((Data.Monoid.<>)
                                     (let
                                        _v
                                          = Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"satPerVbyte") _x
                                      in
                                        if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                            Data.Monoid.mempty
                                        else
                                            (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt 80)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                                     ((Data.Monoid.<>)
                                        (let
                                           _v
                                             = Lens.Family2.view
                                                 (Data.ProtoLens.Field.field
                                                    @"requestedSatPerVbyte")
                                                 _x
                                         in
                                           if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                               Data.Monoid.mempty
                                           else
                                               (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 88)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                                        ((Data.Monoid.<>)
                                           (let
                                              _v
                                                = Lens.Family2.view
                                                    (Data.ProtoLens.Field.field @"force") _x
                                            in
                                              if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                                  Data.Monoid.mempty
                                              else
                                                  (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                                    ((Prelude..)
                                                       Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (\ b -> if b then 1 else 0) _v))
                                           (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                              (Lens.Family2.view
                                                 Data.ProtoLens.unknownFields _x))))))))))))
instance Control.DeepSeq.NFData PendingSweep where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_PendingSweep'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_PendingSweep'outpoint x__)
                (Control.DeepSeq.deepseq
                   (_PendingSweep'witnessType x__)
                   (Control.DeepSeq.deepseq
                      (_PendingSweep'amountSat x__)
                      (Control.DeepSeq.deepseq
                         (_PendingSweep'satPerByte x__)
                         (Control.DeepSeq.deepseq
                            (_PendingSweep'broadcastAttempts x__)
                            (Control.DeepSeq.deepseq
                               (_PendingSweep'nextBroadcastHeight x__)
                               (Control.DeepSeq.deepseq
                                  (_PendingSweep'requestedConfTarget x__)
                                  (Control.DeepSeq.deepseq
                                     (_PendingSweep'requestedSatPerByte x__)
                                     (Control.DeepSeq.deepseq
                                        (_PendingSweep'satPerVbyte x__)
                                        (Control.DeepSeq.deepseq
                                           (_PendingSweep'requestedSatPerVbyte x__)
                                           (Control.DeepSeq.deepseq
                                              (_PendingSweep'force x__) ())))))))))))
{- | Fields :
      -}
data PendingSweepsRequest
  = PendingSweepsRequest'_constructor {_PendingSweepsRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show PendingSweepsRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out PendingSweepsRequest
instance Data.ProtoLens.Message PendingSweepsRequest where
  messageName _ = Data.Text.pack "walletrpc.PendingSweepsRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC4PendingSweepsRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _PendingSweepsRequest'_unknownFields
        (\ x__ y__ -> x__ {_PendingSweepsRequest'_unknownFields = y__})
  defMessage
    = PendingSweepsRequest'_constructor
        {_PendingSweepsRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          PendingSweepsRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser PendingSweepsRequest
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
          (do loop Data.ProtoLens.defMessage) "PendingSweepsRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData PendingSweepsRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_PendingSweepsRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.pendingSweeps' @:: Lens' PendingSweepsResponse [PendingSweep]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'pendingSweeps' @:: Lens' PendingSweepsResponse (Data.Vector.Vector PendingSweep)@ -}
data PendingSweepsResponse
  = PendingSweepsResponse'_constructor {_PendingSweepsResponse'pendingSweeps :: !(Data.Vector.Vector PendingSweep),
                                        _PendingSweepsResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show PendingSweepsResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out PendingSweepsResponse
instance Data.ProtoLens.Field.HasField PendingSweepsResponse "pendingSweeps" [PendingSweep] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweepsResponse'pendingSweeps
           (\ x__ y__ -> x__ {_PendingSweepsResponse'pendingSweeps = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField PendingSweepsResponse "vec'pendingSweeps" (Data.Vector.Vector PendingSweep) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PendingSweepsResponse'pendingSweeps
           (\ x__ y__ -> x__ {_PendingSweepsResponse'pendingSweeps = y__}))
        Prelude.id
instance Data.ProtoLens.Message PendingSweepsResponse where
  messageName _ = Data.Text.pack "walletrpc.PendingSweepsResponse"
  packedMessageDescriptor _
    = "\n\
      \\NAKPendingSweepsResponse\DC2>\n\
      \\SOpending_sweeps\CAN\SOH \ETX(\v2\ETB.walletrpc.PendingSweepR\rpendingSweeps"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        pendingSweeps__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "pending_sweeps"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor PendingSweep)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"pendingSweeps")) ::
              Data.ProtoLens.FieldDescriptor PendingSweepsResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, pendingSweeps__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _PendingSweepsResponse'_unknownFields
        (\ x__ y__ -> x__ {_PendingSweepsResponse'_unknownFields = y__})
  defMessage
    = PendingSweepsResponse'_constructor
        {_PendingSweepsResponse'pendingSweeps = Data.Vector.Generic.empty,
         _PendingSweepsResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          PendingSweepsResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld PendingSweep
             -> Data.ProtoLens.Encoding.Bytes.Parser PendingSweepsResponse
        loop x mutable'pendingSweeps
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'pendingSweeps <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                   mutable'pendingSweeps)
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
                              (Data.ProtoLens.Field.field @"vec'pendingSweeps")
                              frozen'pendingSweeps x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "pending_sweeps"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'pendingSweeps y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'pendingSweeps
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'pendingSweeps <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'pendingSweeps)
          "PendingSweepsResponse"
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
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'pendingSweeps") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData PendingSweepsResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_PendingSweepsResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_PendingSweepsResponse'pendingSweeps x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.publishError' @:: Lens' PublishResponse Data.Text.Text@ -}
data PublishResponse
  = PublishResponse'_constructor {_PublishResponse'publishError :: !Data.Text.Text,
                                  _PublishResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show PublishResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out PublishResponse
instance Data.ProtoLens.Field.HasField PublishResponse "publishError" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PublishResponse'publishError
           (\ x__ y__ -> x__ {_PublishResponse'publishError = y__}))
        Prelude.id
instance Data.ProtoLens.Message PublishResponse where
  messageName _ = Data.Text.pack "walletrpc.PublishResponse"
  packedMessageDescriptor _
    = "\n\
      \\SIPublishResponse\DC2#\n\
      \\rpublish_error\CAN\SOH \SOH(\tR\fpublishError"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        publishError__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "publish_error"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"publishError")) ::
              Data.ProtoLens.FieldDescriptor PublishResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, publishError__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _PublishResponse'_unknownFields
        (\ x__ y__ -> x__ {_PublishResponse'_unknownFields = y__})
  defMessage
    = PublishResponse'_constructor
        {_PublishResponse'publishError = Data.ProtoLens.fieldDefault,
         _PublishResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          PublishResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser PublishResponse
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
                                       "publish_error"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"publishError") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "PublishResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"publishError") _x
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
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData PublishResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_PublishResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_PublishResponse'publishError x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.id' @:: Lens' ReleaseOutputRequest Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.outpoint' @:: Lens' ReleaseOutputRequest Proto.Lnrpc.Ln0.OutPoint@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'outpoint' @:: Lens' ReleaseOutputRequest (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint)@ -}
data ReleaseOutputRequest
  = ReleaseOutputRequest'_constructor {_ReleaseOutputRequest'id :: !Data.ByteString.ByteString,
                                       _ReleaseOutputRequest'outpoint :: !(Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint),
                                       _ReleaseOutputRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ReleaseOutputRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ReleaseOutputRequest
instance Data.ProtoLens.Field.HasField ReleaseOutputRequest "id" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ReleaseOutputRequest'id
           (\ x__ y__ -> x__ {_ReleaseOutputRequest'id = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ReleaseOutputRequest "outpoint" Proto.Lnrpc.Ln0.OutPoint where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ReleaseOutputRequest'outpoint
           (\ x__ y__ -> x__ {_ReleaseOutputRequest'outpoint = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ReleaseOutputRequest "maybe'outpoint" (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ReleaseOutputRequest'outpoint
           (\ x__ y__ -> x__ {_ReleaseOutputRequest'outpoint = y__}))
        Prelude.id
instance Data.ProtoLens.Message ReleaseOutputRequest where
  messageName _ = Data.Text.pack "walletrpc.ReleaseOutputRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC4ReleaseOutputRequest\DC2\SO\n\
      \\STXid\CAN\SOH \SOH(\fR\STXid\DC2+\n\
      \\boutpoint\CAN\STX \SOH(\v2\SI.lnrpc.OutPointR\boutpoint"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        id__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"id")) ::
              Data.ProtoLens.FieldDescriptor ReleaseOutputRequest
        outpoint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outpoint"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Lnrpc.Ln0.OutPoint)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'outpoint")) ::
              Data.ProtoLens.FieldDescriptor ReleaseOutputRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, id__field_descriptor),
           (Data.ProtoLens.Tag 2, outpoint__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ReleaseOutputRequest'_unknownFields
        (\ x__ y__ -> x__ {_ReleaseOutputRequest'_unknownFields = y__})
  defMessage
    = ReleaseOutputRequest'_constructor
        {_ReleaseOutputRequest'id = Data.ProtoLens.fieldDefault,
         _ReleaseOutputRequest'outpoint = Prelude.Nothing,
         _ReleaseOutputRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ReleaseOutputRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ReleaseOutputRequest
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
                                       "id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"id") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "outpoint"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"outpoint") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ReleaseOutputRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"id") _x
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
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'outpoint") _x
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
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData ReleaseOutputRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ReleaseOutputRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ReleaseOutputRequest'id x__)
                (Control.DeepSeq.deepseq (_ReleaseOutputRequest'outpoint x__) ()))
{- | Fields :
      -}
data ReleaseOutputResponse
  = ReleaseOutputResponse'_constructor {_ReleaseOutputResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ReleaseOutputResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ReleaseOutputResponse
instance Data.ProtoLens.Message ReleaseOutputResponse where
  messageName _ = Data.Text.pack "walletrpc.ReleaseOutputResponse"
  packedMessageDescriptor _
    = "\n\
      \\NAKReleaseOutputResponse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ReleaseOutputResponse'_unknownFields
        (\ x__ y__ -> x__ {_ReleaseOutputResponse'_unknownFields = y__})
  defMessage
    = ReleaseOutputResponse'_constructor
        {_ReleaseOutputResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ReleaseOutputResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser ReleaseOutputResponse
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
          (do loop Data.ProtoLens.defMessage) "ReleaseOutputResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData ReleaseOutputResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ReleaseOutputResponse'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.satPerKw' @:: Lens' SendOutputsRequest Data.Int.Int64@
         * 'Proto.Walletrpc.Walletkit_Fields.outputs' @:: Lens' SendOutputsRequest [Proto.Signrpc.Signer.TxOut]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'outputs' @:: Lens' SendOutputsRequest (Data.Vector.Vector Proto.Signrpc.Signer.TxOut)@
         * 'Proto.Walletrpc.Walletkit_Fields.label' @:: Lens' SendOutputsRequest Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.minConfs' @:: Lens' SendOutputsRequest Data.Int.Int32@
         * 'Proto.Walletrpc.Walletkit_Fields.spendUnconfirmed' @:: Lens' SendOutputsRequest Prelude.Bool@ -}
data SendOutputsRequest
  = SendOutputsRequest'_constructor {_SendOutputsRequest'satPerKw :: !Data.Int.Int64,
                                     _SendOutputsRequest'outputs :: !(Data.Vector.Vector Proto.Signrpc.Signer.TxOut),
                                     _SendOutputsRequest'label :: !Data.Text.Text,
                                     _SendOutputsRequest'minConfs :: !Data.Int.Int32,
                                     _SendOutputsRequest'spendUnconfirmed :: !Prelude.Bool,
                                     _SendOutputsRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SendOutputsRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SendOutputsRequest
instance Data.ProtoLens.Field.HasField SendOutputsRequest "satPerKw" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendOutputsRequest'satPerKw
           (\ x__ y__ -> x__ {_SendOutputsRequest'satPerKw = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendOutputsRequest "outputs" [Proto.Signrpc.Signer.TxOut] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendOutputsRequest'outputs
           (\ x__ y__ -> x__ {_SendOutputsRequest'outputs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SendOutputsRequest "vec'outputs" (Data.Vector.Vector Proto.Signrpc.Signer.TxOut) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendOutputsRequest'outputs
           (\ x__ y__ -> x__ {_SendOutputsRequest'outputs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendOutputsRequest "label" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendOutputsRequest'label
           (\ x__ y__ -> x__ {_SendOutputsRequest'label = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendOutputsRequest "minConfs" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendOutputsRequest'minConfs
           (\ x__ y__ -> x__ {_SendOutputsRequest'minConfs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SendOutputsRequest "spendUnconfirmed" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendOutputsRequest'spendUnconfirmed
           (\ x__ y__ -> x__ {_SendOutputsRequest'spendUnconfirmed = y__}))
        Prelude.id
instance Data.ProtoLens.Message SendOutputsRequest where
  messageName _ = Data.Text.pack "walletrpc.SendOutputsRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC2SendOutputsRequest\DC2\FS\n\
      \\n\
      \sat_per_kw\CAN\SOH \SOH(\ETXR\bsatPerKw\DC2(\n\
      \\aoutputs\CAN\STX \ETX(\v2\SO.signrpc.TxOutR\aoutputs\DC2\DC4\n\
      \\ENQlabel\CAN\ETX \SOH(\tR\ENQlabel\DC2\ESC\n\
      \\tmin_confs\CAN\EOT \SOH(\ENQR\bminConfs\DC2+\n\
      \\DC1spend_unconfirmed\CAN\ENQ \SOH(\bR\DLEspendUnconfirmed"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        satPerKw__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sat_per_kw"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"satPerKw")) ::
              Data.ProtoLens.FieldDescriptor SendOutputsRequest
        outputs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outputs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Signrpc.Signer.TxOut)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"outputs")) ::
              Data.ProtoLens.FieldDescriptor SendOutputsRequest
        label__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "label"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"label")) ::
              Data.ProtoLens.FieldDescriptor SendOutputsRequest
        minConfs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "min_confs"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"minConfs")) ::
              Data.ProtoLens.FieldDescriptor SendOutputsRequest
        spendUnconfirmed__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "spend_unconfirmed"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"spendUnconfirmed")) ::
              Data.ProtoLens.FieldDescriptor SendOutputsRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, satPerKw__field_descriptor),
           (Data.ProtoLens.Tag 2, outputs__field_descriptor),
           (Data.ProtoLens.Tag 3, label__field_descriptor),
           (Data.ProtoLens.Tag 4, minConfs__field_descriptor),
           (Data.ProtoLens.Tag 5, spendUnconfirmed__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SendOutputsRequest'_unknownFields
        (\ x__ y__ -> x__ {_SendOutputsRequest'_unknownFields = y__})
  defMessage
    = SendOutputsRequest'_constructor
        {_SendOutputsRequest'satPerKw = Data.ProtoLens.fieldDefault,
         _SendOutputsRequest'outputs = Data.Vector.Generic.empty,
         _SendOutputsRequest'label = Data.ProtoLens.fieldDefault,
         _SendOutputsRequest'minConfs = Data.ProtoLens.fieldDefault,
         _SendOutputsRequest'spendUnconfirmed = Data.ProtoLens.fieldDefault,
         _SendOutputsRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SendOutputsRequest
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.Signrpc.Signer.TxOut
             -> Data.ProtoLens.Encoding.Bytes.Parser SendOutputsRequest
        loop x mutable'outputs
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'outputs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'outputs)
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
                              (Data.ProtoLens.Field.field @"vec'outputs") frozen'outputs x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sat_per_kw"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"satPerKw") y x)
                                  mutable'outputs
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "outputs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'outputs y)
                                loop x v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "label"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"label") y x)
                                  mutable'outputs
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "min_confs"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"minConfs") y x)
                                  mutable'outputs
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "spend_unconfirmed"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"spendUnconfirmed") y x)
                                  mutable'outputs
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'outputs
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'outputs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'outputs)
          "SendOutputsRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"satPerKw") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
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
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'outputs") _x))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"label") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"minConfs") _x
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
                                  (Data.ProtoLens.Field.field @"spendUnconfirmed") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (\ b -> if b then 1 else 0) _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData SendOutputsRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SendOutputsRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SendOutputsRequest'satPerKw x__)
                (Control.DeepSeq.deepseq
                   (_SendOutputsRequest'outputs x__)
                   (Control.DeepSeq.deepseq
                      (_SendOutputsRequest'label x__)
                      (Control.DeepSeq.deepseq
                         (_SendOutputsRequest'minConfs x__)
                         (Control.DeepSeq.deepseq
                            (_SendOutputsRequest'spendUnconfirmed x__) ())))))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.rawTx' @:: Lens' SendOutputsResponse Data.ByteString.ByteString@ -}
data SendOutputsResponse
  = SendOutputsResponse'_constructor {_SendOutputsResponse'rawTx :: !Data.ByteString.ByteString,
                                      _SendOutputsResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SendOutputsResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SendOutputsResponse
instance Data.ProtoLens.Field.HasField SendOutputsResponse "rawTx" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SendOutputsResponse'rawTx
           (\ x__ y__ -> x__ {_SendOutputsResponse'rawTx = y__}))
        Prelude.id
instance Data.ProtoLens.Message SendOutputsResponse where
  messageName _ = Data.Text.pack "walletrpc.SendOutputsResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC3SendOutputsResponse\DC2\NAK\n\
      \\ACKraw_tx\CAN\SOH \SOH(\fR\ENQrawTx"
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
              Data.ProtoLens.FieldDescriptor SendOutputsResponse
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, rawTx__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SendOutputsResponse'_unknownFields
        (\ x__ y__ -> x__ {_SendOutputsResponse'_unknownFields = y__})
  defMessage
    = SendOutputsResponse'_constructor
        {_SendOutputsResponse'rawTx = Data.ProtoLens.fieldDefault,
         _SendOutputsResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SendOutputsResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser SendOutputsResponse
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
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SendOutputsResponse"
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
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SendOutputsResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SendOutputsResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SendOutputsResponse'rawTx x__) ())
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.txHex' @:: Lens' Transaction Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.label' @:: Lens' Transaction Data.Text.Text@ -}
data Transaction
  = Transaction'_constructor {_Transaction'txHex :: !Data.ByteString.ByteString,
                              _Transaction'label :: !Data.Text.Text,
                              _Transaction'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show Transaction where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out Transaction
instance Data.ProtoLens.Field.HasField Transaction "txHex" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Transaction'txHex (\ x__ y__ -> x__ {_Transaction'txHex = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Transaction "label" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Transaction'label (\ x__ y__ -> x__ {_Transaction'label = y__}))
        Prelude.id
instance Data.ProtoLens.Message Transaction where
  messageName _ = Data.Text.pack "walletrpc.Transaction"
  packedMessageDescriptor _
    = "\n\
      \\vTransaction\DC2\NAK\n\
      \\ACKtx_hex\CAN\SOH \SOH(\fR\ENQtxHex\DC2\DC4\n\
      \\ENQlabel\CAN\STX \SOH(\tR\ENQlabel"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        txHex__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tx_hex"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"txHex")) ::
              Data.ProtoLens.FieldDescriptor Transaction
        label__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "label"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"label")) ::
              Data.ProtoLens.FieldDescriptor Transaction
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, txHex__field_descriptor),
           (Data.ProtoLens.Tag 2, label__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Transaction'_unknownFields
        (\ x__ y__ -> x__ {_Transaction'_unknownFields = y__})
  defMessage
    = Transaction'_constructor
        {_Transaction'txHex = Data.ProtoLens.fieldDefault,
         _Transaction'label = Data.ProtoLens.fieldDefault,
         _Transaction'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Transaction -> Data.ProtoLens.Encoding.Bytes.Parser Transaction
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
                                       "tx_hex"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"txHex") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "label"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"label") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Transaction"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"txHex") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"label") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Transaction where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Transaction'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Transaction'txHex x__)
                (Control.DeepSeq.deepseq (_Transaction'label x__) ()))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.inputs' @:: Lens' TxTemplate [Proto.Lnrpc.Ln0.OutPoint]@
         * 'Proto.Walletrpc.Walletkit_Fields.vec'inputs' @:: Lens' TxTemplate (Data.Vector.Vector Proto.Lnrpc.Ln0.OutPoint)@
         * 'Proto.Walletrpc.Walletkit_Fields.outputs' @:: Lens' TxTemplate (Data.Map.Map Data.Text.Text Data.Word.Word64)@ -}
data TxTemplate
  = TxTemplate'_constructor {_TxTemplate'inputs :: !(Data.Vector.Vector Proto.Lnrpc.Ln0.OutPoint),
                             _TxTemplate'outputs :: !(Data.Map.Map Data.Text.Text Data.Word.Word64),
                             _TxTemplate'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show TxTemplate where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out TxTemplate
instance Data.ProtoLens.Field.HasField TxTemplate "inputs" [Proto.Lnrpc.Ln0.OutPoint] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TxTemplate'inputs (\ x__ y__ -> x__ {_TxTemplate'inputs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField TxTemplate "vec'inputs" (Data.Vector.Vector Proto.Lnrpc.Ln0.OutPoint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TxTemplate'inputs (\ x__ y__ -> x__ {_TxTemplate'inputs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TxTemplate "outputs" (Data.Map.Map Data.Text.Text Data.Word.Word64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TxTemplate'outputs (\ x__ y__ -> x__ {_TxTemplate'outputs = y__}))
        Prelude.id
instance Data.ProtoLens.Message TxTemplate where
  messageName _ = Data.Text.pack "walletrpc.TxTemplate"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \TxTemplate\DC2'\n\
      \\ACKinputs\CAN\SOH \ETX(\v2\SI.lnrpc.OutPointR\ACKinputs\DC2<\n\
      \\aoutputs\CAN\STX \ETX(\v2\".walletrpc.TxTemplate.OutputsEntryR\aoutputs\SUB:\n\
      \\fOutputsEntry\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\EOTR\ENQvalue:\STX8\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        inputs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "inputs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Lnrpc.Ln0.OutPoint)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"inputs")) ::
              Data.ProtoLens.FieldDescriptor TxTemplate
        outputs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outputs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor TxTemplate'OutputsEntry)
              (Data.ProtoLens.MapField
                 (Data.ProtoLens.Field.field @"key")
                 (Data.ProtoLens.Field.field @"value")
                 (Data.ProtoLens.Field.field @"outputs")) ::
              Data.ProtoLens.FieldDescriptor TxTemplate
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, inputs__field_descriptor),
           (Data.ProtoLens.Tag 2, outputs__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _TxTemplate'_unknownFields
        (\ x__ y__ -> x__ {_TxTemplate'_unknownFields = y__})
  defMessage
    = TxTemplate'_constructor
        {_TxTemplate'inputs = Data.Vector.Generic.empty,
         _TxTemplate'outputs = Data.Map.empty,
         _TxTemplate'_unknownFields = []}
  parseMessage
    = let
        loop ::
          TxTemplate
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.Lnrpc.Ln0.OutPoint
             -> Data.ProtoLens.Encoding.Bytes.Parser TxTemplate
        loop x mutable'inputs
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'inputs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'inputs)
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
                              (Data.ProtoLens.Field.field @"vec'inputs") frozen'inputs x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "inputs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'inputs y)
                                loop x v
                        18
                          -> do !(entry :: TxTemplate'OutputsEntry) <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                         (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                                             Data.ProtoLens.Encoding.Bytes.isolate
                                                                               (Prelude.fromIntegral
                                                                                  len)
                                                                               Data.ProtoLens.parseMessage)
                                                                         "outputs"
                                (let
                                   key = Lens.Family2.view (Data.ProtoLens.Field.field @"key") entry
                                   value
                                     = Lens.Family2.view (Data.ProtoLens.Field.field @"value") entry
                                 in
                                   loop
                                     (Lens.Family2.over
                                        (Data.ProtoLens.Field.field @"outputs")
                                        (\ !t -> Data.Map.insert key value t) x)
                                     mutable'inputs)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'inputs
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'inputs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'inputs)
          "TxTemplate"
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
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'inputs") _x))
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
                                       (Data.ProtoLens.defMessage :: TxTemplate'OutputsEntry)))))
                      (Data.Map.toList
                         (Lens.Family2.view (Data.ProtoLens.Field.field @"outputs") _x))))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData TxTemplate where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_TxTemplate'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_TxTemplate'inputs x__)
                (Control.DeepSeq.deepseq (_TxTemplate'outputs x__) ()))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.key' @:: Lens' TxTemplate'OutputsEntry Data.Text.Text@
         * 'Proto.Walletrpc.Walletkit_Fields.value' @:: Lens' TxTemplate'OutputsEntry Data.Word.Word64@ -}
data TxTemplate'OutputsEntry
  = TxTemplate'OutputsEntry'_constructor {_TxTemplate'OutputsEntry'key :: !Data.Text.Text,
                                          _TxTemplate'OutputsEntry'value :: !Data.Word.Word64,
                                          _TxTemplate'OutputsEntry'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show TxTemplate'OutputsEntry where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out TxTemplate'OutputsEntry
instance Data.ProtoLens.Field.HasField TxTemplate'OutputsEntry "key" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TxTemplate'OutputsEntry'key
           (\ x__ y__ -> x__ {_TxTemplate'OutputsEntry'key = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TxTemplate'OutputsEntry "value" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TxTemplate'OutputsEntry'value
           (\ x__ y__ -> x__ {_TxTemplate'OutputsEntry'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message TxTemplate'OutputsEntry where
  messageName _ = Data.Text.pack "walletrpc.TxTemplate.OutputsEntry"
  packedMessageDescriptor _
    = "\n\
      \\fOutputsEntry\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\EOTR\ENQvalue:\STX8\SOH"
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
              Data.ProtoLens.FieldDescriptor TxTemplate'OutputsEntry
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor TxTemplate'OutputsEntry
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, key__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _TxTemplate'OutputsEntry'_unknownFields
        (\ x__ y__ -> x__ {_TxTemplate'OutputsEntry'_unknownFields = y__})
  defMessage
    = TxTemplate'OutputsEntry'_constructor
        {_TxTemplate'OutputsEntry'key = Data.ProtoLens.fieldDefault,
         _TxTemplate'OutputsEntry'value = Data.ProtoLens.fieldDefault,
         _TxTemplate'OutputsEntry'_unknownFields = []}
  parseMessage
    = let
        loop ::
          TxTemplate'OutputsEntry
          -> Data.ProtoLens.Encoding.Bytes.Parser TxTemplate'OutputsEntry
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
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "OutputsEntry"
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
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData TxTemplate'OutputsEntry where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_TxTemplate'OutputsEntry'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_TxTemplate'OutputsEntry'key x__)
                (Control.DeepSeq.deepseq (_TxTemplate'OutputsEntry'value x__) ()))
{- | Fields :
     
         * 'Proto.Walletrpc.Walletkit_Fields.id' @:: Lens' UtxoLease Data.ByteString.ByteString@
         * 'Proto.Walletrpc.Walletkit_Fields.outpoint' @:: Lens' UtxoLease Proto.Lnrpc.Ln0.OutPoint@
         * 'Proto.Walletrpc.Walletkit_Fields.maybe'outpoint' @:: Lens' UtxoLease (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint)@
         * 'Proto.Walletrpc.Walletkit_Fields.expiration' @:: Lens' UtxoLease Data.Word.Word64@ -}
data UtxoLease
  = UtxoLease'_constructor {_UtxoLease'id :: !Data.ByteString.ByteString,
                            _UtxoLease'outpoint :: !(Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint),
                            _UtxoLease'expiration :: !Data.Word.Word64,
                            _UtxoLease'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show UtxoLease where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out UtxoLease
instance Data.ProtoLens.Field.HasField UtxoLease "id" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UtxoLease'id (\ x__ y__ -> x__ {_UtxoLease'id = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UtxoLease "outpoint" Proto.Lnrpc.Ln0.OutPoint where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UtxoLease'outpoint (\ x__ y__ -> x__ {_UtxoLease'outpoint = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField UtxoLease "maybe'outpoint" (Prelude.Maybe Proto.Lnrpc.Ln0.OutPoint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UtxoLease'outpoint (\ x__ y__ -> x__ {_UtxoLease'outpoint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UtxoLease "expiration" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UtxoLease'expiration
           (\ x__ y__ -> x__ {_UtxoLease'expiration = y__}))
        Prelude.id
instance Data.ProtoLens.Message UtxoLease where
  messageName _ = Data.Text.pack "walletrpc.UtxoLease"
  packedMessageDescriptor _
    = "\n\
      \\tUtxoLease\DC2\SO\n\
      \\STXid\CAN\SOH \SOH(\fR\STXid\DC2+\n\
      \\boutpoint\CAN\STX \SOH(\v2\SI.lnrpc.OutPointR\boutpoint\DC2\RS\n\
      \\n\
      \expiration\CAN\ETX \SOH(\EOTR\n\
      \expiration"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        id__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"id")) ::
              Data.ProtoLens.FieldDescriptor UtxoLease
        outpoint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outpoint"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Lnrpc.Ln0.OutPoint)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'outpoint")) ::
              Data.ProtoLens.FieldDescriptor UtxoLease
        expiration__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "expiration"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"expiration")) ::
              Data.ProtoLens.FieldDescriptor UtxoLease
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, id__field_descriptor),
           (Data.ProtoLens.Tag 2, outpoint__field_descriptor),
           (Data.ProtoLens.Tag 3, expiration__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UtxoLease'_unknownFields
        (\ x__ y__ -> x__ {_UtxoLease'_unknownFields = y__})
  defMessage
    = UtxoLease'_constructor
        {_UtxoLease'id = Data.ProtoLens.fieldDefault,
         _UtxoLease'outpoint = Prelude.Nothing,
         _UtxoLease'expiration = Data.ProtoLens.fieldDefault,
         _UtxoLease'_unknownFields = []}
  parseMessage
    = let
        loop :: UtxoLease -> Data.ProtoLens.Encoding.Bytes.Parser UtxoLease
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
                                       "id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"id") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "outpoint"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"outpoint") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "expiration"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"expiration") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UtxoLease"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"id") _x
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
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'outpoint") _x
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
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"expiration") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData UtxoLease where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UtxoLease'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UtxoLease'id x__)
                (Control.DeepSeq.deepseq
                   (_UtxoLease'outpoint x__)
                   (Control.DeepSeq.deepseq (_UtxoLease'expiration x__) ())))
newtype WitnessType'UnrecognizedValue
  = WitnessType'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq,
                  Prelude.Ord,
                  Prelude.Show,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out WitnessType'UnrecognizedValue
data WitnessType
  = UNKNOWN_WITNESS |
    COMMITMENT_TIME_LOCK |
    COMMITMENT_NO_DELAY |
    COMMITMENT_REVOKE |
    HTLC_OFFERED_REVOKE |
    HTLC_ACCEPTED_REVOKE |
    HTLC_OFFERED_TIMEOUT_SECOND_LEVEL |
    HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL |
    HTLC_OFFERED_REMOTE_TIMEOUT |
    HTLC_ACCEPTED_REMOTE_SUCCESS |
    HTLC_SECOND_LEVEL_REVOKE |
    WITNESS_KEY_HASH |
    NESTED_WITNESS_KEY_HASH |
    COMMITMENT_ANCHOR |
    WitnessType'Unrecognized !WitnessType'UnrecognizedValue
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Data.ProtoLens.MessageEnum WitnessType where
  maybeToEnum 0 = Prelude.Just UNKNOWN_WITNESS
  maybeToEnum 1 = Prelude.Just COMMITMENT_TIME_LOCK
  maybeToEnum 2 = Prelude.Just COMMITMENT_NO_DELAY
  maybeToEnum 3 = Prelude.Just COMMITMENT_REVOKE
  maybeToEnum 4 = Prelude.Just HTLC_OFFERED_REVOKE
  maybeToEnum 5 = Prelude.Just HTLC_ACCEPTED_REVOKE
  maybeToEnum 6 = Prelude.Just HTLC_OFFERED_TIMEOUT_SECOND_LEVEL
  maybeToEnum 7 = Prelude.Just HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL
  maybeToEnum 8 = Prelude.Just HTLC_OFFERED_REMOTE_TIMEOUT
  maybeToEnum 9 = Prelude.Just HTLC_ACCEPTED_REMOTE_SUCCESS
  maybeToEnum 10 = Prelude.Just HTLC_SECOND_LEVEL_REVOKE
  maybeToEnum 11 = Prelude.Just WITNESS_KEY_HASH
  maybeToEnum 12 = Prelude.Just NESTED_WITNESS_KEY_HASH
  maybeToEnum 13 = Prelude.Just COMMITMENT_ANCHOR
  maybeToEnum k
    = Prelude.Just
        (WitnessType'Unrecognized
           (WitnessType'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UNKNOWN_WITNESS = "UNKNOWN_WITNESS"
  showEnum COMMITMENT_TIME_LOCK = "COMMITMENT_TIME_LOCK"
  showEnum COMMITMENT_NO_DELAY = "COMMITMENT_NO_DELAY"
  showEnum COMMITMENT_REVOKE = "COMMITMENT_REVOKE"
  showEnum HTLC_OFFERED_REVOKE = "HTLC_OFFERED_REVOKE"
  showEnum HTLC_ACCEPTED_REVOKE = "HTLC_ACCEPTED_REVOKE"
  showEnum HTLC_OFFERED_TIMEOUT_SECOND_LEVEL
    = "HTLC_OFFERED_TIMEOUT_SECOND_LEVEL"
  showEnum HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL
    = "HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL"
  showEnum HTLC_OFFERED_REMOTE_TIMEOUT
    = "HTLC_OFFERED_REMOTE_TIMEOUT"
  showEnum HTLC_ACCEPTED_REMOTE_SUCCESS
    = "HTLC_ACCEPTED_REMOTE_SUCCESS"
  showEnum HTLC_SECOND_LEVEL_REVOKE = "HTLC_SECOND_LEVEL_REVOKE"
  showEnum WITNESS_KEY_HASH = "WITNESS_KEY_HASH"
  showEnum NESTED_WITNESS_KEY_HASH = "NESTED_WITNESS_KEY_HASH"
  showEnum COMMITMENT_ANCHOR = "COMMITMENT_ANCHOR"
  showEnum
    (WitnessType'Unrecognized (WitnessType'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UNKNOWN_WITNESS" = Prelude.Just UNKNOWN_WITNESS
    | (Prelude.==) k "COMMITMENT_TIME_LOCK"
    = Prelude.Just COMMITMENT_TIME_LOCK
    | (Prelude.==) k "COMMITMENT_NO_DELAY"
    = Prelude.Just COMMITMENT_NO_DELAY
    | (Prelude.==) k "COMMITMENT_REVOKE"
    = Prelude.Just COMMITMENT_REVOKE
    | (Prelude.==) k "HTLC_OFFERED_REVOKE"
    = Prelude.Just HTLC_OFFERED_REVOKE
    | (Prelude.==) k "HTLC_ACCEPTED_REVOKE"
    = Prelude.Just HTLC_ACCEPTED_REVOKE
    | (Prelude.==) k "HTLC_OFFERED_TIMEOUT_SECOND_LEVEL"
    = Prelude.Just HTLC_OFFERED_TIMEOUT_SECOND_LEVEL
    | (Prelude.==) k "HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL"
    = Prelude.Just HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL
    | (Prelude.==) k "HTLC_OFFERED_REMOTE_TIMEOUT"
    = Prelude.Just HTLC_OFFERED_REMOTE_TIMEOUT
    | (Prelude.==) k "HTLC_ACCEPTED_REMOTE_SUCCESS"
    = Prelude.Just HTLC_ACCEPTED_REMOTE_SUCCESS
    | (Prelude.==) k "HTLC_SECOND_LEVEL_REVOKE"
    = Prelude.Just HTLC_SECOND_LEVEL_REVOKE
    | (Prelude.==) k "WITNESS_KEY_HASH" = Prelude.Just WITNESS_KEY_HASH
    | (Prelude.==) k "NESTED_WITNESS_KEY_HASH"
    = Prelude.Just NESTED_WITNESS_KEY_HASH
    | (Prelude.==) k "COMMITMENT_ANCHOR"
    = Prelude.Just COMMITMENT_ANCHOR
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded WitnessType where
  minBound = UNKNOWN_WITNESS
  maxBound = COMMITMENT_ANCHOR
instance Prelude.Enum WitnessType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum WitnessType: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UNKNOWN_WITNESS = 0
  fromEnum COMMITMENT_TIME_LOCK = 1
  fromEnum COMMITMENT_NO_DELAY = 2
  fromEnum COMMITMENT_REVOKE = 3
  fromEnum HTLC_OFFERED_REVOKE = 4
  fromEnum HTLC_ACCEPTED_REVOKE = 5
  fromEnum HTLC_OFFERED_TIMEOUT_SECOND_LEVEL = 6
  fromEnum HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL = 7
  fromEnum HTLC_OFFERED_REMOTE_TIMEOUT = 8
  fromEnum HTLC_ACCEPTED_REMOTE_SUCCESS = 9
  fromEnum HTLC_SECOND_LEVEL_REVOKE = 10
  fromEnum WITNESS_KEY_HASH = 11
  fromEnum NESTED_WITNESS_KEY_HASH = 12
  fromEnum COMMITMENT_ANCHOR = 13
  fromEnum
    (WitnessType'Unrecognized (WitnessType'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ COMMITMENT_ANCHOR
    = Prelude.error
        "WitnessType.succ: bad argument COMMITMENT_ANCHOR. This value would be out of bounds."
  succ UNKNOWN_WITNESS = COMMITMENT_TIME_LOCK
  succ COMMITMENT_TIME_LOCK = COMMITMENT_NO_DELAY
  succ COMMITMENT_NO_DELAY = COMMITMENT_REVOKE
  succ COMMITMENT_REVOKE = HTLC_OFFERED_REVOKE
  succ HTLC_OFFERED_REVOKE = HTLC_ACCEPTED_REVOKE
  succ HTLC_ACCEPTED_REVOKE = HTLC_OFFERED_TIMEOUT_SECOND_LEVEL
  succ HTLC_OFFERED_TIMEOUT_SECOND_LEVEL
    = HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL
  succ HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL
    = HTLC_OFFERED_REMOTE_TIMEOUT
  succ HTLC_OFFERED_REMOTE_TIMEOUT = HTLC_ACCEPTED_REMOTE_SUCCESS
  succ HTLC_ACCEPTED_REMOTE_SUCCESS = HTLC_SECOND_LEVEL_REVOKE
  succ HTLC_SECOND_LEVEL_REVOKE = WITNESS_KEY_HASH
  succ WITNESS_KEY_HASH = NESTED_WITNESS_KEY_HASH
  succ NESTED_WITNESS_KEY_HASH = COMMITMENT_ANCHOR
  succ (WitnessType'Unrecognized _)
    = Prelude.error
        "WitnessType.succ: bad argument: unrecognized value"
  pred UNKNOWN_WITNESS
    = Prelude.error
        "WitnessType.pred: bad argument UNKNOWN_WITNESS. This value would be out of bounds."
  pred COMMITMENT_TIME_LOCK = UNKNOWN_WITNESS
  pred COMMITMENT_NO_DELAY = COMMITMENT_TIME_LOCK
  pred COMMITMENT_REVOKE = COMMITMENT_NO_DELAY
  pred HTLC_OFFERED_REVOKE = COMMITMENT_REVOKE
  pred HTLC_ACCEPTED_REVOKE = HTLC_OFFERED_REVOKE
  pred HTLC_OFFERED_TIMEOUT_SECOND_LEVEL = HTLC_ACCEPTED_REVOKE
  pred HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL
    = HTLC_OFFERED_TIMEOUT_SECOND_LEVEL
  pred HTLC_OFFERED_REMOTE_TIMEOUT
    = HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL
  pred HTLC_ACCEPTED_REMOTE_SUCCESS = HTLC_OFFERED_REMOTE_TIMEOUT
  pred HTLC_SECOND_LEVEL_REVOKE = HTLC_ACCEPTED_REMOTE_SUCCESS
  pred WITNESS_KEY_HASH = HTLC_SECOND_LEVEL_REVOKE
  pred NESTED_WITNESS_KEY_HASH = WITNESS_KEY_HASH
  pred COMMITMENT_ANCHOR = NESTED_WITNESS_KEY_HASH
  pred (WitnessType'Unrecognized _)
    = Prelude.error
        "WitnessType.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault WitnessType where
  fieldDefault = UNKNOWN_WITNESS
instance Control.DeepSeq.NFData WitnessType where
  rnf x__ = Prelude.seq x__ ()
instance Text.PrettyPrint.GenericPretty.Out WitnessType
data WalletKit = WalletKit {}
instance Data.ProtoLens.Service.Types.Service WalletKit where
  type ServiceName WalletKit = "WalletKit"
  type ServicePackage WalletKit = "walletrpc"
  type ServiceMethods WalletKit = '["bumpFee",
                                    "deriveKey",
                                    "deriveNextKey",
                                    "estimateFee",
                                    "finalizePsbt",
                                    "fundPsbt",
                                    "importAccount",
                                    "importPublicKey",
                                    "labelTransaction",
                                    "leaseOutput",
                                    "listAccounts",
                                    "listLeases",
                                    "listSweeps",
                                    "listUnspent",
                                    "nextAddr",
                                    "pendingSweeps",
                                    "publishTransaction",
                                    "releaseOutput",
                                    "sendOutputs"]
  packedServiceDescriptor _
    = "\n\
      \\tWalletKit\DC2L\n\
      \\vListUnspent\DC2\GS.walletrpc.ListUnspentRequest\SUB\RS.walletrpc.ListUnspentResponse\DC2L\n\
      \\vLeaseOutput\DC2\GS.walletrpc.LeaseOutputRequest\SUB\RS.walletrpc.LeaseOutputResponse\DC2R\n\
      \\rReleaseOutput\DC2\US.walletrpc.ReleaseOutputRequest\SUB .walletrpc.ReleaseOutputResponse\DC2I\n\
      \\n\
      \ListLeases\DC2\FS.walletrpc.ListLeasesRequest\SUB\GS.walletrpc.ListLeasesResponse\DC2:\n\
      \\rDeriveNextKey\DC2\DC1.walletrpc.KeyReq\SUB\SYN.signrpc.KeyDescriptor\DC28\n\
      \\tDeriveKey\DC2\DC3.signrpc.KeyLocator\SUB\SYN.signrpc.KeyDescriptor\DC2;\n\
      \\bNextAddr\DC2\SYN.walletrpc.AddrRequest\SUB\ETB.walletrpc.AddrResponse\DC2O\n\
      \\fListAccounts\DC2\RS.walletrpc.ListAccountsRequest\SUB\US.walletrpc.ListAccountsResponse\DC2R\n\
      \\rImportAccount\DC2\US.walletrpc.ImportAccountRequest\SUB .walletrpc.ImportAccountResponse\DC2X\n\
      \\SIImportPublicKey\DC2!.walletrpc.ImportPublicKeyRequest\SUB\".walletrpc.ImportPublicKeyResponse\DC2H\n\
      \\DC2PublishTransaction\DC2\SYN.walletrpc.Transaction\SUB\SUB.walletrpc.PublishResponse\DC2L\n\
      \\vSendOutputs\DC2\GS.walletrpc.SendOutputsRequest\SUB\RS.walletrpc.SendOutputsResponse\DC2L\n\
      \\vEstimateFee\DC2\GS.walletrpc.EstimateFeeRequest\SUB\RS.walletrpc.EstimateFeeResponse\DC2R\n\
      \\rPendingSweeps\DC2\US.walletrpc.PendingSweepsRequest\SUB .walletrpc.PendingSweepsResponse\DC2@\n\
      \\aBumpFee\DC2\EM.walletrpc.BumpFeeRequest\SUB\SUB.walletrpc.BumpFeeResponse\DC2I\n\
      \\n\
      \ListSweeps\DC2\FS.walletrpc.ListSweepsRequest\SUB\GS.walletrpc.ListSweepsResponse\DC2[\n\
      \\DLELabelTransaction\DC2\".walletrpc.LabelTransactionRequest\SUB#.walletrpc.LabelTransactionResponse\DC2C\n\
      \\bFundPsbt\DC2\SUB.walletrpc.FundPsbtRequest\SUB\ESC.walletrpc.FundPsbtResponse\DC2O\n\
      \\fFinalizePsbt\DC2\RS.walletrpc.FinalizePsbtRequest\SUB\US.walletrpc.FinalizePsbtResponse"
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "listUnspent" where
  type MethodName WalletKit "listUnspent" = "ListUnspent"
  type MethodInput WalletKit "listUnspent" = ListUnspentRequest
  type MethodOutput WalletKit "listUnspent" = ListUnspentResponse
  type MethodStreamingType WalletKit "listUnspent" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "leaseOutput" where
  type MethodName WalletKit "leaseOutput" = "LeaseOutput"
  type MethodInput WalletKit "leaseOutput" = LeaseOutputRequest
  type MethodOutput WalletKit "leaseOutput" = LeaseOutputResponse
  type MethodStreamingType WalletKit "leaseOutput" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "releaseOutput" where
  type MethodName WalletKit "releaseOutput" = "ReleaseOutput"
  type MethodInput WalletKit "releaseOutput" = ReleaseOutputRequest
  type MethodOutput WalletKit "releaseOutput" = ReleaseOutputResponse
  type MethodStreamingType WalletKit "releaseOutput" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "listLeases" where
  type MethodName WalletKit "listLeases" = "ListLeases"
  type MethodInput WalletKit "listLeases" = ListLeasesRequest
  type MethodOutput WalletKit "listLeases" = ListLeasesResponse
  type MethodStreamingType WalletKit "listLeases" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "deriveNextKey" where
  type MethodName WalletKit "deriveNextKey" = "DeriveNextKey"
  type MethodInput WalletKit "deriveNextKey" = KeyReq
  type MethodOutput WalletKit "deriveNextKey" = Proto.Signrpc.Signer.KeyDescriptor
  type MethodStreamingType WalletKit "deriveNextKey" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "deriveKey" where
  type MethodName WalletKit "deriveKey" = "DeriveKey"
  type MethodInput WalletKit "deriveKey" = Proto.Signrpc.Signer.KeyLocator
  type MethodOutput WalletKit "deriveKey" = Proto.Signrpc.Signer.KeyDescriptor
  type MethodStreamingType WalletKit "deriveKey" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "nextAddr" where
  type MethodName WalletKit "nextAddr" = "NextAddr"
  type MethodInput WalletKit "nextAddr" = AddrRequest
  type MethodOutput WalletKit "nextAddr" = AddrResponse
  type MethodStreamingType WalletKit "nextAddr" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "listAccounts" where
  type MethodName WalletKit "listAccounts" = "ListAccounts"
  type MethodInput WalletKit "listAccounts" = ListAccountsRequest
  type MethodOutput WalletKit "listAccounts" = ListAccountsResponse
  type MethodStreamingType WalletKit "listAccounts" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "importAccount" where
  type MethodName WalletKit "importAccount" = "ImportAccount"
  type MethodInput WalletKit "importAccount" = ImportAccountRequest
  type MethodOutput WalletKit "importAccount" = ImportAccountResponse
  type MethodStreamingType WalletKit "importAccount" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "importPublicKey" where
  type MethodName WalletKit "importPublicKey" = "ImportPublicKey"
  type MethodInput WalletKit "importPublicKey" = ImportPublicKeyRequest
  type MethodOutput WalletKit "importPublicKey" = ImportPublicKeyResponse
  type MethodStreamingType WalletKit "importPublicKey" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "publishTransaction" where
  type MethodName WalletKit "publishTransaction" = "PublishTransaction"
  type MethodInput WalletKit "publishTransaction" = Transaction
  type MethodOutput WalletKit "publishTransaction" = PublishResponse
  type MethodStreamingType WalletKit "publishTransaction" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "sendOutputs" where
  type MethodName WalletKit "sendOutputs" = "SendOutputs"
  type MethodInput WalletKit "sendOutputs" = SendOutputsRequest
  type MethodOutput WalletKit "sendOutputs" = SendOutputsResponse
  type MethodStreamingType WalletKit "sendOutputs" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "estimateFee" where
  type MethodName WalletKit "estimateFee" = "EstimateFee"
  type MethodInput WalletKit "estimateFee" = EstimateFeeRequest
  type MethodOutput WalletKit "estimateFee" = EstimateFeeResponse
  type MethodStreamingType WalletKit "estimateFee" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "pendingSweeps" where
  type MethodName WalletKit "pendingSweeps" = "PendingSweeps"
  type MethodInput WalletKit "pendingSweeps" = PendingSweepsRequest
  type MethodOutput WalletKit "pendingSweeps" = PendingSweepsResponse
  type MethodStreamingType WalletKit "pendingSweeps" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "bumpFee" where
  type MethodName WalletKit "bumpFee" = "BumpFee"
  type MethodInput WalletKit "bumpFee" = BumpFeeRequest
  type MethodOutput WalletKit "bumpFee" = BumpFeeResponse
  type MethodStreamingType WalletKit "bumpFee" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "listSweeps" where
  type MethodName WalletKit "listSweeps" = "ListSweeps"
  type MethodInput WalletKit "listSweeps" = ListSweepsRequest
  type MethodOutput WalletKit "listSweeps" = ListSweepsResponse
  type MethodStreamingType WalletKit "listSweeps" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "labelTransaction" where
  type MethodName WalletKit "labelTransaction" = "LabelTransaction"
  type MethodInput WalletKit "labelTransaction" = LabelTransactionRequest
  type MethodOutput WalletKit "labelTransaction" = LabelTransactionResponse
  type MethodStreamingType WalletKit "labelTransaction" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "fundPsbt" where
  type MethodName WalletKit "fundPsbt" = "FundPsbt"
  type MethodInput WalletKit "fundPsbt" = FundPsbtRequest
  type MethodOutput WalletKit "fundPsbt" = FundPsbtResponse
  type MethodStreamingType WalletKit "fundPsbt" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletKit "finalizePsbt" where
  type MethodName WalletKit "finalizePsbt" = "FinalizePsbt"
  type MethodInput WalletKit "finalizePsbt" = FinalizePsbtRequest
  type MethodOutput WalletKit "finalizePsbt" = FinalizePsbtResponse
  type MethodStreamingType WalletKit "finalizePsbt" = 'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\EMwalletrpc/walletkit.proto\DC2\twalletrpc\SUB\SIlightning.proto\SUB\SIlnrpc/ln0.proto\SUB\DC4signrpc/signer.proto\"h\n\
    \\DC2ListUnspentRequest\DC2\ESC\n\
    \\tmin_confs\CAN\SOH \SOH(\ENQR\bminConfs\DC2\ESC\n\
    \\tmax_confs\CAN\STX \SOH(\ENQR\bmaxConfs\DC2\CAN\n\
    \\aaccount\CAN\ETX \SOH(\tR\aaccount\"8\n\
    \\DC3ListUnspentResponse\DC2!\n\
    \\ENQutxos\CAN\SOH \ETX(\v2\v.lnrpc.UtxoR\ENQutxos\"\128\SOH\n\
    \\DC2LeaseOutputRequest\DC2\SO\n\
    \\STXid\CAN\SOH \SOH(\fR\STXid\DC2+\n\
    \\boutpoint\CAN\STX \SOH(\v2\SI.lnrpc.OutPointR\boutpoint\DC2-\n\
    \\DC2expiration_seconds\CAN\ETX \SOH(\EOTR\DC1expirationSeconds\"5\n\
    \\DC3LeaseOutputResponse\DC2\RS\n\
    \\n\
    \expiration\CAN\SOH \SOH(\EOTR\n\
    \expiration\"S\n\
    \\DC4ReleaseOutputRequest\DC2\SO\n\
    \\STXid\CAN\SOH \SOH(\fR\STXid\DC2+\n\
    \\boutpoint\CAN\STX \SOH(\v2\SI.lnrpc.OutPointR\boutpoint\"\ETB\n\
    \\NAKReleaseOutputResponse\"Q\n\
    \\ACKKeyReq\DC2(\n\
    \\DLEkey_finger_print\CAN\SOH \SOH(\ENQR\SOkeyFingerPrint\DC2\GS\n\
    \\n\
    \key_family\CAN\STX \SOH(\ENQR\tkeyFamily\"k\n\
    \\vAddrRequest\DC2\CAN\n\
    \\aaccount\CAN\SOH \SOH(\tR\aaccount\DC2*\n\
    \\EOTtype\CAN\STX \SOH(\SO2\SYN.walletrpc.AddressTypeR\EOTtype\DC2\SYN\n\
    \\ACKchange\CAN\ETX \SOH(\bR\ACKchange\"\"\n\
    \\fAddrResponse\DC2\DC2\n\
    \\EOTaddr\CAN\SOH \SOH(\tR\EOTaddr\"\226\STX\n\
    \\aAccount\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC29\n\
    \\faddress_type\CAN\STX \SOH(\SO2\SYN.walletrpc.AddressTypeR\vaddressType\DC2.\n\
    \\DC3extended_public_key\CAN\ETX \SOH(\tR\DC1extendedPublicKey\DC24\n\
    \\SYNmaster_key_fingerprint\CAN\EOT \SOH(\fR\DC4masterKeyFingerprint\DC2'\n\
    \\SIderivation_path\CAN\ENQ \SOH(\tR\SOderivationPath\DC2,\n\
    \\DC2external_key_count\CAN\ACK \SOH(\rR\DLEexternalKeyCount\DC2,\n\
    \\DC2internal_key_count\CAN\a \SOH(\rR\DLEinternalKeyCount\DC2\GS\n\
    \\n\
    \watch_only\CAN\b \SOH(\bR\twatchOnly\"d\n\
    \\DC3ListAccountsRequest\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC29\n\
    \\faddress_type\CAN\STX \SOH(\SO2\SYN.walletrpc.AddressTypeR\vaddressType\"F\n\
    \\DC4ListAccountsResponse\DC2.\n\
    \\baccounts\CAN\SOH \ETX(\v2\DC2.walletrpc.AccountR\baccounts\"\228\SOH\n\
    \\DC4ImportAccountRequest\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2.\n\
    \\DC3extended_public_key\CAN\STX \SOH(\tR\DC1extendedPublicKey\DC24\n\
    \\SYNmaster_key_fingerprint\CAN\ETX \SOH(\fR\DC4masterKeyFingerprint\DC29\n\
    \\faddress_type\CAN\EOT \SOH(\SO2\SYN.walletrpc.AddressTypeR\vaddressType\DC2\ETB\n\
    \\adry_run\CAN\ENQ \SOH(\bR\ACKdryRun\"\175\SOH\n\
    \\NAKImportAccountResponse\DC2,\n\
    \\aaccount\CAN\SOH \SOH(\v2\DC2.walletrpc.AccountR\aaccount\DC23\n\
    \\SYNdry_run_external_addrs\CAN\STX \ETX(\tR\DC3dryRunExternalAddrs\DC23\n\
    \\SYNdry_run_internal_addrs\CAN\ETX \ETX(\tR\DC3dryRunInternalAddrs\"r\n\
    \\SYNImportPublicKeyRequest\DC2\GS\n\
    \\n\
    \public_key\CAN\SOH \SOH(\fR\tpublicKey\DC29\n\
    \\faddress_type\CAN\STX \SOH(\SO2\SYN.walletrpc.AddressTypeR\vaddressType\"\EM\n\
    \\ETBImportPublicKeyResponse\":\n\
    \\vTransaction\DC2\NAK\n\
    \\ACKtx_hex\CAN\SOH \SOH(\fR\ENQtxHex\DC2\DC4\n\
    \\ENQlabel\CAN\STX \SOH(\tR\ENQlabel\"6\n\
    \\SIPublishResponse\DC2#\n\
    \\rpublish_error\CAN\SOH \SOH(\tR\fpublishError\"\188\SOH\n\
    \\DC2SendOutputsRequest\DC2\FS\n\
    \\n\
    \sat_per_kw\CAN\SOH \SOH(\ETXR\bsatPerKw\DC2(\n\
    \\aoutputs\CAN\STX \ETX(\v2\SO.signrpc.TxOutR\aoutputs\DC2\DC4\n\
    \\ENQlabel\CAN\ETX \SOH(\tR\ENQlabel\DC2\ESC\n\
    \\tmin_confs\CAN\EOT \SOH(\ENQR\bminConfs\DC2+\n\
    \\DC1spend_unconfirmed\CAN\ENQ \SOH(\bR\DLEspendUnconfirmed\",\n\
    \\DC3SendOutputsResponse\DC2\NAK\n\
    \\ACKraw_tx\CAN\SOH \SOH(\fR\ENQrawTx\"5\n\
    \\DC2EstimateFeeRequest\DC2\US\n\
    \\vconf_target\CAN\SOH \SOH(\ENQR\n\
    \confTarget\"3\n\
    \\DC3EstimateFeeResponse\DC2\FS\n\
    \\n\
    \sat_per_kw\CAN\SOH \SOH(\ETXR\bsatPerKw\"\252\ETX\n\
    \\fPendingSweep\DC2+\n\
    \\boutpoint\CAN\SOH \SOH(\v2\SI.lnrpc.OutPointR\boutpoint\DC29\n\
    \\fwitness_type\CAN\STX \SOH(\SO2\SYN.walletrpc.WitnessTypeR\vwitnessType\DC2\GS\n\
    \\n\
    \amount_sat\CAN\ETX \SOH(\rR\tamountSat\DC2$\n\
    \\fsat_per_byte\CAN\EOT \SOH(\rR\n\
    \satPerByteB\STX\CAN\SOH\DC2-\n\
    \\DC2broadcast_attempts\CAN\ENQ \SOH(\rR\DC1broadcastAttempts\DC22\n\
    \\NAKnext_broadcast_height\CAN\ACK \SOH(\rR\DC3nextBroadcastHeight\DC22\n\
    \\NAKrequested_conf_target\CAN\b \SOH(\rR\DC3requestedConfTarget\DC27\n\
    \\SYNrequested_sat_per_byte\CAN\t \SOH(\rR\DC3requestedSatPerByteB\STX\CAN\SOH\DC2\"\n\
    \\rsat_per_vbyte\CAN\n\
    \ \SOH(\EOTR\vsatPerVbyte\DC25\n\
    \\ETBrequested_sat_per_vbyte\CAN\v \SOH(\EOTR\DC4requestedSatPerVbyte\DC2\DC4\n\
    \\ENQforce\CAN\a \SOH(\bR\ENQforce\"\SYN\n\
    \\DC4PendingSweepsRequest\"W\n\
    \\NAKPendingSweepsResponse\DC2>\n\
    \\SOpending_sweeps\CAN\SOH \ETX(\v2\ETB.walletrpc.PendingSweepR\rpendingSweeps\"\190\SOH\n\
    \\SOBumpFeeRequest\DC2+\n\
    \\boutpoint\CAN\SOH \SOH(\v2\SI.lnrpc.OutPointR\boutpoint\DC2\US\n\
    \\vtarget_conf\CAN\STX \SOH(\rR\n\
    \targetConf\DC2$\n\
    \\fsat_per_byte\CAN\ETX \SOH(\rR\n\
    \satPerByteB\STX\CAN\SOH\DC2\DC4\n\
    \\ENQforce\CAN\EOT \SOH(\bR\ENQforce\DC2\"\n\
    \\rsat_per_vbyte\CAN\ENQ \SOH(\EOTR\vsatPerVbyte\"\DC1\n\
    \\SIBumpFeeResponse\"-\n\
    \\DC1ListSweepsRequest\DC2\CAN\n\
    \\averbose\CAN\SOH \SOH(\bR\averbose\"\128\STX\n\
    \\DC2ListSweepsResponse\DC2L\n\
    \\DC3transaction_details\CAN\SOH \SOH(\v2\EM.lnrpc.TransactionDetailsH\NULR\DC2transactionDetails\DC2W\n\
    \\SItransaction_ids\CAN\STX \SOH(\v2,.walletrpc.ListSweepsResponse.TransactionIDsH\NULR\SOtransactionIds\SUB9\n\
    \\SOTransactionIDs\DC2'\n\
    \\SItransaction_ids\CAN\SOH \ETX(\tR\SOtransactionIdsB\b\n\
    \\ACKsweeps\"a\n\
    \\ETBLabelTransactionRequest\DC2\DC2\n\
    \\EOTtxid\CAN\SOH \SOH(\fR\EOTtxid\DC2\DC4\n\
    \\ENQlabel\CAN\STX \SOH(\tR\ENQlabel\DC2\FS\n\
    \\toverwrite\CAN\ETX \SOH(\bR\toverwrite\"\SUB\n\
    \\CANLabelTransactionResponse\"\147\STX\n\
    \\SIFundPsbtRequest\DC2\DC4\n\
    \\EOTpsbt\CAN\SOH \SOH(\fH\NULR\EOTpsbt\DC2)\n\
    \\ETXraw\CAN\STX \SOH(\v2\NAK.walletrpc.TxTemplateH\NULR\ETXraw\DC2!\n\
    \\vtarget_conf\CAN\ETX \SOH(\rH\SOHR\n\
    \targetConf\DC2$\n\
    \\rsat_per_vbyte\CAN\EOT \SOH(\EOTH\SOHR\vsatPerVbyte\DC2\CAN\n\
    \\aaccount\CAN\ENQ \SOH(\tR\aaccount\DC2\ESC\n\
    \\tmin_confs\CAN\ACK \SOH(\ENQR\bminConfs\DC2+\n\
    \\DC1spend_unconfirmed\CAN\a \SOH(\bR\DLEspendUnconfirmedB\n\
    \\n\
    \\btemplateB\ACK\n\
    \\EOTfees\"\156\SOH\n\
    \\DLEFundPsbtResponse\DC2\US\n\
    \\vfunded_psbt\CAN\SOH \SOH(\fR\n\
    \fundedPsbt\DC2.\n\
    \\DC3change_output_index\CAN\STX \SOH(\ENQR\DC1changeOutputIndex\DC27\n\
    \\flocked_utxos\CAN\ETX \ETX(\v2\DC4.walletrpc.UtxoLeaseR\vlockedUtxos\"\175\SOH\n\
    \\n\
    \TxTemplate\DC2'\n\
    \\ACKinputs\CAN\SOH \ETX(\v2\SI.lnrpc.OutPointR\ACKinputs\DC2<\n\
    \\aoutputs\CAN\STX \ETX(\v2\".walletrpc.TxTemplate.OutputsEntryR\aoutputs\SUB:\n\
    \\fOutputsEntry\DC2\DLE\n\
    \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2\DC4\n\
    \\ENQvalue\CAN\STX \SOH(\EOTR\ENQvalue:\STX8\SOH\"h\n\
    \\tUtxoLease\DC2\SO\n\
    \\STXid\CAN\SOH \SOH(\fR\STXid\DC2+\n\
    \\boutpoint\CAN\STX \SOH(\v2\SI.lnrpc.OutPointR\boutpoint\DC2\RS\n\
    \\n\
    \expiration\CAN\ETX \SOH(\EOTR\n\
    \expiration\"P\n\
    \\DC3FinalizePsbtRequest\DC2\US\n\
    \\vfunded_psbt\CAN\SOH \SOH(\fR\n\
    \fundedPsbt\DC2\CAN\n\
    \\aaccount\CAN\ENQ \SOH(\tR\aaccount\"Y\n\
    \\DC4FinalizePsbtResponse\DC2\US\n\
    \\vsigned_psbt\CAN\SOH \SOH(\fR\n\
    \signedPsbt\DC2 \n\
    \\fraw_final_tx\CAN\STX \SOH(\fR\n\
    \rawFinalTx\"\DC3\n\
    \\DC1ListLeasesRequest\"M\n\
    \\DC2ListLeasesResponse\DC27\n\
    \\flocked_utxos\CAN\SOH \ETX(\v2\DC4.walletrpc.UtxoLeaseR\vlockedUtxos*z\n\
    \\vAddressType\DC2\v\n\
    \\aUNKNOWN\DLE\NUL\DC2\ETB\n\
    \\DC3WITNESS_PUBKEY_HASH\DLE\SOH\DC2\RS\n\
    \\SUBNESTED_WITNESS_PUBKEY_HASH\DLE\STX\DC2%\n\
    \!HYBRID_NESTED_WITNESS_PUBKEY_HASH\DLE\ETX*\153\ETX\n\
    \\vWitnessType\DC2\DC3\n\
    \\SIUNKNOWN_WITNESS\DLE\NUL\DC2\CAN\n\
    \\DC4COMMITMENT_TIME_LOCK\DLE\SOH\DC2\ETB\n\
    \\DC3COMMITMENT_NO_DELAY\DLE\STX\DC2\NAK\n\
    \\DC1COMMITMENT_REVOKE\DLE\ETX\DC2\ETB\n\
    \\DC3HTLC_OFFERED_REVOKE\DLE\EOT\DC2\CAN\n\
    \\DC4HTLC_ACCEPTED_REVOKE\DLE\ENQ\DC2%\n\
    \!HTLC_OFFERED_TIMEOUT_SECOND_LEVEL\DLE\ACK\DC2&\n\
    \\"HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL\DLE\a\DC2\US\n\
    \\ESCHTLC_OFFERED_REMOTE_TIMEOUT\DLE\b\DC2 \n\
    \\FSHTLC_ACCEPTED_REMOTE_SUCCESS\DLE\t\DC2\FS\n\
    \\CANHTLC_SECOND_LEVEL_REVOKE\DLE\n\
    \\DC2\DC4\n\
    \\DLEWITNESS_KEY_HASH\DLE\v\DC2\ESC\n\
    \\ETBNESTED_WITNESS_KEY_HASH\DLE\f\DC2\NAK\n\
    \\DC1COMMITMENT_ANCHOR\DLE\r2\178\v\n\
    \\tWalletKit\DC2L\n\
    \\vListUnspent\DC2\GS.walletrpc.ListUnspentRequest\SUB\RS.walletrpc.ListUnspentResponse\DC2L\n\
    \\vLeaseOutput\DC2\GS.walletrpc.LeaseOutputRequest\SUB\RS.walletrpc.LeaseOutputResponse\DC2R\n\
    \\rReleaseOutput\DC2\US.walletrpc.ReleaseOutputRequest\SUB .walletrpc.ReleaseOutputResponse\DC2I\n\
    \\n\
    \ListLeases\DC2\FS.walletrpc.ListLeasesRequest\SUB\GS.walletrpc.ListLeasesResponse\DC2:\n\
    \\rDeriveNextKey\DC2\DC1.walletrpc.KeyReq\SUB\SYN.signrpc.KeyDescriptor\DC28\n\
    \\tDeriveKey\DC2\DC3.signrpc.KeyLocator\SUB\SYN.signrpc.KeyDescriptor\DC2;\n\
    \\bNextAddr\DC2\SYN.walletrpc.AddrRequest\SUB\ETB.walletrpc.AddrResponse\DC2O\n\
    \\fListAccounts\DC2\RS.walletrpc.ListAccountsRequest\SUB\US.walletrpc.ListAccountsResponse\DC2R\n\
    \\rImportAccount\DC2\US.walletrpc.ImportAccountRequest\SUB .walletrpc.ImportAccountResponse\DC2X\n\
    \\SIImportPublicKey\DC2!.walletrpc.ImportPublicKeyRequest\SUB\".walletrpc.ImportPublicKeyResponse\DC2H\n\
    \\DC2PublishTransaction\DC2\SYN.walletrpc.Transaction\SUB\SUB.walletrpc.PublishResponse\DC2L\n\
    \\vSendOutputs\DC2\GS.walletrpc.SendOutputsRequest\SUB\RS.walletrpc.SendOutputsResponse\DC2L\n\
    \\vEstimateFee\DC2\GS.walletrpc.EstimateFeeRequest\SUB\RS.walletrpc.EstimateFeeResponse\DC2R\n\
    \\rPendingSweeps\DC2\US.walletrpc.PendingSweepsRequest\SUB .walletrpc.PendingSweepsResponse\DC2@\n\
    \\aBumpFee\DC2\EM.walletrpc.BumpFeeRequest\SUB\SUB.walletrpc.BumpFeeResponse\DC2I\n\
    \\n\
    \ListSweeps\DC2\FS.walletrpc.ListSweepsRequest\SUB\GS.walletrpc.ListSweepsResponse\DC2[\n\
    \\DLELabelTransaction\DC2\".walletrpc.LabelTransactionRequest\SUB#.walletrpc.LabelTransactionResponse\DC2C\n\
    \\bFundPsbt\DC2\SUB.walletrpc.FundPsbtRequest\SUB\ESC.walletrpc.FundPsbtResponse\DC2O\n\
    \\fFinalizePsbt\DC2\RS.walletrpc.FinalizePsbtRequest\SUB\US.walletrpc.FinalizePsbtResponseB1Z/github.com/lightningnetwork/lnd/lnrpc/walletrpcJ\195\222\SOH\n\
    \\a\DC2\ENQ\NUL\NUL\211\ACK\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\STX\NUL\EM\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX\ETX\NUL\EM\n\
    \\t\n\
    \\STX\ETX\STX\DC2\ETX\EOT\NUL\RS\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ACK\NUL\DC2\n\
    \\b\n\
    \\SOH\b\DC2\ETX\b\NULF\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\b\NULF\n\
    \l\n\
    \\STX\ACK\NUL\DC2\ENQ\f\NUL\217\SOH\SOH\SUB_ WalletKit is a service that gives access to the core functionalities of the\n\
    \ daemon's wallet.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\f\b\DC1\n\
    \\153\SOH\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\ETX\DC1\EOTG\SUB\139\SOH\n\
    \ListUnspent returns a list of all utxos spendable by the wallet with a\n\
    \number of confirmations between the specified minimum and maximum.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\DC1\b\DC3\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\DC1\NAK'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\DC12E\n\
    \\218\STX\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX\SUB\EOTG\SUB\204\STX\n\
    \LeaseOutput locks an output to the given ID, preventing it from being\n\
    \available for any future coin selection attempts. The absolute time of the\n\
    \lock's expiration is returned. The expiration of the lock can be extended by\n\
    \successive invocations of this RPC. Outputs can be unlocked before their\n\
    \expiration through `ReleaseOutput`.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX\SUB\b\DC3\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX\SUB\NAK'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX\SUB2E\n\
    \\182\SOH\n\
    \\EOT\ACK\NUL\STX\STX\DC2\ETX!\EOTM\SUB\168\SOH\n\
    \ReleaseOutput unlocks an output, allowing it to be available for coin\n\
    \selection if it remains unspent. The ID should match the one used to\n\
    \originally lock the output.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\SOH\DC2\ETX!\b\NAK\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\STX\DC2\ETX!\ETB+\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ETX\DC2\ETX!6K\n\
    \;\n\
    \\EOT\ACK\NUL\STX\ETX\DC2\ETX&\EOTD\SUB.\n\
    \ListLeases lists all currently locked utxos.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\SOH\DC2\ETX&\b\DC2\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\STX\DC2\ETX&\DC4%\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\ETX\DC2\ETX&0B\n\
    \\185\SOH\n\
    \\EOT\ACK\NUL\STX\EOT\DC2\ETX-\EOT?\SUB\171\SOH\n\
    \DeriveNextKey attempts to derive the *next* key within the key family\n\
    \(account in BIP43) specified. This method should return the next external\n\
    \child within this branch.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\SOH\DC2\ETX-\b\NAK\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\STX\DC2\ETX-\ETB\GS\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\ETX\DC2\ETX-(=\n\
    \`\n\
    \\EOT\ACK\NUL\STX\ENQ\DC2\ETX3\EOTG\SUBS\n\
    \DeriveKey attempts to derive an arbitrary key specified by the passed\n\
    \KeyLocator.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ENQ\SOH\DC2\ETX3\b\DC1\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ENQ\STX\DC2\ETX3\DC3%\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ENQ\ETX\DC2\ETX30E\n\
    \J\n\
    \\EOT\ACK\NUL\STX\ACK\DC2\ETX8\EOT6\SUB=\n\
    \NextAddr returns the next unused address within the wallet.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ACK\SOH\DC2\ETX8\b\DLE\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ACK\STX\DC2\ETX8\DC2\GS\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ACK\ETX\DC2\ETX8(4\n\
    \\208\SOH\n\
    \\EOT\ACK\NUL\STX\a\DC2\ETX?\EOTJ\SUB\194\SOH\n\
    \ListAccounts retrieves all accounts belonging to the wallet by default. A\n\
    \name and key scope filter can be provided to filter through all of the\n\
    \wallet accounts and return only those matching.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\a\SOH\DC2\ETX?\b\DC4\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\a\STX\DC2\ETX?\SYN)\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\a\ETX\DC2\ETX?4H\n\
    \\226\t\n\
    \\EOT\ACK\NUL\STX\b\DC2\ETXZ\EOTM\SUB\212\t\n\
    \ImportAccount imports an account backed by an account extended public key.\n\
    \The master key fingerprint denotes the fingerprint of the root key\n\
    \corresponding to the account public key (also known as the key with\n\
    \derivation path m/). This may be required by some hardware wallets for\n\
    \proper identification and signing.\n\
    \\n\
    \The address type can usually be inferred from the key's version, but may be\n\
    \required for certain keys to map them into the proper scope.\n\
    \\n\
    \For BIP-0044 keys, an address type must be specified as we intend to not\n\
    \support importing BIP-0044 keys into the wallet using the legacy\n\
    \pay-to-pubkey-hash (P2PKH) scheme. A nested witness address type will force\n\
    \the standard BIP-0049 derivation scheme, while a witness address type will\n\
    \force the standard BIP-0084 derivation scheme.\n\
    \\n\
    \For BIP-0049 keys, an address type must also be specified to make a\n\
    \distinction between the standard BIP-0049 address schema (nested witness\n\
    \pubkeys everywhere) and our own BIP-0049Plus address schema (nested pubkeys\n\
    \externally, witness pubkeys internally).\n\
    \\n\
    \NOTE: Events (deposits/spends) for keys derived from an account will only be\n\
    \detected by lnd if they happen after the import. Rescans to detect past\n\
    \events will be supported later on.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\b\SOH\DC2\ETXZ\b\NAK\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\b\STX\DC2\ETXZ\ETB+\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\b\ETX\DC2\ETXZ6K\n\
    \\246\SOH\n\
    \\EOT\ACK\NUL\STX\t\DC2\EOTc\EOTd*\SUB\231\SOH\n\
    \ImportPublicKey imports a public key as watch-only into the wallet.\n\
    \\n\
    \NOTE: Events (deposits/spends) for a key will only be detected by lnd if\n\
    \they happen after the import. Rescans to detect past events will be\n\
    \supported later on.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\t\SOH\DC2\ETXc\b\ETB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\t\STX\DC2\ETXc\EM/\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\t\ETX\DC2\ETXd\DC1(\n\
    \\237\SOH\n\
    \\EOT\ACK\NUL\STX\n\
    \\DC2\ETXl\EOTC\SUB\223\SOH\n\
    \PublishTransaction attempts to publish the passed transaction to the\n\
    \network. Once this returns without an error, the wallet will continually\n\
    \attempt to re-broadcast the transaction on start up, until it enters the\n\
    \chain.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\n\
    \\SOH\DC2\ETXl\b\SUB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\n\
    \\STX\DC2\ETXl\FS'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\n\
    \\ETX\DC2\ETXl2A\n\
    \\232\SOH\n\
    \\EOT\ACK\NUL\STX\v\DC2\ETXs\EOTG\SUB\218\SOH\n\
    \SendOutputs is similar to the existing sendmany call in Bitcoind, and\n\
    \allows the caller to create a transaction that sends to several outputs at\n\
    \once. This is ideal when wanting to batch create a set of transactions.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\v\SOH\DC2\ETXs\b\DC3\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\v\STX\DC2\ETXs\NAK'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\v\ETX\DC2\ETXs2E\n\
    \\191\SOH\n\
    \\EOT\ACK\NUL\STX\f\DC2\ETXz\EOTG\SUB\177\SOH\n\
    \EstimateFee attempts to query the internal fee estimator of the wallet to\n\
    \determine the fee (in sat/kw) to attach to a transaction in order to\n\
    \achieve the confirmation target.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\f\SOH\DC2\ETXz\b\DC3\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\f\STX\DC2\ETXz\NAK'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\f\ETX\DC2\ETXz2E\n\
    \\180\ETX\n\
    \\EOT\ACK\NUL\STX\r\DC2\EOT\134\SOH\EOTM\SUB\165\ETX\n\
    \PendingSweeps returns lists of on-chain outputs that lnd is currently\n\
    \attempting to sweep within its central batching engine. Outputs with similar\n\
    \fee rates are batched together in order to sweep them within a single\n\
    \transaction.\n\
    \\n\
    \NOTE: Some of the fields within PendingSweepsRequest are not guaranteed to\n\
    \remain supported. This is an advanced API that depends on the internals of\n\
    \the UtxoSweeper, so things may change.\n\
    \\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\r\SOH\DC2\EOT\134\SOH\b\NAK\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\r\STX\DC2\EOT\134\SOH\ETB+\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\r\ETX\DC2\EOT\134\SOH6K\n\
    \\177\v\n\
    \\EOT\ACK\NUL\STX\SO\DC2\EOT\163\SOH\EOT;\SUB\162\v\n\
    \BumpFee bumps the fee of an arbitrary input within a transaction. This RPC\n\
    \takes a different approach than bitcoind's bumpfee command. lnd has a\n\
    \central batching engine in which inputs with similar fee rates are batched\n\
    \together to save on transaction fees. Due to this, we cannot rely on\n\
    \bumping the fee on a specific transaction, since transactions can change at\n\
    \any point with the addition of new inputs. The list of inputs that\n\
    \currently exist within lnd's central batching engine can be retrieved\n\
    \through the PendingSweeps RPC.\n\
    \\n\
    \When bumping the fee of an input that currently exists within lnd's central\n\
    \batching engine, a higher fee transaction will be created that replaces the\n\
    \lower fee transaction through the Replace-By-Fee (RBF) policy. If it\n\
    \\n\
    \This RPC also serves useful when wanting to perform a Child-Pays-For-Parent\n\
    \(CPFP), where the child transaction pays for its parent's fee. This can be\n\
    \done by specifying an outpoint within the low fee transaction that is under\n\
    \the control of the wallet.\n\
    \\n\
    \The fee preference can be expressed either as a specific fee rate or a delta\n\
    \of blocks in which the output should be swept on-chain within. If a fee\n\
    \preference is not explicitly specified, then an error is returned.\n\
    \\n\
    \Note that this RPC currently doesn't perform any validation checks on the\n\
    \fee preference being provided. For now, the responsibility of ensuring that\n\
    \the new fee preference is sufficient is delegated to the user.\n\
    \\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\SO\SOH\DC2\EOT\163\SOH\b\SI\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\SO\STX\DC2\EOT\163\SOH\DC1\US\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\SO\ETX\DC2\EOT\163\SOH*9\n\
    \\192\SOH\n\
    \\EOT\ACK\NUL\STX\SI\DC2\EOT\170\SOH\EOTD\SUB\177\SOH\n\
    \ListSweeps returns a list of the sweep transactions our node has produced.\n\
    \Note that these sweeps may not be confirmed yet, as we record sweeps on\n\
    \broadcast, not confirmation.\n\
    \\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\SI\SOH\DC2\EOT\170\SOH\b\DC2\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\SI\STX\DC2\EOT\170\SOH\DC4%\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\SI\ETX\DC2\EOT\170\SOH0B\n\
    \\141\STX\n\
    \\EOT\ACK\NUL\STX\DLE\DC2\ACK\178\SOH\EOT\179\SOH+\SUB\252\SOH\n\
    \LabelTransaction adds a label to a transaction. If the transaction already\n\
    \has a label the call will fail unless the overwrite bool is set. This will\n\
    \overwrite the exiting transaction label. Labels must not be empty, and\n\
    \cannot exceed 500 characters.\n\
    \\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\DLE\SOH\DC2\EOT\178\SOH\b\CAN\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\DLE\STX\DC2\EOT\178\SOH\SUB1\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\DLE\ETX\DC2\EOT\179\SOH\DC1)\n\
    \\196\a\n\
    \\EOT\ACK\NUL\STX\DC1\DC2\EOT\201\SOH\EOT>\SUB\181\a\n\
    \FundPsbt creates a fully populated PSBT that contains enough inputs to fund\n\
    \the outputs specified in the template. There are two ways of specifying a\n\
    \template: Either by passing in a PSBT with at least one output declared or\n\
    \by passing in a raw TxTemplate message.\n\
    \\n\
    \If there are no inputs specified in the template, coin selection is\n\
    \performed automatically. If the template does contain any inputs, it is\n\
    \assumed that full coin selection happened externally and no additional\n\
    \inputs are added. If the specified inputs aren't enough to fund the outputs\n\
    \with the given fee rate, an error is returned.\n\
    \\n\
    \After either selecting or verifying the inputs, all input UTXOs are locked\n\
    \with an internal app ID.\n\
    \\n\
    \NOTE: If this method returns without an error, it is the caller's\n\
    \responsibility to either spend the locked UTXOs (by finalizing and then\n\
    \publishing the transaction) or to unlock/release the locked UTXOs in case of\n\
    \an error on the caller's side.\n\
    \\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\DC1\SOH\DC2\EOT\201\SOH\b\DLE\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\DC1\STX\DC2\EOT\201\SOH\DC2!\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\DC1\ETX\DC2\EOT\201\SOH,<\n\
    \\203\ENQ\n\
    \\EOT\ACK\NUL\STX\DC2\DC2\EOT\216\SOH\EOTJ\SUB\188\ENQ\n\
    \FinalizePsbt expects a partial transaction with all inputs and outputs fully\n\
    \declared and tries to sign all inputs that belong to the wallet. Lnd must be\n\
    \the last signer of the transaction. That means, if there are any unsigned\n\
    \non-witness inputs or inputs without UTXO information attached or inputs\n\
    \without witness data that do not belong to lnd's wallet, this method will\n\
    \fail. If no error is returned, the PSBT is ready to be extracted and the\n\
    \final TX within to be broadcast.\n\
    \\n\
    \NOTE: This method does NOT publish the transaction once finalized. It is the\n\
    \caller's responsibility to either publish the transaction on success or\n\
    \unlock/release any locked UTXOs in case of an error in this method.\n\
    \\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\DC2\SOH\DC2\EOT\216\SOH\b\DC4\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\DC2\STX\DC2\EOT\216\SOH\SYN)\n\
    \\r\n\
    \\ENQ\ACK\NUL\STX\DC2\ETX\DC2\EOT\216\SOH4H\n\
    \\f\n\
    \\STX\EOT\NUL\DC2\ACK\219\SOH\NUL\228\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\NUL\SOH\DC2\EOT\219\SOH\b\SUB\n\
    \C\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\EOT\221\SOH\EOT\CAN\SUB5 The minimum number of confirmations to be included.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\EOT\221\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\EOT\221\SOH\n\
    \\DC3\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\EOT\221\SOH\SYN\ETB\n\
    \C\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\EOT\224\SOH\EOT\CAN\SUB5 The maximum number of confirmations to be included.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\EOT\224\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\EOT\224\SOH\n\
    \\DC3\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\EOT\224\SOH\SYN\ETB\n\
    \S\n\
    \\EOT\EOT\NUL\STX\STX\DC2\EOT\227\SOH\EOT\ETB\SUBE An optional filter to only include outputs belonging to an account.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\STX\ENQ\DC2\EOT\227\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\EOT\227\SOH\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\EOT\227\SOH\NAK\SYN\n\
    \\f\n\
    \\STX\EOT\SOH\DC2\ACK\230\SOH\NUL\233\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\SOH\SOH\DC2\EOT\230\SOH\b\ESC\n\
    \Q\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\EOT\232\SOH\EOT\"\SUBC A list of utxos satisfying the specified number of confirmations.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\NUL\EOT\DC2\EOT\232\SOH\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\EOT\232\SOH\r\ETB\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\EOT\232\SOH\CAN\GS\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\EOT\232\SOH !\n\
    \\f\n\
    \\STX\EOT\STX\DC2\ACK\235\SOH\NUL\248\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\STX\SOH\DC2\EOT\235\SOH\b\SUB\n\
    \\155\SOH\n\
    \\EOT\EOT\STX\STX\NUL\DC2\EOT\240\SOH\EOT\DC1\SUB\140\SOH\n\
    \An ID of 32 random bytes that must be unique for each distinct application\n\
    \using this RPC which will be used to bound the output lease to.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\EOT\240\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\EOT\240\SOH\n\
    \\f\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\EOT\240\SOH\SI\DLE\n\
    \D\n\
    \\EOT\EOT\STX\STX\SOH\DC2\EOT\243\SOH\EOT \SUB6 The identifying outpoint of the output being leased.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\ACK\DC2\EOT\243\SOH\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\EOT\243\SOH\DC3\ESC\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\EOT\243\SOH\RS\US\n\
    \p\n\
    \\EOT\EOT\STX\STX\STX\DC2\EOT\247\SOH\EOT\"\SUBb The time in seconds before the lock expires. If set to zero, the default\n\
    \ lock duration is used.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\ENQ\DC2\EOT\247\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\EOT\247\SOH\v\GS\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\EOT\247\SOH !\n\
    \\f\n\
    \\STX\EOT\ETX\DC2\ACK\250\SOH\NUL\255\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ETX\SOH\DC2\EOT\250\SOH\b\ESC\n\
    \\\\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\EOT\254\SOH\EOT\SUB\SUBN\n\
    \The absolute expiration of the output lease represented as a unix timestamp.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\EOT\254\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\EOT\254\SOH\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\EOT\254\SOH\CAN\EM\n\
    \\f\n\
    \\STX\EOT\EOT\DC2\ACK\129\STX\NUL\135\STX\SOH\n\
    \\v\n\
    \\ETX\EOT\EOT\SOH\DC2\EOT\129\STX\b\FS\n\
    \?\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\EOT\131\STX\EOT\DC1\SUB1 The unique ID that was used to lock the output.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\EOT\131\STX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\EOT\131\STX\n\
    \\f\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\EOT\131\STX\SI\DLE\n\
    \F\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\EOT\134\STX\EOT \SUB8 The identifying outpoint of the output being released.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ACK\DC2\EOT\134\STX\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\EOT\134\STX\DC3\ESC\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\EOT\134\STX\RS\US\n\
    \\f\n\
    \\STX\EOT\ENQ\DC2\ACK\137\STX\NUL\138\STX\SOH\n\
    \\v\n\
    \\ETX\EOT\ENQ\SOH\DC2\EOT\137\STX\b\GS\n\
    \\f\n\
    \\STX\EOT\ACK\DC2\ACK\140\STX\NUL\153\STX\SOH\n\
    \\v\n\
    \\ETX\EOT\ACK\SOH\DC2\EOT\140\STX\b\SO\n\
    \\190\SOH\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\EOT\146\STX\EOT\US\SUB\175\SOH\n\
    \Is the key finger print of the root pubkey that this request is targeting.\n\
    \This allows the WalletKit to possibly serve out keys for multiple HD chains\n\
    \via public derivation.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\EOT\146\STX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\EOT\146\STX\n\
    \\SUB\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\EOT\146\STX\GS\RS\n\
    \n\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\EOT\152\STX\EOT\EM\SUB`\n\
    \The target key family to derive a key from. In other contexts, this is\n\
    \known as the \"account\".\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ENQ\DC2\EOT\152\STX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\EOT\152\STX\n\
    \\DC4\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\EOT\152\STX\ETB\CAN\n\
    \\f\n\
    \\STX\EOT\a\DC2\ACK\155\STX\NUL\171\STX\SOH\n\
    \\v\n\
    \\ETX\EOT\a\SOH\DC2\EOT\155\STX\b\DC3\n\
    \v\n\
    \\EOT\EOT\a\STX\NUL\DC2\EOT\160\STX\EOT\ETB\SUBh\n\
    \The name of the account to retrieve the next address of. If empty, the\n\
    \default wallet account is used.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ENQ\DC2\EOT\160\STX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\EOT\160\STX\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\EOT\160\STX\NAK\SYN\n\
    \.\n\
    \\EOT\EOT\a\STX\SOH\DC2\EOT\165\STX\EOT\EM\SUB \n\
    \The type of address to derive.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ACK\DC2\EOT\165\STX\EOT\SI\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\SOH\DC2\EOT\165\STX\DLE\DC4\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ETX\DC2\EOT\165\STX\ETB\CAN\n\
    \;\n\
    \\EOT\EOT\a\STX\STX\DC2\EOT\170\STX\EOT\DC4\SUB-\n\
    \Whether a change address should be derived.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ENQ\DC2\EOT\170\STX\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\SOH\DC2\EOT\170\STX\t\SI\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ETX\DC2\EOT\170\STX\DC2\DC3\n\
    \\f\n\
    \\STX\EOT\b\DC2\ACK\172\STX\NUL\177\STX\SOH\n\
    \\v\n\
    \\ETX\EOT\b\SOH\DC2\EOT\172\STX\b\DC4\n\
    \:\n\
    \\EOT\EOT\b\STX\NUL\DC2\EOT\176\STX\EOT\DC4\SUB,\n\
    \The address encoded using a bech32 format.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ENQ\DC2\EOT\176\STX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\SOH\DC2\EOT\176\STX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ETX\DC2\EOT\176\STX\DC2\DC3\n\
    \\f\n\
    \\STX\ENQ\NUL\DC2\ACK\179\STX\NUL\184\STX\SOH\n\
    \\v\n\
    \\ETX\ENQ\NUL\SOH\DC2\EOT\179\STX\ENQ\DLE\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\EOT\180\STX\EOT\DLE\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\EOT\180\STX\EOT\v\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\EOT\180\STX\SO\SI\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\EOT\181\STX\EOT\FS\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\EOT\181\STX\EOT\ETB\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\EOT\181\STX\SUB\ESC\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\STX\DC2\EOT\182\STX\EOT#\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\SOH\DC2\EOT\182\STX\EOT\RS\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\STX\DC2\EOT\182\STX!\"\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\ETX\DC2\EOT\183\STX\EOT*\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\ETX\SOH\DC2\EOT\183\STX\EOT%\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\ETX\STX\DC2\EOT\183\STX()\n\
    \\f\n\
    \\STX\EOT\t\DC2\ACK\185\STX\NUL\237\STX\SOH\n\
    \\v\n\
    \\ETX\EOT\t\SOH\DC2\EOT\185\STX\b\SI\n\
    \6\n\
    \\EOT\EOT\t\STX\NUL\DC2\EOT\187\STX\EOT\DC4\SUB( The name used to identify the account.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ENQ\DC2\EOT\187\STX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\SOH\DC2\EOT\187\STX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ETX\DC2\EOT\187\STX\DC2\DC3\n\
    \\128\ETX\n\
    \\EOT\EOT\t\STX\SOH\DC2\EOT\197\STX\EOT!\SUB\241\STX\n\
    \The type of addresses the account supports.\n\
    \AddressType                       | External Branch | Internal Branch\n\
    \---------------------------------------------------------------------\n\
    \WITNESS_PUBKEY_HASH               | P2WPKH          | P2WPKH\n\
    \NESTED_WITNESS_PUBKEY_HASH        | NP2WPKH         | NP2WPKH\n\
    \HYBRID_NESTED_WITNESS_PUBKEY_HASH | NP2WPKH         | P2WPKH\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\ACK\DC2\EOT\197\STX\EOT\SI\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\SOH\DC2\EOT\197\STX\DLE\FS\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\ETX\DC2\EOT\197\STX\US \n\
    \\220\SOH\n\
    \\EOT\EOT\t\STX\STX\DC2\EOT\204\STX\EOT#\SUB\205\SOH\n\
    \The public key backing the account that all keys are derived from\n\
    \represented as an extended key. This will always be empty for the default\n\
    \imported account in which single public keys are imported into.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\ENQ\DC2\EOT\204\STX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\SOH\DC2\EOT\204\STX\v\RS\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\ETX\DC2\EOT\204\STX!\"\n\
    \\240\SOH\n\
    \\EOT\EOT\t\STX\ETX\DC2\EOT\212\STX\EOT%\SUB\225\SOH\n\
    \The fingerprint of the root key from which the account public key was\n\
    \derived from. This will always be zero for the default imported account in\n\
    \which single public keys are imported into. The bytes are in big-endian\n\
    \order.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\ENQ\DC2\EOT\212\STX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\SOH\DC2\EOT\212\STX\n\
    \ \n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\ETX\DC2\EOT\212\STX#$\n\
    \\183\SOH\n\
    \\EOT\EOT\t\STX\EOT\DC2\EOT\219\STX\EOT\US\SUB\168\SOH\n\
    \The derivation path corresponding to the account public key. This will\n\
    \always be empty for the default imported account in which single public keys\n\
    \are imported into.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\ENQ\DC2\EOT\219\STX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\SOH\DC2\EOT\219\STX\v\SUB\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\ETX\DC2\EOT\219\STX\GS\RS\n\
    \\200\SOH\n\
    \\EOT\EOT\t\STX\ENQ\DC2\EOT\226\STX\EOT\"\SUB\185\SOH\n\
    \The number of keys derived from the external branch of the account public\n\
    \key. This will always be zero for the default imported account in which\n\
    \single public keys are imported into.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\ENQ\DC2\EOT\226\STX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\SOH\DC2\EOT\226\STX\v\GS\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\ETX\DC2\EOT\226\STX !\n\
    \\200\SOH\n\
    \\EOT\EOT\t\STX\ACK\DC2\EOT\233\STX\EOT\"\SUB\185\SOH\n\
    \The number of keys derived from the internal branch of the account public\n\
    \key. This will always be zero for the default imported account in which\n\
    \single public keys are imported into.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ACK\ENQ\DC2\EOT\233\STX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ACK\SOH\DC2\EOT\233\STX\v\GS\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ACK\ETX\DC2\EOT\233\STX !\n\
    \G\n\
    \\EOT\EOT\t\STX\a\DC2\EOT\236\STX\EOT\CAN\SUB9 Whether the wallet stores private keys for the account.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\a\ENQ\DC2\EOT\236\STX\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\t\STX\a\SOH\DC2\EOT\236\STX\t\DC3\n\
    \\r\n\
    \\ENQ\EOT\t\STX\a\ETX\DC2\EOT\236\STX\SYN\ETB\n\
    \\f\n\
    \\STX\EOT\n\
    \\DC2\ACK\238\STX\NUL\244\STX\SOH\n\
    \\v\n\
    \\ETX\EOT\n\
    \\SOH\DC2\EOT\238\STX\b\ESC\n\
    \N\n\
    \\EOT\EOT\n\
    \\STX\NUL\DC2\EOT\240\STX\EOT\DC4\SUB@ An optional filter to only return accounts matching this name.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ENQ\DC2\EOT\240\STX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\SOH\DC2\EOT\240\STX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ETX\DC2\EOT\240\STX\DC2\DC3\n\
    \V\n\
    \\EOT\EOT\n\
    \\STX\SOH\DC2\EOT\243\STX\EOT!\SUBH An optional filter to only return accounts matching this address type.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ACK\DC2\EOT\243\STX\EOT\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\SOH\DC2\EOT\243\STX\DLE\FS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ETX\DC2\EOT\243\STX\US \n\
    \\f\n\
    \\STX\EOT\v\DC2\ACK\245\STX\NUL\247\STX\SOH\n\
    \\v\n\
    \\ETX\EOT\v\SOH\DC2\EOT\245\STX\b\FS\n\
    \\f\n\
    \\EOT\EOT\v\STX\NUL\DC2\EOT\246\STX\EOT\"\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\EOT\DC2\EOT\246\STX\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ACK\DC2\EOT\246\STX\r\DC4\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\SOH\DC2\EOT\246\STX\NAK\GS\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ETX\DC2\EOT\246\STX !\n\
    \\f\n\
    \\STX\EOT\f\DC2\ACK\249\STX\NUL\155\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\f\SOH\DC2\EOT\249\STX\b\FS\n\
    \4\n\
    \\EOT\EOT\f\STX\NUL\DC2\EOT\251\STX\EOT\DC4\SUB& A name to identify the account with.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ENQ\DC2\EOT\251\STX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\SOH\DC2\EOT\251\STX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ETX\DC2\EOT\251\STX\DC2\DC3\n\
    \\179\SOH\n\
    \\EOT\EOT\f\STX\SOH\DC2\EOT\130\ETX\EOT#\SUB\164\SOH\n\
    \A public key that corresponds to a wallet account represented as an extended\n\
    \key. It must conform to a derivation path of the form\n\
    \m/purpose'/coin_type'/account'.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ENQ\DC2\EOT\130\ETX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\SOH\DC2\EOT\130\ETX\v\RS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ETX\DC2\EOT\130\ETX!\"\n\
    \\144\STX\n\
    \\EOT\EOT\f\STX\STX\DC2\EOT\138\ETX\EOT%\SUB\129\STX\n\
    \The fingerprint of the root key (also known as the key with derivation path\n\
    \m/) from which the account public key was derived from. This may be required\n\
    \by some hardware wallets for proper identification and signing. The bytes\n\
    \must be in big-endian order.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ENQ\DC2\EOT\138\ETX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\SOH\DC2\EOT\138\ETX\n\
    \ \n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ETX\DC2\EOT\138\ETX#$\n\
    \\197\SOH\n\
    \\EOT\EOT\f\STX\ETX\DC2\EOT\145\ETX\EOT!\SUB\182\SOH\n\
    \An address type is only required when the extended account public key has a\n\
    \legacy version (xpub, tpub, etc.), such that the wallet cannot detect what\n\
    \address scheme it belongs to.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\ACK\DC2\EOT\145\ETX\EOT\SI\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\SOH\DC2\EOT\145\ETX\DLE\FS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\ETX\DC2\EOT\145\ETX\US \n\
    \\214\STX\n\
    \\EOT\EOT\f\STX\EOT\DC2\EOT\154\ETX\EOT\NAK\SUB\199\STX\n\
    \Whether a dry run should be attempted when importing the account. This\n\
    \serves as a way to confirm whether the account is being imported correctly\n\
    \by returning the first N addresses for the external and internal branches of\n\
    \the account. If these addresses match as expected, then it should be safe to\n\
    \import the account as is.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\EOT\ENQ\DC2\EOT\154\ETX\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\f\STX\EOT\SOH\DC2\EOT\154\ETX\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\f\STX\EOT\ETX\DC2\EOT\154\ETX\DC3\DC4\n\
    \\f\n\
    \\STX\EOT\r\DC2\ACK\156\ETX\NUL\173\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\r\SOH\DC2\EOT\156\ETX\b\GS\n\
    \4\n\
    \\EOT\EOT\r\STX\NUL\DC2\EOT\158\ETX\EOT\CAN\SUB& The details of the imported account.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ACK\DC2\EOT\158\ETX\EOT\v\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\SOH\DC2\EOT\158\ETX\f\DC3\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ETX\DC2\EOT\158\ETX\SYN\ETB\n\
    \\233\SOH\n\
    \\EOT\EOT\r\STX\SOH\DC2\EOT\165\ETX\EOT/\SUB\218\SOH\n\
    \The first N addresses that belong to the external branch of the account.\n\
    \The external branch is typically used for external non-change addresses.\n\
    \These are only returned if a dry run was specified within the request.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\EOT\DC2\EOT\165\ETX\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\ENQ\DC2\EOT\165\ETX\r\DC3\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\SOH\DC2\EOT\165\ETX\DC4*\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\ETX\DC2\EOT\165\ETX-.\n\
    \\220\SOH\n\
    \\EOT\EOT\r\STX\STX\DC2\EOT\172\ETX\EOT/\SUB\205\SOH\n\
    \The first N addresses that belong to the internal branch of the account.\n\
    \The internal branch is typically used for change addresses. These are only\n\
    \returned if a dry run was specified within the request.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\EOT\DC2\EOT\172\ETX\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\ENQ\DC2\EOT\172\ETX\r\DC3\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\SOH\DC2\EOT\172\ETX\DC4*\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\ETX\DC2\EOT\172\ETX-.\n\
    \\f\n\
    \\STX\EOT\SO\DC2\ACK\175\ETX\NUL\181\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\SO\SOH\DC2\EOT\175\ETX\b\RS\n\
    \A\n\
    \\EOT\EOT\SO\STX\NUL\DC2\EOT\177\ETX\EOT\EM\SUB3 A compressed public key represented as raw bytes.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\ENQ\DC2\EOT\177\ETX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\SOH\DC2\EOT\177\ETX\n\
    \\DC4\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\ETX\DC2\EOT\177\ETX\ETB\CAN\n\
    \O\n\
    \\EOT\EOT\SO\STX\SOH\DC2\EOT\180\ETX\EOT!\SUBA The type of address that will be generated from the public key.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\ACK\DC2\EOT\180\ETX\EOT\SI\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\SOH\DC2\EOT\180\ETX\DLE\FS\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\ETX\DC2\EOT\180\ETX\US \n\
    \\f\n\
    \\STX\EOT\SI\DC2\ACK\182\ETX\NUL\183\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\SI\SOH\DC2\EOT\182\ETX\b\US\n\
    \\f\n\
    \\STX\EOT\DLE\DC2\ACK\185\ETX\NUL\195\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\DLE\SOH\DC2\EOT\185\ETX\b\DC3\n\
    \/\n\
    \\EOT\EOT\DLE\STX\NUL\DC2\EOT\189\ETX\EOT\NAK\SUB!\n\
    \The raw serialized transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\ENQ\DC2\EOT\189\ETX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\SOH\DC2\EOT\189\ETX\n\
    \\DLE\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\ETX\DC2\EOT\189\ETX\DC3\DC4\n\
    \Z\n\
    \\EOT\EOT\DLE\STX\SOH\DC2\EOT\194\ETX\EOT\NAK\SUBL\n\
    \An optional label to save with the transaction. Limited to 500 characters.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\ENQ\DC2\EOT\194\ETX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\SOH\DC2\EOT\194\ETX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\ETX\DC2\EOT\194\ETX\DC3\DC4\n\
    \\f\n\
    \\STX\EOT\DC1\DC2\ACK\196\ETX\NUL\205\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\DC1\SOH\DC2\EOT\196\ETX\b\ETB\n\
    \\218\SOH\n\
    \\EOT\EOT\DC1\STX\NUL\DC2\EOT\204\ETX\EOT\GS\SUB\203\SOH\n\
    \If blank, then no error occurred and the transaction was successfully\n\
    \published. If not the empty string, then a string representation of the\n\
    \broadcast error.\n\
    \\n\
    \TODO(roasbeef): map to a proper enum type\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\ENQ\DC2\EOT\204\ETX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\SOH\DC2\EOT\204\ETX\v\CAN\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\ETX\DC2\EOT\204\ETX\ESC\FS\n\
    \\f\n\
    \\STX\EOT\DC2\DC2\ACK\207\ETX\NUL\228\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\DC2\SOH\DC2\EOT\207\ETX\b\SUB\n\
    \j\n\
    \\EOT\EOT\DC2\STX\NUL\DC2\EOT\212\ETX\EOT\EM\SUB\\\n\
    \The number of satoshis per kilo weight that should be used when crafting\n\
    \this transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\ENQ\DC2\EOT\212\ETX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\SOH\DC2\EOT\212\ETX\n\
    \\DC4\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\ETX\DC2\EOT\212\ETX\ETB\CAN\n\
    \Z\n\
    \\EOT\EOT\DC2\STX\SOH\DC2\EOT\217\ETX\EOT'\SUBL\n\
    \A slice of the outputs that should be created in the transaction produced.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\EOT\DC2\EOT\217\ETX\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\ACK\DC2\EOT\217\ETX\r\SUB\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\SOH\DC2\EOT\217\ETX\ESC\"\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\ETX\DC2\EOT\217\ETX%&\n\
    \Q\n\
    \\EOT\EOT\DC2\STX\STX\DC2\EOT\220\ETX\EOT\NAK\SUBC An optional label for the transaction, limited to 500 characters.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\STX\ENQ\DC2\EOT\220\ETX\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\STX\SOH\DC2\EOT\220\ETX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\STX\ETX\DC2\EOT\220\ETX\DC3\DC4\n\
    \t\n\
    \\EOT\EOT\DC2\STX\ETX\DC2\EOT\224\ETX\EOT\CAN\SUBf The minimum number of confirmations each one of your outputs used for\n\
    \ the transaction must satisfy.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ETX\ENQ\DC2\EOT\224\ETX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ETX\SOH\DC2\EOT\224\ETX\n\
    \\DC3\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ETX\ETX\DC2\EOT\224\ETX\SYN\ETB\n\
    \Y\n\
    \\EOT\EOT\DC2\STX\EOT\DC2\EOT\227\ETX\EOT\US\SUBK Whether unconfirmed outputs should be used as inputs for the transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\EOT\ENQ\DC2\EOT\227\ETX\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\EOT\SOH\DC2\EOT\227\ETX\t\SUB\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\EOT\ETX\DC2\EOT\227\ETX\GS\RS\n\
    \\f\n\
    \\STX\EOT\DC3\DC2\ACK\229\ETX\NUL\234\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\DC3\SOH\DC2\EOT\229\ETX\b\ESC\n\
    \C\n\
    \\EOT\EOT\DC3\STX\NUL\DC2\EOT\233\ETX\EOT\NAK\SUB5\n\
    \The serialized transaction sent out on the network.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\ENQ\DC2\EOT\233\ETX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\SOH\DC2\EOT\233\ETX\n\
    \\DLE\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\ETX\DC2\EOT\233\ETX\DC3\DC4\n\
    \\f\n\
    \\STX\EOT\DC4\DC2\ACK\236\ETX\NUL\241\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\DC4\SOH\DC2\EOT\236\ETX\b\SUB\n\
    \Q\n\
    \\EOT\EOT\DC4\STX\NUL\DC2\EOT\240\ETX\EOT\SUB\SUBC\n\
    \The number of confirmations to shoot for when estimating the fee.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\ENQ\DC2\EOT\240\ETX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\SOH\DC2\EOT\240\ETX\n\
    \\NAK\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\ETX\DC2\EOT\240\ETX\CAN\EM\n\
    \\f\n\
    \\STX\EOT\NAK\DC2\ACK\242\ETX\NUL\248\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\NAK\SOH\DC2\EOT\242\ETX\b\ESC\n\
    \{\n\
    \\EOT\EOT\NAK\STX\NUL\DC2\EOT\247\ETX\EOT\EM\SUBm\n\
    \The amount of satoshis per kw that should be used in order to reach the\n\
    \confirmation target in the request.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\ENQ\DC2\EOT\247\ETX\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\SOH\DC2\EOT\247\ETX\n\
    \\DC4\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\ETX\DC2\EOT\247\ETX\ETB\CAN\n\
    \\f\n\
    \\STX\ENQ\SOH\DC2\ACK\250\ETX\NUL\210\EOT\SOH\n\
    \\v\n\
    \\ETX\ENQ\SOH\SOH\DC2\EOT\250\ETX\ENQ\DLE\n\
    \\f\n\
    \\EOT\ENQ\SOH\STX\NUL\DC2\EOT\251\ETX\EOT\CAN\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\NUL\SOH\DC2\EOT\251\ETX\EOT\DC3\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\NUL\STX\DC2\EOT\251\ETX\SYN\ETB\n\
    \|\n\
    \\EOT\ENQ\SOH\STX\SOH\DC2\EOT\129\EOT\EOT\GS\SUBn\n\
    \A witness that allows us to spend the output of a commitment transaction\n\
    \after a relative lock-time lockout.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\SOH\SOH\DC2\EOT\129\EOT\EOT\CAN\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\SOH\STX\DC2\EOT\129\EOT\ESC\FS\n\
    \\131\SOH\n\
    \\EOT\ENQ\SOH\STX\STX\DC2\EOT\135\EOT\EOT\FS\SUBu\n\
    \A witness that allows us to spend a settled no-delay output immediately on a\n\
    \counterparty's commitment transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\STX\SOH\DC2\EOT\135\EOT\EOT\ETB\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\STX\STX\DC2\EOT\135\EOT\SUB\ESC\n\
    \\148\SOH\n\
    \\EOT\ENQ\SOH\STX\ETX\DC2\EOT\141\EOT\EOT\SUB\SUB\133\SOH\n\
    \A witness that allows us to sweep the settled output of a malicious\n\
    \counterparty's who broadcasts a revoked commitment transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\ETX\SOH\DC2\EOT\141\EOT\EOT\NAK\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\ETX\STX\DC2\EOT\141\EOT\CAN\EM\n\
    \\155\SOH\n\
    \\EOT\ENQ\SOH\STX\EOT\DC2\EOT\147\EOT\EOT\FS\SUB\140\SOH\n\
    \A witness that allows us to sweep an HTLC which we offered to the remote\n\
    \party in the case that they broadcast a revoked commitment state.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\EOT\SOH\DC2\EOT\147\EOT\EOT\ETB\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\EOT\STX\DC2\EOT\147\EOT\SUB\ESC\n\
    \\149\SOH\n\
    \\EOT\ENQ\SOH\STX\ENQ\DC2\EOT\153\EOT\EOT\GS\SUB\134\SOH\n\
    \A witness that allows us to sweep an HTLC output sent to us in the case that\n\
    \the remote party broadcasts a revoked commitment state.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\ENQ\SOH\DC2\EOT\153\EOT\EOT\CAN\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\ENQ\STX\DC2\EOT\153\EOT\ESC\FS\n\
    \\174\STX\n\
    \\EOT\ENQ\SOH\STX\ACK\DC2\EOT\161\EOT\EOT*\SUB\159\STX\n\
    \A witness that allows us to sweep an HTLC output that we extended to a\n\
    \party, but was never fulfilled.  This HTLC output isn't directly on the\n\
    \commitment transaction, but is the result of a confirmed second-level HTLC\n\
    \transaction. As a result, we can only spend this after a CSV delay.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\ACK\SOH\DC2\EOT\161\EOT\EOT%\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\ACK\STX\DC2\EOT\161\EOT()\n\
    \\183\STX\n\
    \\EOT\ENQ\SOH\STX\a\DC2\EOT\169\EOT\EOT+\SUB\168\STX\n\
    \A witness that allows us to sweep an HTLC output that was offered to us, and\n\
    \for which we have a payment preimage. This HTLC output isn't directly on our\n\
    \commitment transaction, but is the result of confirmed second-level HTLC\n\
    \transaction. As a result, we can only spend this after a CSV delay.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\a\SOH\DC2\EOT\169\EOT\EOT&\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\a\STX\DC2\EOT\169\EOT)*\n\
    \\236\SOH\n\
    \\EOT\ENQ\SOH\STX\b\DC2\EOT\176\EOT\EOT$\SUB\221\SOH\n\
    \A witness that allows us to sweep an HTLC that we offered to the remote\n\
    \party which lies in the commitment transaction of the remote party. We can\n\
    \spend this output after the absolute CLTV timeout of the HTLC as passed.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\b\SOH\DC2\EOT\176\EOT\EOT\US\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\b\STX\DC2\EOT\176\EOT\"#\n\
    \\132\STX\n\
    \\EOT\ENQ\SOH\STX\t\DC2\EOT\184\EOT\EOT%\SUB\245\SOH\n\
    \A witness that allows us to sweep an HTLC that was offered to us by the\n\
    \remote party. We use this witness in the case that the remote party goes to\n\
    \chain, and we know the pre-image to the HTLC. We can sweep this without any\n\
    \additional timeout.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\t\SOH\DC2\EOT\184\EOT\EOT \n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\t\STX\DC2\EOT\184\EOT#$\n\
    \\237\SOH\n\
    \\EOT\ENQ\SOH\STX\n\
    \\DC2\EOT\191\EOT\EOT\"\SUB\222\SOH\n\
    \A witness that allows us to sweep an HTLC from the remote party's commitment\n\
    \transaction in the case that the broadcast a revoked commitment, but then\n\
    \also immediately attempt to go to the second level to claim the HTLC.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\n\
    \\SOH\DC2\EOT\191\EOT\EOT\FS\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\n\
    \\STX\DC2\EOT\191\EOT\US!\n\
    \\158\SOH\n\
    \\EOT\ENQ\SOH\STX\v\DC2\EOT\197\EOT\EOT\SUB\SUB\143\SOH\n\
    \A witness type that allows us to spend a regular p2wkh output that's sent to\n\
    \an output which is under complete control of the backing wallet.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\v\SOH\DC2\EOT\197\EOT\EOT\DC4\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\v\STX\DC2\EOT\197\EOT\ETB\EM\n\
    \\145\SOH\n\
    \\EOT\ENQ\SOH\STX\f\DC2\EOT\203\EOT\EOT!\SUB\130\SOH\n\
    \A witness type that allows us to sweep an output that sends to a nested P2SH\n\
    \script that pays to a key solely under our control.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\f\SOH\DC2\EOT\203\EOT\EOT\ESC\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\f\STX\DC2\EOT\203\EOT\RS \n\
    \`\n\
    \\EOT\ENQ\SOH\STX\r\DC2\EOT\209\EOT\EOT\ESC\SUBR\n\
    \A witness type that allows us to spend our anchor on the commitment\n\
    \transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\r\SOH\DC2\EOT\209\EOT\EOT\NAK\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\r\STX\DC2\EOT\209\EOT\CAN\SUB\n\
    \\f\n\
    \\STX\EOT\SYN\DC2\ACK\212\EOT\NUL\133\ENQ\SOH\n\
    \\v\n\
    \\ETX\EOT\SYN\SOH\DC2\EOT\212\EOT\b\DC4\n\
    \E\n\
    \\EOT\EOT\SYN\STX\NUL\DC2\EOT\214\EOT\EOT \SUB7 The outpoint of the output we're attempting to sweep.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\ACK\DC2\EOT\214\EOT\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\SOH\DC2\EOT\214\EOT\DC3\ESC\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\ETX\DC2\EOT\214\EOT\RS\US\n\
    \I\n\
    \\EOT\EOT\SYN\STX\SOH\DC2\EOT\217\EOT\EOT!\SUB; The witness type of the output we're attempting to sweep.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\SOH\ACK\DC2\EOT\217\EOT\EOT\SI\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\SOH\SOH\DC2\EOT\217\EOT\DLE\FS\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\SOH\ETX\DC2\EOT\217\EOT\US \n\
    \B\n\
    \\EOT\EOT\SYN\STX\STX\DC2\EOT\220\EOT\EOT\SUB\SUB4 The value of the output we're attempting to sweep.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\STX\ENQ\DC2\EOT\220\EOT\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\STX\SOH\DC2\EOT\220\EOT\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\STX\ETX\DC2\EOT\220\EOT\CAN\EM\n\
    \\249\SOH\n\
    \\EOT\EOT\SYN\STX\ETX\DC2\EOT\228\EOT\EOT0\SUB\234\SOH\n\
    \Deprecated, use sat_per_vbyte.\n\
    \The fee rate we'll use to sweep the output, expressed in sat/vbyte. The fee\n\
    \rate is only determined once a sweeping transaction for the output is\n\
    \created, so it's possible for this to be 0 before this.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ETX\ENQ\DC2\EOT\228\EOT\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ETX\SOH\DC2\EOT\228\EOT\v\ETB\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ETX\ETX\DC2\EOT\228\EOT\SUB\ESC\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ETX\b\DC2\EOT\228\EOT\FS/\n\
    \\SO\n\
    \\ACK\EOT\SYN\STX\ETX\b\ETX\DC2\EOT\228\EOT\GS.\n\
    \P\n\
    \\EOT\EOT\SYN\STX\EOT\DC2\EOT\231\EOT\EOT\"\SUBB The number of broadcast attempts we've made to sweep the output.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\EOT\ENQ\DC2\EOT\231\EOT\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\EOT\SOH\DC2\EOT\231\EOT\v\GS\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\EOT\ETX\DC2\EOT\231\EOT !\n\
    \u\n\
    \\EOT\EOT\SYN\STX\ENQ\DC2\EOT\237\EOT\EOT%\SUBg\n\
    \The next height of the chain at which we'll attempt to broadcast the\n\
    \sweep transaction of the output.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ENQ\ENQ\DC2\EOT\237\EOT\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ENQ\SOH\DC2\EOT\237\EOT\v \n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ENQ\ETX\DC2\EOT\237\EOT#$\n\
    \B\n\
    \\EOT\EOT\SYN\STX\ACK\DC2\EOT\240\EOT\EOT%\SUB4 The requested confirmation target for this output.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ACK\ENQ\DC2\EOT\240\EOT\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ACK\SOH\DC2\EOT\240\EOT\v \n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ACK\ETX\DC2\EOT\240\EOT#$\n\
    \z\n\
    \\EOT\EOT\SYN\STX\a\DC2\EOT\244\EOT\EOT:\SUBl Deprecated, use requested_sat_per_vbyte.\n\
    \ The requested fee rate, expressed in sat/vbyte, for this output.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\a\ENQ\DC2\EOT\244\EOT\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\a\SOH\DC2\EOT\244\EOT\v!\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\a\ETX\DC2\EOT\244\EOT$%\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\a\b\DC2\EOT\244\EOT&9\n\
    \\SO\n\
    \\ACK\EOT\SYN\STX\a\b\ETX\DC2\EOT\244\EOT'8\n\
    \\218\SOH\n\
    \\EOT\EOT\SYN\STX\b\DC2\EOT\251\EOT\EOT\RS\SUB\203\SOH\n\
    \The fee rate we'll use to sweep the output, expressed in sat/vbyte. The fee\n\
    \rate is only determined once a sweeping transaction for the output is\n\
    \created, so it's possible for this to be 0 before this.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\b\ENQ\DC2\EOT\251\EOT\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\b\SOH\DC2\EOT\251\EOT\v\CAN\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\b\ETX\DC2\EOT\251\EOT\ESC\GS\n\
    \P\n\
    \\EOT\EOT\SYN\STX\t\DC2\EOT\254\EOT\EOT(\SUBB The requested fee rate, expressed in sat/vbyte, for this output.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\t\ENQ\DC2\EOT\254\EOT\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\t\SOH\DC2\EOT\254\EOT\v\"\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\t\ETX\DC2\EOT\254\EOT%'\n\
    \t\n\
    \\EOT\EOT\SYN\STX\n\
    \\DC2\EOT\132\ENQ\EOT\DC3\SUBf\n\
    \Whether this input must be force-swept. This means that it is swept even\n\
    \if it has a negative yield.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\n\
    \\ENQ\DC2\EOT\132\ENQ\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\n\
    \\SOH\DC2\EOT\132\ENQ\t\SO\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\n\
    \\ETX\DC2\EOT\132\ENQ\DC1\DC2\n\
    \\f\n\
    \\STX\EOT\ETB\DC2\ACK\135\ENQ\NUL\136\ENQ\SOH\n\
    \\v\n\
    \\ETX\EOT\ETB\SOH\DC2\EOT\135\ENQ\b\FS\n\
    \\f\n\
    \\STX\EOT\CAN\DC2\ACK\138\ENQ\NUL\143\ENQ\SOH\n\
    \\v\n\
    \\ETX\EOT\CAN\SOH\DC2\EOT\138\ENQ\b\GS\n\
    \Z\n\
    \\EOT\EOT\CAN\STX\NUL\DC2\EOT\142\ENQ\EOT-\SUBL\n\
    \The set of outputs currently being swept by lnd's central batching engine.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\EOT\DC2\EOT\142\ENQ\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\ACK\DC2\EOT\142\ENQ\r\EM\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\SOH\DC2\EOT\142\ENQ\SUB(\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\ETX\DC2\EOT\142\ENQ+,\n\
    \\f\n\
    \\STX\EOT\EM\DC2\ACK\145\ENQ\NUL\170\ENQ\SOH\n\
    \\v\n\
    \\ETX\EOT\EM\SOH\DC2\EOT\145\ENQ\b\SYN\n\
    \>\n\
    \\EOT\EOT\EM\STX\NUL\DC2\EOT\147\ENQ\EOT \SUB0 The input we're attempting to bump the fee of.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\NUL\ACK\DC2\EOT\147\ENQ\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\NUL\SOH\DC2\EOT\147\ENQ\DC3\ESC\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\NUL\ETX\DC2\EOT\147\ENQ\RS\US\n\
    \R\n\
    \\EOT\EOT\EM\STX\SOH\DC2\EOT\150\ENQ\EOT\ESC\SUBD The target number of blocks that the input should be spent within.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\ENQ\DC2\EOT\150\ENQ\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\SOH\DC2\EOT\150\ENQ\v\SYN\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\ETX\DC2\EOT\150\ENQ\EM\SUB\n\
    \\129\SOH\n\
    \\EOT\EOT\EM\STX\STX\DC2\EOT\157\ENQ\EOT0\SUBs\n\
    \Deprecated, use sat_per_vbyte.\n\
    \The fee rate, expressed in sat/vbyte, that should be used to spend the input\n\
    \with.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\STX\ENQ\DC2\EOT\157\ENQ\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\STX\SOH\DC2\EOT\157\ENQ\v\ETB\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\STX\ETX\DC2\EOT\157\ENQ\SUB\ESC\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\STX\b\DC2\EOT\157\ENQ\FS/\n\
    \\SO\n\
    \\ACK\EOT\EM\STX\STX\b\ETX\DC2\EOT\157\ENQ\GS.\n\
    \t\n\
    \\EOT\EOT\EM\STX\ETX\DC2\EOT\163\ENQ\EOT\DC3\SUBf\n\
    \Whether this input must be force-swept. This means that it is swept even\n\
    \if it has a negative yield.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\ETX\ENQ\DC2\EOT\163\ENQ\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\ETX\SOH\DC2\EOT\163\ENQ\t\SO\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\ETX\ETX\DC2\EOT\163\ENQ\DC1\DC2\n\
    \b\n\
    \\EOT\EOT\EM\STX\EOT\DC2\EOT\169\ENQ\EOT\GS\SUBT\n\
    \The fee rate, expressed in sat/vbyte, that should be used to spend the input\n\
    \with.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\EOT\ENQ\DC2\EOT\169\ENQ\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\EOT\SOH\DC2\EOT\169\ENQ\v\CAN\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\EOT\ETX\DC2\EOT\169\ENQ\ESC\FS\n\
    \\f\n\
    \\STX\EOT\SUB\DC2\ACK\172\ENQ\NUL\173\ENQ\SOH\n\
    \\v\n\
    \\ETX\EOT\SUB\SOH\DC2\EOT\172\ENQ\b\ETB\n\
    \\f\n\
    \\STX\EOT\ESC\DC2\ACK\175\ENQ\NUL\182\ENQ\SOH\n\
    \\v\n\
    \\ETX\EOT\ESC\SOH\DC2\EOT\175\ENQ\b\EM\n\
    \\223\SOH\n\
    \\EOT\EOT\ESC\STX\NUL\DC2\EOT\181\ENQ\EOT\NAK\SUB\208\SOH\n\
    \Retrieve the full sweep transaction details. If false, only the sweep txids\n\
    \will be returned. Note that some sweeps that LND publishes will have been\n\
    \replaced-by-fee, so will not be included in this output.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\ENQ\DC2\EOT\181\ENQ\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\SOH\DC2\EOT\181\ENQ\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\ETX\DC2\EOT\181\ENQ\DC3\DC4\n\
    \\f\n\
    \\STX\EOT\FS\DC2\ACK\184\ENQ\NUL\198\ENQ\SOH\n\
    \\v\n\
    \\ETX\EOT\FS\SOH\DC2\EOT\184\ENQ\b\SUB\n\
    \\SO\n\
    \\EOT\EOT\FS\ETX\NUL\DC2\ACK\185\ENQ\EOT\192\ENQ\ENQ\n\
    \\r\n\
    \\ENQ\EOT\FS\ETX\NUL\SOH\DC2\EOT\185\ENQ\f\SUB\n\
    \\229\SOH\n\
    \\ACK\EOT\FS\ETX\NUL\STX\NUL\DC2\EOT\191\ENQ\b,\SUB\212\SOH\n\
    \Reversed, hex-encoded string representing the transaction ids of the\n\
    \sweeps that our node has broadcast. Note that these transactions may\n\
    \not have confirmed yet, we record sweeps on broadcast, not confirmation.\n\
    \\n\
    \\SI\n\
    \\a\EOT\FS\ETX\NUL\STX\NUL\EOT\DC2\EOT\191\ENQ\b\DLE\n\
    \\SI\n\
    \\a\EOT\FS\ETX\NUL\STX\NUL\ENQ\DC2\EOT\191\ENQ\DC1\ETB\n\
    \\SI\n\
    \\a\EOT\FS\ETX\NUL\STX\NUL\SOH\DC2\EOT\191\ENQ\CAN'\n\
    \\SI\n\
    \\a\EOT\FS\ETX\NUL\STX\NUL\ETX\DC2\EOT\191\ENQ*+\n\
    \\SO\n\
    \\EOT\EOT\FS\b\NUL\DC2\ACK\194\ENQ\EOT\197\ENQ\ENQ\n\
    \\r\n\
    \\ENQ\EOT\FS\b\NUL\SOH\DC2\EOT\194\ENQ\n\
    \\DLE\n\
    \\f\n\
    \\EOT\EOT\FS\STX\NUL\DC2\EOT\195\ENQ\b9\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\NUL\ACK\DC2\EOT\195\ENQ\b \n\
    \\r\n\
    \\ENQ\EOT\FS\STX\NUL\SOH\DC2\EOT\195\ENQ!4\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\NUL\ETX\DC2\EOT\195\ENQ78\n\
    \\f\n\
    \\EOT\EOT\FS\STX\SOH\DC2\EOT\196\ENQ\b+\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\SOH\ACK\DC2\EOT\196\ENQ\b\SYN\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\SOH\SOH\DC2\EOT\196\ENQ\ETB&\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\SOH\ETX\DC2\EOT\196\ENQ)*\n\
    \\f\n\
    \\STX\EOT\GS\DC2\ACK\200\ENQ\NUL\209\ENQ\SOH\n\
    \\v\n\
    \\ETX\EOT\GS\SOH\DC2\EOT\200\ENQ\b\US\n\
    \5\n\
    \\EOT\EOT\GS\STX\NUL\DC2\EOT\202\ENQ\EOT\DC3\SUB' The txid of the transaction to label.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\NUL\ENQ\DC2\EOT\202\ENQ\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\NUL\SOH\DC2\EOT\202\ENQ\n\
    \\SO\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\NUL\ETX\DC2\EOT\202\ENQ\DC1\DC2\n\
    \O\n\
    \\EOT\EOT\GS\STX\SOH\DC2\EOT\205\ENQ\EOT\NAK\SUBA The label to add to the transaction, limited to 500 characters.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\ENQ\DC2\EOT\205\ENQ\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\SOH\DC2\EOT\205\ENQ\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\ETX\DC2\EOT\205\ENQ\DC3\DC4\n\
    \J\n\
    \\EOT\EOT\GS\STX\STX\DC2\EOT\208\ENQ\EOT\ETB\SUB< Whether to overwrite the existing label, if it is present.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\STX\ENQ\DC2\EOT\208\ENQ\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\STX\SOH\DC2\EOT\208\ENQ\t\DC2\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\STX\ETX\DC2\EOT\208\ENQ\NAK\SYN\n\
    \\f\n\
    \\STX\EOT\RS\DC2\ACK\211\ENQ\NUL\212\ENQ\SOH\n\
    \\v\n\
    \\ETX\EOT\RS\SOH\DC2\EOT\211\ENQ\b \n\
    \\f\n\
    \\STX\EOT\US\DC2\ACK\214\ENQ\NUL\131\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT\US\SOH\DC2\EOT\214\ENQ\b\ETB\n\
    \\SO\n\
    \\EOT\EOT\US\b\NUL\DC2\ACK\215\ENQ\EOT\232\ENQ\ENQ\n\
    \\r\n\
    \\ENQ\EOT\US\b\NUL\SOH\DC2\EOT\215\ENQ\n\
    \\DC2\n\
    \\221\ETX\n\
    \\EOT\EOT\US\STX\NUL\DC2\EOT\226\ENQ\b\ETB\SUB\206\ETX\n\
    \Use an existing PSBT packet as the template for the funded PSBT.\n\
    \\n\
    \The packet must contain at least one non-dust output. If one or more\n\
    \inputs are specified, no coin selection is performed. In that case every\n\
    \input must be an UTXO known to the wallet that has not been locked\n\
    \before. The sum of all inputs must be sufficiently greater than the sum\n\
    \of all outputs to pay a miner fee with the specified fee rate. A change\n\
    \output is added to the PSBT if necessary.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\NUL\ENQ\DC2\EOT\226\ENQ\b\r\n\
    \\r\n\
    \\ENQ\EOT\US\STX\NUL\SOH\DC2\EOT\226\ENQ\SO\DC2\n\
    \\r\n\
    \\ENQ\EOT\US\STX\NUL\ETX\DC2\EOT\226\ENQ\NAK\SYN\n\
    \K\n\
    \\EOT\EOT\US\STX\SOH\DC2\EOT\231\ENQ\b\ESC\SUB=\n\
    \Use the outputs and optional inputs from this raw template.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\SOH\ACK\DC2\EOT\231\ENQ\b\DC2\n\
    \\r\n\
    \\ENQ\EOT\US\STX\SOH\SOH\DC2\EOT\231\ENQ\DC3\SYN\n\
    \\r\n\
    \\ENQ\EOT\US\STX\SOH\ETX\DC2\EOT\231\ENQ\EM\SUB\n\
    \\SO\n\
    \\EOT\EOT\US\b\SOH\DC2\ACK\234\ENQ\EOT\245\ENQ\ENQ\n\
    \\r\n\
    \\ENQ\EOT\US\b\SOH\SOH\DC2\EOT\234\ENQ\n\
    \\SO\n\
    \X\n\
    \\EOT\EOT\US\STX\STX\DC2\EOT\238\ENQ\b\US\SUBJ\n\
    \The target number of blocks that the transaction should be confirmed in.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\STX\ENQ\DC2\EOT\238\ENQ\b\SO\n\
    \\r\n\
    \\ENQ\EOT\US\STX\STX\SOH\DC2\EOT\238\ENQ\SI\SUB\n\
    \\r\n\
    \\ENQ\EOT\US\STX\STX\ETX\DC2\EOT\238\ENQ\GS\RS\n\
    \b\n\
    \\EOT\EOT\US\STX\ETX\DC2\EOT\244\ENQ\b!\SUBT\n\
    \The fee rate, expressed in sat/vbyte, that should be used to spend the\n\
    \input with.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\ETX\ENQ\DC2\EOT\244\ENQ\b\SO\n\
    \\r\n\
    \\ENQ\EOT\US\STX\ETX\SOH\DC2\EOT\244\ENQ\SI\FS\n\
    \\r\n\
    \\ENQ\EOT\US\STX\ETX\ETX\DC2\EOT\244\ENQ\US \n\
    \l\n\
    \\EOT\EOT\US\STX\EOT\DC2\EOT\251\ENQ\EOT\ETB\SUB^\n\
    \The name of the account to fund the PSBT with. If empty, the default wallet\n\
    \account is used.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\EOT\ENQ\DC2\EOT\251\ENQ\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\EOT\SOH\DC2\EOT\251\ENQ\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\US\STX\EOT\ETX\DC2\EOT\251\ENQ\NAK\SYN\n\
    \t\n\
    \\EOT\EOT\US\STX\ENQ\DC2\EOT\255\ENQ\EOT\CAN\SUBf The minimum number of confirmations each one of your outputs used for\n\
    \ the transaction must satisfy.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\ENQ\ENQ\DC2\EOT\255\ENQ\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\US\STX\ENQ\SOH\DC2\EOT\255\ENQ\n\
    \\DC3\n\
    \\r\n\
    \\ENQ\EOT\US\STX\ENQ\ETX\DC2\EOT\255\ENQ\SYN\ETB\n\
    \Y\n\
    \\EOT\EOT\US\STX\ACK\DC2\EOT\130\ACK\EOT\US\SUBK Whether unconfirmed outputs should be used as inputs for the transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\ACK\ENQ\DC2\EOT\130\ACK\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\US\STX\ACK\SOH\DC2\EOT\130\ACK\t\SUB\n\
    \\r\n\
    \\ENQ\EOT\US\STX\ACK\ETX\DC2\EOT\130\ACK\GS\RS\n\
    \\f\n\
    \\STX\EOT \DC2\ACK\132\ACK\NUL\148\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT \SOH\DC2\EOT\132\ACK\b\CAN\n\
    \:\n\
    \\EOT\EOT \STX\NUL\DC2\EOT\136\ACK\EOT\SUB\SUB,\n\
    \The funded but not yet signed PSBT packet.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\NUL\ENQ\DC2\EOT\136\ACK\EOT\t\n\
    \\r\n\
    \\ENQ\EOT \STX\NUL\SOH\DC2\EOT\136\ACK\n\
    \\NAK\n\
    \\r\n\
    \\ENQ\EOT \STX\NUL\ETX\DC2\EOT\136\ACK\CAN\EM\n\
    \V\n\
    \\EOT\EOT \STX\SOH\DC2\EOT\141\ACK\EOT\"\SUBH\n\
    \The index of the added change output or -1 if no change was left over.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\SOH\ENQ\DC2\EOT\141\ACK\EOT\t\n\
    \\r\n\
    \\ENQ\EOT \STX\SOH\SOH\DC2\EOT\141\ACK\n\
    \\GS\n\
    \\r\n\
    \\ENQ\EOT \STX\SOH\ETX\DC2\EOT\141\ACK !\n\
    \d\n\
    \\EOT\EOT \STX\STX\DC2\EOT\147\ACK\EOT(\SUBV\n\
    \The list of lock leases that were acquired for the inputs in the funded PSBT\n\
    \packet.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\STX\EOT\DC2\EOT\147\ACK\EOT\f\n\
    \\r\n\
    \\ENQ\EOT \STX\STX\ACK\DC2\EOT\147\ACK\r\SYN\n\
    \\r\n\
    \\ENQ\EOT \STX\STX\SOH\DC2\EOT\147\ACK\ETB#\n\
    \\r\n\
    \\ENQ\EOT \STX\STX\ETX\DC2\EOT\147\ACK&'\n\
    \\f\n\
    \\STX\EOT!\DC2\ACK\150\ACK\NUL\166\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT!\SOH\DC2\EOT\150\ACK\b\DC2\n\
    \\163\ETX\n\
    \\EOT\EOT!\STX\NUL\DC2\EOT\160\ACK\EOT'\SUB\148\ETX\n\
    \An optional list of inputs to use. Every input must be an UTXO known to the\n\
    \wallet that has not been locked before. The sum of all inputs must be\n\
    \sufficiently greater than the sum of all outputs to pay a miner fee with the\n\
    \fee rate specified in the parent message.\n\
    \\n\
    \If no inputs are specified, coin selection will be performed instead and\n\
    \inputs of sufficient value will be added to the resulting PSBT.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\EOT\DC2\EOT\160\ACK\EOT\f\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\ACK\DC2\EOT\160\ACK\r\ESC\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\SOH\DC2\EOT\160\ACK\FS\"\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\ETX\DC2\EOT\160\ACK%&\n\
    \U\n\
    \\EOT\EOT!\STX\SOH\DC2\EOT\165\ACK\EOT$\SUBG\n\
    \A map of all addresses and the amounts to send to in the funded PSBT.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT!\STX\SOH\ACK\DC2\EOT\165\ACK\EOT\ETB\n\
    \\r\n\
    \\ENQ\EOT!\STX\SOH\SOH\DC2\EOT\165\ACK\CAN\US\n\
    \\r\n\
    \\ENQ\EOT!\STX\SOH\ETX\DC2\EOT\165\ACK\"#\n\
    \\f\n\
    \\STX\EOT\"\DC2\ACK\168\ACK\NUL\181\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT\"\SOH\DC2\EOT\168\ACK\b\DC1\n\
    \>\n\
    \\EOT\EOT\"\STX\NUL\DC2\EOT\172\ACK\EOT\DC1\SUB0\n\
    \A 32 byte random ID that identifies the lease.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\"\STX\NUL\ENQ\DC2\EOT\172\ACK\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\"\STX\NUL\SOH\DC2\EOT\172\ACK\n\
    \\f\n\
    \\r\n\
    \\ENQ\EOT\"\STX\NUL\ETX\DC2\EOT\172\ACK\SI\DLE\n\
    \D\n\
    \\EOT\EOT\"\STX\SOH\DC2\EOT\175\ACK\EOT \SUB6 The identifying outpoint of the output being leased.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\"\STX\SOH\ACK\DC2\EOT\175\ACK\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT\"\STX\SOH\SOH\DC2\EOT\175\ACK\DC3\ESC\n\
    \\r\n\
    \\ENQ\EOT\"\STX\SOH\ETX\DC2\EOT\175\ACK\RS\US\n\
    \\\\n\
    \\EOT\EOT\"\STX\STX\DC2\EOT\180\ACK\EOT\SUB\SUBN\n\
    \The absolute expiration of the output lease represented as a unix timestamp.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\"\STX\STX\ENQ\DC2\EOT\180\ACK\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\"\STX\STX\SOH\DC2\EOT\180\ACK\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\"\STX\STX\ETX\DC2\EOT\180\ACK\CAN\EM\n\
    \\f\n\
    \\STX\EOT#\DC2\ACK\183\ACK\NUL\196\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT#\SOH\DC2\EOT\183\ACK\b\ESC\n\
    \\167\SOH\n\
    \\EOT\EOT#\STX\NUL\DC2\EOT\189\ACK\EOT\SUB\SUB\152\SOH\n\
    \A PSBT that should be signed and finalized. The PSBT must contain all\n\
    \required inputs, outputs, UTXO data and partial signatures of all other\n\
    \signers.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT#\STX\NUL\ENQ\DC2\EOT\189\ACK\EOT\t\n\
    \\r\n\
    \\ENQ\EOT#\STX\NUL\SOH\DC2\EOT\189\ACK\n\
    \\NAK\n\
    \\r\n\
    \\ENQ\EOT#\STX\NUL\ETX\DC2\EOT\189\ACK\CAN\EM\n\
    \p\n\
    \\EOT\EOT#\STX\SOH\DC2\EOT\195\ACK\EOT\ETB\SUBb\n\
    \The name of the account to finalize the PSBT with. If empty, the default\n\
    \wallet account is used.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT#\STX\SOH\ENQ\DC2\EOT\195\ACK\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT#\STX\SOH\SOH\DC2\EOT\195\ACK\v\DC2\n\
    \\r\n\
    \\ENQ\EOT#\STX\SOH\ETX\DC2\EOT\195\ACK\NAK\SYN\n\
    \\f\n\
    \\STX\EOT$\DC2\ACK\197\ACK\NUL\203\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT$\SOH\DC2\EOT\197\ACK\b\FS\n\
    \J\n\
    \\EOT\EOT$\STX\NUL\DC2\EOT\199\ACK\EOT\SUB\SUB< The fully signed and finalized transaction in PSBT format.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT$\STX\NUL\ENQ\DC2\EOT\199\ACK\EOT\t\n\
    \\r\n\
    \\ENQ\EOT$\STX\NUL\SOH\DC2\EOT\199\ACK\n\
    \\NAK\n\
    \\r\n\
    \\ENQ\EOT$\STX\NUL\ETX\DC2\EOT\199\ACK\CAN\EM\n\
    \R\n\
    \\EOT\EOT$\STX\SOH\DC2\EOT\202\ACK\EOT\ESC\SUBD The fully signed and finalized transaction in the raw wire format.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT$\STX\SOH\ENQ\DC2\EOT\202\ACK\EOT\t\n\
    \\r\n\
    \\ENQ\EOT$\STX\SOH\SOH\DC2\EOT\202\ACK\n\
    \\SYN\n\
    \\r\n\
    \\ENQ\EOT$\STX\SOH\ETX\DC2\EOT\202\ACK\EM\SUB\n\
    \\f\n\
    \\STX\EOT%\DC2\ACK\205\ACK\NUL\206\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT%\SOH\DC2\EOT\205\ACK\b\EM\n\
    \\f\n\
    \\STX\EOT&\DC2\ACK\208\ACK\NUL\211\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT&\SOH\DC2\EOT\208\ACK\b\SUB\n\
    \3\n\
    \\EOT\EOT&\STX\NUL\DC2\EOT\210\ACK\EOT(\SUB% The list of currently leased utxos.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT&\STX\NUL\EOT\DC2\EOT\210\ACK\EOT\f\n\
    \\r\n\
    \\ENQ\EOT&\STX\NUL\ACK\DC2\EOT\210\ACK\r\SYN\n\
    \\r\n\
    \\ENQ\EOT&\STX\NUL\SOH\DC2\EOT\210\ACK\ETB#\n\
    \\r\n\
    \\ENQ\EOT&\STX\NUL\ETX\DC2\EOT\210\ACK&'b\ACKproto3"