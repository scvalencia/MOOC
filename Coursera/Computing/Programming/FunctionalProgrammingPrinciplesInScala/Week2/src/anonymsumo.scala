def sum(f: Int => Int, a: Int, b: Int) = {

	def innersum(a: Int, b: Int): Int =
		if (a > b) 0 else f(a) + innersum(a + 1, b)
		
	innersum(a, b)	
}

val fact: (Int => Int) = (x: Int) => if (x < 2) 1 else x * fact(x - 1)

def sumInts(a: Int, b: Int)			= sum(x => x, a, b)
def sumCubes(a: Int, b: Int)		= sum(x => x * x * x, a, b)
def sumFactorials(a: Int, b: Int)	= sum(fact, a, b)

println(sumInts(0, 10))
println(sumCubes(0, 10))
println(sumFactorials(0, 5))