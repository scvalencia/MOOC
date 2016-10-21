(* 
	The previous week, we asked you the following question: Consider a non empty 
	array of integers a, write a function min_index : int array -> int 
	that returns the index of the minimal element of a.

	As the arrays contain integers and the indices of arrays are also represented 
	by integers, you might have confused an index and the content of a cell. 

	To avoid such a confusion, let us define a type for index (given in the prelude below).

	This type has a single constructor waiting for one integer.

	For instance, if you want to represent the index 0, use the value Index 0.
	Defining such a type is interesting because it allows the type-checker to 
	check that an integer is not used where an index is expected (or the converse).   
*)

(* 
	Write a function read : int array -> index -> int such that read a (Index k) 
	returns the k-th element of a.  
*)

type index = Index of int;;

let identity x = x;;

let arr = Array.init 10 identity;;

let read a idx =
	match idx with
		| Index(0) -> a.(0)
		| Index(n) -> a.(n);;

(*
	Write a function inside : int array -> index -> bool such that 
	inside a idx is true if and only if idx is a valid index for the array a. 	
*)

let inside a idx =
	let max_bound = Array.length a in
	match idx with
		| Index(0) -> true
		| Index(n) ->
			if n < 0 then false
			else if n < max_bound then true
			else false;;

(*
	Write a function next : index -> index such that next (Index k) is 
	equal to Index (k + 1).
*)

let next idx =
	match idx with 
		| Index(n) -> Index(n + 1);;

(*
	Consider a non empty array of integers a, write a function 
	min_index : int array -> index that returns the index of the minimal element of a. 
*)

let min_index arr = 
	let rec aux min min_idx idx =

		if idx = Array.length arr then
			min_idx
		else 
			let current = (read arr (Index(idx))) in
				if current < min then
					aux current (Index(idx)) (idx + 1)
				else 
					aux min min_idx (idx + 1)

	in aux arr.(0) (Index(0)) 0;;