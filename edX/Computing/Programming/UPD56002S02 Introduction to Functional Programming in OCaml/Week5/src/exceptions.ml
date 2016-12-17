exception Empty_List

let head = function
	h::_ -> h
	| [] -> raise Empty_List

exception Zero

let rec multl = function
	[]		-> 1
	| x::xs -> if x = 0 then 0 else x * (multl xs)

let multlexc l =
	let rec aux = function 
		[]		-> 1
		| x::xs -> 	if x = 0 then raise Zero 
					else x * (aux xs)
	in 
		try aux l with Zero -> 0
