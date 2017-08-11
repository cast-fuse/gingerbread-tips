module Views.Headline exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


headline : Html msg
headline =
    div [ class "white" ]
        [ h2 [ class "f-headline handwriting mv2" ] [ text "''How did you...?''" ]
        , p [ class "f5 mt1 mb5 tl mh4" ] [ text "Our site is full of tips, tricks and life hacks from single parents just like you." ]
        ]
