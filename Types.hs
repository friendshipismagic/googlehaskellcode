import Data.Map

module Types (
        CacheSolution,
        Solution,
        RequestMap,
        EndPoint)
    where

data CacheSolution = CacheSolution {
    cacheId :: Int,
    videos :: [Int]
}

data Solution = Solution {
    s::[CacheSolution]
}

newtype RequestMap = RequestMap Map Int Int

-- Request <id vidéo> <nombre de requêts>
data Request = Request Int Int

data EndPoint = EndPoint {
    latency :: Int,
    cache_count :: Int,
    cache_servers :: RequestMap,
    requests :: [Request]
}
