module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)


view : Model -> Html Msg
view model =
    div [ class "tc blue mt5" ]
        [ h2 [ class "tracked-mega fw5 f2 ttu" ] [ text "Gingerbread Tips" ]
        , div [ class "center mw8 ph3" ] <| List.map renderTip sampleTips
        ]


renderTip : String -> Html Msg
renderTip tip =
    div [ class "bg-light-blue mv4 pa4 tl br2" ] [ text tip ]


sampleTips : List String
sampleTips =
    [ "Tip 1"
    , "Tip 2"
    , "Tip 3"
    ]
