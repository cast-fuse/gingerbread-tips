module Views.Tags exposing (..)

import Data.Tip exposing (allTags)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Model exposing (..)


tagCloud : List Tip -> Html Msg
tagCloud tips =
    div [ class "bg-gold ph3" ]
        [ div [ class "mw7-ns mw8 center ph3" ]
            [ p [ class "dark-blue tl pt3 pb0" ] [ text "Filter these tips by..." ]
            , div [ class "pb4 tl" ] (List.map renderTag <| allTags tips)
            ]
        ]


renderTag : Tag -> Html Msg
renderTag tag =
    div [ class "dib pv2 ph3 br5 pointer orange bg-white f5 mb2 mr2", onClick <| GoToTag tag ]
        [ p [ class "ma0" ] [ text tag.title ] ]
