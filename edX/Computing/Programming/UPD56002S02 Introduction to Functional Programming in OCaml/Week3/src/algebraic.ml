type phone_number = int * int * int * int * int * int * int;;

type contact = {
	name : string;
	phone : phone_number
};;

type query = 
	| Insert of contact
	| Delete of contact
	| Search of string;;

let c1 = {
	name = "Camile Benoit";
	phone = (2, 4, 7, 2, 4, 1, 6)
};;

let c2 = {
	name = "Philip Robignon";
	phone = (6, 6, 9, 4, 1, 5, 6)
};;

let c3 = {
	name = "Marie Schuster";
	phone = (7, 4, 6, 1, 3, 9, 6)
};;

let c4 = {
	name = "Agnes Ambuschen";
	phone = (6, 3, 8, 4, 5, 1, 9)
};;

let c5 = {
	name = "Joan Glimenie";
	phone = (5, 6, 3, 7, 7, 3, 5)
};;

let c6 = {
	name = "Robert Diderot";
	phone = (2, 3, 6, 2, 7, 4, 0)
};;

let c7 = {
	name = "Jan Darles";
	phone = (6, 2, 7, 2, 6, 8, 4)
};;

let c8 = {
	name = "Emanuelle Miterrand";
	phone = (2, 6, 7, 4, 2, 5, 1)
};;

let c9 = {
	name = "Karl Lippert";
	phone = (7, 5, 8, 3, 4, 5, 0)
};;

let query1 = Insert c1;;

let query2 = Insert c2;;

let query3 = Delete c1;;

type data = None | Single of int | Pair of int * int;;

type color = Black | Gray | White;;

let lighter (c1, c2) = 
	match (c1, c2) with
		| (Black, Black)  -> false
		| (Gray, Gray)    -> false
		| (White, White)  -> false
		| (Black, _)      -> false
		| (_, Black)      -> true
		| (White, _)      -> true
		| (Gray, White)   -> false;;


