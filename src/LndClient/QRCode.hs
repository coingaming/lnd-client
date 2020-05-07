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
import Codec.QRCode
  ( ErrorLevel (L),
    QRImage,
    TextEncoding (Iso8859_1OrUtf8WithoutECI),
    ToText,
    defaultQRCodeOptions,
    encodeAutomatic,
  )
import Codec.QRCode.JuicyPixels (toImage, toPngDataUrlT)
import Data.Aeson (FromJSON, ToJSON)
import Data.Text
import Data.Text.Lazy (toStrict)
import Database.Persist.Class (PersistField)
import Database.Persist.Sql (PersistFieldSql)

newtype QRPixels = QRPixels (Image Pixel8)

newtype QRPngDataUrl = QRPngDataUrl Text
  deriving (FromJSON, ToJSON, PersistField, PersistFieldSql, Show, Eq)

data QROpts
  = QROpts
      { qrBorder :: Int,
        qrScale :: Int
      }

qrDefOpts :: QROpts
qrDefOpts =
  QROpts
    { qrBorder = 4,
      qrScale = 5
    }

qrGeneric :: ToText a => a -> Maybe QRImage
qrGeneric = encodeAutomatic (defaultQRCodeOptions L) Iso8859_1OrUtf8WithoutECI

qrPixels :: ToText a => QROpts -> a -> Maybe QRPixels
qrPixels opts x = QRPixels . toImage (qrBorder opts) (qrScale opts) <$> qrGeneric x

qrPngDataUrl :: ToText a => QROpts -> a -> Maybe QRPngDataUrl
qrPngDataUrl opts x =
  QRPngDataUrl . toStrict . toPngDataUrlT (qrBorder opts) (qrScale opts)
    <$> qrGeneric x