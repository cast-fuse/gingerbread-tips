module View exposing (..)

import Model exposing (..)
import Html exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ p [] [ text "Get building!" ] ]
