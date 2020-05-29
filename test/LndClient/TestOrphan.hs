{-# LANGUAGE StandaloneDeriving #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module LndClient.TestOrphan
  (
  )
where

import LndClient.Data.AddInvoice
import LndClient.Data.ChannelPoint
import LndClient.Data.Invoice
import LndClient.Import

deriving instance Show MoneyAmount

deriving instance Show SettleIndex

deriving instance Show AddIndex

deriving instance Show PaymentRequest

deriving instance Show Invoice

deriving instance Show AddInvoiceRequest

deriving instance Show AddInvoiceResponse

deriving instance Show ChannelPoint
