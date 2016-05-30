def sum(f: Int => Int): (Int, Int) => Int = {
	def inner(a: Int, b: Int): Int = 
		if (a > b) 0
		else f(a) + inner(a + 1, b)
	inner
}

println(sum(x => x)(0, 10))