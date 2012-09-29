open Batteries

(* OCaml names *)
type name_type =
    FileName
  | ModuleName
  | TypeName
  | ValueName
  | ParameterName
  | FieldName
  | ConstructorName

module OCamlName =
struct
  let keywords = [
    "type";
    "method";
    "private";
    "end";
    "ref";
    "object";
    "open";
    "raise";
  ]

  let is_first_character_valid s =
    match s.[0] with
        'a'..'z'
      | 'A'..'Z'
      | '_' -> true
      | _ -> false

  let replace_invalid_characters s =
    String.map
      (fun c ->
         match c with
             'a'..'z'
           | 'A'..'Z'
           | '0'..'9'
           | '_' -> c
           | _ -> '_'
      ) s

  let get_ocaml_name name_type name =
    if name = "" then ""
    else
      let name_without_invalid_characters = replace_invalid_characters name in
      let name_with_valid_first_character =
        if is_first_character_valid name_without_invalid_characters then
          name_without_invalid_characters
        else
          match name_type with
              ModuleName
            | FileName ->
                "M" ^ name_without_invalid_characters
            | ConstructorName ->
                "V" ^ name_without_invalid_characters
            | TypeName
            | ValueName
            | ParameterName
            | FieldName ->
                "_" ^ name_without_invalid_characters in
      let name_with_proper_first_letter_case =
        match name_type with
            ModuleName
          | ConstructorName ->
              String.capitalize name_with_valid_first_character
          | FileName
          | TypeName
          | ValueName
          | ParameterName
          | FieldName ->
              String.uncapitalize name_with_valid_first_character
      in
        if List.mem name_with_proper_first_letter_case keywords then
          "_" ^ name_with_proper_first_letter_case
        else
          name_with_proper_first_letter_case

end
(* END OCaml names *)

(* Symbol table *)
module Symbol =
struct
  type type_param =
      TypeVariable
    | Type of t
  and t = {
    module_prefix : string;
    symbol_name : string;
    params : type_param list;
  }

  let symbols_to_string sep symbols =
    let get_param n =
      let start_code = Char.code 'a' in
      let param_code = start_code + n - 1 in
      let param_chr = Char.chr param_code in
      let param_string = String.of_char param_chr in
        "'" ^ param_string
    in
    let i = ref 0 in
    let rec loop symbol =
      let params_string =
        List.map
          (function
               TypeVariable -> incr i; get_param !i
             | Type t -> loop t)
          symbol.params
        |> String.concat ","
      in
        match symbol.params with
            [] ->
              if symbol.module_prefix <> "" then
                symbol.module_prefix ^ "." ^ symbol.symbol_name
              else symbol.symbol_name
          | [_] ->
            Printf.sprintf "%s %s.%s"
              params_string
              symbol.module_prefix
              symbol.symbol_name
          | _ ->
            Printf.sprintf "(%s) %s.%s"
              params_string
              symbol.module_prefix
              symbol.symbol_name
    in
    List.map loop symbols
      |> String.concat sep

  let to_string symbol =
    symbols_to_string "" [symbol]

  let boolean = {
    module_prefix = "";
    symbol_name = "bool";
    params = [];
  }

  let js_type n = {
    module_prefix = "Js";
    symbol_name = n;
    params = [];
  }

  let js_array param = {
    module_prefix = "Js";
    symbol_name = "js_array";
    params = [param];
  }

  let generic_js_array = js_array TypeVariable

end

