module type DictSig = sig
	type ('k, 'v) t

	exception NotFound

	val empty : ('k, 'v) t
	val add : ('k, 'v) t -> 'k -> 'v -> ('k, 'v) t
	val lookup : ('k, 'v) t -> 'k -> 'v
	val remove : ('k, 'v) t -> 'k -> ('k, 'v) t

end

module Dict : DictSig = struct
	
	type ('k, 'v) t = ('k * 'v) list

	exception NotFound

	let empty = []

	let add d k v = (k, v) :: d

	let rec lookup d k = match d with
		| (k', v') :: _ when k' = k -> v'
		| _ :: d' 					-> lookup d' k
		| _							-> raise NotFound

	let rec remove d k = match d with
		| (k', _) :: d' when k' = k -> d'
		| _ :: d' 					-> remove d' k
		| _							-> raise NotFound
	
end

module Dict' : DictSig = struct
	
	type ('k, 'v) t = 
		| Empty
		| Node of 
			('k, 'v) t * 'k * 'v * ('k, 'v) t

	exception NotFound

	let empty = Empty

	let rec add d k v = match d with
		| Empty 				-> Node (Empty, k, v, Empty)
		| Node (l, k', v', r)	->
			if k = k' then Node (l, k, v, r)
			else if k < k' then Node (add l k v, k', v', r)
			else Node (l, k', v', add r k v)

	let rec lookup d k = match d with
		| Empty 				-> raise NotFound
		| Node (l, k', v', r)	->
			if k = k' then v'
			else if k < k' then lookup l k
			else lookup r k

	let rec append d1 d2 = match d2 with
    	| Empty -> d1
    	| Node (l, k, v, r) -> append (append (add d1 k v) l) r

  	let rec remove d k = match d with
    	| Empty -> Empty
    	| Node (l, k', v, r) ->
      		if k = k' then append l r
			else Node ((remove l k), k', v, (remove r k))
	
end

module Directory(Dict : DictSig) = struct

	let force = Dict.empty
	let force = Dict.add force "luke" 100
	let force = Dict.add force "yoda" 150
	let force = Dict.add force "darth" 300

	let force_of_luke = Dict.lookup force "luke"
	(* let force_of_r2d2 = Dict.lookup force "r2d2" *)

end

module Client1 = Directory(Dict)
module Client2 = Directory(Dict')