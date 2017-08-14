module Helpers.List exposing (chunkEvery)


chunkEvery : Int -> List a -> List (List a)
chunkEvery groupSize list =
    case list of
        [] ->
            []

        list ->
            List.take groupSize list :: (chunkEvery groupSize <| List.drop groupSize list)
