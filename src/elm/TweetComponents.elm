module TweetComponents where

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Signal           exposing (Address, message)
import Types            exposing (..)

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

profilePicture : Address Action -> Tweet -> Html
profilePicture address t =
  img 
  [ src t.image 
  , style 
    [ ("width",        "38px"     )
    , ("height",       "auto"     )
    , ("float",        "left"     )
    , ("margin-right", "1em"      )
    , ("border",       "1px solid")
    , ("border-color", "#b0a69a"  )
    , ("cursor",       "pointer"  )
    ]
  , onClick address (GoToUser t)
  ] []

profileDetails : Address Action -> Tweet -> Html
profileDetails address t =
  div 
  [ style 
    [ ("float",        "left") 
    , ("margin-right", "1em" )
    , ("width",        "20em")
    ] 
  ]
  [ div []
    [ p
      [ class "point ignorable"
      , style [ ("cursor", "pointer") ]
      , onClick address (GoToUser t)
      ] 
      [ text t.name ]
    ]
  , div []
    [ veryIgnorable t.date
    , ignorable     " "
    , p
      [ class "point veryIgnorable" 
      , style 
        [ ("cursor",  "pointer") 
        , ("display", "inline" )
        ]
      , onClick address (GoToUser t)
      ] 
      [ text t.handle]
    ] 
  ]

tweetContent : Address Action -> Tweet -> Html
tweetContent address t =
  p
  [ class "point" 
  , style [ ("cursor",  "pointer") ]
  , onClick address (GoToTweet t)
  ]
  [ text t.content ]