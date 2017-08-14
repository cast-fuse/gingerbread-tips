module Helpers.List exposing (groupListElements)


groupListElements : Int -> List a -> List (List a)
groupListElements groupSize list =
    case list of
        [] ->
            []

        list ->
            List.take groupSize list :: (groupListElements groupSize <| List.drop groupSize list)
