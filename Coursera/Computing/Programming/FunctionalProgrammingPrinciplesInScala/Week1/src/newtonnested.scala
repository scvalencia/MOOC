/* A block is delimited by brces, it may contain a sequence of definitions or expressions
 * The last element (expression) of a block defines the value of the block
 * This return expression, can be preceded by auxiliary definitions
 * Blocks are themselves expressions; a block may appear everywhere an expression can
*/
def sqrt(x: Double) = {

	val EPSILON = 0.000001

	def abs(x: Double) = if (x < 0) -x else x

	// Recursive definitons need an explicit return type in Scala
	def newton(guess: Double, x: Double): Double =
		if (isGoodEnough(guess, x)) guess
		else newton(improve(guess, x), x)

	def isGoodEnough(guess: Double, x: Double) =
		abs(guess * guess - x) / x < EPSILON 

	def improve(guess: Double, x: Double) = 
		(guess + x / guess) / 2

	newton(1.0, x)

}

println(sqrt(2))
println(sqrt(1e-6))
println(sqrt(1e60))