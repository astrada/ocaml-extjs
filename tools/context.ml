type t = {
  current_file : SourceModel.File.t;
  symbol_table : SourceModel.SymbolTable.t;
}

let current_file = {
  Lens.get = (fun x -> x.current_file);
  Lens.set = (fun v x -> { x with current_file = v })
}
let symbol_table = {
  Lens.get = (fun x -> x.symbol_table);
  Lens.set = (fun v x -> { x with symbol_table = v })
}

let create file = {
  current_file = file;
  symbol_table = SourceModel.SymbolTable.create ()
}

module ContextStateMonad =
  StateMonad.Make(struct type s = t end)

