module Data.Tip exposing (..)

import Model exposing (..)
import Dict exposing (Dict)


handleTipsResponse : RemoteTipsData -> Model -> Model
handleTipsResponse tipsData model =
    { model | tips = tipsData }


allTags : List Tip -> Dict String Tag
allTags tips =
    tips |> List.foldl (\tip dict -> Dict.union (makeTagDict tip.tags) dict) Dict.empty


makeTagDict : List Tag -> Dict String Tag
makeTagDict tags =
    tags |> List.foldl (\tag dict -> Dict.insert (String.toLower tag.title) tag dict) Dict.empty
