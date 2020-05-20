{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module LndClient.Util
  ( doExpBackOff,
    stdToJSON,
    stdParseJSON,
    safeFromIntegral,
  )
where

import Chronos (stopwatch)
import Control.Exception (Handler (..), catches)
import Control.Retry (exponentialBackoff, limitRetries, retrying)
import LndClient.Data.Type
import LndClient.Import.External

stdToJSON :: (Generic a, GToJSON Zero (Rep a)) => a -> Value
stdToJSON =
  genericToJSON $ (aesonDrop 0 snakeCase) {omitNothingFields = True}

stdParseJSON :: (Generic a, GFromJSON Zero (Rep a)) => Value -> Parser a
stdParseJSON = genericParseJSON $ aesonDrop 0 snakeCase

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

doExpBackOff ::
  (MonadUnliftIO m, Show a) => Int -> (a -> Bool) -> m a -> m (Either LndError a)
doExpBackOff lim cond expr =
  retrying policy whenX exprSafe
  where
    policy = exponentialBackoff 1000000 <> limitRetries lim
    --
    -- TODO: improvement
    --
    -- very boolean blind and not obvious implementation in Control.Retry
    -- library works, but it's good to make PR with better sum type
    -- something like "data WhatToDo = Retry | Halt"
    whenX _ x = return $ case x of
      Right _ -> False
      Left _ -> True
    exprSafe _ = do
      exprIO <- toIO expr
      liftIO $ resolve <$> stopwatch (catches (Right <$> exprIO) exHandlers)
    resolve (elapsedTime, res) =
      case res of
        Left e -> Left $ LndHttpException elapsedTime e
        Right x ->
          if cond x
            then Right x
            else Left $ LndFail elapsedTime (show x)
    exHandlers =
      [ Handler
          ( \(e :: HttpException) -> return $ Left $ case e of
              (InvalidUrlException _ _) -> e
              (HttpExceptionRequest re ex) ->
                HttpExceptionRequest
                  re
                    { requestHeaders =
                        (\(x, _) -> (x, "SECRET"))
                          <$> requestHeaders re,
                      queryString = "SECRET"
                    }
                  ex
          )
      ]
