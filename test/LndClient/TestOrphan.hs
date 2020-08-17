{-# LANGUAGE StandaloneDeriving #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module LndClient.TestOrphan
  (
  )
where

import LndClient.Data.AddInvoice
import LndClient.Data.ChannelPoint
import LndClient.Data.Invoice
import LndClient.Data.ListChannels
import LndClient.Data.SendPayment
import LndClient.Import

deriving instance Show MoneyAmount

deriving instance Show SettleIndex

deriving instance Show AddIndex

deriving instance Show PaymentRequest

deriving instance Show Invoice

deriving instance Show AddInvoiceRequest

deriving instance Show AddInvoiceResponse

deriving instance Show ChannelPoint

deriving instance Show Channel

deriving instance Show SendPaymentResponse
