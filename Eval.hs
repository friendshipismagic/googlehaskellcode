import Types

evalSolution :: Solution -> Int
evalSolution s =
    foldr (+) 0 $ map requestGain endpoints
    where
        endpoints =


requestCostNoCache :: EndPoint -> Request -> Int
requestCostNoCache  e (Request _ n) = (latency e) * n

requestCost :: EndPoint -> Request -> Solution -> Int
requestCost e (Request v n) s =
    cacheLatency * n
    where
        cacheLatency = -- Latence du cache correspondant à la vidéo 
