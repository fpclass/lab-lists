--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab: Lists                                                                 --
--------------------------------------------------------------------------------

import Data.Char (isDigit)

import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

import qualified Lab as L

--------------------------------------------------------------------------------

tests :: TestTree 
tests = testGroup ""
 [
    testCase "numbers, numbers', and numbers'' are the same" $ do
        assertEqual "numbers sums up to 108" (sum L.numbers) 108
        assertEqual "numbers has 6 elements" (length L.numbers) 6
        assertEqual "numbers and numbers' are not the same" L.numbers L.numbers' 
        assertEqual "numbers and numbers'' are not the same" L.numbers L.numbers''
        assertEqual "numbers' and numbers'' are not the same" L.numbers' L.numbers'' 
 ,  testCase "isPalindrome detects palindromes" $ do 
        assertBool "isPalindrome thinks radar is not a palindrome" (L.isPalindrome "radar")
        assertBool "isPalindrome thinks level is not a palindrome" (L.isPalindrome "level")
        assertBool "isPalindrome thinks wow is not a palindrome" (L.isPalindrome "wow")
        assertBool "isPalindrome thinks 141 is not a palindrome" (L.isPalindrome "141")
        assertBool "isPalindrome thinks kayak is not a palindrome" (L.isPalindrome "kayak")
        assertBool "isPalindrome thinks cs141 is a palindrome" (not $ L.isPalindrome "cs141")
        assertBool "isPalindrome thinks haskell is a palindrome" (not $ L.isPalindrome "haskell")
        assertBool "isPalindrome thinks cake is a palindrome" (not $ L.isPalindrome "cake")
 ,  testProperty "validModuleCode accepts valid module codes" $ 
        forAll (arbitrary `suchThat` \v -> isDigit v) $ \a -> 
        forAll (arbitrary `suchThat` \v -> isDigit v) $ \b -> 
        forAll (arbitrary `suchThat` \v -> isDigit v) $ \c ->
        L.validModuleCode ['c', 's', a, b, c]
 ,  testProperty "validModuleCode rejects module codes that are not of the right format" $ 
        \a b c d -> forAll (arbitrary `suchThat` \v -> v /= 'c') $ \e ->
        not (L.validModuleCode [e, d, c, b, a])
 ,  testProperty "validModuleCode rejects module codes that are the wrong length" $ 
        forAll (arbitrary `suchThat` \v -> length v /= 5) $ \xs ->
        not (L.validModuleCode xs) 
 ]

--------------------------------------------------------------------------------

main :: IO ()
main = defaultMain tests

--------------------------------------------------------------------------------
