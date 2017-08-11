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


anyTrue : List Bool -> Bool
anyTrue =
    List.foldl (||) False


containsTag : String -> Tip -> Bool
containsTag tagUrl tip =
    tip.tags
        |> List.map .urlSlug
        |> List.member tagUrl


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


getCurrentTagName : List Navigation.Location -> String
getCurrentTagName history =
    history
        |> List.head
        |> Maybe.andThen getTagFromUrlBar
        |> Maybe.withDefault ""


getTagFromUrlBar : Navigation.Location -> Maybe String
getTagFromUrlBar =
    parsePath string
