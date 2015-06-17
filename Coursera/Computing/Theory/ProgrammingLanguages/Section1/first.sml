(* This is a comment, this is our first program *)

val x = 34;
(* Static enviroment: x : int *)
(* Dynamic enviroment: x -> 24 *)
val y = 17;

(* Static enviroment: x : int, y : int *)
(* Dynamic enviroment: x -> 24, y -> 17 *)

val z = (x + y) + (y + 2); (* Just can use earlier bindings *)
(* Static enviroment: x : int, y : int, z : int *)
(* Dynamic enviroment: x -> 24, y -> 17, z -> 70 *)

val q = z + 1;
(* Static enviroment: x : int, y : int, z : int , q : int *)
(* Dynamic enviroment: x -> 24, y -> 17, z -> 70, q -> 71 *)


(* Conditional expressions *)
val abs_of_z = if z < 0 then 0 - z else z;
	(* Static enviroment: x : int, y : int, z : int , q : int, abs_of_z : int *)
(* Dynamic enviroment: x -> 24, y -> 17, z -> 70, 
q -> 71, abs_of_z -> 70 *)

val abs_of_z_simpler = abs z;

(*
	val x = e
	val x : t = e	
*)

val a = 10;

(*
	a : int
	a -> 10	
*)

val b = a * 2;

(*
	b : int
	b -> 20	
*)

val a = 5;

(*
	a : int
	a -> 5	
*)

val c = b;

(*
	c : int
	c -> 10	
*)

val d = a;

(*
	d : int
	a -> 5	
*)

val a = a + 1;

(*
	a : int
	a -> 6	
*)