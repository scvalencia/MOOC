def sum(f: Int => Int, a: Int, b: Int) = {

	def innersum(a: Int, b: Int): Int =
		if (a > b) 0 else f(a) + innersum(a + 1, b)
		
	innersum(a, b)	
}

def id(x: Int) = x

def cube(x: Int) = x * x * x

def factorial(n: Int) = {
	def iter(acc: Int, n: Int): Int =
		if (n == 0) acc
		else iter(acc * n, n - 1)
	iter(1, n)
}

def sumInts(a: Int, b: Int)			= sum(id, a, b)
def sumCubes(a: Int, b: Int)		= sum(cube, a, b)
def sumFactorials(a: Int, b: Int)	= sum(factorial, a, b)

println(sumInts(0, 10))
println(sumCubes(0, 10))
println(sumFactorials(0, 5))