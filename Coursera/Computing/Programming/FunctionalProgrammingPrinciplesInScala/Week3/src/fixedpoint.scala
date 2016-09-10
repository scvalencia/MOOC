import math.abs

val EPSILON = 0.00001

def isCloseEnough(x: Double, y: Double) =
	abs((x - y) / x) / x < EPSILON
	
def fixedPoint(f: Double => Double)(firstGuess: Double) = {
	def iterate(guess: Double): Double = {
		val next = f(guess)
		if (isCloseEnough(guess, next)) next
		else iterate(next)
	}
	iterate(firstGuess)
}

def sqrt(x: Double) = fixedPoint(y => (y + x / y) / 2)(1.0)

println(fixedPoint(x => 1 + x/2)(1))
println(sqrt(4.0))