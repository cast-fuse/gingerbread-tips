module Views.Navbar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Model exposing (..)


navbar : Html Msg
navbar =
    div [ class "flex justify-between items-center mw7-ns mw8 center pa3" ]
        [ div [ class "w-100 mw6 pointer ma3 tl", onClick Home ] [ img [ src "/gingerbread-tips/img/gingerbread-logo.png", class "w-100 w-70-ns" ] [] ]
        , div [ class "bg-orange pv2 ph4 white tracked fw1 br5" ] [ h3 [ class "ma0 f6" ] [ text "Main site" ] ]
        ]
