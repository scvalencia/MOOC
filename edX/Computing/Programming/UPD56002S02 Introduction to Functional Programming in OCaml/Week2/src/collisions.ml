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