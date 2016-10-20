let p = [| 1; 2; 3 |];;

let primes = Array.make 5 false;;

let square x = x * x;;

let squares n = Array.init n square;;

let s1 = squares 5;;

let s2 = squares 10;;

let n = Array.length s2;;

let e1 = s2.(0);;
let e2 = s2.(1);;
let e3 = s2.(2);;
let e4 = s2.(3);;
let e5 = s2.(4);;
let e6 = s2.(5);;

let swap a = [| a.(1); a.(0) |];;

let b = swap [| 2; 1 |];;

(* Exercises *)

let min a =
	let rec min_solve current index =

		if index = Array.length a then
			current
		else if a.(index) < current then
			min_solve a.(index) (index + 1)
		else 
			min_solve current (index + 1)

	in min_solve a.(0) 0;;

let min_index a = 
	let rec min_solve min min_idx idx =

		if idx = Array.length a then
			min_idx 
		else if a.(idx) < min then
			min_solve a.(idx) idx (idx + 1)
		else
			min_solve min min_idx (idx + 1)

	in min_solve a.(0) 0 0;;

let is_sorted a =
	let rec sorted current idx =
		if idx = Array.length a then
			true
		else if (String.compare a.(idx) current) = 1 then
			sorted a.(idx) (idx + 1)
		else
			false
	in 
		if Array.length a = 0 then true
		else sorted a.(0) 1;;

let find dict word = 
	let rec binary_search low high = 
		if low > high then (-1)
		else
			let mid = (low + high) / 2 in
			let value = dict.(mid) in
				if value = word then mid
				else if (String.compare value word) = (-1) then
					binary_search (mid + 1) high
				else
					binary_search low (mid - 1)
	in binary_search 0 ((Array.length dict) - 1);;
