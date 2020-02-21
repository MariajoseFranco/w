module Main where
import Test.QuickCheck
main :: IO ()
main = do
    quickCheck propMyAppend
    quickCheck propMyNull

-- | Append two lists.
myAppend :: [a] -> [a] -> [a]
myAppend [] xs = xs
myAppend (x:xs) ys = x : myAppend xs ys

-- | Extract the last element of a list, which must be finite and non-empty.
myLast :: [a] -> a
myLast [] = error "La lista es vacía"
myLast [x] = x
myLast (x:xs) = myLast xs

-- | Test whether a list is empty.
myNull :: [a] -> Bool
myNull [] = True
myNull [x] = False
myNull (x:xs) = False

-- | Testing ’myAppend’ function.
propMyAppend :: [Int] -> [Int] -> Bool
propMyAppend xs ys = myAppend xs ys == xs ++ ys

-- | Testing ’myNull’ function.
propMyNull :: [Int] -> Bool
propMyNull xs = myNull xs == null xs