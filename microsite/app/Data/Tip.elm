module Data.Tip exposing (..)

import Dict exposing (Dict)
import Model exposing (..)
import Navigation
import UrlParser exposing (..)


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
filterTipsByTagTitle tagTitle tips =
    if isValidTagTitle tagTitle tips then
        List.filter (containsTagTitle tagTitle) tips
    else
        tips


isValidTagTitle : String -> List Tip -> Bool
isValidTagTitle tagTitle tips =
    tips
        |> List.map (containsTagTitle tagTitle)
        |> List.foldl (||) False


containsTagTitle : String -> Tip -> Bool
containsTagTitle tagTitle tip =
    tip.tags
        |> List.map .title
        |> List.member tagTitle


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
    tags |> List.foldl (\tag dict -> Dict.insert tag.title tag dict) Dict.empty


getCurrentTagName : List Navigation.Location -> String
getCurrentTagName history =
    history
        |> List.head
        |> Maybe.andThen getTagFromLocation
        |> Maybe.withDefault ""


getTagFromLocation : Navigation.Location -> Maybe String
getTagFromLocation =
    parsePath string
