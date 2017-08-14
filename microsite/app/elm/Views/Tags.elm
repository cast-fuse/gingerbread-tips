module Views.Tags exposing (..)

import Data.Tip exposing (allTags)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Model exposing (..)


renderTags : List Tip -> Html Msg
renderTags tips =
    div [ class "bg-gold ph3" ]
        [ div [ class "mw8 center ph3" ]
            [ p [ class "dark-blue tl pv4" ] [ text "Filter these tips by..." ]
            , div [ class "pb4 flex justify-between" ] (List.map renderTag <| allTags tips)
            ]
        ]


renderTag : Tag -> Html Msg
renderTag tag =
    div [ class "dib pv2 ph3 br5 pointer orange bg-white f2", onClick <| GoToTag tag ]
        [ p [ class "ma0" ] [ text tag.title ] ]