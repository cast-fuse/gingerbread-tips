module Data.Tip exposing (..)

import Model exposing (..)


handleTipsResponse : RemoteTipsData -> Model -> Model
handleTipsResponse tipsData model =
    { model | tips = tipsData }
