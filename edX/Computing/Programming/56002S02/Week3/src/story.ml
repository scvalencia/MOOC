type story = {
	context			: context;
	perturbation	: event;
	adventure		: event list;
	conclusion		: context
}

and context = { characters : character list }

and character = {
	name		: string;
	state		: state;	
	location	: location
}

and event = 
	| Change of character * state
	| Action of character * action

and state = Happy | Hungry

and action = Eat | GoToRestaurant

and location = Appartment | Restaurant;;

let something_happens context =
	let what_can_happen =
		compatible_actions context @ possible_changes context
	in
		let event = random_pick what_can_happen in
		event, apply event context;;

let happy context = 
	all_characters_Are [Happy] context.characters

let rec end_story events context =
	if happy context then
		context, List.rev events
	else
		let event, context = 
			something_happens context
		in
			end_story (event :: events) context;;

let make_story initial_context =
	let perturbation, context =
		something_happens initial_context
	in
		let conclusion, adventure = 
			end_story [] context
		in
			{
				context 		= initial_context;
				perturbation	= perturbation;
				adventure 		= adventure;
				conclusion		= conclusion
			};;