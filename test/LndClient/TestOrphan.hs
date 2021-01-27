{-# LANGUAGE StandaloneDeriving #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module LndClient.TestOrphan
  (
  )
where

import LndClient.Data.AddInvoice
import LndClient.Data.Invoice
import LndClient.Data.Payment
import LndClient.Data.SendPayment
import LndClient.Import
import LndClient.Watcher

deriving instance Show SettleIndex

deriving instance Show AddIndex

deriving instance Show PaymentRequest

deriving instance Show Invoice

deriving instance Show AddInvoiceRequest

deriving instance Show AddInvoiceResponse

deriving instance Show SendPaymentResponse

deriving instance Show Payment

deriving instance Show RPreimage

deriving instance Show a => Show (LndResult a)
