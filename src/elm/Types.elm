module Types exposing (Msg(..), Model, Tweet)


type Msg 
  = HandleInput  Int
  | RefreshField String
  | GoToUser     Tweet
  | GoToTweet    Tweet
  | GetTweets    (List Tweet)

type alias Model =
  { twitterHandle: String 
  , tweets:        List Tweet
  }

type alias Tweet =
  { content: String 
  , name:    String
  , handle:  String
  , image:   String
  , date:    String
  }
