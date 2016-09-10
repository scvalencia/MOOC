# Data and abstraction

So far, the objects has been instances of a single class, now, is introduced the concept of class hierarchies. An important aspect, is that the model of evaluation depends on the called method depends on the runtime type of the receiver (**dynamic binding**). The model of evaluation, already supports this concept. 

## Class Hierarchies	



Higher-order functions, allow you to pass functions as arguments, and to return functions from other functions. Functional programming languages, treat functions as first-class values. This means that like any other value, functions can be passed as a parameter, and returned as a result. This provides a flexible way to compose and design programs.

**Higher-order function**: A function that take other functions as parameters or returns other functions as results. A **first-order functions**, acts on values of normal data types (not functions per se).

Example:

We desire to design a functions to compute:

$$\sum_{i = a}^{b} i$$

```scala
def sumInts(a: Int, b: Int): Int = 
	if (a > b) 0 else a + sumInts(a + 1, b)
```

Now we desire to find the sum if the cubes between ```a``` and `b`.

```scala
def cube(x: Int): Int = x * x * x

def sumCubes(a: Int, b: Int): Int =
	if (a > b) 0 else cube(a) + sumCubes(a + 1, b)
```

Now, we want to find the sum of the factorials between `a` and `b`.

```scala
def factorial(n: Int) = {

	def iter(acc: Int, n: Int): Int =
		if (n == 0) acc
		else iter(acc * n, n - 1)
		
	iter(1, n)
}

def sumFactorial(a: Int, b: Int): Int = 
	if (a > b) 0 else factorial(a) + sumFactorial(a + 1, b)
```

All of the above functions, are special cases of:

$$\sum_{i = a}^{b} f(i),\ f \in \{ Id,\ cube,\ fact\} \wedge\ f\ :\ \mathbb{Z}\ \rightarrow \mathbb{Z}$$

Can we factor this under a common pattern?

Let's define a function `sum`:

```scala
def sum(f: Int => Int, a: Int, b: Int) = {

	def innersum(a: Int, b: Int): Int =
		if (a > b) 0 else f(a) + innersum(a + 1, b)
		
	innersum(f, a, b)	
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
def sumCubes(a: Int, b: Int)		= sum(cubes, a, b)
def sumFactorials(a: Int, b: Int)	= sum(factorial, a, b)
```

The type `A => B`, is the type of a **function** that takes an argment of type `A`, and returns a result of type `B`. For instance `Int => Int`, is the type of maps from integers to integers.

There's an annoying detail in the presented code, that is, the declaration of the auxiliary functions `id`, `cube`, and `factorial`. So passing functions as paramters, can lead to the creating of unnecessary auxiliar functions, as oposed to simple data types, where passing those as parameters, does not require a prior declaration.

```scala
def name = "Hola"
println(name)

println("Hola")
```

Because strings exists as literals, one can do that. Since functions are supposed to be first-class citizens, functional programming languages tend to provide a flexible mechanism to use function literals, these are called **anonymous functions**.

```scala
(x: Int) => x * x * x
(x: Int, y: Int) => x + x
```

