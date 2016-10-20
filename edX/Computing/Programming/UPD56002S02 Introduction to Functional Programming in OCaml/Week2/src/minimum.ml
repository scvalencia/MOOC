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