open List

let a = length [1;2;3;4]

module Stack = struct
	type 'a t = 'a list

	let empty = []
	let push x s = x :: s
	let pop = function
		| []	-> None
		| x::xs	-> Some(x, xs)
end

let s = Stack.empty

let s' = Stack.push 1 s

let x, s'' = 
	match Stack.pop s' with
		| None			-> assert false
		| Some (x, s)	-> (x, s)

let r = Stack.pop s

module S = struct

	let g = 2

	module F = struct
		let f = 1
	end

end

let b = S.g
let c = S.F.f

module Forest = struct
	type 'a forest = 'a list

	module Tree = struct
		type 'a tree = Leaf of 'a | Node of 'a tree forest
	end
end