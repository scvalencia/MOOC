(*
	 Optimizing partial applications 

	Every triangle has a circumscribed circle, that is a circle that goes through the three points of 
	a given triangle. Trigonometry tells us that the radius of this circle is

	 	s / [2 * (cos(a/2) * cos(b/2) * cos(c/2)]

	where a, b and c are the angles of the triangle, and s is its circumference. 
*)

(*
	Define a function ccr: float -> float -> float -> float -> float that takes as arguments a, b, c and s, 
	and returns the radius of circumscribed circle as described above. 
*)

let ccr a b c s = 
	let dem = (2. *. cos (a /. 2.) *. 2. *. cos (b /. 2.) *. 2. *. cos (c /. 2.)) in
	s /. dem;;

let ccr2 a b c s =
  	let partial x = 2. *. cos(a /. 2.) in
  	let dem = partial a *. partial b *. partial c
	in s /. dem;;