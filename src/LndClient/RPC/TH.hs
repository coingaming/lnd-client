{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE TemplateHaskell #-}

module LndClient.RPC.TH
  ( mkRpc,
    RpcKind (..),
  )
where

--import qualified InvoiceGrpc as GRPC
import Language.Haskell.TH.Syntax
--import LndClient.Data.AddHodlInvoice (AddHodlInvoiceRequest (..))
--import LndClient.Data.AddInvoice (AddInvoiceRequest (..), AddInvoiceResponse (..))
--import LndClient.Data.ChannelPoint (ChannelPoint (..))
--import LndClient.Data.CloseChannel (CloseChannelRequest (..), CloseStatusUpdate (..))
import LndClient.Data.GetInfo
import LndClient.Data.InitWallet (InitWalletRequest (..))
--import LndClient.Data.Invoice (Invoice (..))
--import LndClient.Data.ListChannels (Channel (..), ListChannelsRequest (..))
--import LndClient.Data.NewAddress (NewAddressResponse (..))
--import LndClient.Data.OpenChannel (OpenChannelRequest (..))
--import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..), Peer (..))
--import LndClient.Data.SendPayment (SendPaymentRequest (..), SendPaymentResponse (..))
--import LndClient.Data.SubscribeChannelEvents (ChannelEventUpdate (..))
--import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
--import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.Import
import LndClient.RPC.Generic
import qualified LndGrpc as GRPC
import qualified WalletUnlockerGrpc as GRPC

data RpcKind = RpcSilent | RpcKatip

mkRpc :: RpcKind -> Q [Dec]
mkRpc k = do
  [d|
    getInfo ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError GetInfoResponse)
    getInfo env =
      $(grpcSync)
        GetInfo
        GRPC.lightningClient
        GRPC.lightningGetInfo
        env
        GRPC.GetInfoRequest

    initWallet ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError ())
    initWallet env = do
      res <-
        $(grpcSync)
          InitWallet
          GRPC.walletUnlockerClient
          GRPC.walletUnlockerInitWallet
          env
          InitWalletRequest
            { walletPassword = coerce $ envLndWalletPassword env,
              cipherSeedMnemonic = coerce $ envLndCipherSeedMnemonic env,
              aezeedPassphrase = coerce $ envLndAezeedPassphrase env
            }
      if isRight res
        then waitForGrpc env
        else return res
    |]
  where
    tcc = case k of
      RpcSilent -> [t|MonadIO|]
      RpcKatip -> [t|KatipContext|]
    grpcSync = case k of
      RpcSilent -> [e|grpcSyncSilent|]
      RpcKatip -> [e|grpcSyncKatip|]
