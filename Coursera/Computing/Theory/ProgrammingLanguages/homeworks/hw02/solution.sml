(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option(st, strs) =
	let fun helper [] acc 			= NONE
		  | helper (s::strs') acc 	= 
		  								if same_string(st, s) then SOME(strs' @ acc) 
		  								else helper strs' (s::acc)
	in 
		helper strs [] 
	end

fun get_substitutions1(words, st) = 
	case words of
		[]			=> []
		| w::ws 	=> 
						case all_except_option(st, w) of
							NONE		=> get_substitutions1(ws, st)
							| SOME ws'	=> ws' @ get_substitutions1(ws, st)

fun get_substitutions2(words, st) =
	let fun aux words acc =
			case words of
				[]			=> acc
				| w::ws 	=> 
								let 
									val rest = aux ws acc
								in 
									case all_except_option(st, w) of
										NONE		=> rest
										| SOME ws'	=> ws' @ rest
								end
	in 
		aux words [] 
	end

fun similar_names(substitutions, {first=f, middle=m:string, last=l:string}) =
	let 
		val subs = f::get_substitutions2(substitutions, f)
		fun aux ss =
			case ss of
				[]			=> []
				| s::ss'	=> {first=s, middle=m, last=l}::(aux ss')
	in 
		aux subs
	end

datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank
datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun card_color c =
	case c of
		(Clubs, _)		=> Black
		| (Spades, _)	=> Black
		| _				=> Red

fun card_value c =
	case c of
		(_, Num(n))		=> n
		| (_, Ace)		=> 11
		| _				=> 10

fun remove_card(cs : card list, c, e) =
	let 
		fun helper [] acc 			= raise e
		  | helper (x::xs) acc 		= 
		  		if x = c then (xs @ acc) 
		  		else helper xs (x::acc)
	in 
		helper cs [] 
	end

fun all_same_color (xs : card list) =
	case xs of		
		[] 			=> true
  		| _::[]		=> true
  		| h::n::cs 	=> ((card_color h) = (card_color n)) andalso all_same_color (n::cs)

fun sum_cards (cs : card list) =
	let 
		fun helper (c::cs : card list) acc = helper cs (card_value(c) + acc)
		  | helper [] acc      = acc 
	in 
		helper cs 0 
	end

fun score(held_cards, goal) =
	let
	 	val sum = sum_cards held_cards
	 	val preliminary = if sum > goal then 3 * (sum - goal) else goal - sum
	in
	 	if (all_same_color held_cards) then (preliminary div 2)
	 	else preliminary
	end

fun officiate(card_list : card list, move_list : move list, goal) =
	let
		fun helper held cards moves = case moves of
			[]						=> held
			| Discard(c)::moves'	=> 
				helper (remove_card(held, c, IllegalMove)) cards moves' 
			| Draw::moves'			=> 
				case cards of 
					[]			=> held
					| c::cards' => 
						let
							val held' = c::held
						in
							if sum_cards(held') > goal then held'
							else helper held' cards' moves'
						end
	in
		score((helper [] card_list move_list), goal)
	end