{-# LANGUAGE NoImplicitPrelude #-}
{- |
   Module      : NameRGB
   Copyright   : Copyright (C) 2019 Emin Mastizada
   Student #   : 150120914
   Stability   : alpha
Converts RGB to HSV and reverse.
-}
module NameRGB where

import Prelude
import qualified Data.Map.Strict as Map

color_map = Map.fromList [("AliceBlue", (240, 248, 255)), ("AntiqueWhite", (250, 235, 215)), ("Aqua", (0, 255, 255)), ("Aquamarine", (127, 255, 212)), ("Azure", (240, 255, 255)), ("Beige\
\", (245, 245, 220)), ("Bisque", (255, 228, 196)), ("Black", (0, 0, 0)), ("BlanchedAlmond", (255, 235, 205)), ("Blue", (0, 0, 255)), ("BlueViolet", (138, 43, 226)), ("Brown\
\", (165, 42, 42)), ("BurlyWood", (222, 184, 135)), ("CadetBlue", (95, 158, 160)), ("Chartreuse", (127, 255, 0)), ("Chocolate", (210, 105, 30)), ("Coral", (255, 127, 80)), ("CornflowerBlue\
\", (100, 149, 237)), ("Cornsilk", (255, 248, 220)), ("Crimson", (220, 20, 60)), ("Cyan", (0, 255, 255)), ("Grey", (128, 128, 128)), ("Green", (0, 128, 0)), ("Red\
\", (255, 0, 0)), ("Yellow", (255, 255, 0))]

lookupToValue :: Maybe (Integer, Integer, Integer) -> (Integer, Integer, Integer)
lookupToValue (Just a) = a
lookupToValue Nothing = (0, 0, 0)

name2rgb :: String -> (Integer, Integer, Integer)
name2rgb name = lookupToValue (Map.lookup name color_map)
