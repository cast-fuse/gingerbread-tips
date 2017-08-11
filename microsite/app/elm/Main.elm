module Main exposing (..)

import Model exposing (..)
import Navigation
import Update exposing (..)
import View exposing (..)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { update = update
        , subscriptions = always Sub.none
        , view = view
        , init = init
        }
