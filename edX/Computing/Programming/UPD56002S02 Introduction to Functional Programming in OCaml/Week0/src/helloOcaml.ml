(* Lists *)

let empty = [];;

print_int 4;;
print_string "\n";;

let rec suml = 
	function
		| []      -> 0
	  	| a::rest -> a + (suml rest);;

let rec fold op e = 
	function 
		| [] 		-> e 
	  	| x::xs -> op x (fold op e xs);;

print_int (suml [1;2;3;4;5;6;7;8;9;10]);;
print_string "\n";;

print_int (fold ( + ) 0 [1;2;3;4;5;6;7;8;9;10]);;
print_string "\n";;

print_int (fold ( * ) 1 [1;2;3;4;5;6;7;8;9;10]);;
print_string "\n";;

print_int (fold (fun (x, y) a -> x + a) 0 [(2, 4); (3, 5)]);;
print_string "\n";;

print_string (fold ( ^ ) "" ["Hello"; " "; "World"; "!"]);;
print_string "\n";;

(* Removes all consecutive dupicates from a list *)

let rec destrutter =
	function
		| []		 	 -> []
		| x :: [] 	 	 -> x :: []
		| x :: y :: rest ->
			if x = y then destrutter(y :: rest)
			else x :: destrutter(y :: rest);;

destrutter [1;1;2;2;3;2;2;4;4;6;7;8;8];;

let xor = 
	function 
		| (false, false) -> false
		| (false, true)  -> true
		| (true, false)  -> true
		| (true, true)   -> false
