(* Welcome to Jane Street's OCaml challenges!

   This exercise is just meant to familiarize you with the build process and
   tools.

   Write OCaml code using your favorite text editor; if you aren't already
   committed to one, we recommend Visual Studio Code. *)

let rec read_lines ic = 
   try
      let line = input_line ic in
      line :: read_lines ic
   with
      End_of_file -> []

let () =
   let ic = open_in "d1_sample.txt" in
   let list = read_lines ic in
   print_endline "Hello world!"


