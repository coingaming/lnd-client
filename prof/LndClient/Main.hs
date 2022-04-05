module LndClient.Main
  ( main,
  )
where

import qualified Control.Concurrent.Async as Async
import LndClient.Import
import LndClient.LndTest
import LndClient.RPC.Silent
import LndClient.TestApp

main :: IO ()
main =
  void $
    Async.race delay poll
  where
    delay :: IO ()
    delay =
      sleep
        . MicroSecondsDelay
        --- $ 3 * 60 * 60 * 1000000
        $ 5 * 60 * 1000000
    poll :: IO ()
    poll =
      withEnv
        . forever
        . void
        $ getInfo =<< getLndEnv Bob
