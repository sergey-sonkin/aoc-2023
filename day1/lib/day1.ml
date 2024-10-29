let rec read_lines ic =
  try
    let line = input_line ic in
    line :: read_lines ic
  with
  | End_of_file -> []
;;

let parse_char_list (char_list : char list) : string =
  let rec _parse_char_list (_char_list : char list) : string =
    match _char_list with
    | '1' :: _ -> "1"
    | '2' :: _ -> "2"
    | '3' :: _ -> "3"
    | '4' :: _ -> "4"
    | '5' :: _ -> "5"
    | '6' :: _ -> "6"
    | '7' :: _ -> "7"
    | '8' :: _ -> "8"
    | '9' :: _ -> "9"
    | '0' :: _ -> "0"
    | 'o' :: 'n' :: 'e' :: _ -> "1"
    | 't' :: 'w' :: 'o' :: _ -> "2"
    | 't' :: 'h' :: 'r' :: 'e' :: 'e' :: _ -> "3"
    | 'f' :: 'o' :: 'u' :: 'r' :: _ -> "4"
    | 'f' :: 'i' :: 'v' :: 'e' :: _ -> "5"
    | 's' :: 'i' :: 'x' :: _ -> "6"
    | 's' :: 'e' :: 'v' :: 'e' :: 'n' :: _ -> "7"
    | 'e' :: 'i' :: 'g' :: 'h' :: 't' :: _ -> "8"
    | 'n' :: 'i' :: 'n' :: 'e' :: _ -> "9"
    | 'z' :: 'e' :: 'r' :: 'o' :: _ -> "0"
    | _ :: rest -> _parse_char_list rest
    | _ -> raise Exit "Processed string without finding int"
  in
  _parse_char_list char_list
;;

let parse_char_list_backwards (char_list : char list) : string =
  let rec _parse_char_list (_char_list : char list) : string =
    match _char_list with
    | '1' :: _ -> "1"
    | '2' :: _ -> "2"
    | '3' :: _ -> "3"
    | '4' :: _ -> "4"
    | '5' :: _ -> "5"
    | '6' :: _ -> "6"
    | '7' :: _ -> "7"
    | '8' :: _ -> "8"
    | '9' :: _ -> "9"
    | '0' :: _ -> "0"
    | 'e' :: 'n' :: 'o' :: _ -> "1"
    | 'o' :: 'w' :: 't' :: _ -> "2"
    | 'e' :: 'e' :: 'r' :: 'h' :: 't' :: _ -> "3"
    | 'r' :: 'u' :: 'o' :: 'f' :: _ -> "4"
    | 'e' :: 'v' :: 'i' :: 'f' :: _ -> "5"
    | 'x' :: 'i' :: 's' :: _ -> "6"
    | 'n' :: 'e' :: 'v' :: 'e' :: 's' :: _ -> "7"
    | 't' :: 'h' :: 'g' :: 'i' :: 'e' :: _ -> "8"
    | 'e' :: 'n' :: 'i' :: 'n' :: _ -> "9"
    | 'o' :: 'r' :: 'e' :: 'z' :: _ -> "0"
    | _ :: rest -> _parse_char_list rest
    | _ -> raise Exit "Processed string without finding int"
  in
  _parse_char_list char_list
;;

let string_to_char_list (str : string) : char list = str |> String.to_seq |> List.of_seq

let two_digit_int_from_char_list (char_list : char list) : int =
  let first_int_string = parse_char_list char_list in
  let second_int_string = parse_char_list_backwards (List.rev char_list) in
  int_of_string (first_int_string ^ second_int_string)
;;

let () =
  "/Users/sonkin/Documents/Github/ocaml2023/day1/lib/d1_sample_b.txt"
  |> open_in
  |> read_lines
  |> List.map string_to_char_list
  |> List.map two_digit_int_from_char_list
  |> List.fold_left ( + ) 0
  |> Printf.printf "The sum is %d\r"
;;

(*let () =*)
(*  let fp = "/Users/sonkin/Documents/Github/ocaml2023/day1/lib/d1_sample_b.txt" in*)
(*  let ic = open_in fp in*)
(*  let list_strings = read_lines ic in*)
(*  let list_char_lists = List.map string_to_char_list list_strings in*)
(*  let ints_list = List.map two_digit_int_from_char_list list_char_lists in*)
(*  let sum = List.fold_left ( + ) 0 ints_list in*)
(*  Printf.printf "The sum is %d\r" sum*)
(*;;*)

(*let%test _ = get_ints_in_string "1abc2" = "12"*)
(*let%test _ = get_ints_in_string "pqr3stu8vwx" = "38"*)
(*let%test _ = get_ints_in_string "a1b2c3d4e5f" = "12345"*)
(*let%test _ = get_ints_in_string "treb7uchet" = "7"*)

(*let%test _ = ("two1nine" |> string_to_char_list |> parse_char_list) = "2"*)
(*let%test _ = "eightwothree" |> string_to_char_list |> parse_char_list = "8"*)
(*let%test _ = "abcone2threexyz" |> string_to_char_list |> parse_char_list = "1"*)
(*let%test _ = "xtwone3four" |> string_to_char_list |> parse_char_list = "2"*)
(*let%test _ = "4nineeightseven2" |> string_to_char_list |> parse_char_list = "4"*)
(*let%test _ = "zoneight234" |> string_to_char_list |> parse_char_list = "1"*)
(*let%test _ = "7pqrstsixteen" |> string_to_char_list |> parse_char_list = "2"*)

(*let%test _ = "two1nine" |> string_to_char_list |> parse_char_list_backwards = "9"*)
(*let%test _ = "eightwothree" |> string_to_char_list |> parse_char_list_backwards = "3"*)
(*let%test _ = "abcone2threexyz" |> string_to_char_list |> parse_char_list_backwards = "3"*)
(*let%test _ = "xtwone3four" |> string_to_char_list |> parse_char_list_backwards = "4"*)
(*let%test _ = "4nineeightseven2" |> string_to_char_list |> parse_char_list_backwards = "2"*)
(*let%test _ = "zoneight234" |> string_to_char_list |> parse_char_list_backwards = "4"*)
(*let%test _ = ("7pqrstsixteen" |> string_to_char_list |> parse_char_list_backwards) = "6"*)
(*let%test _ = ("7pqrstsixteen" |> string_to_char_list |> parse_char_list_backwards) = "0"*)
