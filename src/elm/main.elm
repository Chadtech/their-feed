import Effects          exposing (Effects, Never)
import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Http
import Json.Decode as Json
import Task
import Debug
import Window
import Regex             exposing (regex, escape, HowMany(..))
import Signal            exposing (message, mailbox, Mailbox)
import Types             exposing (..)
import StartApp
import Json.Encode as JE exposing (string, encode)
import Components        exposing (tf'header, handleField, row, column, tweetView, break, line)
import List              exposing (..)
import Init              exposing (initialTweets)

init : (Model, Effects Action)
init = 
  ( Model "" initialTweets, Effects.none )

-- UPDATE

search : Model -> Effects Action
search m = 
  Effects.none 


update : Action -> Model -> (Model, Effects Action)
update action m =
  case action of 

    Search ->
      (m, Effects.none)

    HandleInput key ->
      if key == 13 then
        (Model "please wait.." [], search m)
      else
        (m, Effects.none)

    RefreshField field ->
      (Model field m.tweets, Effects.none)

-- VIEW

view : Signal.Address Action -> Model -> Html
view address m =
  let
    header =
      row
      [ column tf'header
      , column 
        <|handleField m.handle address
      ]

    tweets = 
      intersperse line
      <|map tweetView m.tweets

    body =
      intersperse break
      <|append [ header ] tweets
  in
    div
    [ style 
      [ ("margin", "auto") 
      , ("width", "80%")
      ]
    ]
    [ div 
      [ class "container"
      , style [("width", "1200px")] 
      ]
      body
    ]


-- APP

app =
  StartApp.start
    { init   = init
    , update = update
    , view   = view
    , inputs = []
    }

main =
  app.html

-- PORTS

port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks



