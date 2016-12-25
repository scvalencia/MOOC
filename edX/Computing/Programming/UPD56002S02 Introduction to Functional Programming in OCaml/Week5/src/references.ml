(* Simple uses of references *)

exception Empty

(* Define swap : 'a ref -> 'a ref -> unit that swaps the contents of two references. *)

let swap ra rb =
	let tp = ref !ra in
	ra := !rb; rb := !tp

(* 

	Define update : 'a ref -> ('a -> 'a) -> 'a that calls a function on the contents of a reference, updates 
	it with the result, and returns the old value. For instance let r = ref 6 in update r (function x -> x + 1) 
	should return 6 and set the reference to 7.  
*)

let update rf fn =
	let v = !rf in
	rf := fn !rf; v

(* 
	Define move: 'a list ref -> 'a list ref -> unit, that removes the top argument from the first list and puts 
	it on top of the second list. If the first list is empty, it should raise Empty.  
*)

let e1 = ref [1;2;3;6]

let e2 = ref [8;4;3;8;10]

let move l1 l2 =
	if !l1 = [] then raise Empty
	else
		let s1 = List.length !l1 in
		let v1 = List.nth !l1 (s1 - 1) in
		l2 := !l2 @ [v1]; l1 := List.tl !l1

(* 
	A common pattern is to use a reference to perform a computation in an imperative way, but to keep it in a 
	local definition, completely invisible from outside the function implementation.
	Define reverse: 'a list -> 'a list, that has a type and an observable behaviour that look like the ones of 
	a purely functional function, buf that use a reference internally to perform the computation. It takes a list, 
	and returns a copy of the list whose elements are in reverse order. The only functions you can call, 
	except from locally defined functions, are (!), (:=), ref, and move that you just defined. And you are 
	not allowed to use pattern matching.  
*)