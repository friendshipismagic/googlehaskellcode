import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Control.Monad

import Types

read_cache_servers_assoc :: Int -> IO[(Int,Int)]
read_cache_servers_assoc count = 
    sequence $ map (\y -> do
            cache_server_line <- getLine
            let [id_cache, latency_cache] = map read $ words cache_server_line :: [Int]
            return  (id_cache, latency_cache)
            ) [1..count]

read_cache_servers :: Int -> IO (Map Int Int)
read_cache_servers count = liftM Map.fromList $ (read_cache_servers_assoc count)


read_endpoints :: Int -> IO [EndPoint]
read_endpoints count = map (\x ->  do
        endpoint_line <- getLine
        -- EndPoint parameters
        let [latency, cache_count] = map read $ words endpoint_line :: [Int]
        
        cache_servers <- read_cache_servers cache_count 

        return EndPoint { 
        latency=latency,
        cache_latencies=cache_servers,
        requests=[]
        }) [1..count]

main = do
    config_line <- getLine
    video_size_line <- getLine
    -- First line is for describing global structure
    let [conf_V, conf_E, conf_R, conf_C, conf_X] = map read . words config_line

    let video_sizes = map read . words video_size_line

    -- Parse each endpoints 
    let endpoints   = read_endpoints conf_E 
    putStrLn "HelloHashCode"
