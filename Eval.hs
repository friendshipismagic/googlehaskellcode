module Eval (evalSolution) where

import Types
import qualified Data.Map.Strict as M
import Data.Function

foo :: Int -> Int -> Float
foo = (/) `on` fromIntegral

evalSolution :: [EndPoint] -> Solution -> Int
evalSolution endpoints sol = (1000*(sum gains)) `foo` n
    where
        gains = concat $ map (\x -> requestGains x sol) endpoints
        n = sum $ map numberOfRequests endpoints

numberOfRequests :: EndPoint -> Int
numberOfRequests e = foldr (\(Request _ n) m -> m+n) 0 $ requests e

requestGains :: EndPoint -> Solution -> [Int]
requestGains e sol =
    map (\r -> (requestCostNoCache e r) - (requestCost e r sol)) $ requests e

requestCostNoCache :: EndPoint -> Request -> Int
requestCostNoCache  e (Request _ n) = (latency e) * n

requestCost :: EndPoint -> Request -> Solution -> Int
requestCost e (Request v n) sol =
    n * ((cache_latencies e) M.! ((s sol) M.! v))
