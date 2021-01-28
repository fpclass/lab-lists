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
numbers' = 4 : (8 : (15 : (16 : (23 : (42 : [])))))

-- syntactic sugar for lists
-- the number 42 is currently missing from the end of this list
numbers'' :: [Int]
numbers'' = [4,8,15,16,23,42]

--------------------------------------------------------------------------------

isPalindrome :: [Char] -> Bool 
isPalindrome xs = xs == reverse xs

validModuleCode :: [Char] -> Bool
validModuleCode ['c','s',x,y,z] =
    isDigit x && isDigit y && isDigit z
-- validModuleCode ['c','s',x,y,z] =
--     all isDigit [x,y,z]
-- validModuleCode ('c':'s':xs) = 
--     length xs == 3 && all isDigit xs
validModuleCode _ = False

--------------------------------------------------------------------------------
