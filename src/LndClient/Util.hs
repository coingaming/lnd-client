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
    logAs,
  )
where

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

logAs :: (MonadIO m, KatipContext m) => Severity -> LoggingStrategy -> LogStr -> m ()
logAs initialSeverity strategy msg =
  case initialSeverity of
    ErrorS -> case strategy of
      LogOverlay LogOverlayValues {logErrorAs = severity} -> $(logTM) severity msg
      LogDefault -> $(logTM) ErrorS msg
    InfoS -> case strategy of
      LogOverlay LogOverlayValues {logErrorAs = severity} -> $(logTM) severity msg
      LogDefault -> $(logTM) InfoS msg
    _ -> $(logTM) initialSeverity msg
