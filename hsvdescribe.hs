{-# LANGUAGE NoImplicitPrelude #-}
{- |
   Module      : HsvDescribe
   Copyright   : Copyright (C) 2019 Emin Mastizada
   Student #   : 150120914
   Stability   : alpha
Converts RGB to HSV and reverse.
-}
module HsvDescribe where

import Prelude

describe_h :: Integer -> String
describe_h h
  | h < 15  = "red"
  | h == 15 = "reddish"
  | h > 15  = "orange"
  | h > 45  = "yellow"
  | h > 70  = "lime"
  | h > 79  = "green"
  | h > 163 = "cyan"
  | h > 193 = "blue"
  | h > 240 = "indigo"
  | h > 260 = "violet"
  | h > 270 = "purple"
  | h > 291 = "magenta"
  | h > 327 = "rose"
  | otherwise = "red"

describe_s :: Integer -> String
describe_s s
  | s < 4  = "grey"
  | s > 3  = "almost grey"
  | s > 10 = "very unsaturated"
  | s > 30 = "unsaturated"
  | s > 46 = "rather unsaturated"
  | s > 60 = "saturated"
  | s > 80 = "rather saturated"
  | otherwise = "very saturated"

describe_v :: Integer -> String
describe_v v
  | v < 10 = "almost black"
  | v > 9  = "very dark"
  | v > 22 = "dark"
  | v > 30 = "normal"
  | v > 60 = "light"
  | v > 80 = "very light"
  | otherwise = "almost white"

hsvdescribe :: (Integer, Integer, Integer) -> String
hsvdescribe (h, s, v) = value where
  value = describe_h h ++ ", " ++ describe_s s ++ ", " ++ describe_v v
