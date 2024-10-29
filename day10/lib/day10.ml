open Core

type location =
  { row : int
  ; column : int
  }

let get_length (contents : string list) : (int, string) result =
  match contents with
  | s :: _ -> Ok (String.length s)
  | _ -> Error "Contents are empty"
;;

let find_starting_char (string_list : string list) : (location, string) result =
  let rec _find_starting_char (_string_list : string list) (count : int)
    : (location, string) result
    =
    match _string_list with
    | str :: rest ->
      (match String.index str 's' with
       | Some i -> Ok { row = count; column = i }
       | None -> _find_starting_char rest (count + 1))
    | _ -> Error "Unable to find starting character 's'"
  in
  _find_starting_char string_list 0
;;

module IntMap = Map.Make (Int)

let find_longest_cycle
  (data : string array)
  (start_location : location)
  (start_shape : char)
  =
  let map = IntMap.empty in
  let { row; column } = start_location in
  let rec _find_longest_cycle = 0 in
  0
;;

(*let traverse_graph () = *)
(*  let starting_pos in*)
(*  let rec _traverse_graph (traversed: (int * int) array) = *)
(*  in _traverse_graph *)

let main () =
  let file = "/Users/sonkin/Documents/Github/ocaml2023/day10/day10a.txt" in
  let contents = In_channel.read_lines file in
  let starting_char = find_starting_char contents in
  let length = get_length contents in
  let arr = Array.of_list contents in
  Printf.printf "Hello world!"
;;
