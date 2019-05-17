{-# LANGUAGE NoImplicitPrelude #-}
{- |
   Module      : hsvGradient
   Copyright   : Copyright (C) 2019 Emin Mastizada
   Student #   : 150120914
   Stability   : alpha
Converts RGB to HSV and reverse.
-}
module HsvGradient where

import Prelude

toInt :: Float -> Integer
toInt x = round x

merge :: [(Integer, Integer, Integer)] -> [(Integer, Integer, Integer)] -> [(Integer, Integer, Integer)]
merge [] ys = ys
merge (x:xs) ys = x:merge ys xs

combine_colors :: (Integer, Integer, Integer) -> (Integer, Integer, Integer) -> Integer -> [(Integer, Integer, Integer)] -> [(Integer, Integer, Integer)]
combine_colors (hs, ss, vs) (h_delta, s_delta, v_delta) step xs
  | step > 0 = merge xs (combine_colors ((hs + h_delta) `mod` 360, (ss + s_delta) `mod` 100, (vs + v_delta) `mod` 100) (h_delta, s_delta, v_delta) (step - 1) [((hs + h_delta) `mod` 360, (ss + s_delta) `mod` 100, (vs + v_delta) `mod` 100)])
  | otherwise = merge xs [((hs + h_delta) `mod` 360, (ss + s_delta) `mod` 100, (vs + v_delta) `mod` 100)]

hsvgradient :: (Integer, Integer, Integer) -> (Integer, Integer, Integer) -> Integer -> [(Integer, Integer, Integer)]
hsvgradient (hs, ss, vs) (he, se, ve) step = xs where
  h_delta = toInt ((fromIntegral (abs (he - hs))) / (fromIntegral step))
  s_delta = toInt ((fromIntegral (abs (se - ss))) / (fromIntegral step))
  v_delta = toInt ((fromIntegral (abs (ve - vs))) / (fromIntegral step))
  xs = combine_colors (hs, ss, vs) (h_delta, s_delta, v_delta) step []
