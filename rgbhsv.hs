{-# LANGUAGE NoImplicitPrelude #-}
{- |
   Module      : RgbHsv
   Copyright   : Copyright (C) 2019 Emin Mastizada
   Student #   : 150120914
   Stability   : alpha
Converts RGB to HSV and reverse.
-}
module RgbHsv where

import Prelude
import Data.Fixed (mod')

toInt :: Float -> Integer
toInt x = round x

calc_h :: Float -> Float -> Float -> Float -> Float -> Float -> Integer
calc_h c_max c_min delta r g b
  | delta == 0 = 0
  | c_max == r = toInt (60 * (((g - b) / delta) `mod'` 6.0))
  | c_max == g = toInt (60 * ((b - r) / delta + 2.0))
  | c_max == b = toInt (60 * ((r - g) / delta + 4.0))
  | otherwise = 0

calc_s :: Float -> Float -> Integer
calc_s c_max delta
  | c_max == 0 = 0
  | otherwise  = toInt ((delta / c_max) * 100)

find_max :: Float -> Float -> Float -> Float
find_max r g b
  | r >= g && r >= b = r
  | g >= b           = g
  | otherwise        = b

find_min :: Float -> Float -> Float -> Float
find_min r g b
  | r <= g && r <= b = r
  | g <= b           = g
  | otherwise        = b

rgb2hsv :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
rgb2hsv (r, g, b) = (calc_h c_max c_min delta rc gc bc, calc_s c_max delta, value) where
  rc = (fromIntegral r) / 255.0
  gc = (fromIntegral g) / 255.0
  bc = (fromIntegral b) / 255.0
  c_max = find_max rc gc bc
  c_min = find_min rc gc bc
  delta = c_max - c_min
  value = toInt (c_max * 100)

calc_rgb_x :: Integer -> Float -> Float
calc_rgb_x h c = c * (1 - abs ((((fromIntegral h) / 60.0) `mod'` 2) - 1))

calc_rgb :: Integer -> Float -> Float -> (Float, Float, Float)
calc_rgb h c x
  | h < 60    = (c, x, 0.0)
  | h < 120   = (x, c, 0.0)
  | h < 180   = (0.0, c, x)
  | h < 240   = (0.0, x, c)
  | h < 300   = (x, 0.0, c)
  | otherwise = (c, 0.0, x)

hsv2rgb :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
hsv2rgb (h, s, v) = (r, g, b) where
  -- range limits for values:
  h_safe = h `mod` 360
  s_safe = (fromIntegral (s `mod` 100)) / 100.0
  v_safe = (fromIntegral (v `mod` 100)) / 100.0
  c = v_safe * s_safe
  x = calc_rgb_x h_safe c
  m = v_safe - c
  (rc, gc, bc) = calc_rgb h_safe c x
  r = toInt ((rc + m) * 255)
  g = toInt ((gc + m) * 255)
  b = toInt ((bc + m) * 255)
