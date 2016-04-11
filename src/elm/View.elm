--import Effects exposing (Effects, Never)
module View where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (message)
import Types exposing (..)
import Json.Decode as Json


tf'header : Html
tf'header =
  p [ class "point" ] [ text "Their Feed"]


