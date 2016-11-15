(*
	Lambda-expressions as values

	In this exercise, we will define functions as values, also called lambda expressions, using the keyword 
	function to do a pattern-matching on their argument. As a result, you are not allowed to use match ... 
	with in your code.
*)

(*
	Define a function last_element: 'a list -> 'a that returns the last element of a list. 
	Your function may return (invalid_arg "last_element") when the list is empty. 
*)

let rec last_element = function
	| []	-> invalid_arg "last_element"
	| [x]	-> x
	| _::xs	-> last_element xs;;

(*
	Write a function is_sorted: 'a list -> bool that takes a list l as argument, and that checks that the 
	list is sorted in increasing order according to the polymorphic comparison operator <. 
*)

let rec is_sorted = function
	| x::y::[]			-> x < y
	| x::((y::xs) as l)	-> (x < y) && is_sorted l
	| ([]|[_])			-> true;;

let foo = fun n x -> n + x;;

(* foo 7 8 or (foo 7) 8 *)

let aux = function n -> (function x -> n + x);;

