--import Effects exposing (Effects, Never)
module Components where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (message)
import Types exposing (..)
import Json.Decode as Json
import Debug


tf'header : Html
tf'header =
  p 
  [ class "point" 
  , style
    [ ("margin-top", "4px") ]
  ] 
  [ text "Their Feed" ]

handleField : String -> Signal.Address Action -> Html
handleField content address =
  input 
  [ class       "field"
  , placeholder "type their handle, then press enter" 
  , value       content
  , onKeyDown   address (\i -> HandleInput i)
  , on          "input" targetValue
    <|\str -> message address 
    <|RefreshField str
  ] 
  []

point : String -> Html
point str =
  p
  [ class "point" ]
  [ text str ]

ignorable : String -> Html
ignorable str =
  p
  [ class "point ignorable"
  , style [ ("display", "inline") ] ]
  [ text str ]

veryIgnorable : String -> Html
veryIgnorable str =
  p
  [ class "point veryIgnorable"
  , style [ ("display", "inline") ] ]
  [ text str ]

break : Html
break =
  br [] []

line : Html
line =
  hr 
  [ style
    [ ("border-color", "#54574d") ]
  ] []

row : List Html -> Html
row columns =
  div [ class "row" ] columns

column : Html -> Html
column element =
  div [ class "column" ] [ element ]

tweetView : Tweet ->  Html
tweetView t =
  div []
  [ img 
    [ src t.image 
    , style 
      [ ("width",        "38px")
      , ("height",       "auto")
      , ("float",        "left")
      , ("margin-right", "1em")
      , ("border",       "1px solid")
      , ("border-color", "#b0a69a")
      ]
    ] []

  , div 
    [ style 
      [ ("float",        "left") 
      , ("margin-right", "1em" )
      , ("width",        "20em")
      ] 
    ]
    [ div []
      [ ignorable     t.name ] 
    , div []
      [ veryIgnorable t.date
      , ignorable     " "
      , veryIgnorable t.handle
      ] 
    ]

  , p
    [ class "point" ]
    [ text t.content ]
  ] 


