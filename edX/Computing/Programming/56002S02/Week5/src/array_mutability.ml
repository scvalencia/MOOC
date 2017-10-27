let cubes n = Array.init n (fun i -> i * i * i)

let sqrti n = truncate (sqrt (float n))

let issquare n = let s = sqrti n in s * s = n

let squarecubes n =
	let c = cubes n in

	for i = 0 to n - 1 do

		if issquare c.(i) then begin
			print_int c.(i);
			print_string " "
		end

	done;

	print_string "\n"

let a = [|0;1;2;3;4|]

let _ = a.(0) <- 100

let rotate a = 
	let n = Array.length a in
	if n = 0 then () else 
		let v = a.(0) in

		for i = 0 to n - 2 do
			a.(i) <- a.(i + 1)
		done;

		a.(n - 1) <- v

let rotate_by a n =
	for i = 0 to n do
		rotate a
	done;