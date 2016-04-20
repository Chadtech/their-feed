module Components where

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Signal           exposing (Address, message)
import Types            exposing (..)
import TweetComponents  exposing (..)


tf'header : Html
tf'header =
  p 
  [ class "point" 
  , style [ ("margin-top", "4px") ]
  ] 
  [ text "Their Feed" ]

handleField : String -> Address Action -> Html
handleField content address =
  input 
  [ class       "field"
  , placeholder "type their handle, then press enter" 
  , value       content
  , onKeyDown   address (\i -> HandleInput i)
  , on          "input" targetValue
    <|\str ->   message address 
    <|RefreshField str
  ] 
  []

point : String -> Html
point str =
  p
  [ class "point" ]
  [ text str ]

break : Html
break =
  br [] []

line : Html
line =
  hr 
  [ style [ ("border-color", "#54574d") ] ] 
  []

row : List Html -> Html
row columns =
  div [ class "row" ] columns

column : Html -> Html
column element =
  div [ class "column" ] [ element ]

tweetView : Address Action -> Tweet -> Html
tweetView address t =
  div 
  [ style 
    [ ("height", "2em")
    , ("margin-bottom", "1em")
    ]
  ]
  [ profilePicture address t
  , profileDetails address t
  , tweetContent   address t
  ] 


