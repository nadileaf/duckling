-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}

module Duckling.Duration.Rules
  ( rules
  ) where

import Prelude
import Data.String

import Duckling.Dimensions.Types
import Duckling.Duration.Helpers
import Duckling.Number.Types (NumberData(..))
import qualified Duckling.Number.Types as TNumber
import Duckling.Types

ruleIntegerUnitofduration :: Rule
ruleIntegerUnitofduration = Rule
  { name = "<integer> <unit-of-duration>"
  , pattern =
    [ Predicate isNatural
    , dimension TimeGrain
    ]
  , prod = \tokens -> case tokens of
      (Token Numeral (NumberData {TNumber.value = v}):
       Token TimeGrain grain:
       _) -> Just . Token Duration . duration grain $ floor v
      _ -> Nothing
  }

rules :: [Rule]
rules =
  [ ruleIntegerUnitofduration
  ]