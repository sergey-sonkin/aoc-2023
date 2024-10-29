[@@@warning "-26"]
[@@@warning "-32"]

type game =
  { red : int
  ; blue : int
  ; green : int
  }

let rec read_lines ic =
  try
    let line = input_line ic in
    line :: read_lines ic
  with
  | End_of_file -> []
;;

let parse_line (line : string) : game =
  let re_color = Str.regexp "\\([0-9]+\\) \\(blue\\|red\\|green\\)" in
  let max_blue = ref 0 in
  let max_red = ref 0 in
  let max_green = ref 0 in
  let update_max color count =
    match color with
    | "blue" -> if count > !max_blue then max_blue := count
    | "red" -> if count > !max_red then max_red := count
    | "green" -> if count > !max_green then max_green := count
    | _ -> raise Exit
  in
  let rec search pos =
    try
      let _ = Str.search_forward re_color line pos in
      let count = int_of_string (Str.matched_group 1 line) in
      let color = Str.matched_group 2 line in
      update_max color count;
      search (Str.match_end ())
    with
    | Not_found -> ()
  in
  search 0;
  { blue = !max_blue; red = !max_red; green = !max_green }
;;

let is_valid_game (game : game) : int =
  (*only 12 red cubes, 13 green cubes, and 14 blue cubes?*)
  if game.red <= 12 && game.green <= 13 && game.blue <= 14 then 1 else 0
;;

let get_num_valid_games (games : game list) : int =
  let rec _get_num_valid_games (_games : game list) (_count : int) (_sum : int) =
    match _games with
    | game :: rest ->
      _get_num_valid_games rest (_count + 1) (_sum + (_count * is_valid_game game))
    | _ -> _sum
  in
  _get_num_valid_games games 1 0
;;

let get_power_sum (games : game list) : int =
  let rec _get_num_valid_games (_games : game list) (_sum : int) =
    match _games with
    | game :: rest ->
      _get_num_valid_games rest (_sum + (game.red * game.blue * game.green))
    | _ -> _sum
  in
  _get_num_valid_games games 0
;;

let main () =
  let fp = "/Users/sonkin/Documents/Github/ocaml2023/day2/day2a.txt" in
  let ic = open_in fp in
  let list_strings = read_lines ic in
  let games_list = List.map parse_line list_strings in
  let num_valid_games = get_power_sum games_list in
  Printf.printf "Game validity: %d\n" num_valid_games
;;
