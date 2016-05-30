# Higher order functions

## Introduction

Higher-order functions, allow you to pass functions as arguments, and to return functions from other functions. Functional programming languages, treat functions as first-class values. This means that like any other value, functions can be passed as a parameter, and returned as a result. This provides a flexible way to compose and design programs.

**Higher-order function**: A function that take other functions as parameters or that return functions as results. A **first-order functions**, acts on values of normal data types (not functions per se).

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

The type `A => B`, is the type of a **function** that takes an argment of type `A`, and returns a result of type `B`. For instance `Int => Int`, is the functions of maps integers to integers.

There's an annoying detail in the presented code, that is, the declaration of the auxiliary functions `id`, `cube`, anf `factorial`. So passing functions as paramters, can lead to the creating of unnecessary auxiliar functions, as oposed to simple data types, where passing those as parameters, does not require a prior declaration.

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
def sumCubes(a: Int, b: Int)		= sum(x => x * x * x, a, b
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

Scala has syntactic sugar for funtcions that return functions as values. For instance, the following definition of `sum`, is equivalent to the one with the nested `inner` function above.

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



