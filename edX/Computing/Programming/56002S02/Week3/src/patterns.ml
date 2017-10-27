let remove_one_or_zero_from_head1 = function
	| 0::xs | 1::xs	-> xs 
	| l 			-> l;;

let remove_one_or_zero_from_head2 = function
	| (0 | 1) :: xs	-> xs 
	| l 			-> l;; 

let duplicate_head_at_the_end = function
	| []			-> []
	| (x::xs) as l 	-> l @ [x];;

let max a b = 
	match a, b with
		| a, b when a < b -> b
		| a, b 			  -> a

(*
	Advanced patterns

	Let's rewrite some pattern matching with advanced constructs. 
*)

type e = EInt of int | EMul of e * e | EAdd of e * e

(*
	Factorize the pattern matching of function simplify using or-patterns. 
	It should boil down to three cases. 

	let simplify = function
  		| EMul (EInt 1, e) -> e
  		| EMul (e, EInt 1) -> e
  		| EMul (EInt 0, e) -> EInt 0
  		| EMul (e, EInt 0) -> EInt 0
  		| EAdd (EInt 0, e) -> e
  		| EAdd (e, EInt 0) -> e
  		| e -> e
*)

let simplify = function
	| EMul (EInt 1, e) | EMul (e, EInt 1) | EAdd (EInt 0, e) | EAdd (e, EInt 0) | e	-> e
	| EMul (EInt 0, e) | EMul (e, EInt 0) 											-> EInt 0

(*
	The only_small_lists function takes a list as input and returns this list only if it contains two or 
	less elements, otherwise the empty list is returned. Rewrite this function using or-patterns and an 
	as-pattern. It should boil down to two cases. 

	let only_small_lists = function
	  	| [] -> []
	  	| [x] -> [x]
	  	| [x;y] -> [x;y]
	  	| _ -> []
*)

let only_small_lists = function
	| ([x] | [x;_]) as l 	-> l
	| _ 					-> []

(*
	Turn the third case of no_consecutive_repetition into two distinct cases, dropping the if construct in 
	favor of a when clause. 

	let rec no_consecutive_repetition = function
		| [] -> []
		| [x] -> [x]
		| x :: y :: ys ->
			if x = y then
				no_consecutive_repetition (y :: ys)
			else
				x :: (no_consecutive_repetition (y :: ys))
*)

let rec no_consecutive_repetition = function
	| x :: y :: ys when x = y 	-> no_consecutive_repetition (y :: ys)
	| x :: y :: ys when x <> y 	-> x :: (no_consecutive_repetition (y :: ys))
	| ([] | [_]) as l 			-> l;;