module Model exposing (..)

import Dict exposing (Dict)
import Navigation
import RemoteData exposing (WebData)


type alias Model =
    { tips : RemoteTipsData
    , history : List Navigation.Location
    }


type alias Tip =
    { title : String
    , body : String
    , attribution : String
    , tags : List Tag
    }


type alias Tag =
    { title : String
    , link : String
    }


type alias AllTags =
    Dict String Tag


type alias RemoteTipsData =
    WebData (List Tip)


type Msg
    = TipsResponse RemoteTipsData
    | UrlChange Navigation.Location
