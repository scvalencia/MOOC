(*
	Abstract syntax trees are a convenient way to represent a syntactic expression in a structured way.
	Let us consider arithmetic expressions formed by the following rules:

		1. an integer is an arithmetic expression;
		2. if lhs and rhs are arithmetic expressions then lhs + rhs is an arithmetic expression;
		3. if lhs and rhs are arithmetic expressions then lhs * rhs is an arithmetic expression.

	Such an expression can be represented by a value of type exp as defined in the given prelude 
	(as well as the definition of 1 + 2 * 3 as an example).    
*)

type exp =
	| EInt of int
  	| EAdd of exp * exp
  	| EMul of exp * exp

let example =
  	EAdd (EInt 1, EMul (EInt 2, EInt 3))

(* Write the expression 2 * 2 + 3 * 3 in a variable my_example *)

let my_example = EAdd ((EMul (EInt 2, EInt 2)), (EMul (EInt 3, EInt 3)));;

(* 
	Write a function eval : exp -> int that computes the value of an arithmetic expression. 
	The evaluation rules are:

		1. If the expression is an integer x, the evaluation is x.

		2. If the expression is lhs + rhs and lhs evaluates to x and rhs evaluates to y, 
		then the evaluation is x + y.

		3. If the expression is lhs * rhs and lhs evaluates to x and rhs evaluates to y, 
		then the evaluation is x * y.
*)

let eval expression = 
	let rec aux = function
		| EInt x 	 	-> x
		| EAdd (e1, e2) -> (aux e1) + (aux e2)
		| EMul (e1, e2) -> (aux e1) * (aux e2)
	in aux expression;;

(*
	If an expression is of the form a * b + a * c then a * (b + c) is a factorized equivalent expression.
	Write a function factorize : exp -> exp that implements this transformation on its input exp if it 
	has the shape a * b + a * c or does nothing otherwise.  
*)

let factorize expression =
	match expression with
		| EInt _ 		-> expression
		| EMul (e1, e2) -> expression
		| EAdd (e1, e2) -> 
			match (e1, e2) with
				| (EMul (e3, e4), EMul (e5, e6)) ->
					if (eval e3) = (eval e5) then
						EMul (e3, EAdd (e4, e6))
					else EAdd (e1, e2)
				| _ -> expression;;

(* 
	Write the reverse transformation of factorize, expand : exp -> exp, which turns an expression of 
	the shape a * (b + c) into a * b + a * c. 
*)

let expand expression =
	match expression with
		| EInt _ 		-> expression
		| EAdd (e1, e2) -> expression
		| EMul (e1, e2) -> 
			match e2 with
				| EAdd (e3, e4) ->
					EAdd (EMul (e1, e3), EMul (e1, e4))
				| _ -> expression;;

(*
	Implement a function simplify: exp -> exp which takes an expression e and:

	    1. If e is of the shape e * 0 or 0 * e, returns the expression 0.
	    2. If e is of the shape e * 1 or 1 * e, returns the expression e.
	    3. If e is of the shape e + 0 or 0 + e, returns the expression e. 

	and does nothing otherwise. 
*)

let simplify expression = 
	match expression with
		| EInt _		-> expression
		| EAdd (e1, e2) -> 
			let v1 = eval e1 in
			let v2 = eval e2 in
				if v1 = 0 then e2
				else if v2 = 0 then e1
				else expression 
		| EMul (e1, e2) ->
			let v1 = eval e1 in
			let v2 = eval e2 in
				if v1 = 0 || v2 = 0 then EInt 0
				else if v1 = 1 then e2
				else if v2 = 1 then e1 
				else expression;;	