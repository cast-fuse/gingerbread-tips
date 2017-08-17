module Data.Navigation exposing (..)

import Navigation
import UrlParser exposing (parsePath, string, s, (</>))


getCurrentTagName : List Navigation.Location -> String
getCurrentTagName history =
    history
        |> List.head
        |> Maybe.andThen getTagFromUrlBar
        |> Maybe.withDefault ""


getOrigin : List Navigation.Location -> String
getOrigin history =
    history
        |> List.head
        |> Maybe.map .origin
        |> Maybe.withDefault ""


getTagFromUrlBar : Navigation.Location -> Maybe String
getTagFromUrlBar =
    parsePath (s "gingerbread-tips" </> string)
