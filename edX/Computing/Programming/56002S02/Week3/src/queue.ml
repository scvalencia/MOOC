(* 
	 A queue is a standard FIFO data structure. See wikipedia

	In this exercise, we implement a queue with a pair of two lists (front, back) 
	such that front @ List.rev back represents the sequence of elements in the queue. 
*)

type queue = int list * int list

(*
	Write a function is_empty : queue -> bool such that is_empty q is true 
	if and only if q has no element. 
*)

let is_empty (front, back) =
	match (front, back) with
		| ([], []) -> true
		| (_, _)   -> false;;

(*
	Write a function enqueue : int -> queue -> queue such that enqueue x q is the 
	queue as q except that x is at the end of the queue.  
*)

let enqueue x q =
	match q with 
		| ([], []) -> ([], [x])
		| (xs, []) -> (xs, [x])
		| (ws, ys) -> (ws, x::ys);;

(* 
	Write a function split : int list -> int list * int list such that 
	split l = (front, back) where l = back @ List.rev front 
	and the length of back and front is List.length l / 2 or List.length l / 2 + 1
*)

let split l =
	let len = List.length l in
	let mid = len / 2 - 1 in
	let rec aux front back idx aux_lst =
		match aux_lst with
			| [] 	-> (front, back)
			| x::xs ->
				if idx <= mid then
					aux (front @ [x]) back (idx + 1) xs
				else
					aux front (back @ [x]) (idx + 1) xs
	in aux [] [] 0 l;;

(*
	Write a function dequeue : queue -> int * queue such that dequeue q = (x, q') 
	where x is the front element of the queue q and q' corresponds to remaining elements. 
	This function assumes that q is non empty
*)

let dequeue q = 
	match q with 
		| ([], x::xs) -> (x, ([], xs))
		| (x::xs, ys) -> (x, (xs, ys));;


