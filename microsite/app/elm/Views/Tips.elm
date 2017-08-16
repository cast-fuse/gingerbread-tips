module Views.Tips exposing (..)

import Data.Tip exposing (visibleTips)
import Helpers.List exposing (chunkEvery)
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import RemoteData exposing (..)
import Views.Tags exposing (renderTag, tagCloud)


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
                    tagCloud tips

                tipsAndTags =
                    intersperseTags tags <| List.indexedMap renderTip <| visibleTips model.history tips
            in
                div []
                    [ div [] tipsAndTags
                    , tags
                    ]


renderTip : Int -> Tip -> Html Msg
renderTip index tip =
    div [ class "center mw7-ns mw8 ph3 pv3 pv1-ns" ]
        [ quoteBubble tip.title tip.body
        , div [ class "tl mt4 mt2-ns" ]
            [ p [ class "white f6 mv0 mh3" ] [ text tip.attribution ]
            , div [ class "ma3" ] <| List.map renderTag tip.tags
            ]
        ]


intersperseTags : Html Msg -> List (Html Msg) -> List (Html Msg)
intersperseTags tags tips =
    tips
        |> chunkEvery 2
        |> List.intersperse [ tags ]
        |> List.concat


quoteBubble : String -> String -> Html msg
quoteBubble title body =
    div [ class "relative pt2 pb4 ph2 mt3 mb2 tl" ]
        [ div [ class "relative z-3 black pv3 ph4" ]
            [ h2 [ class "f5 handwriting mt0 mb1-ns" ] [ text title ]
            , p [ class "f6" ] [ text <| addQuotationMarks <| String.trim body ]
            ]
        , img [ class "absolute top-0 left-0 z-1 h-100 w-100", src "/gingerbread-tips/img/quote-box.png" ] []
        ]


addQuotationMarks : String -> String
addQuotationMarks quote =
    "“" ++ quote ++ "”"
