(*
	An implementation of list with an efficient concatenation

	Concatenating two standard OCaml lists takes a time proportional to the length of the first list. 
	In this exercise, we implement a data structure for lists with a constant time concatenation.

	The preludes gives a type 'a clist, which is either a single element of type 'a, the concatenation of 
	two 'a clist or an empty 'a clist.

	This representation of a list is not linear: it is a tree-like datastructure since the CApp constructor 
	contains two values of type 'a clist.
	
	The sequence of elements contained in a value of type 'a clist is obtained by a depth-first traversal 
	of the tree. For instance, the example given in the prelude, of type int clist is a valid representation 
	for the sequence [1;2;3;4]. 

*)

type 'a clist =
  	| CSingle of 'a
  	| CApp of 'a clist * 'a clist
  	| CEmpty;;

let example = 
	CApp (CApp (CSingle 1, CSingle 2), CApp (CSingle 3, CApp (CSingle 4, CEmpty)));;

(*
	Write a function to_list : 'a clist -> 'a list which computes the 'a list that contains the same elements 
	as the input 'a clist, in the same order. 
*)

let rec to_list = function
	| CSingle(x)		-> [x]
	| CApp(x, CEmpty)	-> to_list x
	| CApp(CEmpty, x)	-> to_list x
	| CApp(x, y)		-> to_list x @ to_list y
	| CEmpty			-> [];;

(*
	Write a function of_list : 'a list -> 'a clist which computes the 'a clist that contains the same elements 
	as the input 'a list, in the same order. 
*)

let rec of_list = function
	| []		-> CEmpty
	| [x]		-> CSingle x
	| x::y::xs	-> CApp (CApp (CSingle x, CSingle y), (of_list xs));;

(*
	Write a function append : 'a clist -> 'a clist -> 'a clist such that:

	    append CEmpty l = append l CEmpty = l
	    append l1 l2 = CApp (l1, l2) otherwise
*)

let append cslist1 cslist2 =
	match cslist1, cslist2 with
		| CEmpty, x	-> x
		| x, CEmpty	-> x
		| x, y		-> CApp(x, y);;

(*
	Write a function hd : 'a clist -> 'a option that returns Some x where x is the first element of the input 
	'a clist, if it is not empty, and returns None otherwise. 
*)

let rec hd = function
	| CEmpty			-> None
	| CSingle(x) 		-> Some x
	| CApp(x, CEmpty)	-> hd x
	| CApp(CEmpty, x)   -> hd x
	| CApp(x, y)		-> hd x;;

(*
	Write a function tl : 'a clist -> 'a clist option that returns Some l where l is the input sequence without 
	its first element, if this input sequence is not empty, or returns None otherwise. 
*)

let tl = function
	| CEmpty			-> None
	| CSingle(x) 		-> Some (CEmpty)
	| CApp(x, CEmpty)	-> Some (CEmpty)
	| CApp(CEmpty, x)   -> Some (CEmpty)
	| CApp(x, y)		-> Some y;;