{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module LndClient.Utils
  ( doExpBackOff,
    coerceLndResult,
    stdToJSON,
    stdParseJSON,
  )
where

import Chronos (stopwatch)
import Control.Exception (Handler (..), catches, throwIO)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Control.Retry (exponentialBackoff, limitRetries, retrying)
import Data.Aeson
  ( GFromJSON,
    GToJSON,
    Value,
    Zero,
    genericParseJSON,
    genericToJSON,
    omitNothingFields,
  )
import Data.Aeson.Casing (aesonDrop, snakeCase)
import Data.Aeson.Types (Parser)
import GHC.Generics (Generic, Rep (..))
import LndClient.Data.Types
import Network.HTTP.Client (HttpException (..), queryString, requestHeaders)
import UnliftIO (MonadUnliftIO, toIO)

stdToJSON :: (Generic a, GToJSON Zero (Rep a)) => a -> Value
stdToJSON =
  genericToJSON $ (aesonDrop 0 snakeCase) {omitNothingFields = True}

stdParseJSON :: (Generic a, GFromJSON Zero (Rep a)) => Value -> Parser a
stdParseJSON = genericParseJSON $ aesonDrop 0 snakeCase

coerceLndResult :: (Show a, MonadIO m) => LndResult a -> m a
coerceLndResult (LndSuccess _ x) = return x
coerceLndResult (LndFail _ x) = fail $ "got LndFail " <> show x
coerceLndResult (LndHttpException _ e) = liftIO $ throwIO e

doExpBackOff ::
  (MonadUnliftIO m) => Int -> (a -> Bool) -> m a -> m (LndResult a)
doExpBackOff lim cond expr =
  retrying policy when exprSafe
  where
    policy = exponentialBackoff 1000000 <> limitRetries lim
    --
    -- TODO: improvement
    --
    -- very boolean blind and not obvious implementation in Control.Retry
    -- library works, but it's good to make PR with better sum type
    -- something like "data WhatToDo = Retry | Halt"
    when _ x = return $ case x of
      LndSuccess _ _ -> False
      _ -> True
    exprSafe _ = do
      exprIO <- toIO expr
      liftIO $ resolve <$> stopwatch (catches (Right <$> exprIO) exHandlers)
    resolve (elapsedTime, res) =
      case res of
        Left e -> LndHttpException elapsedTime e
        Right x -> (if cond x then LndSuccess else LndFail) elapsedTime x
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
