fun is_older(date1 : (int * int * int), date2 : (int * int * int)) =
	let
		val (y1, m1, d1) = (#1 date1, #2 date1, #3 date1)
		val (y2, m2, d2) = (#1 date2, #2 date2, #3 date2)
	in
		(y1 < y2) orelse (y1 = y2 andalso m1 < m2) orelse (y1 = y2 andalso m1 = m2 andalso d1 < d2)
	end

fun number_in_month(dates : (int * int * int) list, month : int) =
	let
		fun aux(ds : (int * int * int) list, count : int) =
			if null ds then count
			else
				let
					val count = if #2 (hd ds) = month then (count + 1) else count
				in 
					aux(tl ds, count)
				end
	in 
		aux(dates, 0)
	end

fun number_in_months(dates : (int * int * int) list, months : int list) =
	if null months then 0
	else
		number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates : (int * int * int) list,  month : int) = 
	if null dates then []
	else
		let
			val current = hd dates
			val rest = dates_in_month(tl dates, month)
		in
			if #2 (current) = month then current :: rest
			else rest
		end

fun dates_in_months(dates : (int * int * int) list, months : int list) =
	if null months then []
	else
		dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(xs : string list, n : int) =
	let
		fun aux(lst : string list, i : int) =
			if i = n then hd lst
			else aux(tl lst, i + 1)
	in aux(xs, 1)
	end

fun date_to_string(date : int * int * int) =
	let
		val month_names = ["January", "February", "March", "April", "May", "June", 
			"July", "August", "September", "October", "November", "December"]
	in
		get_nth(month_names, (#2 date)) ^ " " ^ (Int.toString (#3 date)) ^ 
			"," ^ " " ^ (Int.toString (#1 date))
	end

fun number_before_reaching_sum(sum : int, xs : int list) =
	let
		fun aux(ys : int list, accum : int, i : int) =
			if sum <= (accum + (hd ys)) then i
			else aux(tl ys, accum + (hd ys), i + 1)
	in
		aux(xs, 0, 0)
	end

fun what_month (day : int) =
    let
        val month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        1 + number_before_reaching_sum(day, month_days)
	end

fun month_range(day1 : int, day2 : int) =
	if day1 = day2 then [(what_month day1)]
	else (what_month day1) :: month_range(day1 + 1, day2)

fun oldest (ds : (int * int * int) list) =
    if null ds then NONE
    else
    	let
    		val rest = oldest(tl ds)
        in
        	if isSome rest andalso is_older((valOf rest), (hd ds)) then rest
        	else SOME (hd ds)
end