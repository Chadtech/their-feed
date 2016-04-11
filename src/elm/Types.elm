module Types where

type Action
  = Search
  | HandleInput Int
  | RefreshField String

type alias Model =
  { handle: String 
  , tweets: List Tweet
  }

type alias Tweet =
  { content: String 
  , name:    String
  , handle:  String
  , image:   String
  , date:    String
  }
