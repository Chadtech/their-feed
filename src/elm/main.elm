import Html             exposing (p, text)
import Html.Attributes  exposing (class)
import Html.App         as App
import Types            exposing (..)
import Init             exposing (init)
import View             exposing (view)
import Debug
import Ports            exposing (..)

main =
  App.program
  { init          = (init, Cmd.none) 
  , view          = view
  , update        = update
  , subscriptions = subscriptions
  }

subscriptions : Model -> Sub Msg
subscriptions model =
  handOverTweets GetTweets

update : Msg -> Model -> (Model, Cmd Msg)
update message m =
  case message of 

    HandleInput key ->
      if key == 13 then
        (Model "please wait.." [], search m.twitterHandle)
      else
        (m, Cmd.none)

    RefreshField field ->
      (Model field m.tweets, Cmd.none)

    GoToUser tweet ->
      (m, Cmd.none)

    GoToTweet tweet ->
      (m, Cmd.none)

    GetTweets tweets ->
      ({m | tweets = tweets}, Cmd.none)