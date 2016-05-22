module TweetComponents exposing (..)

import Html                 exposing (..)
import Html.Attributes      exposing (..)
import Html.Events          exposing (..)
import Types                exposing (..)
import Components           exposing (..)
import TweetComponentStyles exposing (..)

(-) = (,)

tweetView : Tweet -> Html Msg
tweetView t =
  div 
  [ tweetViewStyle ]
  [ profilePicture t
  , profileDetails t
  , tweetContent   t
  ] 

profilePicture : Tweet -> Html Msg
profilePicture t =
  img 
  [ src t.image 
  , profilePictureStyle
  , onClick (GoToUser t)
  ] []

profileDetails : Tweet -> Html Msg
profileDetails t =
  div [ profileDetailsStyle ]
  [ name t
  , handleAndDate t
  ]

name : Tweet -> Html Msg
name t =
  div []
  [ p
    [ class "point ignorable"
    , nameStyle
    , onClick (GoToUser t)
    ] 
    [ text t.name ]
  ]

handleAndDate : Tweet -> Html Msg
handleAndDate t =
  div []
  [ veryIgnorable t.date
  , ignorable     " "
  , p
    [ class "point veryIgnorable" 
    , handleAndDateStyle
    , onClick (GoToUser t)
    ]
    [ text t.handle ]
  ] 

tweetContent : Tweet -> Html Msg
tweetContent t =
  p
  [ class "point" 
  , tweetContentStyle
  , onClick (GoToTweet t)
  ]
  [ text t.content ]