module SymbolTable =
struct
  type t = (string, Symbol.t) Hashtbl.t

  let add_type table ?(params = []) id prefix name =
    let symbol = {
      Symbol.module_prefix = prefix;
      symbol_name = name;
      params;
    } in
    Hashtbl.add table id symbol;
    symbol

  let create () : t =
    let table = Hashtbl.create 64 in
    add_type table
      ~params:[Symbol.Type Symbol.boolean] "Boolean" "Js" "t"
      |> ignore;
    add_type table
      ~params:[Symbol.Type (Symbol.js_type "number")] "Number" "Js" "t"
      |> ignore;
    add_type table
      ~params:[Symbol.Type (Symbol.js_type "js_string")] "String" "Js" "t"
      |> ignore;
    add_type table
      ~params:[Symbol.Type Symbol.generic_js_array] "Array" "Js" "t"
      |> ignore;
    add_type table
      ~params:[Symbol.TypeVariable] "Object" "Js" "t"
      |> ignore;
    add_type table
      ~params:[Symbol.TypeVariable] "Function" "Js" "callback"
      |> ignore;
    add_type table
      "Error" "" ""
      |> ignore;
    add_type table "undefined" "" "unit" |> ignore;
    table

  let lookup_type table id =
    try
      Hashtbl.find table id
    with Not_found ->
      if String.starts_with id "Ext." then
        let prefix =
          OCamlName.get_ocaml_name ModuleName id in
        add_type table id prefix "t"
      else failwith ("Unsupported type: " ^ id)

  let map_type table id =
    match id with
      | s when String.contains s '/' ->
          (* TODO: analyze alternatives? *)
          lookup_type table "Object"
      | s when String.ends_with s "[]" ->
          let inner_type =
            lookup_type table (String.rchop ~n:2 s) in
          { Symbol.module_prefix = "Js";
            symbol_name = "t";
            params = [Symbol.Type (Symbol.js_array (Symbol.Type inner_type))];
          }
      | s when String.starts_with s "Ext." ->
          let inner_type =
            lookup_type table s in
          { Symbol.module_prefix = "Js";
            symbol_name = "t";
            params = [Symbol.Type inner_type];
          }
      | s ->
          lookup_type table s

end
(* END Symbol table *)

module Type =
struct
  type t = {
    id : string;
    symbol : Symbol.t;
  }

	let id = {
		Lens.get = (fun x -> x.id);
		Lens.set = (fun v x -> { x with id = v })
	}
	let symbol = {
		Lens.get = (fun x -> x.symbol);
		Lens.set = (fun v x -> { x with symbol = v })
	}

  let create id symbol = {
    id;
    symbol;
  }

  let unit_type = {
    id = "";
    symbol = {
      Symbol.module_prefix = "";
      symbol_name = "unit";
      params = [];
    };
  }

end

module Param =
struct
  type t = {
    id : string;
    name : string;
    ptype : Type.t;
    doc : string
  }

	let id = {
		Lens.get = (fun x -> x.id);
		Lens.set = (fun v x -> { x with id = v })
	}
	let name = {
		Lens.get = (fun x -> x.name);
		Lens.set = (fun v x -> { x with name = v })
	}
	let ptype = {
		Lens.get = (fun x -> x.ptype);
		Lens.set = (fun v x -> { x with ptype = v })
	}
	let doc = {
		Lens.get = (fun x -> x.doc);
		Lens.set = (fun v x -> { x with doc = v })
	}

  let create id ptype doc = {
    id;
    name = OCamlName.get_ocaml_name ParameterName id;
    ptype;
    doc;
  }

  let unit_param = {
    id = "";
    name = "()";
    ptype = Type.unit_type;
    doc = "";
  }

end

module Function =
struct
  type t = {
    id : string;
    name : string;
    doc : string;
    owner : string;
    property : bool;
    readonly : bool;
    params : Param.t list;
    return : Param.t
  }

	let id = {
		Lens.get = (fun x -> x.id);
		Lens.set = (fun v x -> { x with id = v })
	}
	let name = {
		Lens.get = (fun x -> x.name);
		Lens.set = (fun v x -> { x with name = v })
	}
	let doc = {
		Lens.get = (fun x -> x.doc);
		Lens.set = (fun v x -> { x with doc = v })
	}
	let owner = {
		Lens.get = (fun x -> x.owner);
		Lens.set = (fun v x -> { x with owner = v })
	}
	let property = {
		Lens.get = (fun x -> x.property);
		Lens.set = (fun v x -> { x with property = v })
	}
	let readonly = {
		Lens.get = (fun x -> x.readonly);
		Lens.set = (fun v x -> { x with readonly = v })
	}
	let params = {
		Lens.get = (fun x -> x.params);
		Lens.set = (fun v x -> { x with params = v })
	}
	let return = {
		Lens.get = (fun x -> x.return);
		Lens.set = (fun v x -> { x with return = v })
	}

  let create id doc owner params return = {
    id;
    name = OCamlName.get_ocaml_name ValueName id;
    doc;
    owner;
    property = false;
    readonly = false;
    params = if params = [] then [Param.unit_param] else params;
    return
  }

  let create_property id doc owner readonly return = {
    id;
    name = OCamlName.get_ocaml_name ValueName id;
    doc;
    owner;
    property = true;
    readonly;
    params = [];
    return
  }

end

