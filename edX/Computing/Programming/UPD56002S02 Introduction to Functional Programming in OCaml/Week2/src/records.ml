type point2D = { x : int; y : int };;

let origin = { x = 0; y = 0};;

let from_tuple (x, y) = { x; y };;

let a : point2D = from_tuple (4, 2);;

let b : point2D = from_tuple (10, 5);;

type box = {
	left_upper_corner  : point2D;
	right_upper_corner : point2D;
};;

let the_box : box = {
	left_upper_corner = a;
	right_upper_corner = b;
};;

(* Exercise *)

type point = { x : float; y : float; z : float };;
type dpoint = { dx : float; dy : float; dz : float };;
type physical_object = { position : point; velocity : dpoint };;

let move p dp =
	{ x = (p.x +. dp.dx); y = (p.y +. dp.dy); z = (p.z +. dp.dz) };;

let next obj = 
	{ position = move obj.position obj.velocity; velocity = obj.velocity};;

let will_collide_soon p1 p2 =
	let np1 = next p1 in
	let np2 = next p2 in 
	let dx = np1.position.x -. np2.position.x in
	let dy = np1.position.y -. np2.position.y in 
	let distance = sqrt(dx ** 2.0 +. dy ** 2.0) in
	distance < 2.0;;


(* 
	On planet Shadokus, a year has 5 months, each month has 4 days, 
	each day has 3 hours and each hour has 2 minutes. 
	A calendar date is therefore defined as the record 
	type date of the given prelude. 
*)

type date = { 
	year : int; month : int; day : int;
    hour : int; minute : int 
};;

let the_origin_of_time = { 
	year = 1; month = 1; day = 1;
	hour = 0; minute = 0 
};;

let wellformed date = 
	let year = date.year in
	let month = date.month in
	let day = date.day in
	let hour = date.hour in
	let minute = date.minute in

		year >= 1 && (month >= 1 && month <= 5) && 
		(day >= 1 && day <= 4) && (hour >= 0 && hour <= 2) &&
		(minute >= 0 && minute <= 1);;

let next date = 
	let year = date.year in
	let month = date.month in
	let day = date.day in
	let hour = date.hour in
	let minute = date.minute in

		if wellformed { year = year; month = month; day = day; hour = hour; minute = minute + 1 } then 
			{ year = year; month = month; day = day; hour = hour; minute = minute + 1 }
		else if wellformed { year = year; month = month; day = day; hour = hour + 1; minute = 0 } then 
			{ year = year; month = month; day = day; hour = hour + 1; minute = 0 }
		else if wellformed { year = year; month = month; day = day + 1; hour = 0; minute = 0 } then
			{ year = year; month = month; day = day + 1; hour = 0; minute = 0 }
		else if wellformed { year = year; month = month + 1; day = 1; hour = 0; minute = 0 } then 
			{ year = year; month = month + 1; day = 1; hour = 0; minute = 0 }
		else { year = year + 1; month = 1; day = 1; hour = 0; minute = 0 };;

let of_int minutes = 
	let rec convert date count =
		if count = minutes then 
			date
		else convert (next date) (count + 1)
	in convert the_origin_of_time 0;;

