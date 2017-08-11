module Views.Layout exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


backgroundBlock : List (Html msg) -> Html msg
backgroundBlock content =
    div [ class "bg-dark-blue pv4-l pv2" ] content
