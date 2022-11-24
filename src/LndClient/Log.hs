{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.Log
  ( SecretRpc,
    katipAddLndSecret,
    katipAddLndPublic,
    katipAddLndLoc,
    rpcRunning,
    rpcFailed,
    rpcSucceeded,
    newSeverity,
    newSev,
  )
where

import qualified Data.Set as Set
import qualified GHC.TypeLits as GHC
import qualified Katip
import LndClient.Data.LndEnv
import LndClient.Data.Type
import LndClient.Import.External
import qualified Network.GRPC.Client.Helpers as Grpc

type family SecretRpc (t :: GHC.Symbol) :: GHC.Nat where
--
-- Sync
--
  SecretRpc "unlockWallet" = 1
  SecretRpc "initWallet" = 1
  SecretRpc "newAddress" = 0
  SecretRpc "addInvoice" = 0
  SecretRpc "addHoldInvoice" = 0
  SecretRpc "cancelInvoice" = 0
  SecretRpc "settleInvoice" = 0
  SecretRpc "openChannelSync" = 0
  SecretRpc "listChannels" = 0
  SecretRpc "listPeers" = 0
  SecretRpc "connectPeer" = 0
  SecretRpc "getInfo" = 0
  SecretRpc "sendPaymentSync" = 0
  SecretRpc "sendCoins" = 0
  SecretRpc "fundPsbt" = 0
  SecretRpc "finalizePsbt" = 0
  SecretRpc "publishTransaction" = 0
  SecretRpc "listUnspent" = 0
  SecretRpc "listLeases" = 0
  SecretRpc "releaseOutput" = 0
  SecretRpc "leaseOutput" = 0
  SecretRpc "decodePayReq" = 0
  SecretRpc "lookupInvoice" = 0
  SecretRpc "pendingChannels" = 0
  SecretRpc "closedChannels" = 0
  SecretRpc "listInvoices" = 0
  SecretRpc "signMessage" = 0
  SecretRpc "verifyMessage" = 0
  SecretRpc "fundingStateStep" = 0
  SecretRpc "exportAllChannelBackups" = 0
  SecretRpc "exportChannelBackup" = 0
  SecretRpc "restoreChannelBackups" = 0
  SecretRpc "walletBalance" = 0
  SecretRpc "channelBalance" = 0
--
-- Sub
--
  SecretRpc "trackPaymentV2" = 0
  SecretRpc "subscribeHtlcEvents" = 0
  SecretRpc "closeChannel" = 0
  SecretRpc "openChannel" = 0
  SecretRpc "subscribeChannelEvents" = 0
  SecretRpc "subscribeInvoices" = 0
  SecretRpc "subscribeSingleInvoice" = 0

rpcIsSecret ::
  forall t.
  GHC.KnownNat (SecretRpc t) =>
  Bool
rpcIsSecret =
  natVal (Proxy @(SecretRpc t)) > 0

inspectSecret ::
  forall (rpc :: GHC.Symbol) raw.
  ( Out raw,
    KnownNat (SecretRpc rpc)
  ) =>
  LndEnv ->
  raw ->
  Text
inspectSecret env =
  inspectPlain
    . if rpcIsSecret @rpc
      then SecretLog (loggingStrategySecret $ envLndLogStrategy env)
      else PrettyLog

katipAddLndMeta ::
  (KatipContext m) =>
  LndEnv ->
  LoggingMeta ->
  SimpleLogPayload ->
  m a ->
  m a
katipAddLndMeta env meta slp this =
  if Set.member meta . loggingStrategyMeta $ envLndLogStrategy env
    then Katip.katipAddContext slp this
    else this

katipAddLndSecret ::
  forall (rpc :: GHC.Symbol) a m b.
  ( Out a,
    KatipContext m,
    KnownNat (SecretRpc rpc)
  ) =>
  LndEnv ->
  LoggingMeta ->
  a ->
  m b ->
  m b
katipAddLndSecret env meta =
  katipAddLndMeta env meta
    . sl (inspectPlain meta :: Text)
    . inspectSecret @rpc env

katipAddLndPublic ::
  ( Out a,
    KatipContext m
  ) =>
  LndEnv ->
  LoggingMeta ->
  a ->
  m b ->
  m b
katipAddLndPublic env meta =
  katipAddLndMeta env meta
    . sl (inspectPlain meta :: Text)
    . inspectPlain @Text

katipAddLndLoc ::
  ( KatipContext m
  ) =>
  LndEnv ->
  m a ->
  m a
katipAddLndLoc env =
  case Grpc._grpcClientConfigAddress $ envLndConfig env of
    Grpc.AddressTCP host port ->
      katipAddLndPublic env LndHost host
        . katipAddLndPublic env LndPort (toInteger port)
    Grpc.AddressUnix {} ->
      katipAddLndPublic env LndHost ("AddressUnix" :: Text)
    Grpc.AddressSocket {} ->
      katipAddLndPublic env LndHost ("AddressSocket" :: Text)

rpcRunning :: Katip.LogStr
rpcRunning = "RPC is running..."

rpcFailed :: Katip.LogStr
rpcFailed = "RPC failed!"

rpcSucceeded :: Katip.LogStr
rpcSucceeded = "RPC succeeded!"

newSeverity ::
  LndEnv ->
  Severity ->
  Maybe Timespan ->
  Maybe LndError ->
  Severity
newSeverity =
  loggingStrategySeverity
    . envLndLogStrategy

newSev ::
  LndEnv ->
  Severity ->
  Severity
newSev env sev =
  newSeverity env sev Nothing Nothing
