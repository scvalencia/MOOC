val EPSILON = 0.000001

def abs(x: Double) = if (x < 0) -x else x

// Recursive definitons need an explicit return type in Scala
def newton(guess: Double, x: Double): Double =
	if (isGoodEnough(guess, x)) guess
	else newton(improve(guess, x), x)

def isGoodEnough(guess: Double, x: Double) =
	abs(guess * guess - x) < EPSILON 

def improve(guess: Double, x: Double) = 
	(guess + x / guess) / 2

def sqrt(x: Double) = newton(1.0, x)

println(sqrt(2))
println(sqrt(9))
println(sqrt(25))