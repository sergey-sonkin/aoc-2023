[@@@ocaml.warning "-26"]

let rec read_lines ic = 
   try
      let line = input_line ic in
      line :: read_lines ic
   with
      End_of_file -> []

let is_char c =
   match c with
   | '1' -> true
   | '2' -> true
   | '3' -> true
   | '4' -> true
   | '5' -> true
   | '6' -> true
   | '7' -> true
   | '8' -> true
   | '9' -> true
   | _ -> false

let get_first_and_last_of_string (list: char list) =
   let first = list |> List.hd in
   let second = list |> List.rev |> List.hd in
   (String.make 1 first) ^ (String.make 1 second)


let get_ints_in_string (str: string): int =
   let rec _get_ints_in_string (seq: char Seq.t) (res: char list) = 
      match Seq.uncons seq with
       | Some (c, rest) when is_char c -> _get_ints_in_string rest (c :: res)
       | Some (_, rest) -> _get_ints_in_string rest res
       | None -> res |> List.rev |> get_first_and_last_of_string |> int_of_string
   in _get_ints_in_string (String.to_seq str) []

let () =
   let fp = "/Users/sonkin/Documents/Github/ocaml2023/day1/lib/d1_complete.txt" in
   let ic = open_in fp in
   let list = read_lines ic in
   let ints = List.map get_ints_in_string list in
   let sum = List.fold_left (+) 0 ints in
   Printf.printf "The sum is %d\r" sum


(*let%test _ = get_ints_in_string "1abc2" = "12"*)
(*let%test _ = get_ints_in_string "pqr3stu8vwx" = "38"*)
(*let%test _ = get_ints_in_string "a1b2c3d4e5f" = "12345"*)
(*let%test _ = get_ints_in_string "treb7uchet" = "7"*)
