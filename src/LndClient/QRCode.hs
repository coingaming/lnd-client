{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LndClient.QRCode
  ( qrGeneric,
    qrPixels,
    qrPngDataUrl,
    qrDefOpts,
    QROpts (..),
    QRPixels (..),
    QRPngDataUrl (..),
  )
where

import Codec.Picture (Image (..), Pixel8)
import Codec.QRCode as QR
  ( ErrorLevel (L),
    QRImage,
    TextEncoding (Iso8859_1OrUtf8WithoutECI),
    ToText,
    defaultQRCodeOptions,
    encodeAutomatic,
  )
import Codec.QRCode.JuicyPixels (toImage, toPngDataUrlT)
import LndClient.Import.External

newtype QRPixels = QRPixels {unQRPixels :: Image Pixel8}

newtype QRPngDataUrl = QRPngDataUrl {unQRPngDataUrl :: Text}
  deriving newtype (PersistField, PersistFieldSql, Show, Eq)

data QROpts = QROpts
  { qrBorder :: Int,
    qrScale :: Int
  }

qrDefOpts :: QROpts
qrDefOpts =
  QROpts
    { qrBorder = 4,
      qrScale = 5
    }

qrGeneric :: QR.ToText a => a -> Maybe QRImage
qrGeneric = encodeAutomatic (defaultQRCodeOptions L) Iso8859_1OrUtf8WithoutECI

qrPixels :: QR.ToText a => QROpts -> a -> Maybe QRPixels
qrPixels opts x = QRPixels . toImage (qrBorder opts) (qrScale opts) <$> qrGeneric x

qrPngDataUrl :: QR.ToText a => QROpts -> a -> Maybe QRPngDataUrl
qrPngDataUrl opts x =
  QRPngDataUrl . toStrict . toPngDataUrlT (qrBorder opts) (qrScale opts)
    <$> qrGeneric x
