(*  Multiset

    A multiset is like a set, with the difference that a value can appear more than once.

*)

(* Implement a module MultiSet that implements the signature MultiSet_S. *)

module type MultiSet_S = sig

    (* A multi-set of type ['a t] is a collection of values of type ['a] that may occur several times. *)
    type 'a t

    (* [occurrences s x] return the number of time [x] occurs in [s]. *)
    val occurrences : 'a t -> 'a -> int

    (* The empty set has no element. There is only one unique representation of the empty set. *)
    val empty : 'a t

    (* 
        [insert s x] returns a new multi-set that contains all elements of [s] and a new occurrence of [x]. 
        Typically, [occurrences s x = occurrences (insert s x) x + 1]. 
    *)
    val insert : 'a t -> 'a -> 'a t

    (* 
        [remove s x] returns a new multi-set that contains all elements of [s] minus an occurrence of [x] 
        (if [x] actually occurs in [s]). Typically, [occurrences s x = occurrences (remove s x) x -1] 
        if [occurrences s x > 0]. 
    *)
    val remove : 'a t -> 'a -> 'a t

end

module MultiSet : MultiSet_S = struct

    type 'a t = 'a list

    let occurrences multi_set element =
        let rec aux xs c = match (xs, c) with
            | [], c      -> c
            | x::xs', c   -> 
                            if x = element then aux xs' (c + 1) 
                            else aux xs' c

        in aux multi_set 0

    let empty = []

    let insert multi_set element = element :: multi_set

    let remove multi_set element =
        let rec aux = function
            | []    -> []
            | x::xs -> 
                        if x = element then xs
                        else aux xs

        in aux multi_set
end

(*

    Define a function letters: string -> char MultiSet.t (where MultiSet is the module defined in the previous 
    question). This function produces a multiset in which all characters are associated to the times they appear 
    in the input string.

*)

let rec explode ch = match ch with
    | "" -> []
    | ch -> (String.get ch 0 ) :: (explode (String.sub ch 1 ((String.length ch) - 1)))

let letters' word =
    List.fold_left (fun ms ch -> MultiSet.insert ms ch) MultiSet.empty (explode word)

let letters'' word = 
    
    let ms = ref MultiSet.empty in

    for i = 0 to (String.length word) - 1 do
        let ch = String.get word i in 
        ms := (MultiSet.insert !ms ch)
    done;

    !ms

let letters word =
    let size = String.length word in
    let rec aux ms n = match n with
        | -1   -> ms
        | _    -> aux (MultiSet.insert ms (String.get word n)) (n - 1)
    in aux MultiSet.empty (size - 1)
    
(*     
    
    Define a function anagram: string -> string -> bool that uses the previous function to tell if two words 
    have the same multiset of characters.
*)


let anagram word1 word2 = 
    if String.length word1 <> String.length word2 then false
    else
        let rec aux xs ms = match (xs, ms) with
            | [], ms' when ms' = MultiSet.empty    -> true
            | x::xs', _                            -> 
                let removed = MultiSet.remove ms x in
                if removed = ms then false
                else aux xs' removed
            | _                                     -> false
        in aux (explode word2) (letters word1) 