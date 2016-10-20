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