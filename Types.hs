module Types ( Solution(..), Request(..), EndPoint(..),CacheCapacities(..) ) where

    import qualified Data.Map.Strict as Map

    data Solution = Solution {
        s :: Map.Map Int Int -- Vidéo x id cache
    }


    -- Request <id vidéo> <nombre de requêts>
    data Request = Request Int Int

    data CacheCapacities = CacheCapacities (Map.Map Int Int) 
    data EndPoint = EndPoint 
        { latency :: Int
        , cache_latencies :: Map.Map Int Int -- Numéro cache x latence
        , requests :: [Request]
        }

