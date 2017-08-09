module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import RemoteData exposing (..)


view : Model -> Html Msg
view model =
    div [ class "tc blue mt5" ]
        [ h2 [ class "tracked-mega fw5 f2 ttu" ] [ text "Gingerbread Tips" ]
        , renderTips model.tips
        ]


renderTips : RemoteTipsData -> Html Msg
renderTips remoteTipsData =
    case remoteTipsData of
        NotAsked ->
            span [] []

        Loading ->
            p [] [ text "loading Tips" ]

        Failure _ ->
            p [] [ text "Sorry there was a problem loading the data" ]

        Success tips ->
            div [ class "center mw8 ph3" ] <| List.map renderTip tips


renderTip : Tip -> Html Msg
renderTip tip =
    div [ class "bg-light-blue mv4 pa4 tl br2" ]
        [ h2 [] [ text tip.title ]
        , p [] [ text tip.body ]
        ]
