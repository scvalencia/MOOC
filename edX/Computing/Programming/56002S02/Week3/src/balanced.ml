(*
	A binary tree t, of the 'a bt type given in the prelude, is either an empty tree, 
	or the root of a tree with a value and two children subtrees. 
*)

type 'a bt =
	| Empty
	| Node of 'a bt * 'a * 'a bt;;

let rec insert x = function
	| Empty			-> Node(Empty, x, Empty)
	| Node(l, y, r)	-> 
		if x = y then Node(l, y, r)
		else if x < y then Node(insert x l, y, r)
		else Node(l, y, insert x r);;

(*
	Write a function height : 'a bt -> int that computes the height of a tree.
*)

let rec height = 
	let max a b = if a > b then a else b in
	function
		| Empty			-> 0
		| Node(l, x, r)	->
			1 + max (height l) (height r);;

(*
	A tree is balanced if, for all internal node n, its two subtrees have the same height. 
	Write a function balanced : 'a bt -> bool that tells if a tree is balanced. 

	let balanced = function
	  | Empty					-> true
	  | Node(Empty, x, Empty)	-> true
	  | Node(Empty, x, r)		-> false
	  | Node(l, x, Empty) 	-> false
	  | Node(l, x, r)			->
	      height l = height r;;

*)

let rec balanced = function
	| Empty					-> true
	| Node(Empty, x, Empty)	-> true
	| Node(Empty, x, r)		-> false
	| Node(l, x, Empty) 	-> false
	| Node(l, x, r)			->
		balanced l && balanced r;;

let root : int bt = Empty;;
let tree = insert 7 (insert 5 (insert 6 root));;