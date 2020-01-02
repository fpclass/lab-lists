--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab: Lists                                                                 --
--------------------------------------------------------------------------------

module Lab where

--------------------------------------------------------------------------------

import Data.Char (isDigit)

--------------------------------------------------------------------------------

-- without explicit brackets
numbers :: [Int]
numbers = 4 : 8 : 15 : 16 : 23 : 42 : []

-- with explicit brackets to show the associativity of cons
-- the number 4 is currently missing from the beginning of this list
numbers' :: [Int]
numbers' = 8 : (15 : (16 : 23 : (42 : [])))

-- syntactic sugar for lists
-- the number 42 is currently missing from the end of this list
numbers'' :: [Int]
numbers'' = [4,8,15,16,23]

--------------------------------------------------------------------------------

isPalindrome :: [Char] -> Bool 
isPalindrome = undefined

validModuleCode :: [Char] -> Bool 
validModuleCode = undefined

--------------------------------------------------------------------------------
