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
    div []
        [ div [ class "bg-white dark-gray mv4 pa4 tl br2" ]
            [ h2 [ class "f2 handwriting mt0" ] [ text tip.title ]
            , p [ class "f5" ] [ text tip.body ]
            ]
        , div [ class "flex justify-between" ]
            [ p [ class "white f2 mv0 mh3" ] [ text tip.attribution ]
            , p [ class "f2 mv0 mh3 bg-white orange pv2 ph3 br5" ] [ text "separation" ]
            ]
        ]
