type int_list = Nil | Element of int * int_list;;

let ml = Element(5, Element(7, Element(8, Nil)));;

let rec custom_length = function
	| Nil          	  	-> 0
	| Element(x, rest) 	-> 1 + custom_length rest;;

let rec length = function
	| [] 	-> 0
	| x::xs -> 1 + length xs;;

let l = [1;2;4;0;8;9;6];;

let rec rev1 = function 
	| []	-> []
	| x::xs	-> rev1 xs @ [x];;

let rev = 
	let rec rev_aux accum = function
		| []	-> accum
		| x::xs -> rev_aux (x::accum) xs

	in rev_aux [];;

let rec set_of_sorted_list = function
	| []		-> []
	| [x]		-> [x]
	| x::x'::xs -> 
		if x = x' then
			set_of_sorted_list (x'::xs)
		else
			x :: set_of_sorted_list(x'::xs);;

(*
	Write a function mem : int -> int list -> bool such that mem x l is true 
	if and only if x occurs in l. 
*)

let rec mem e l =
	match l with
		| [] 	-> false
		| x::xs -> 
			if x = e then true 
			else mem e xs 

(* 
	Write a function append : int list -> int list -> int list such that append l1 l2 
	is the concatenation of l1 and l2. 
*)

let rec append l1 l2 = 
	match l2 with 
		| []    -> l1
		| x::xs -> append (l1 @ [x]) xs;;

(*
	Write a function combine : int list -> int list -> (int * int) list such that combine l1 l2 
	is the list of pairs obtained by joining the elements of l1 and l2. This function assumes 
	that l1 and l2 have the same length. For instance, combine [1;2] [3;4] = [(1, 3); (2, 4)]. 
*)

let rec combine l1 l2 = 
	match l1 with
		| []	-> []
		| x::xs ->
			match l2 with
				| [] 	-> []
				| y::ys -> (x, y) :: combine xs ys;;

(*
	Write a function assoc : (string * int) list -> string -> int option such that 
	assoc l k = Some x if (k, x) is the first pair of l whose first component is k. 
	If no such pair exists, assoc l k = None. 
*)

let rec assoc l k =
	match l with 
		| []			-> None
		| (x1, x2)::xs 	-> 
			if x1 = k then 
				Some(x2)
			else assoc xs k;;