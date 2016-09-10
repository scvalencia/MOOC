/* Write a `product` function that calculates the product of the 
 * values of a function for the points on a given interval
 */
def product(f: Int => Int)(a: Int, b: Int): Int = {
	if (a > b) 1 else f(a) * product(f)(a + 1, b)
}

/* Write `factorial` in terms of `product` */
def factorial(n: Int): Int = {
	product(x => x)(1, n)
}

/* Write a more general function, that generalizes both `sum`, and `product` */
def general(f: Int => Int, operation: (Int, Int) => Int, identity: Int)
	(a: Int, b: Int): Int = {
		if (a > b) identity 
		else operation(f(a), general(f, operation, identity)(a + 1, b))
}

// The product of the squares between 3 and 4 is
val val1 = product(x => x * x)(3, 4)
val val2 = general(x => x * x, (x, y) => x * y, 1)(3, 4)

// The sum of the numbers between 0 and 10 is:
val val3 = general(x => x, (x, y) => x + y, 0)(0, 10)

println(val1)
println(val2)
println(val3)