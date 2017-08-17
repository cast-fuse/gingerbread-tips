module Views.Headline exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


headline : Html msg
headline =
    div [ class "white mw7-ns mw8 center" ]
        [ h2 [ class "f2 f1-ns handwriting mv2" ] [ text "''How did you...?''" ]
        , p [ class "f5 f4-ns mt1 mb2-ns tl mh4" ] [ text "Trusted tips and tricks from single parents around the UK. Brought to you by Gingerbread." ]
        ]
