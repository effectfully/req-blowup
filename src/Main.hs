{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Data.Foldable
import qualified Data.ByteString.Char8 as BS8
import           Data.Default
import           Network.HTTP.Req

sample_url = "https://www.avito.ru/ekaterinburg/avtomobili/chevrolet_cruze_2012_1030458230"

main :: IO ()
main = for_ (parseUrlHttps sample_url) $ \(url, scheme) -> do
  body <- runReq def $ responseBody <$> req GET url NoReqBody bsResponse scheme
  BS8.putStrLn body
