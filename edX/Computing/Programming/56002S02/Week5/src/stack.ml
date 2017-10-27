(* Implementing a stack with an array *)


(*
	In this exercise, we will encode imperative stacks of ints using the type stack = int array as defined in 
	the prelude.

	We will use the first cell (cell 0) to store the number of items in the stack. Then the cells of the array 
	starting from 1 will be used to store the elements in the stack. The bottom element of the stack will be 
	stored at position 1.

	The stack will thus have a maximum capacity, being the length of the array minus one.

	    * An empty stack of capacity 4 would match the following pattern:
	    [| 0 ; _ ; _ ; _ ; _|]

	    * A stack of capacity 4 containing 1 at the bottom, then 2 and then 3 at the top would match the 
	    following pattern:
	    [| 3 ; 1 ; 2 ; 3 ; _|]
*)

type stack = int array
exception Full
exception Empty

(* Define a function create : int -> stack that creates a new stack of the given maximum capacity. *)

let create size = Array.init (size + 1) (fun _ -> 0)

(* 
	Define a function push : stack -> int -> unit that adds an element as the top of the stack.
	The function must fail with the exception Full given in the prelude if nothing can be added to the stack. 
*)

let push (buf : stack) elt =
	let size = Array.length buf in
	let capacity = size - buf.(0) - 1 in
	if capacity < 1 then raise Full
	else
		buf.(0) <- buf.(0) + 1;
		buf.(size - capacity) <- elt

(* 
	Define a function append : stack -> int array -> unit that adds an array of integers as the top of the stack. 
	The first element of the array must be at the top of the stack, the others in order, up to the last element, 
	which will be the lowest in the stack. In other words, the last element of the array should be pushed first, etc.
	The function must fail with the exception Full given in the prelude if some elements could not fit in the stack.
	But in this case, it should still fill the stack with as many elements as possible. 
*)

let append buf arr = 
	let size = Array.length arr in
	for i = size - 1 downto 0 do
		push buf (arr.(i))
	done

(*
	Define a function pop : stack -> int that takes an element as the top of the stack, removes it from the stack, 
	and return it. The function must fail with the exception Empty given in the prelude if nothing can be taken 
	from the stack.
*)

let pop (buf : stack) = 
	let items = buf.(0) in
	if items = 0 then raise Empty
	else buf.(0) <- buf.(0) - 1; buf.(items)
