module TweetComponentStyles exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Types            exposing (..)

(-) = (,)

tweetViewStyle : Attribute Msg
tweetViewStyle = 
  style 
    [ "height"        - "2em"
    , "margin-bottom" - "1em"
    ]

profilePictureStyle : Attribute Msg
profilePictureStyle =
  style 
  [ "width"        - "38px"     
  , "height"       - "auto"     
  , "float"        - "left"     
  , "margin-right" - "1em"      
  , "border"       - "1px solid"
  , "border-color" - "#b0a69a"  
  , "cursor"       - "pointer"  
  ]

profileDetailsStyle : Attribute Msg
profileDetailsStyle = 
  style 
  [ "float"        - "left" 
  , "margin-right" - "1em" 
  , "width"        - "20em"
  ]

nameStyle : Attribute Msg
nameStyle = 
  style [ "cursor" - "pointer" ]

handleAndDateStyle : Attribute Msg
handleAndDateStyle =
  style
  [ "cursor"  - "pointer" 
  , "display" - "inline" 
  ]

tweetContentStyle : Attribute Msg
tweetContentStyle = 
  style [ "cursor" - "pointer" ]
