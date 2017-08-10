module Model exposing (..)

import RemoteData exposing (WebData)
import Dict exposing (Dict)


type alias Model =
    { tips : RemoteTipsData
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
