let example =

	let str = read_line() in

	let num = try Some (int_of_string str) with _ -> None in

	match num with
			| Some v	-> print_int v; print_string "\n"
			| None		-> print_string "None"; print_string "\n"


(* 
	Write a function print_int_list : int list -> unit that takes a list of integers as input, and prints all 
	the elements of the list, each on its own line. 
*)

let rec print_int_list (is : int list) = 
	match is with
		| [] 		-> ()
		| i::is' 	-> print_int i; print_newline (); print_int_list is'

(*
	Write a function print_every_other : int -> int list -> unit that takes a value k and a list of integers as 
	input, and prints the elements of the list that are in positions multiple of k, each on its own line. 
	Note: the first element of a list is at the position 0, not 1. 
*)

let print_every_other k xs =
	let size = List.length xs in
	let rec aux idx = 
		if (idx < size) then (print_int (List.nth xs idx); print_newline (); aux (idx + k)) 
		else ()
	in aux k

(*
	Write a function print_list : ('a -> unit) -> 'a list -> unit that takes a printer of values of some 
	type 'a and a list of such values as input, and prints all the elements of the list, each on its own line. 
*)

let rec print_list printer xs =
	match xs with
		| []		-> ()
		| x::xs'	-> printer x; print_newline (); (print_list printer xs')

