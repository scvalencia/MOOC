exception Empty_List

let head = function
	h::_ -> h
	| [] -> raise Empty_List

exception Zero

let rec multl = function
	[]		-> 1
	| x::xs -> if x = 0 then 0 else x * (multl xs)

let multlexc l =
	let rec aux = function 
		[]		-> 1
		| x::xs -> 	if x = 0 then raise Zero 
					else x * (aux xs)
	in 
		try aux l with Zero -> 0


(* In this exercise, we will unveil the basics of the grading system.  *)

(* 

	For each question, we call both your function and a reference function on a list of randomly sampled test cases, 
	and observe the results. We also have to handle the case where a function raises an exception instead of 
	producing a result. Sometimes, we even expect your function to raise an exception, and want to compare it to 
	the exception raised by the reference function.

	For this, we use the 'a result type given in the prelude.

	Define a function exec: ('a -> 'b) -> 'a -> 'b result, that calls the given function on the given argument, 
	and returns Ok with the result if everything went well, and Error with the exception raised, if there was one. 

*)

type report = message list
and message = string * status
and status = Successful | Failed

type 'a result = Ok of 'a | Error of exn

let exec f x =
	try Ok (f x) with e -> Error(e) 

(*

	To be able to provide you with the nice error reports, we use an intermediate type for producing reports, 
	similar to the one given in the prelude. Define a function compare with the following signature.

	compare : 'a result -> 'a result -> ('a -> string) -> message

	This function will take first the user function's result and then the reference function's result. 
	It also takes a printer compatible with the return type, to display the results as in one the following cases.

	    ("got correct value 13", Successful)
	    ("got unexpected value 13", Failed)
	    ("got correct exception Exit", Successful)
	    ("got unexpected exception Exit", Failed)

	You must respect the exact wording for your solution to be accepted. To display exceptions, you can 
	use the provided exn_to_string function. 

*)

let exn_to_string e = "Exception" 

let compare user reference to_string =
	let correct_val = "got correct value " in
	let unexpected_val = "got unexpected value " in
	let correct_exn = "got correct exception " in
	let unexpected_exn = "got unexpected exception " in
		match user with
			| Ok v 		-> 
							if user = reference then (correct_val ^  to_string v, Successful)
							else (unexpected_val ^ to_string v, Failed)
			| Error e 	-> 
							if user = reference then (correct_exn ^ exn_to_string e, Successful)
							else (unexpected_exn ^ exn_to_string e, Failed)

(* 

	Then we define random samplers for each type of data that will be passed to your function. 
	For a given type 'a, a random sampler simply has type unit -> 'a, an imperative function that returns a 
	new value of type 'a every time you give it a unit.
	
	Define a function test with the following signature.

	test : ('a -> 'b) -> ('a -> 'b) -> (unit -> 'a) -> ('b -> string) -> report

	This function must proceed to exactly 10 tests, calling the sampler each time, and return the list of messages. 
	For each sample, you will exec the user function (the first parameter), then exec the reference function, and 
	compare the results. It will then return the list containing the 10 comparison messages.

	Your solution must respect the constraint that the first call to the sampler corresponds to the first 
	message of the list, the second to the second, etc. Be cautious about not reversing the list. And since the 
	sampler is an imperative, remember to use let ... in constructs if necessary, to force the order of 
	evaluation. 

*)

let test user reference sample to_string : report = 

	let rec aux n =
		match n with
			| 0 -> []
			| _	-> 
					let arg = sample () in
					let user_output = exec user arg in
					let reference_output = exec reference arg in
					let sample_output = compare user_output reference_output to_string in
					sample_output::(aux (n - 1))

	in aux 10