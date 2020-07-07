{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

module LndClient.Util
  ( safeFromIntegral,
    showB64BS,
    logAs,
  )
where

import qualified Data.ByteString.Base64 as B64 (encode)
import qualified Data.Text as TS
import Katip.Core
import LndClient.Data.Type
import LndClient.Import.External

safeFromIntegral ::
  forall a b. (Integral a, Integral b, Bounded b) => a -> Maybe b
safeFromIntegral x =
  if (intX >= intMin) && (intX <= intMax)
    then Just $ fromIntegral x
    else Nothing
  where
    intX = fromIntegral x :: Integer
    intMin = fromIntegral (minBound :: b) :: Integer
    intMax = fromIntegral (maxBound :: b) :: Integer

showB64BS :: ByteString -> String
showB64BS x =
  case decodeUtf8' $ "B64 " <> B64.encode x of
    Left _ -> "RAW " <> show x
    Right s -> TS.unpack s

logAs :: (MonadIO m, KatipContext m) => Severity -> LoggingStrategy -> LogStr -> m ()
logAs initialSeverity (LoggingStrategy func) = $(logTM) (func initialSeverity)
