let rec map f = function
	| []	-> []
	| x::xs	-> (f x) :: (map f xs);;

let rec map2 f l1 l2 = 
	match (l1, l2) with
		| [], []		-> []
		| x::xs, y::ys	-> (f x y) :: (map2 f xs ys)
		| _				-> raise (Invalid_argument "List.map2");;

(* Matrices *)

let vsum = map2 (+);;
let val1 = vsum [1;2;3] [1;2;3];;

let msum = map2 (map2 (+));;
let val2 = msum [[1;2];[3;4]] [[10;20];[30;40]];

(*
	let a = [[2;3];[6;7;8]]
	a @ (map (function x -> 3::x) a) =>
		[[2; 3]; [6; 7; 8]; [3; 2; 3]; [3; 6; 7; 8]]
*)

let rec sublists = function
  	| [] 	-> [[]]
  	| h::r 	->
      	let rp = sublists r in 
		rp @ (List.map (function l -> h::l) rp);;