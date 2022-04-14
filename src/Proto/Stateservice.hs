{- This file was auto-generated from stateservice.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Stateservice (
        State(..), GetStateRequest(), GetStateResponse(),
        SubscribeStateRequest(), SubscribeStateResponse(), WalletState(..),
        WalletState(), WalletState'UnrecognizedValue
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
      -}
data GetStateRequest
  = GetStateRequest'_constructor {_GetStateRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show GetStateRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out GetStateRequest
instance Data.ProtoLens.Message GetStateRequest where
  messageName _ = Data.Text.pack "lnrpc.GetStateRequest"
  packedMessageDescriptor _
    = "\n\
      \\SIGetStateRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetStateRequest'_unknownFields
        (\ x__ y__ -> x__ {_GetStateRequest'_unknownFields = y__})
  defMessage
    = GetStateRequest'_constructor
        {_GetStateRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetStateRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser GetStateRequest
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
          (do loop Data.ProtoLens.defMessage) "GetStateRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData GetStateRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq (_GetStateRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Stateservice_Fields.state' @:: Lens' GetStateResponse WalletState@ -}
data GetStateResponse
  = GetStateResponse'_constructor {_GetStateResponse'state :: !WalletState,
                                   _GetStateResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show GetStateResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out GetStateResponse
instance Data.ProtoLens.Field.HasField GetStateResponse "state" WalletState where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetStateResponse'state
           (\ x__ y__ -> x__ {_GetStateResponse'state = y__}))
        Prelude.id
instance Data.ProtoLens.Message GetStateResponse where
  messageName _ = Data.Text.pack "lnrpc.GetStateResponse"
  packedMessageDescriptor _
    = "\n\
      \\DLEGetStateResponse\DC2(\n\
      \\ENQstate\CAN\SOH \SOH(\SO2\DC2.lnrpc.WalletStateR\ENQstate"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        state__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "state"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor WalletState)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"state")) ::
              Data.ProtoLens.FieldDescriptor GetStateResponse
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, state__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetStateResponse'_unknownFields
        (\ x__ y__ -> x__ {_GetStateResponse'_unknownFields = y__})
  defMessage
    = GetStateResponse'_constructor
        {_GetStateResponse'state = Data.ProtoLens.fieldDefault,
         _GetStateResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetStateResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser GetStateResponse
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
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "state"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"state") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "GetStateResponse"
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
                         Prelude.fromEnum _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData GetStateResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GetStateResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_GetStateResponse'state x__) ())
{- | Fields :
      -}
data SubscribeStateRequest
  = SubscribeStateRequest'_constructor {_SubscribeStateRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SubscribeStateRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SubscribeStateRequest
instance Data.ProtoLens.Message SubscribeStateRequest where
  messageName _ = Data.Text.pack "lnrpc.SubscribeStateRequest"
  packedMessageDescriptor _
    = "\n\
      \\NAKSubscribeStateRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SubscribeStateRequest'_unknownFields
        (\ x__ y__ -> x__ {_SubscribeStateRequest'_unknownFields = y__})
  defMessage
    = SubscribeStateRequest'_constructor
        {_SubscribeStateRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SubscribeStateRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SubscribeStateRequest
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
          (do loop Data.ProtoLens.defMessage) "SubscribeStateRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData SubscribeStateRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SubscribeStateRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Stateservice_Fields.state' @:: Lens' SubscribeStateResponse WalletState@ -}
data SubscribeStateResponse
  = SubscribeStateResponse'_constructor {_SubscribeStateResponse'state :: !WalletState,
                                         _SubscribeStateResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SubscribeStateResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SubscribeStateResponse
instance Data.ProtoLens.Field.HasField SubscribeStateResponse "state" WalletState where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SubscribeStateResponse'state
           (\ x__ y__ -> x__ {_SubscribeStateResponse'state = y__}))
        Prelude.id
instance Data.ProtoLens.Message SubscribeStateResponse where
  messageName _ = Data.Text.pack "lnrpc.SubscribeStateResponse"
  packedMessageDescriptor _
    = "\n\
      \\SYNSubscribeStateResponse\DC2(\n\
      \\ENQstate\CAN\SOH \SOH(\SO2\DC2.lnrpc.WalletStateR\ENQstate"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        state__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "state"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor WalletState)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"state")) ::
              Data.ProtoLens.FieldDescriptor SubscribeStateResponse
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, state__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SubscribeStateResponse'_unknownFields
        (\ x__ y__ -> x__ {_SubscribeStateResponse'_unknownFields = y__})
  defMessage
    = SubscribeStateResponse'_constructor
        {_SubscribeStateResponse'state = Data.ProtoLens.fieldDefault,
         _SubscribeStateResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SubscribeStateResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser SubscribeStateResponse
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
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "state"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"state") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SubscribeStateResponse"
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
                         Prelude.fromEnum _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SubscribeStateResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SubscribeStateResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SubscribeStateResponse'state x__) ())
newtype WalletState'UnrecognizedValue
  = WalletState'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq,
                  Prelude.Ord,
                  Prelude.Show,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out WalletState'UnrecognizedValue
data WalletState
  = NON_EXISTING |
    LOCKED |
    UNLOCKED |
    RPC_ACTIVE |
    SERVER_ACTIVE |
    WAITING_TO_START |
    WalletState'Unrecognized !WalletState'UnrecognizedValue
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Data.ProtoLens.MessageEnum WalletState where
  maybeToEnum 0 = Prelude.Just NON_EXISTING
  maybeToEnum 1 = Prelude.Just LOCKED
  maybeToEnum 2 = Prelude.Just UNLOCKED
  maybeToEnum 3 = Prelude.Just RPC_ACTIVE
  maybeToEnum 4 = Prelude.Just SERVER_ACTIVE
  maybeToEnum 255 = Prelude.Just WAITING_TO_START
  maybeToEnum k
    = Prelude.Just
        (WalletState'Unrecognized
           (WalletState'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum NON_EXISTING = "NON_EXISTING"
  showEnum LOCKED = "LOCKED"
  showEnum UNLOCKED = "UNLOCKED"
  showEnum RPC_ACTIVE = "RPC_ACTIVE"
  showEnum SERVER_ACTIVE = "SERVER_ACTIVE"
  showEnum WAITING_TO_START = "WAITING_TO_START"
  showEnum
    (WalletState'Unrecognized (WalletState'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "NON_EXISTING" = Prelude.Just NON_EXISTING
    | (Prelude.==) k "LOCKED" = Prelude.Just LOCKED
    | (Prelude.==) k "UNLOCKED" = Prelude.Just UNLOCKED
    | (Prelude.==) k "RPC_ACTIVE" = Prelude.Just RPC_ACTIVE
    | (Prelude.==) k "SERVER_ACTIVE" = Prelude.Just SERVER_ACTIVE
    | (Prelude.==) k "WAITING_TO_START" = Prelude.Just WAITING_TO_START
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded WalletState where
  minBound = NON_EXISTING
  maxBound = WAITING_TO_START
instance Prelude.Enum WalletState where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum WalletState: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum NON_EXISTING = 0
  fromEnum LOCKED = 1
  fromEnum UNLOCKED = 2
  fromEnum RPC_ACTIVE = 3
  fromEnum SERVER_ACTIVE = 4
  fromEnum WAITING_TO_START = 255
  fromEnum
    (WalletState'Unrecognized (WalletState'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ WAITING_TO_START
    = Prelude.error
        "WalletState.succ: bad argument WAITING_TO_START. This value would be out of bounds."
  succ NON_EXISTING = LOCKED
  succ LOCKED = UNLOCKED
  succ UNLOCKED = RPC_ACTIVE
  succ RPC_ACTIVE = SERVER_ACTIVE
  succ SERVER_ACTIVE = WAITING_TO_START
  succ (WalletState'Unrecognized _)
    = Prelude.error
        "WalletState.succ: bad argument: unrecognized value"
  pred NON_EXISTING
    = Prelude.error
        "WalletState.pred: bad argument NON_EXISTING. This value would be out of bounds."
  pred LOCKED = NON_EXISTING
  pred UNLOCKED = LOCKED
  pred RPC_ACTIVE = UNLOCKED
  pred SERVER_ACTIVE = RPC_ACTIVE
  pred WAITING_TO_START = SERVER_ACTIVE
  pred (WalletState'Unrecognized _)
    = Prelude.error
        "WalletState.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault WalletState where
  fieldDefault = NON_EXISTING
instance Control.DeepSeq.NFData WalletState where
  rnf x__ = Prelude.seq x__ ()
instance Text.PrettyPrint.GenericPretty.Out WalletState
data State = State {}
instance Data.ProtoLens.Service.Types.Service State where
  type ServiceName State = "State"
  type ServicePackage State = "lnrpc"
  type ServiceMethods State = '["getState", "subscribeState"]
  packedServiceDescriptor _
    = "\n\
      \\ENQState\DC2O\n\
      \\SOSubscribeState\DC2\FS.lnrpc.SubscribeStateRequest\SUB\GS.lnrpc.SubscribeStateResponse0\SOH\DC2;\n\
      \\bGetState\DC2\SYN.lnrpc.GetStateRequest\SUB\ETB.lnrpc.GetStateResponse"
instance Data.ProtoLens.Service.Types.HasMethodImpl State "subscribeState" where
  type MethodName State "subscribeState" = "SubscribeState"
  type MethodInput State "subscribeState" = SubscribeStateRequest
  type MethodOutput State "subscribeState" = SubscribeStateResponse
  type MethodStreamingType State "subscribeState" = 'Data.ProtoLens.Service.Types.ServerStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl State "getState" where
  type MethodName State "getState" = "GetState"
  type MethodInput State "getState" = GetStateRequest
  type MethodOutput State "getState" = GetStateResponse
  type MethodStreamingType State "getState" = 'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\DC2stateservice.proto\DC2\ENQlnrpc\"\ETB\n\
    \\NAKSubscribeStateRequest\"B\n\
    \\SYNSubscribeStateResponse\DC2(\n\
    \\ENQstate\CAN\SOH \SOH(\SO2\DC2.lnrpc.WalletStateR\ENQstate\"\DC1\n\
    \\SIGetStateRequest\"<\n\
    \\DLEGetStateResponse\DC2(\n\
    \\ENQstate\CAN\SOH \SOH(\SO2\DC2.lnrpc.WalletStateR\ENQstate*s\n\
    \\vWalletState\DC2\DLE\n\
    \\fNON_EXISTING\DLE\NUL\DC2\n\
    \\n\
    \\ACKLOCKED\DLE\SOH\DC2\f\n\
    \\bUNLOCKED\DLE\STX\DC2\SO\n\
    \\n\
    \RPC_ACTIVE\DLE\ETX\DC2\DC1\n\
    \\rSERVER_ACTIVE\DLE\EOT\DC2\NAK\n\
    \\DLEWAITING_TO_START\DLE\255\SOH2\149\SOH\n\
    \\ENQState\DC2O\n\
    \\SOSubscribeState\DC2\FS.lnrpc.SubscribeStateRequest\SUB\GS.lnrpc.SubscribeStateResponse0\SOH\DC2;\n\
    \\bGetState\DC2\SYN.lnrpc.GetStateRequest\SUB\ETB.lnrpc.GetStateResponseB'Z%github.com/lightningnetwork/lnd/lnrpcJ\196\r\n\
    \\ACK\DC2\EOT\NUL\NUL=\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\STX\NUL\SO\n\
    \\b\n\
    \\SOH\b\DC2\ETX\EOT\NUL<\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\EOT\NUL<\n\
    \\155\ACK\n\
    \\STX\ACK\NUL\DC2\EOT\SUB\NUL#\SOH\SUBi State service is a always running service that exposes the current state of\n\
    \ the wallet and RPC server.\n\
    \2\163\ENQ\n\
    \ Comments in this file will be directly parsed into the API\n\
    \ Documentation as descriptions of the associated method, message, or field.\n\
    \ These descriptions should go right above the definition of the object, and\n\
    \ can be in either block or // comment format.\n\
    \\n\
    \ An RPC method can be matched to an lncli command by placing a line in the\n\
    \ beginning of the description in exactly the following format:\n\
    \ lncli: `methodname`\n\
    \\n\
    \ Failure to specify the exact name of the command will cause documentation\n\
    \ generation to fail.\n\
    \\n\
    \ More information on how exactly the gRPC documentation is generated from\n\
    \ this proto file can be found here:\n\
    \ https://github.com/lightninglabs/lightning-api\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\SUB\b\r\n\
    \\133\SOH\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\EOT\GS\EOT\RS0\SUBw SubscribeState subscribes to the state of the wallet. The current wallet\n\
    \ state will always be delivered immediately.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\GS\b\SYN\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\GS\CAN-\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ACK\DC2\ETX\RS\DC1\ETB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\RS\CAN.\n\
    \\\\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX\"\EOT>\SUBO GetState returns the current wallet state without streaming further\n\
    \ changes.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX\"\b\DLE\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX\"\DC2!\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX\",<\n\
    \\n\
    \\n\
    \\STX\ENQ\NUL\DC2\EOT%\NUL/\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\NUL\SOH\DC2\ETX%\ENQ\DLE\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\ETX&\EOT\NAK\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\ETX&\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\ETX&\DC3\DC4\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\ETX'\EOT\SI\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\ETX'\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\ETX'\r\SO\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\STX\DC2\ETX(\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\STX\SOH\DC2\ETX(\EOT\f\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\STX\STX\DC2\ETX(\SI\DLE\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\ETX\DC2\ETX)\EOT\DC3\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ETX\SOH\DC2\ETX)\EOT\SO\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ETX\STX\DC2\ETX)\DC1\DC2\n\
    \P\n\
    \\EOT\ENQ\NUL\STX\EOT\DC2\ETX,\EOT\SYN\SUBC SERVER_ACTIVE means that the lnd server is ready to accept calls.\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\EOT\SOH\DC2\ETX,\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\EOT\STX\DC2\ETX,\DC4\NAK\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\ENQ\DC2\ETX.\EOT\ESC\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ENQ\SOH\DC2\ETX.\EOT\DC4\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ENQ\STX\DC2\ETX.\ETB\SUB\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT1\NUL2\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX1\b\GS\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT4\NUL6\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX4\b\RS\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX5\EOT\SUB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\ETX5\EOT\SI\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX5\DLE\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX5\CAN\EM\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT8\NUL9\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX8\b\ETB\n\
    \\n\
    \\n\
    \\STX\EOT\ETX\DC2\EOT;\NUL=\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETX;\b\CAN\n\
    \\v\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETX<\EOT\SUB\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ACK\DC2\ETX<\EOT\SI\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETX<\DLE\NAK\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETX<\CAN\EMb\ACKproto3"