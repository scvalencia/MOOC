type 'a bst =
	| Empty
	| Node of 'a bst * 'a * 'a bst;;

let rec insert x = function
	| Empty			-> Node(Empty, x, Empty)
	| Node(l, y, r)	-> 
		if x = y then Node(l, y, r)
		else if x < y then Node(insert x l, y, r)
		else Node(l, y, insert x r);;

let rec find_max = function
	| Empty				-> assert false
	| Node(_, x, Empty)	-> x
	| Node(_, x, r) 	-> find_max r;;

let rec delete x = function
	| Empty			-> Empty
	| Node(l, y, r)	->
		if x = y then join l r
		else if x < y then Node(delete x l, y, r)
		else Node(l, y, delete x r)

and join l r =
	match l, r with
		| Empty, r 	-> r
		| l, Empty 	-> l
		| l, r 		->
			let m = find_max l in
			Node(delete m l, m, r);;

type contact = { name : string ; age : int };;

type database = contact bst;;

type int_bst = int bst;;

let root : int_bst = Empty;;

insert 7 (insert 5 (insert 6 root));;

