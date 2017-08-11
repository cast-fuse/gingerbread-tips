module Views.Headline exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


headline : Html msg
headline =
    div [ class "white" ]
        [ h2 [ class "f1 handwriting" ] [ text "'How did you...?''" ]
        , p [ class "f3" ] [ text "Our site is full of tips, tricks and life hacks from single parents just like you." ]
        ]
