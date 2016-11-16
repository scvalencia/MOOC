let rec fold_right f l b = 
	match l with
		| []	-> b
		| x::xs	-> f x (fold_right f xs b);;

let values = [1;2;3;4;5;6]

let identity = fold_right (fun x y -> x::y) values [];;

let summation = fold_right (fun x y -> x + y) values 0;;

let product = fold_right (fun x y -> x * y) values 1;;

let concat = fold_right (fun x y -> x::y);;

let c = concat values values;;

let rec fold_left f a l =
	match l with 
		| []	-> a
		| x::xs	-> fold_left f (f a x) xs;;

let reverse = fold_left (fun x y -> y::x) [];;

let rev = reverse values;;

let inner_product v1 v2 =
	fold_right (+) (List.map2 (fun x y -> x * y) v1 v2) 0;;

let inner = inner_product [2;4;6] [1;3;5];;

let countif predicate xs =
	List.fold_left 
		(fun counter item -> if predicate item then counter + 1 else counter) 0 xs;;


(*
	Using fold to produce lists

	The idea of this exercise is to write functions that iterate on lists, using the fold_left and fold_right 
	functions from the List module. 
*)

(*
	Write a function filter : ('a -> bool) -> 'a list -> 'a list that takes a predicate p 
	(a function returning a boolean) and a list l and returns all the elements of l that satisfy p 
	(for which p returns true). 
*)

let rec range a b =
	if a <= b then a::(range (a + 1) b)
	else [];;

let rec filter predicate xs =
	match xs with
		| []	-> []
		| x::xs	-> 
			let rest = filter predicate xs in
			if predicate x then x::rest
			else rest;;

let evn = function x -> x mod 2 = 0;;

let evns = filter evn (range 0 10);;

(*
	Define, using List.fold_right, a function partition : ('a -> bool) -> 'a list -> 'a list * 'a list 
	that takes a predicate p and a list l, and that partitions l by p. It returns a pair of two lists (lpos,lneg), 
	where lpos is the list of all elements of l that satisfy p, and lneg is the list of all elements that do not 
	satisfy p. 
*)

let partition predicate xs =
	List.fold_right (fun x (lpos, lneg) ->
						if predicate x then (x::lpos, lneg)
						else (lpos, x::lneg)) xs ([], []);;

let test = partition evn (range 0 10);;

(*
	One way of sorting a list is as follows:

    The empty list is already sorted.
    If the list x::xs has a head x and a rest xs, then a sorted version of x::xs can be obtained in three parts:
        first a sorted version of all elements of xs that are smaller or equal to x,
        then x,
        then a sorted version of all elements of xs that are greater than x.

	Write a function sort:'a list-> 'a list that implements this algorithm, using the function partition of 
	the previous question. This sorting algorithm is also known as Quicksort where the pivot is always the first 
	element of the list.
*)

let rec sort xs = 
	match xs with	
		| []	-> []
		| x::xs	-> 
			let predicate = (function y -> y <= x) in
			let left, right = partition predicate xs in

			(sort left) @ [x] @ (sort right);;

(*
	Using fold to check predicates
*)

(*
	Using List.fold_left, write a function for_all : ('a -> bool) -> 'a list -> bool. 
	It takes as argument a list l of type 'a list, and a predicate p of type 'a -> bool. 
	It must return true if and only if all elements of l satisfy the predicate p. 
*)

let for_all predicate xs =
	List.fold_left (fun x y -> x && (predicate y)) true xs;;

(*
	Using List.fold_left, write a function exists : ('a -> bool) -> 'a list -> bool. 
	It takes as argument a list l of type 'a list, and a predicate p of type 'a -> bool. 
	It must returns true if at least one element of l satisfies the predicate p. 
*)

let exists predicate xs =
	List.fold_left (fun x y -> x || (predicate y)) false xs;;

(*
	Write a function sorted : ('a -> 'a -> int) -> 'a list -> bool, using List.fold_left that checks that a 
	list of elements l of type 'a is sorted, according to an ordering function cmp of type 'a -> 'a -> int.

	The ordering function returns:

	    1 (or any positive number) if the first element is greater than the second,
	    -1 (or any negative number) if the first element is lesser than the second,
	    and 0 otherwise.

	For the fold_left part, you can use the type 'a option as the accumulator: at each iteration of fold_left, 
	if the list if sorted until now, the acccumulator is either Some v, where v is the previous element, 
	or None otherwise.

	Remember, the empty list is sorted, so you can use the list with at least one element to check using 
	fold_left. 
*)

let cmp x y = 
	if x > y then 1
	else if y < x then (-1)
	else 0;; 

let sorted cmp xs = 
	let rec sorted_map = function
		| [] | [_]				-> [true]
		| y1::((y2::ys) as l)	-> ((cmp y1 y2) < 1) :: (sorted_map l)
	in
		List.fold_left (fun x y -> x && y) true (sorted_map xs);;