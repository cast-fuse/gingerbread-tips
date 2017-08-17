module Data.Tip exposing (..)

import Data.Navigation exposing (getCurrentTagName)
import Dict exposing (Dict)
import Helpers.List exposing (anyTrue)
import Model exposing (..)
import Navigation


handleTipsResponse : RemoteTipsData -> Model -> Model
handleTipsResponse tipsData model =
    { model | tips = tipsData }


visibleTips : List Navigation.Location -> List Tip -> List Tip
visibleTips history allTips =
    let
        currentTagName =
            getCurrentTagName history
    in
        allTips |> filterTipsByTagTitle currentTagName


filterTipsByTagTitle : String -> List Tip -> List Tip
filterTipsByTagTitle tagUrl tips =
    if isValidTag tagUrl tips then
        List.filter (containsTag tagUrl) tips
    else
        tips


isValidTag : String -> List Tip -> Bool
isValidTag tagTitle tips =
    tips
        |> List.map (containsTag tagTitle)
        |> anyTrue


containsTag : String -> Tip -> Bool
containsTag tagUrl tip =
    tip.tags
        |> List.map .urlSlug
        |> List.map (\url -> String.contains tagUrl url)
        |> anyTrue


allTags : List Tip -> List Tag
allTags tips =
    tips
        |> allTagsDictionary
        |> Dict.toList
        |> List.map Tuple.second


allTagsDictionary : List Tip -> AllTags
allTagsDictionary tips =
    tips |> List.foldl (\tip dict -> Dict.union (makeTagDict tip.tags) dict) Dict.empty


makeTagDict : List Tag -> Dict String Tag
makeTagDict tags =
    tags |> List.foldl (\tag dict -> Dict.insert tag.urlSlug tag dict) Dict.empty
