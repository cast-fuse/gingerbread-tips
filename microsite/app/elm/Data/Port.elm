port module Data.Port exposing (..)


scrollTop : Cmd msg
scrollTop =
    scrollTop_ ()


port scrollTop_ : () -> Cmd msg
