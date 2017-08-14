module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Views.Headline exposing (headline)
import Views.Layout exposing (backgroundBlock)
import Views.Navbar exposing (navbar)
import Views.Tips exposing (tips)


view : Model -> Html Msg
view model =
    div [ class "tc blue mt3" ]
        [ navbar
        , backgroundBlock
            [ headline
            , tips model
            ]
        , navbar
        ]