module Method =
struct
  type method_type =
      Property
    | Method
    | Callback

  type t = {
    id : string;
    name : string;
    doc : string;
    readonly : bool;
    template : bool;
    method_type : method_type;
    params : Param.t list;
    return : Param.t
  }

	let id = {
		Lens.get = (fun x -> x.id);
		Lens.set = (fun v x -> { x with id = v })
	}
	let name = {
		Lens.get = (fun x -> x.name);
		Lens.set = (fun v x -> { x with name = v })
	}
	let doc = {
		Lens.get = (fun x -> x.doc);
		Lens.set = (fun v x -> { x with doc = v })
	}
	let readonly = {
		Lens.get = (fun x -> x.readonly);
		Lens.set = (fun v x -> { x with readonly = v })
	}
	let template = {
		Lens.get = (fun x -> x.template);
		Lens.set = (fun v x -> { x with template = v })
	}
  let method_type = {
		Lens.get = (fun x -> x.method_type);
		Lens.set = (fun v x -> { x with method_type = v })
	}
	let params = {
		Lens.get = (fun x -> x.params);
		Lens.set = (fun v x -> { x with params = v })
	}
	let return = {
		Lens.get = (fun x -> x.return);
		Lens.set = (fun v x -> { x with return = v })
	}

  let create_property id doc readonly return = {
    id;
    name = OCamlName.get_ocaml_name ValueName id;
    doc;
    readonly;
    template = false;
    method_type = Property;
    params = [];
    return
  }

  let create_method id doc template params return = {
    id;
    name = OCamlName.get_ocaml_name ValueName id;
    doc;
    readonly = false;
    template;
    method_type = Method;
    params;
    return
  }

  let create_event id doc params = {
    id;
    name = OCamlName.get_ocaml_name ValueName id;
    doc;
    readonly = false;
    template = false;
    method_type = Callback;
    params;
    return = Param.unit_param;
  }

end

module ClassType =
struct
  type t = {
    id : string;
    name : string;
    doc : string;
    superclasses : string list;
    methods : Method.t list;
  }

	let id = {
		Lens.get = (fun x -> x.id);
		Lens.set = (fun v x -> { x with id = v })
	}
	let name = {
		Lens.get = (fun x -> x.name);
		Lens.set = (fun v x -> { x with name = v })
	}
	let doc = {
		Lens.get = (fun x -> x.doc);
		Lens.set = (fun v x -> { x with doc = v })
	}
	let superclasses = {
		Lens.get = (fun x -> x.superclasses);
		Lens.set = (fun v x -> { x with superclasses = v })
	}
	let methods = {
		Lens.get = (fun x -> x.methods);
		Lens.set = (fun v x -> { x with methods = v })
	}

  let create id = {
    id;
    name = "t";
    doc = "";
    superclasses = [];
    methods = [];
  }

end

module Module =
struct
  type t = {
    id : string;
    name : string;
    doc : string;
    toplevel : bool;
    class_types : ClassType.t list;
    functions : Function.t list;
  }

	let id = {
		Lens.get = (fun x -> x.id);
		Lens.set = (fun v x -> { x with id = v })
	}
	let name = {
		Lens.get = (fun x -> x.name);
		Lens.set = (fun v x -> { x with name = v })
	}
	let doc = {
		Lens.get = (fun x -> x.doc);
		Lens.set = (fun v x -> { x with doc = v })
	}
	let toplevel = {
		Lens.get = (fun x -> x.toplevel);
		Lens.set = (fun v x -> { x with toplevel = v })
	}
	let class_types = {
		Lens.get = (fun x -> x.class_types);
		Lens.set = (fun v x -> { x with class_types = v })
	}
	let functions = {
		Lens.get = (fun x -> x.functions);
		Lens.set = (fun v x -> { x with functions = v })
	}

  let create toplevel = {
    id = "";
    name = "";
    doc = "";
    toplevel;
    class_types = [];
    functions = [];
  }

  let set_id id m =
    { m with id;
             name = OCamlName.get_ocaml_name ModuleName id;
    }

end

module File =
struct
  type t = {
    name : string;
    modules : Module.t list;
  }

	let name = {
		Lens.get = (fun x -> x.name);
		Lens.set = (fun v x -> { x with name = v })
	}
	let modules = {
		Lens.get = (fun x -> x.modules);
		Lens.set = (fun v x -> { x with modules = v })
	}

  let create basename = {
    name = OCamlName.get_ocaml_name FileName basename;
    modules = []
  }

end

