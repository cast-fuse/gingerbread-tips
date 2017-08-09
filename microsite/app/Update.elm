module Update exposing (..)

import Data.Tip exposing (handleTipsResponse)
import Model exposing (..)
import RemoteData exposing (..)
import Request.Tip exposing (getTips)


init : ( Model, Cmd Msg )
init =
    initialState ! [ getTips ]


initialState : Model
initialState =
    { tips = Loading }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TipsResponse tipsResponse ->
            (model |> handleTipsResponse tipsResponse) ! []