In Scala, an anonymous functions `(x1: T1, ..., xn: Tn) => E`, can always be expresses using `def`, that is: `def f(x1: T1, ..., xn: Tn) => E; f` (usaully inside a block), where `f`, is an arbitrary, fresh name (that's not yet used in the program).

Using anonymous functions, we can express the program as follows:

```scala
def sum(f: Int => Int, a: Int, b: Int) = {
	def innersum(a: Int, b: Int): Int =
		if (a > b) 0 else f(a) + innersum(a + 1, b)
	innersum(a, b)	
}

val fact: (Int => Int) = (x: Int) => if (x < 2) 1 else x * fact(x - 1)

// Infered type of the anonymous function
def sumInts(a: Int, b: Int)			= sum(x => x, a, b)
def sumCubes(a: Int, b: Int)		= sum(x => x * x * x, a, b)
def sumFactorials(a: Int, b: Int)	= sum(fact, a, b)
```

A tail-recursive version of sum is:

```scala
def sum(f: Int => Int, a: Int, b: Int) = {

	def loop(a: Int, acc: Int): Int = {
		if (a > b) acc
		else loop(a + 1, f(a) + acc)
	}
	
	loop(a, 0)
}
```

## Currying

Higher-order functions are basic building blocks of functional program, there exists a special form to write them in many functional programming languages.

The summations functions defined above are:

```scala
def sumInts(a: Int, b: Int)			= sum(id, a, b)
def sumCubes(a: Int, b: Int)		= sum(cubes, a, b)
def sumFactorials(a: Int, b: Int)	= sum(factorial, a, b)
```

Can we factor out the passing of `a`, and `b`?

```scala
/* sum is now a function that returns another function. 
 * The returned function applies the given function parameter 
 *f and sums the results
 */
 
def sum(f: Int => Int): (Int, Int) => Int = {
	def inner(a: Int, b: Int): Int = 
		if (a > b) 0
		else f(a) + inner(a + 1, b)
	inner
}

def sumInts(a: Int, b: Int)			= sum(x => x)
def sumCubes(a: Int, b: Int)		= sum(x => x * x * x)
def sumFactorials(a: Int, b: Int)	= sum(factorial)

val summation1 = sumInts(0, 10)

// Holds the value 55
val summation2 = sum(x => x)(0, 10)
```

Functon applications associates to the left:

```scala
sum(x => x)(1, 10) === (sum(x => x)) (1, 10)
```

Scala has syntactic sugar for functions that return functions as values. For instance, the following definition of `sum`, is equivalent to the one with the nested `inner` function above.

```scala
def sum(f: Int => Int)(a: Int, b: Int): Int = {
	if (a > b) 0 else f(a) + sum(f)(a + 1, b)
}
```

This allow you to write `sum(x => x)`. In general, a definition of a function with multiple parameter list:

`def f(args1)...(argsn) = E, n > 1` is equivalent to
`def f(args1)...(argsn-1) = {def g(argsn) = E; g}`, or in short:
`def f(args1)...(argsn-1) = (argsn) => E`

Repeating the process `n` times, `def f(args1)...(argsn-1)(argsn) = E`, is equivalent to:
`def f = (args1 => (args2 => ... (argsn => E)...))`. This style of definition and function applications, is called **currying**, named after Haskell Brooks Curry, a twentieth century logician. The idea goes back even further to Schöenfinkel and Frege, buth the term **currying** has stuck. The idea behind it, is that the original parameter list functions, is mapped to a function withour parameters, but where the definition of it consists of `n` nested anonymous functions.

Given a function whose header is:

```scala
def sum(f: Int => Int)(a: Int, b: Int): Int = ...
```

its type is:

```scala
(Int => Int) => (Int, Int) => Int

// Since functional types associates to the right
Int => Int => Int equiv Int => (Int => Int)
```

Execise:

* Write a `product` function that calculates the product of the values of a function for the points on a given interval.

```scala
def product(f: Int => Int)(a: Int, b: Int): Int = {
	if (a > b) 1 else f(a) * product(f)(a + 1, b)
}
```

* Write `factorial` in terms of `product`.

```scala
def factorial(n: Int): Int = {
	product(x => x)(1, n)
}
```

* Write a more general function, that generalizes both `sum`, and `product`.

```scala
def general(f: Int => Int, operation: (Int, Int) => Int, identity: Int)
	(a: Int, b: Int): Int = {
		if (a > b) identity 
		else operation(f(a), general(f, operation, identity)(a + 1, b))
}

def sum(f: Int => Int)(a: Int, b: Int): Int = 
	general(f, (x, y) => x + y, 0)(a, b)
	
def product(f: Int => Int)(a: Int, b: Int): Int =
	 general(f, (x, y) => x * y, 1)(a, b)
```

## An example, finding fixed-points

A number `x`, is called a fixed point of a function `f` if `f(x) = x`. For some functions `f`, we can locate the fixed pointd by starting with an initial estimate and then by applying `f` in a repetitive way.

	x, f(x), f(f(x)), f(f(f(x))), ...
	
until the value does not vary anymore (or the change is sufficiently small). This definition, leads to:

```scala
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
```

`sqrt(x)` is the number `y` such that `y * y = x THEN y = x / y THEN sqrt(x)`, is a fixed point of the function `y => x / y`. With that in mind, we can revisit the `sqrt(x)` example.

```scala
def sqrt(x: Double) = fixedPoint(y => (y + x / y) / 2)(1)
```
The previous example have shown that the expressive power of a language is greatly increased if we can pass functions arguments. The following example shows that functions that return functions can also be very useful.

Consider again iteration towards fixed point. We begin by observing that $$\sqrt{x}$$ is a fixed point of the function `y => y / x` . Then the iteration converges by averaging successive values. This technique **stabilizing by averaging** is general enough to merit being abstracted into its own function. 

```scala
def averageDamp(f: Double => Double)(x: Double) = (x + f(x)) / 2
```

Exerciese: Given `fixedPoint()`, and `averageDamp()`, write a square root function that makes use of both of them.

```scala
def sqrt(x: Double) = {
	val average = averageDamp(y => x / y)(1)
	fixedPoint(average)
}
```

## Scala syntax

EBNF (Extnder Backus-Naur form)

```
| denotes an alternative
[...] an option (0 or 1)
{...} a repetition (0 or more)
```

```
Types 		 := SimpleType | FunctionType
FunctonType  := SimpleType '=>' Type | '(' [Types] ')' '=>' Type
SimpleType   := 'Int' | 'Double' | 'Byte' | 'Short' | 'Char' | 'Long' 
			  | 'Float' | 'Boolean'
Types 		 := Type {',' Type}
Epr 		 := InfixExpr | FunctionExpr 
			  | if '(' Exp ')' Expr else Expr
InfixExpr 	 := PrefixExpr | InfixExpr Operator InfixExpr
Operator 	 := ident
PrefixExpr 	 := ['+' | '-' | '!' | '~'] SimpleExpr
SimpleExpr 	 := ident | literal | SimpleExpr '.' ident | Block
FunctionExpr := Binding '=>' Expr
Binding 	 := ident [':' SimpleType] | '(' [Binding {',' Binding}] ')'
Binding 	 := ident [':' Type]
Block 		 := '{' {Def ';'} Expr '}'
Def 		 := FunDef | ValDef
FunDef 		 := 'def' ident {'(' [Parameters] ')'} [':' Type] '=' Expr
ValDef 		 := 'val' ident [':' Type] '=' Expr
Parameter 	 := ident ':' [ '=>' ] Type
Parameters 	 := Parameter {',' Parameter}
```

![](https://raw.githubusercontent.com/scvalencia/MOOC/master/img/scala-syntax-2016-06-02%2011.42.11.png)

![](https://raw.githubusercontent.com/scvalencia/MOOC/master/img/scala-syntax-2016-06-02%2011.50.38.png)

## Data and functions

In Scala, one can package data by defining a **class**

```scala
class Rational(x: Int, y: Int) {
	def numer = x
	def denom = y
}
```

This definition introduces two entities:

* A new type, named `Rational`
* A constructor `Rational` to create elements of this type

Scala keeps the names of types and values in different namespaces. So there's no conflict between the two definition (constructor and type). A **type**, is a collection of elements. Elements of a class, are called **objects**. We create an object, by prefixing an application of the constructor of the class with the operator `new`.

```scala
new Rational(1, 2)
```
Objects of the class `Rational`, have two members, `numer`, and
`denom`. We select the members of an object with the infix operator '.' (like in Java). We can now define the arithmetic functions that implement the standard rules:

$$\frac{n_1}{d_1} + \frac{n_1}{d_1} = \frac{n_1d_2+n_2d_1}{d_1d_2}$$

$$\frac{n_1}{d_1} - \frac{n_1}{d_1} = \frac{n_1d_2-n_2d_1}{d_1d_2}$$

$$\frac{n_1}{d_1} \times \frac{n_1}{d_1} = \frac{n_1n_2}{d_1d_2}$$

$$\frac{n_1}{d_1} \div \frac{n_1}{d_1} = \frac{n_1d_2}{d_1n_2}$$

$$\frac{n1}{d1} = \frac{n1}{d1} \iff n_1d_2 = d_1n_2$$

We can package the functions operating on a data abstraction in the data abstraction itself. Such functions, are called methods.

```scala
class Rational(x: Int, y: Int) {

	private def gcd(a: Int, b: Int): Int = 
		if (b == 0) a else gcd(b, a % b)

	private val common = gcd(x, y)

	def numer = x / common
	def denom = y / common

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
```

We could instead of calculate `gcd` immediately, calculate it every time each class member is called:

```scala
def numer = x / gcf(x, y)
def denom = y / gcd(x, y)
```

That could be an adventage if each member is not called oftenly. An alternative, would be to declare those as `vals`, so each one, is computed only once. No matter which implementation we use, the client observe exactly the same behavior each case.

One can impose restrictions in the creation and manipulation of `Rational` objects. There are to alternatives, to add a `require` inside of the class:

```scala
class Rational(x: Int, y: Int) {
	require(y != 0, "The denominator, must be a positive Integer"
	...
```

If the requie test fails, it throws an `IllegalArgumentException`. Another alternative, is to use `assert`. A failing `assert` will throw an `AsertionError`.

* `require` is used to enforce a precondition on the caller of a function
* `assert` is used as to check the code of the function itself

```scala
val x = sqrt(y)
assert(x >= 0)
```

Another syntactic construct, is **constructors**. Scala provides a primary constructor, that takes the parameters of the class, and executes all statements in the class body. A class can have several constructors, one can define a secondary constructor, using `this` as a function:

```scala
class Rational(x: Int, y: Int) {

	def this(x: Int) = this(x, 1)
	...
```

## The evaluation of objects

So far, we have develop a model for the evaluation of pure functions using the substitution model. Now we extend it to classes and objects. The evaluation of the expression (instantiation)

```scala	
new C(e1, ..., em)
```

is done, first by evaluationg each `ei`. That's it. The resulting expression `new C(v1,...,vm)`, is already a value.

Given a class definition:

```scala
class C(x1, ..., xm) {
	... 
	def f(y1,...,yn) = b 
	...
}
```

where

* The formal parameters of the class are `x1,...,xm`
* The class defines a method `f` with formal parameters `y1,...,yn`

How is the following expression evaluated?

```scala
new C(v1,...,vm).f(w1,...,wm)
```
This expression, is rewritten to:

```scala
[w1 / y1, ..., wn / yn]
	[v1 / x1,..., vm / xm]
		[new C(v1,...,vm) / this]
			(b)
```

Thre are three substitutions:

* The parameters of the function `f`, are replaced by its values
* The parameters of the class `C`, are substituted by the class arguments
* `this`, substitutes `new C(v1,...,vm)`

Example:

```scala
EXP: new Rational(1, 2).number
eval(EXP)
	[1 / x, 2 / y]
		[]
			[new Rational(1, 2) / this]
				(x)
	= 1

```

```scala
EXP: new Rational(1, 2).less(new Rational(2, 3))
eval(EXP)
	[1 / x, 2 / y]
		[new Rational(2, 3) / that]
			[new Rational(1, 2) / this]
				(this.number * that.denom < that.number * this.denom)
				
	= new Rational(1, 2).number * new Rational(2, 3).denom < 
		new Rational(2, 3).number * new Rational(1, 2).denom
	= Applying the first substitution 
	= 1 * 3 < 2 * 2
	= true
```

### Operators:

In principle, the rational numbers defined by `Rational` are as natural as integrs. But for the user of these abstraction, there is a noticeable difference, we write `x + y`, if `x`and `y` are integers, but we write `r.add(x)` if `r` and `s` are `Rational` objects. Scala provides a construct for the elimination of this difference. Any method with one parameter, can be used as an infix opertor in Scala:

Threrefore is possible to write:

```scala
r add s /* in place of */ r.add(s)
r max s /* in place of */ r.max(s)
r less s /* in place of */ r.less(s)
```
Operators can be used as identifiers, in Scala identifiers can be symbolic and alphanumeric.

	x1	*	+?%&	vector_++	counter_=
	
Our class could be rewritten as:

```scala
class Rational(x: Int, y: Int) {

	private def gcd(a: Int, b: Int): Int = 
		if (b == 0) a else gcd(b, a % b)

	private val common = gcd(x, y)

	def numer = x / common
	def denom = y / common

	def this(x: Int) = this(x, 1)

	def + (that: Rational) = {
		val ansnumer = this.numer * that.denom + that.numer * this.denom
		val ansdenom = this.denom * that.denom
		new Rational(ansnumer, ansdenom)
	}

	def - (that: Rational) = {
		// this + that.neg 
		val ansnumer = this.numer * that.denom - that.numer * this.denom
		val ansdenom = this.denom * that.denom
		new Rational(ansnumer, ansdenom)
	}

	def * (that: Rational) = {
		val ansnumer = this.numer * that.numer
		val ansdenom = this.denom * that.denom
		new Rational(ansnumer, ansdenom)
	}

	def / (that: Rational) = {
		val ansnumer = this.numer * that.denom
		val ansdenom = this.denom * that.numer
		new Rational(ansnumer, ansdenom)
	}

	// def neg: Rational = ...
	// def unary_- : Rational = ... NOTE THE SPACE BETWEEN - and :
	def neg() = new Rational(-this.numer, this.denom)

	def < (that: Rational) = 
		this.numer * that.denom < that.numer * this.denom

	def max(that: Rational) = 
		if (this.less(that)) that else this

	override def toString() =
		this.numer + "/" + this.denom
}
```

The precedence of an operator, is determined by its first character. The following list, shows the characters in increasing order of priority precedence:

* `all letters`
* `|`
* `^`
* `&`
* `< >`
* `= !`
* `:`
* `+ -`
* `* / %`
* `all other special characters`

So
	
	a + b ^? c ?^ d less a ==> b | c
	
is parenthesized as:

```	
a + b ^? c ?^ d less a ==> b | c
a + b ^? (c ?^ d) less a ==> b | c
(a + b) ^? (c ?^ d) less a ==> b | c
(a + b) ^? (c ?^ d) less (a ==> b) | c
((a + b) ^? (c ?^ d)) less (a ==> b) | c
((a + b) ^? (c ?^ d)) less ((a ==> b) | c)
```




