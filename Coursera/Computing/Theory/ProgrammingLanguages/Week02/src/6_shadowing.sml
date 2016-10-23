(* Programming Languages, Dan Grossman *)
(* Section 1: Examples to Demonstrate Shadowing *)

val a = 10

val b = a * 2

val a = 5

val c = b

val d = a

val a = a + 1

(* next line does not type-check, f not in environment *)
(* val g = f - 3  *)

val f = a * 2

(*
	val a = <hidden-value> : int
	val b = 20 : int
	val a = <hidden-value> : int
	val c = 20 : int
	val d = 5 : int
	val a = 6 : int
	val f = 12 : int
	val it = () : unit
*)

