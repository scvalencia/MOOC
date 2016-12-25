type color = { r: int; g : int; b : int }
let black = { r = 255; g = 255; b = 255 }

type point2D = { mutable x : int; mutable y : int; c : color}

let origin = { x = 0; y = 0; c = black }

let offset_h p dx = { p with x = p.x + dx }
let offset_v p dy = { p with y = p.y + dy }

let move p dx dy =
	p.x <- p.x + dx;
	p.y <- p.y + dy

let p = offset_h origin 10

