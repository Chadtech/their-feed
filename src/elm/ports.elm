port module Ports exposing (..)

import Types exposing (..)

port search : String -> Cmd msg

port handOverTweets : (List Tweet -> msg) -> Sub msg