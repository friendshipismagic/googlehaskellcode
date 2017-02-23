import Data.Map
import Types

read_cache_servers count = Map.fromList (map (\y -> do
            cache_server_line <- getLine
            let [id_cache, latency_cache] = words cache_server_line in (id_cache, latency_cache)
            ) [1..count])

read_endpoints count = map (\x ->  do
        endpoint_line <- getLine
        -- EndPoint parameters
        let [latency, cache_count] = words endpoint_line in
        let cache_servers          = read_cache_servers cache_counts in

        EndPoint { 
        latency=latency,
        cache_counts=cache_counts,
        cache_servers=cache_servers
        }) [1..count]

main = do
    config_line <- getLine
    video_size_line <- getLine
    -- First line is for describing global structure
    let [conf_V, conf_E, conf_R, conf_C, conf_X] = map read . words config_line in

    let video_sizes = map read . words video_size_line in

    -- Parse each endpoints 
    let endpoints   = read_endpoints conf_E in
    putStrLn "HelloHashCode"
