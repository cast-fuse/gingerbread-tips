module Request.Tip exposing (..)

import HtmlParser
import HtmlParser.Util
import Http
import Json.Decode as Json exposing (..)
import Json.Decode.Pipeline exposing (..)
import Model exposing (..)
import RemoteData exposing (RemoteData)


getTips : Cmd Msg
getTips =
    Http.get "http://localhost:8888/wp-json/wp/v2/tips" tipsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map TipsResponse


tipsDecoder : Decoder (List Tip)
tipsDecoder =
    list tipDecoder


tipDecoder : Decoder Tip
tipDecoder =
    decode Tip
        |> requiredAt [ "title", "rendered" ] nonHtmlString
        |> requiredAt [ "content", "rendered" ] nonHtmlString
        |> hardcoded "mum"
        |> hardcoded []


nonHtmlString : Decoder String
nonHtmlString =
    string |> Json.map (HtmlParser.parse >> HtmlParser.Util.textContent)
