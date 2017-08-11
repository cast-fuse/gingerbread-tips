module Views.Tags exposing (..)

import Data.Tip exposing (allTags)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Model exposing (..)


renderTags : List Tip -> List (Html Msg)
renderTags tips =
    tips
        |> allTags
        |> List.map renderTag


renderTag : Tag -> Html Msg
renderTag tag =
    div [ class "dib ph3 pointer", onClick <| GoToTag tag ] [ p [] [ text tag.title ] ]
