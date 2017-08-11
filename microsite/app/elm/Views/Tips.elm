module Views.Tips exposing (..)

import Data.Tip exposing (visibleTips)
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import RemoteData exposing (..)


tips : Model -> Html Msg
tips model =
    case model.tips of
        NotAsked ->
            span [] []

        Loading ->
            p [] [ text "loading Tips" ]

        Failure _ ->
            p [] [ text "Sorry there was a problem loading the data" ]

        Success tips ->
            div [ class "center mw8 ph3" ]
                [ div [] <| List.map renderTip <| visibleTips model.history tips
                ]


renderTip : Tip -> Html Msg
renderTip tip =
    div [ class "bg-white dark-gray mv4 pa4 tl br2" ]
        [ h2 [ class "f2 handwriting" ] [ text tip.title ]
        , p [ class "f5" ] [ text tip.body ]
        ]
