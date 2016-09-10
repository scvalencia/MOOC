class Rational(x: Int, y: Int) {

	private def gcd(a: Int, b: Int): Int = 
		if (b == 0) a else gcd(b, a % b)

	private val common = gcd(x, y)

	def numer = x / common
	def denom = y / common

	def this(x: Int) = this(x, 1)

	def add(that: Rational) = {
		val ansnumer = this.numer * that.denom + that.numer * this.denom
		val ansdenom = this.denom * that.denom
		new Rational(ansnumer, ansdenom)
	}

	def sub(that: Rational) = {
		val ansnumer = this.numer * that.denom - that.numer * this.denom
		val ansdenom = this.denom * that.denom
		new Rational(ansnumer, ansdenom)
	}

	def mul(that: Rational) = {
		val ansnumer = this.numer * that.numer
		val ansdenom = this.denom * that.denom
		new Rational(ansnumer, ansdenom)
	}

	def div(that: Rational) = {
		val ansnumer = this.numer * that.denom
		val ansdenom = this.denom * that.numer
		new Rational(ansnumer, ansdenom)
	}

	def neg() = new Rational(-this.numer, this.denom)

	def less(that: Rational) = 
		this.numer * that.denom < that.numer * this.denom

	def max(that: Rational) = 
		if (this.less(that)) that else this

	override def toString() =
		this.numer + "/" + this.denom
}

val x = new Rational(1, 3)
val y = new Rational(5, 7)
val z = new Rational(3, 2)

println(x.add(z))
println(x.neg())
println(x.sub(y).sub(z))
println(x)