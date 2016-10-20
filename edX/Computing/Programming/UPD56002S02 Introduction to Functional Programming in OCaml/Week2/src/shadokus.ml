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