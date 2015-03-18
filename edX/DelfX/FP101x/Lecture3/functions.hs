add :: Int -> Int -> Int
add a b = a + b

const :: a -> (b -> a)
const x = (\_ -> x)

-- Exercises

safetail1 :: [a] -> [a] 
safetail1 lst = 
	if null(lst) then [] 
	else drop 1 lst

safetail2 :: [a] -> [a]
safetail2 lst
	| null lst	= []
	| otherwise = drop 1 lst

safetail3 :: [a] -> [a]
safetail3 []      = []
safetail3 (x:xs) = xs

or1 :: Bool -> Bool -> Bool
or1 True  True   = True
or1 True  False  = True
or1 False True   = True
or1 False False  = False

or2 :: Bool -> Bool -> Bool
or2 True x  = True
or2 False x = x

or3 :: Bool -> Bool -> Bool
or3 True x = True
or3 x False = x

and1 :: Bool -> Bool -> Bool
and1 a b =
	if a then b
	else False
