[@@@warning "-26"]
[@@@warning "-32"]

let rec read_lines ic =
  try
    let line = input_line ic in
    line :: read_lines ic
  with
  | End_of_file -> []
;;

let parse_game_number (str : string) : char list =
  let char_list = List.of_seq (String.to_seq str) in
  let rec _parse_game_number (_char_list : char list) : char list =
    match _char_list with
    | ':' :: ' ' :: rest -> rest
    | _ :: rest -> _parse_game_number rest
    | _ -> raise Exit
  in
  _parse_game_number char_list
;;

let test_parse_game_number () =
  assert (
    parse_game_number "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    = ("3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green" |> String.to_seq |> List.of_seq));
  assert (
    parse_game_number
      "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
    = ("8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
       |> String.to_seq
       |> List.of_seq))
;;

let () =
  (*test_parse_game_number ();*)
  (*let fp = "/Users/sonkin/Documents/Github/ocaml2023/day1/lib/d1_sample_b.txt" in*)
  (*let ic = open_in fp in*)
  (*let list_strings = read_lines ic in*)
  print_endline "Hello, World!"
;;
