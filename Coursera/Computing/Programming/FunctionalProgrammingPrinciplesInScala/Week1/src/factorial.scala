def factorial(n: Int) = {
	def iter(acc: Int, n: Int): Int =
		if (n == 0) acc
		else iter(acc * n, n - 1)
	iter(1, n)
}

println(factorial(5))