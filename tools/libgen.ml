open Yojson

let () =
  let json = Safe.from_file "tools/jsduck/Ext.Base.json" in
    match json with
        `Assoc assoc ->
          List.iter (fun (n, _) -> print_endline n) assoc
      | _ ->
          failwith "Unexpected root type"

