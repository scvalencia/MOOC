module Exp = struct

	type e = EMul of e * e | EAdd of e * e | EInt of int

	let int x = EInt x

	let mul a b = match a, b with
		| EInt 0, _ | _, EInt 0		-> EInt 0
		| EInt 1, e | e, EInt 1		-> e
		| e, e'						-> EMul (e, e')

	let add a b = match a, b with
		| EInt 0, e | e, EInt 0		-> e
		| e, e'						-> EAdd (e, e')

	let rec eval = function
		| EInt e 		-> e
		| EAdd (e, e')	-> eval e + eval e'
		| EMul (e, e')	-> eval e * eval e'
	
end

let expression x y z =
	Exp.int (Exp.eval (Exp.mul (Exp.int x) (Exp.add (Exp.int y) (Exp.int z))))