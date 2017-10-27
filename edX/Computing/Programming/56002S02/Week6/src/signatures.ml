module type NAT = sig
	(* An abstract type *)
	type tau 
	val zero : tau
	val succ : tau -> tau
	val pred : tau -> tau	
end

module Natural : NAT = struct
	type tau = int

	let zero = 0
	let succ n = if n = max_int then 0 else n + 1
	let pred = function 0 -> 0 | n -> n - 1
end

let rec add : Natural.tau -> Natural.tau -> Natural.tau = fun x y ->
	if x = Natural.zero then y else succ (add (pred x) y)

let break_the_abstraction = pred (-1)