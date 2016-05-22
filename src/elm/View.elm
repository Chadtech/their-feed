module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Components exposing (..)
import TweetComponents  exposing (..)
import List exposing (map, append, intersperse)
import Json.Decode as Json


view : Model -> Html Msg
view m =
  container <| body m

(-) = (,)

header : Model -> Html Msg
header m = 
  map column 
  [ p 
    [ class "point" 
    , style [ "margin-top" - "4px" ]
    ] 
    [ text "Their Feed" ]
  , twitterHandleField m.twitterHandle
  ]
  |> row

tweets : Model -> List (Html Msg)
tweets m =
  intersperse line
  <|map tweetView m.tweets

body : Model -> List (Html Msg)
body m =
  tweets m 
  |>append [ header m, break ] 

container : List (Html Msg) -> Html Msg
container b =
  div
  [ class "container"
  , style 
    [ "margin" - "auto" 
    , "width"  - "82%"
    ] 
  ]
    b

twitterHandleField : String -> Html Msg
twitterHandleField content =
  input 
  [ class        "field"
  , placeholder  "type their handle, then press enter" 
  , value        content
  , on "keydown" (Json.map HandleInput keyCode)
  , onInput      RefreshField
  ] 
  []
