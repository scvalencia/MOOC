let log2int n =
	let count = ref 0 and v = ref n in

	while !v > 1 do
		count := !count + 1;
		v := !v / 2
	done;

	!count

let read_int () = int_of_string (read_line())

let read_intlist () =
	let l = ref [] in 
	let doread () = 
		try
			while true do
				l := (read_int ()) :: !l
			done
		with _ -> ()
	in
		doread();
		List.rev !l