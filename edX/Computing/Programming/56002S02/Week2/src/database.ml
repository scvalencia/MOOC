type phone_number = int * int * int * int * int * int * int;;

type contact = {
	name : string;
	phone : phone_number
};;

type database = {
	number_of_contacts : int;
	contacts : contact array;
};;

let dummy_contact = {
	name = "";
	phone = (0, 0, 0, 0, 0, 0, 0)
};;

let create_db capacity = {
	number_of_contacts = 0;
	contacts = Array.make capacity dummy_contact
};;

type query = {
	code : int;
	contact : contact
};;

let search db contact = 
	let rec aux_search idx =

		if idx = db.number_of_contacts then
			(false, db, dummy_contact)
		else
			let current = db.contacts.(idx) in
				if current = contact then
					(true, db, contact)
				else
					aux_search (idx + 1)
	
	in aux_search 0;;

let insert db contact = 
	if db.number_of_contacts = Array.length db.contacts then
		(false, db, dummy_contact)
	else
		let (status, db, _) = search db contact in

			if status then (false, db, dummy_contact)
			else
				let cells i =
					if i = db.number_of_contacts then 
						contact
					else
						db.contacts.(i)
				in 
					let db' = {
						number_of_contacts = db.number_of_contacts + 1;
						contacts = Array.init (Array.length db.contacts) cells
					}

		in (true, db', contact);;

let delete db contact = 
	let (status, db, _) = search db contact in

		if not status then 
			(false, db, dummy_contact)
		else
			let cells i =
				if db.contacts.(i) = contact then 
					dummy_contact
				else
					db.contacts.(i)
			in 
				let db' = {
					number_of_contacts = db.number_of_contacts - 1;
					contacts = Array.init (Array.length db.contacts) cells
				}

	in (true, db', contact);;

(* A small contact list *)

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

let db = create_db 9;;

let engine db (code, contact) = 
	if code = 0 then insert db contact
	else if code = 1 then delete db contact
	else if code = 2 then search db contact
	else (false, db, dummy_contact);;

let (_, db, _) = engine db (0, c1);;
let (_, db, _) = engine db (0, c2);;
let (_, db, _) = engine db (0, c3);;
let (_, db, _) = engine db (0, c4);;
let (_, db, _) = engine db (0, c5);;
let (_, db, _) = engine db (0, c6);;
let (_, db, _) = engine db (0, c7);;
let (_, db, _) = engine db (0, c8);;
let (_, db, _) = engine db (0, c9);;

let (_, db, _) = engine db (1, c7);;
let (_, db, _) = engine db (1, c2);;
let (_, db, _) = engine db (1, c4);;

let (_, db, _) = engine db (2, c1);;
