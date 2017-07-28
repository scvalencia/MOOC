type ltable = (string * string list) list

(*

	Write a function words : string -> string list that takes a sentence and returns the list of its words. 
	As a first approximation, will work on single sentences in simple english, so you can consider sequences 
	of roman letters and digits as words, and everything else as separators. If you want to build words bit 
	by bit, you can experiment with the Buffer module. Beware, this preliminary function may not be as easy 
	as it seems.

*)

(*
	"fdfdsf sdfsdfs, dsgdsd"
	"fdfdsf sdfsdfs,             dsgdsd 323 323..... 2323"
	"fdfdsf sdfsdfs, dsgdsd. 232323. wdwdwd"
	"fdfdsf sdfsdfs, dsgdsd. egregergree 345 64 fdvdf"
*)


let words str = 
	let valid ch = (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || (ch >= '0' && ch <= '9') in
	let parse = ref [] in
	let size = String.length str in
	let current_word = ref [] in

	for i = 0 to size - 1 do
		let ch = String.get str i in
		if valid ch then (print_char ch; print_newline (); current_word := !current_word @ [ch])
		else begin
			parse := !parse @ [!current_word];
			current_word := [];

		end
	done;

	parse


let words' str = 
	let valid ch = (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || (ch >= '0' && ch <= '9') in

    let size = String.length str in

    let rec explode xs n = match n with
        | -1   -> xs
        | _    -> explode ((String.get str n) :: xs) (n - 1) in 

    let parse = explode [] (size - 1) in

	let rec aux buffer parse acc = match parse with
		| []		-> acc
		| p :: ps'	-> 
			if valid p then aux (p :: buffer) ps' acc
			else aux [] ps' (buffer :: acc)

	in aux [] parse []
