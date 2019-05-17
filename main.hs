{-# LANGUAGE NoImplicitPrelude #-}
{- |
   Module      : Main
   Copyright   : Copyright (C) 2019 Emin Mastizada
   Student #   : 150120914
   Stability   : alpha
Converts RGB to HSV and reverse.
-}
module Main where

import Prelude
import Data.Fixed (mod')
import RgbHsv (rgb2hsv, hsv2rgb)
import NameRGB (name2rgb)
import HsvGradient (hsvgradient)
import HsvDescribe (hsvdescribe)

main = do
  putStrLn("RGB 2 HSV with argument #121213 (18, 18, 19):")
  print(h, s, v)
  putStrLn("HSV 2 RGB with argument 240, 8, 5:")
  print(r, g, b)
  putStrLn("RGB for name Chocolate:")
  print(nr, ng, nb)
  putStrLn("HSV Gradient:")
  print(hsb_xs)
  putStrLn("Description for 240, 8, 5:")
  print(description) where
    (h, s, v) = rgb2hsv (18, 18, 19)
    (r, g, b) = hsv2rgb (240, 8, 5)
    (nr, ng, nb) = name2rgb "Chocolate"
    hsb_xs = hsvgradient (60, 50, 50) (120, 100, 100) 3
    description = hsvdescribe(240, 8, 5)
