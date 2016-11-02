(* 
	The data structure called trie is very convenient to represent a dictionary whose keys are strings. 
	It is space-efficient way while providing a very fast lookup function. See the page on WikiPedia.
	In this exercise, we will implement such a data structure, assuming that we want to associate 
	integers to the strings of the dictionary.

	Let us define a trie using two mutually defined types (given in the prelude): 

		* trie which represents a trie, that is a tree whose root may contain an integer and whose 
		children are indexed by characters;

		* char_to_children which implements the associative data structure whose keys are characters 
		and whose values are trie (childrens). 

	As a trade-off between speed and memory consumption, we choose an associative list to represent 
	the association between characters and children. The prelude also gives examples of empty trie 
	and of another one that contains the following pairs (key, value):

	[("A", 15); ("to", 7); ("tea", 3);("ted", 4); ("ten", 12); ("i", 11); ("in", 5); ("inn", 9)].  
*)

type trie = Trie of int option * char_to_children 
and char_to_children = (char * trie) list

let empty = Trie (None, [])

(* [("A", 15); ("to", 7); ("tea", 3);("ted", 4); ("ten", 12); ("i", 11); ("in", 5); ("inn", 9)] *)

let example = Trie (None,
	[('i', Trie (Some 11,
		[('n', Trie (Some 5, [('n', Trie (Some 9, []))]))])); 
	('t', 
		Trie (None, 
			[('e', 
				Trie (None, 
					[('n', Trie (Some 12, [])); ('d', Trie (Some 4, [])); 
					('a', Trie (Some 3, []))])); 
			('o', Trie (Some 7, []))])); 
	('A', Trie (Some 15, []))])

(* 
	Write a function children_from_char : char_to_children -> char -> trie option such that:

		1. children_from_char m c = Some t if (c, t) is the first pair in m with c as a first component; 

		2. children_from_char m c = None if no such pair exists in m. 
*)

let children_from_char (m : char_to_children) (chr : char) = 
	let rec aux m = 
		match m with
			| [] 	-> None
			| (c, t)::xs -> 
				if c = chr then Some(t)
				else aux xs
	in aux m;; 

(*
	Write a function update_children : char_to_children -> char -> trie -> char_to_children such that:

		1. children_from_char (update_children m c t) c = Some t;

		2. children_from_char (update_children m c t) c' = children_from_char m c' for c <> c'; 

		3. If children_from_char m c = Some t then List.length (update_children m c t') = List.length m.
*)

let a = [('A', 2); ('B', 5); ('T', 8); ('h', 0); ('g', 34); ('l', 5); ('c', 56)] 

let update a (ch : char) (n : int) =
	let rec aux m accum =
		match m with
			| []			-> accum
			| (chr, i)::xs	->
				if chr = ch then
					accum @ [(chr, n)] @ xs
				else
					aux (xs) (accum @ [(chr, i)])
	in aux a [];;

let update_children (m : char_to_children) (c : char) (t : trie) : char_to_children = 
	let rec aux m accum = 
		match m with
			| [] 	-> accum
			| (chr, i)::xs -> 
				if chr = c then 
					accum @ [(c, t)] @ xs
				else 
					aux (xs) (accum @ [(chr, i)])
	in 
		if children_from_char m c = None then 
			(c, t)::m
		else
			aux m [];;

(*
	Write a function lookup : trie -> string -> int option such that lookup trie w = Some i if i 
	is the value of the key w in trie and lookup trie w = None if w is not a key of trie.
	To look for a key in a trie, iterate over the characters of the key from left to right. 
	Given the current character c and the current node of the trie n, look for the children n 
	for character c. If such a children exists, continue with that trie and the remainder of the key. 
	If no such children exists, the key is not in the trie. 

	When the characters of the key are entirely consumed, look at the root of the current trie. 
	If there is an integer, this is the value you are looking for. If there is no integer, 
	the key not in the trie.
*)

let lookup (trie : trie) (word : string) = "Hard!!"

(*
	Write a function insert : trie -> string -> int -> trie such that: 
		lookup (insert trie w k) w = Some k and 
		lookup (insert trie w k) w' = lookup trie w' for w <> w'.
*)

let insert trie (w : string) (v : int) = "Hard""

