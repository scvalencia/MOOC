let exchange k = 
	(k mod 10) * 10 + (k / 10);;

let is_valid_answer (grand_father_age, grand_son_age) =
	grand_son_age * 4 = grand_father_age
	&& 3 * exchange grand_father_age = exchange grand_son_age;;

let find answer = 
	let rec solve answer =
		let (max_grand_father_age, min_grand_son_age) = answer 
		in
			if min_grand_son_age * 4 > max_grand_father_age  then 
				(-1, -1)
			else if is_valid_answer answer then 
				answer
			else
				let 
					recursion_father = solve (max_grand_father_age - 1, min_grand_son_age)
				in 
					if is_valid_answer recursion_father then
						recursion_father
					else
						solve (max_grand_father_age, min_grand_son_age + 1)
	in solve answer;;