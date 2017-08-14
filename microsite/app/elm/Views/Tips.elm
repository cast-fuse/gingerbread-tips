module Views.Tips exposing (..)

import Data.Tip exposing (visibleTips)
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import RemoteData exposing (..)
import Views.Tags exposing (renderTags)
import Helpers.List exposing (groupListElements)


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
            let
                tags =
                    renderTags tips

                tipsAndTags =
                    intersperseTags tags <| List.indexedMap renderTip <| visibleTips model.history tips
            in
                div []
                    [ div [] tipsAndTags
                    , tags
                    ]


renderTip : Int -> Tip -> Html Msg
renderTip index tip =
    div [ class "center mw8 ph3 pv3" ]
        [ quoteBubble tip.title tip.body
        , div [ class "flex justify-between mt4" ]
            [ p [ class "white f2 mv0 mh3" ] [ text tip.attribution ]
            , p [ class "f2 mv0 mh3 bg-white orange pv2 ph3 br5" ] [ text "Separation" ]
            ]
        ]


intersperseTags : Html Msg -> List (Html Msg) -> List (Html Msg)
intersperseTags tags tips =
    tips
        |> groupListElements 2
        |> List.intersperse (List.singleton tags)
        |> List.concat


quoteBubble : String -> String -> Html msg
quoteBubble title body =
    div [ class "relative pt2 pb4 ph2 mt3 mb2 tl" ]
        [ div [ class "relative z-3 black pv3 ph4" ]
            [ h2 [ class "f1 handwriting mt0" ] [ text title ]
            , p [ class "f6" ] [ text <| addQuotationMarks body ]
            ]
        , img [ class "absolute top-0 left-0 z-1 h-100 w-100", src "img/quote-box.png" ] []
        ]


addQuotationMarks : String -> String
addQuotationMarks quote =
    "“" ++ quote ++ "”"
