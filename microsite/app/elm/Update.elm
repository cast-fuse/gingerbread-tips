module Update exposing (..)

import Data.Tip exposing (handleTipsResponse)
import Model exposing (..)
import Navigation exposing (newUrl)
import RemoteData exposing (..)
import Request.Tip exposing (getTips)


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    initialState location ! [ getTips ]


initialState : Navigation.Location -> Model
initialState location =
    { tips = Loading
    , history = [ location ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TipsResponse tipsResponse ->
            (model |> handleTipsResponse tipsResponse) ! []

        UrlChange location ->
            { model | history = location :: model.history } ! []

        Home ->
            model ! [ newUrl "/" ]

        GoToTag tag ->
            model ! [ newUrl tag.urlSlug ]
