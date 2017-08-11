module Views.Navbar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Model exposing (..)


navbar : Html Msg
navbar =
    div [ class "flex justify-between items-center mw8 center pa3" ]
        [ div [ class "w-100 mw6 pointer ma3", onClick Home ] [ img [ src "/img/gingerbread-logo.png", class "w-100" ] [] ]
        , div [ class "bg-orange br4 pv2 ph4 white f6 tracked fw1 br5" ] [ h3 [ class "f2 ma0" ] [ text "Main site" ] ]
        ]
