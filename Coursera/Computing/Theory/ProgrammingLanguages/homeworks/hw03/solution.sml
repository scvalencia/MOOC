fun only_capitals strings = 
	let
		val starts_with_upper_case = (fn str => Char.isUpper(String.sub(str, 0)))
	in
		List.filter starts_with_upper_case strings
	end

fun longest_string1 strings =
	let
		val lengths = List.map (fn s => (String.size s, s)) strings
		val cmp_str_by_length = fn ((l1, s1), (l2, s2)) => if l1 > l2 then (l1, s1) else (l2, s2)
		val (sz, ss) = List.foldl cmp_str_by_length (0, "") lengths
	in
		ss
	end

fun longest_string2 strings =
	let
		val lengths = List.map (fn s => (String.size s, s)) strings
		val cmp_str_by_length = fn ((l1, s1), (l2, s2)) => if l1 > l2 then (l1, s1) else (l2, s2)
		val (sz, ss) = List.foldl cmp_str_by_length (0, "") (List.rev lengths)
	in
		ss
	end

fun longest_string_helper foo strings =
	let
		val flag_fn = if foo(1, 0) then List.foldl else List.foldr
		val lengths = List.map (fn s => (String.size s, s)) strings
		val cmp_str_by_length = fn ((l1, s1), (l2, s2)) => if l1 > l2 then (l1, s1) else (l2, s2)
		val (sz, ss) = flag_fn cmp_str_by_length (0, "") lengths
	in
		ss
	end

fun longest_string3 strings =
	let
		val foo = fn (x, y) => if (x > y) then true else false
	in
		longest_string_helper foo strings
	end

fun longest_string4 strings =
	let
		val foo = fn (x, y) => if (x > y) then false else true
	in
		longest_string_helper foo strings
	end

fun first_answer transformer xs =
	case xs of
		[]			=> raise NoAnswer
		| x::xs' 	=> 
			case transformer x of 
				NONE 		=> (first_answer transformer xs')
				| SOME x'	=> x'