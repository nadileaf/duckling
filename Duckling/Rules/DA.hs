-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}

module Duckling.Rules.DA
  ( rules
  ) where

import Duckling.Dimensions.Types
import qualified Duckling.Duration.DA.Rules as Duration
import qualified Duckling.Number.DA.Rules as Number
import qualified Duckling.Ordinal.DA.Rules as Ordinal
import qualified Duckling.Time.DA.Rules as Time
import qualified Duckling.TimeGrain.DA.Rules as TimeGrain
import Duckling.Types

rules :: Some Dimension -> [Rule]
rules (Some Distance) = []
rules (Some Duration) = Duration.rules
rules (Some Numeral) = Number.rules
rules (Some Email) = []
rules (Some Finance) = []
rules (Some Ordinal) = Ordinal.rules
rules (Some PhoneNumber) = []
rules (Some Quantity) = []
rules (Some RegexMatch) = []
rules (Some Temperature) = []
rules (Some Time) = Time.rules
rules (Some TimeGrain) = TimeGrain.rules
rules (Some Url) = []
rules (Some Volume) = []