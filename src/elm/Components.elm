module Components exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)
import Json.Decode as Json

(-) = (,)

point : String -> Html Msg
point str =
  p
  [ class "point" ]
  [ text str ]

break : Html Msg
break =
  br [] []

line : Html Msg
line =
  hr 
  [ style [ "border-color" - "#54574d" ] ] 
  []

row : List (Html Msg) -> Html Msg
row columns =
  div [ class "row" ] columns

column : Html Msg -> Html Msg
column element =
  div [ class "column" ] [ element ]

ignorable : String -> Html Msg
ignorable str =
  p
  [ class "point ignorable"
  , style [ "display" - "inline" ] ]
  [ text str ]

veryIgnorable : String -> Html Msg
veryIgnorable str =
  p
  [ class "point veryIgnorable"
  , style [ "display" - "inline" ] ]
  [ text str ]



