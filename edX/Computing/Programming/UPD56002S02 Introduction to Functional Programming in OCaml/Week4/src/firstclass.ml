let rec apply f n x =
	if n <= 0 then x
	else apply f (n - 1) (f x);;

let compose f g = (function x -> f (g x));;

let value = apply (function x -> x + 1) 10 0;;

let composition = (compose (function x -> x + 1) (function x -> 2 * x)) 10;;

(*
	Using first class functions

	Write a function compose : ('a -> 'a) list -> ('a -> 'a) that takes as argument a list l of 
	functions, and that returns the function that is the composition of the functions in l. For instance, 

	compose [f;g;h] x = f (g (h x)). Or with concrete functions, 
	compose [(fun x -> x+1);(fun x -> 3*x);(fun x -> x-1)] 2 = 4. 
*)

let rec compose fs =
	match fs with
		| f::[]	-> (function a -> f a)
		| f::fs -> (function a -> f (compose fs a));;

(*
	Write a function fixedpoint : (float -> float) -> float -> float -> float that takes a 
	function f of type float -> float and two floating-point arguments start and delta. 
	The function fixedpoint applies repetitively f to the result of its previous application, 
	starting from start, until it reaches a value y where the difference between y and (f y) is smaller than delta. 
	In that case it returns the value of y. For instance, fixedpoint cos 0. 0.001 yields approximately 0.739
*)

let fixedpoint foo start delta = 
	let rec aux current =
		if ((foo current) -. current) < delta then
			current
		else aux (current +. delta)
	in aux start;;

(*
	Functions returning functions 

	The following function checks the pairwise equality of the elements of two lists, 
	on the common length of both lists: 

	let rec equal_on_common l1 l2 = 
		match l1, l2 with
			| [], _ 			-> true
			| _, [] 			-> true
			| h1::r1, h2::r2 	-> h1 = h2 && equal_on_common r1 r2

	Rewrite equal_on_common : 'a list -> 'a list -> bool by using nested function .. -> constructions. 
	Using the match .. with construction or tuple patterns is forbidden. You can (and must) only call the 
	operators && and =, and the function equal_on_common recursively. 
*)

let rec equal_on_common = fun l1 l2 -> 
	if l1 = [] && l2 = [] then true
	else if l1 = [] && l2 <> [] then true
	else if l2 = [] && l1 <> [] then true 
	else
		let h1, r1 = List.hd l1, List.tl l1 in
	    let h2, r2 = List.hd l2, List.tl l2 in

	    h1 = h2 && equal_on_common r1 r2;;

let rec equal_on_common = function l1 ->
	function l2 -> 
		(if l1 = [] || l2 = [] then true
		else 
			let h1, r1 = List.hd l1, List.tl l1 in
		    let h2, r2 = List.hd l2, List.tl l2 in

		    h1 = h2 && equal_on_common r1 r2);;