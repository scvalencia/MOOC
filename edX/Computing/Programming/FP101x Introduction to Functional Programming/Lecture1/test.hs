-- Call it using ghci test.hs
double x = x + x
quadruple x = double (double x)
-- Now call :reload
factorial n = product [1 .. n]
average ns = sum ns `div`length ns

n = a `div`length xs
	where
		a = 10
		xs = [1,2,3,4,5]

prod [] = 1
prod (x : xs) = x * prod xs

qsort [] = []
qsort (x:xs) = qsort ys ++ [x] ++ qsort zs
	      where
	      	ys = [a | a <- xs, a <= x]
	      	zs = [b | b <- xs, b > x]

qsort' [] = []
qsort' (x:xs) = qsort' larger ++ [x] ++ qsort' smaller
	where 
		smaller = [a | a <- xs, a <= x]
		larger = [b | b <- xs, b > x]

qsort'' [] = []
qsort'' (x:xs) = qsort'' larger ++ [x] ++ qsort'' larger
	where 
		smaller = [a | a <- xs, a <= x]
		larger = [b | b <- xs, b > x]
