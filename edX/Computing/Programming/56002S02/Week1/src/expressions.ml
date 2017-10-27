let x = Random.int 9 + 1;;

let x_power_8 = 
	
	let rec foo =
		function
			| 8 -> 1
			| y -> x * (foo (y + 1))
	
in foo 0;;

let multiple_of n d = n mod d = 0;;

let integer_square_root1 n = 
	int_of_float (sqrt (float_of_int n));;

let last_character str = 
	String.get str (String.length str - 1);;

let string_of_bool truth =
	if truth then "true" else "false";;

let integer_square_root2 n =
	let rec solver r =
		if r * r <= n then r else solver (r - 1)
in solver n;;

let rec gcd a b =
	if b = 0 then a
	else gcd b (a mod b);;

let multiple_upto n r =
	let min_bound = 2 
	in 
		let max_bound = r
		in
			let rec solver d =
				if d > max_bound then false
				else if n mod d = 0 then true
				else solver (d + 1)

in solver min_bound;;

let is_prime n = 
	let man_bound = int_of_float (sqrt (float_of_int n))
in 
	if n = 1 then false else 
	not (multiple_upto n man_bound);;