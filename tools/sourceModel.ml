open Batteries

(* OCaml names *)
type name_type =
    FileName
  | ModuleName
  | ValueName
  | ParameterName

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
    "exception";
    "done";
    "rec";
    "match";
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
            | ValueName
            | ParameterName ->
                "_" ^ name_without_invalid_characters in
      let name_with_proper_first_letter_case =
        match name_type with
            ModuleName ->
              String.capitalize name_with_valid_first_character
          | FileName
          | ParameterName ->
              String.uncapitalize name_with_valid_first_character
          | ValueName ->
              match name_with_valid_first_character.[0] with
                  'a'..'z'
                | '_' ->
                    name_with_valid_first_character
                | _ ->
                    "_" ^ name_with_valid_first_character
      in
        if List.mem name_with_proper_first_letter_case keywords then
          "_" ^ name_with_proper_first_letter_case
        else
          name_with_proper_first_letter_case

end
(* END OCaml names *)

type class_cat =
    StandardClass
  | ConfigClass
  | EventClass
  | StaticClass

(* Symbol table *)
module Symbol =
struct
  type type_param =
      TypeVariable
    | SelfTypeVariable
    | Type of t
  and t = {
    module_prefix : string;
    symbol_name : string;
    params : type_param list;
    optional : bool;
  }

  let js_t param = {
    module_prefix = "Js";
    symbol_name = "t";
    params = [param];
    optional = false;
  }

  let js_object = {
    module_prefix = "Js";
    symbol_name = "t";
    params = [TypeVariable];
    optional = false;
  }

  let self_object = {
    module_prefix = "Js";
    symbol_name = "t";
    params = [SelfTypeVariable];
    optional = false;
  }

  let boolean = {
    module_prefix = "";
    symbol_name = "bool";
    params = [];
    optional = false;
  }

  let date = {
    module_prefix = "Js";
    symbol_name = "date";
    params = [];
    optional = false;
  }

  let js_type n = {
    module_prefix = "Js";
    symbol_name = n;
    params = [];
    optional = false;
  }

  let js_array param = {
    module_prefix = "Js";
    symbol_name = "js_array";
    params = [param];
    optional = false;
  }

  let generic_js_array = js_array TypeVariable

  let type_variable = {
    module_prefix = "";
    symbol_name = "";
    params = [TypeVariable];
    optional = false;
  }

  let self_type_variable = {
    module_prefix = "";
    symbol_name = "";
    params = [SelfTypeVariable];
    optional = false;
  }

  module Aliases =
  struct
    let module_aliases =
      let tbl = Hashtbl.create 64 in
      Hashtbl.add tbl "Ext_Element" "Ext_dom_Element";
      Hashtbl.add tbl "Ext_core_Element" "Ext_dom_Element";
      Hashtbl.add tbl "Ext_CompositeElement" "Ext_dom_CompositeElement";
      Hashtbl.add tbl "Ext_Container" "Ext_container_Container";
      Hashtbl.add tbl "Ext_data_Record" "Ext_data_Model";
      tbl

    let get_canonical alias =
      try
        Hashtbl.find module_aliases alias
      with Not_found -> alias

  end

  module TypeMap =
  struct
    let type_map =
      [("Ext_dom_AbstractElement",
        [("Ext_dom_Element", self_type_variable);
         ("Ext_dom_CompositeElement", type_variable);
         ("Ext_dom_Element_Fly", self_type_variable);
        ]);
       ("Ext_ElementLoader",
        [("Ext_Component", type_variable)]);
       ("Ext_util_Region",
        [("Ext_util_Point", type_variable)]);
       ("Ext_AbstractPlugin",
        [("Ext_Component", type_variable);
        ]);
       ("Ext_AbstractComponent",
        [("Ext_Component", self_type_variable);
         ("Ext_container_Container", type_variable);
         ("Ext_util_Positionable", self_type_variable);
        ]);
       ("Ext_util_Floating",
        [("Ext_Component", type_variable);
        ]);
       ("Ext_ZIndexManager",
        [("Ext_Component", type_variable);
        ]);
       ("Ext_Component",
        [("Ext_container_Container", type_variable);
         ("Ext_LoadMask", type_variable);
        ]);
       ("Ext_util_AbstractMixedCollection",
        [("Ext_util_MixedCollection", self_type_variable);
        ]);
       ("Ext_util_Sortable",
        [("Ext_util_MixedCollection", type_variable);
        ]);
       ("Ext_layout_ContextItem",
        [("Ext_layout_Layout", type_variable);
        ]);
       ("Ext_container_AbstractContainer",
        [("Ext_container_Container", self_type_variable);
        ]);
       ("Ext_panel_AbstractPanel",
        [("Ext_panel_Panel", self_type_variable);
        ]);
       ("Ext_container_DockingContainer",
        [("Ext_panel_Panel", type_variable);
        ]);
       ("Ext_data_Model",
        [("Ext_data_Store", type_variable);
         ("Ext_data_proxy_Proxy", type_variable);
        ]);
       ("Ext_grid_feature_Feature",
        [("Ext_grid_Panel", type_variable);
         ("Ext_view_Table", type_variable);
        ]);
       ("Ext_data_Operation",
        [("Ext_data_Batch", type_variable);
        ]);
       ("Ext_data_AbstractStore",
        [("Ext_data_Store", self_type_variable);
        ]);
       ("Ext_view_AbstractView",
        [("Ext_view_View", self_type_variable);
        ]);
       ("Ext_grid_header_Container",
        [("Ext_grid_column_Column", self_type_variable);
        ]);
       ("Ext_app_Controller",
        [("Ext_app_Application", type_variable);
        ]);
       ("Ext_form_action_Action",
        [("Ext_form_Basic", type_variable);
        ]);
       ("Ext_form_field_Base",
        [("Ext_form_field_Field", self_type_variable);
        ]);
       ("Ext_dom_CompositeElementLite",
        [("Ext_dom_CompositeElement", self_type_variable);
        ]);
       ("Ext_grid_locking_Lockable",
        [("Ext_grid_Panel", type_variable);
        ]);
      ]

    let type_table =
      let create_subtable submap =
        let tbl = Hashtbl.create 64 in
        List.iter
          (fun (id, symbol) -> Hashtbl.add tbl id symbol)
          submap;
        tbl
      in
      let tbl = Hashtbl.create 64 in
      List.iter
        (fun (id, subtbl) ->
           Hashtbl.add tbl id (create_subtable subtbl))
        type_map;
      tbl

    let map_symbol current_module symbol =
      let canonical_module =
        Aliases.get_canonical symbol.module_prefix in
      try
        let subtbl =
          Hashtbl.find type_table current_module in
        Hashtbl.find subtbl canonical_module
      with Not_found ->
        { symbol with module_prefix = canonical_module }

  end

  module BaseClasses =
  struct
    module StringSet =
      Set.Make(struct type t = string let compare = compare end)

    let base_classes =
      List.fold_left
        (fun set name -> StringSet.add name set)
        StringSet.empty
        ["Ext_Base";
         "Ext_dom_AbstractElement";
         "Ext_util_AbstractMixedCollection";
         "Ext_dd_DragDrop";
         "Ext_AbstractComponent";
         "Ext_Component";
         "Ext_layout_container_Container";
         "Ext_container_AbstractContainer";
         "Ext_container_Container";
         "Ext_panel_AbstractPanel";
         "Ext_panel_Panel";
         "Ext_data_proxy_Proxy";
         "Ext_data_AbstractStore";
         "Ext_selection_Model";
         "Ext_form_field_Field";
         "Ext_form_field_Base";
        ]

    let is_base_class symbol =
      StringSet.mem symbol.module_prefix base_classes

  end

  let rec to_string current_module class_cat orig_symbol =
    let symbol = TypeMap.map_symbol current_module orig_symbol in
    let params_string =
      List.map
        (function
             TypeVariable -> "_"
           | SelfTypeVariable ->
               begin match class_cat with
                   EventClass -> "t"
                 | _ -> "'self" end
           | Type t -> to_string current_module class_cat t)
        symbol.params
      |> String.concat ","
    in
    let type_string =
      match symbol.params with
          [] ->
            if symbol.module_prefix <> "" &&
               symbol.module_prefix <> current_module then
              Printf.sprintf "%s.%s"
                symbol.module_prefix
                symbol.symbol_name
            else if symbol.module_prefix = current_module &&
                    symbol.symbol_name = "t" &&
                    class_cat <> EventClass then
              "'self"
            else symbol.symbol_name
        | [Type t] when symbol.module_prefix = "Js" &&
                        (* Added to compile faster: lots of event handlers
                         * have "this" as first parameter (of type t Js.t).
                         * Using types #t Js.t slows OCaml compiler. *)
                        params_string <> "t" &&
                        (* Exclude generic objects *)
                        params_string <> "_" &&
                        (* Exclude self references *)
                        params_string <> "'self" &&
                        symbol.symbol_name = "t" &&
                        BaseClasses.is_base_class t ->
              Printf.sprintf "#%s %s.%s"
                params_string
                symbol.module_prefix
                symbol.symbol_name
        | [_] ->
            if symbol.module_prefix <> "" &&
               symbol.module_prefix <> current_module then
              Printf.sprintf "%s %s.%s"
                params_string
                symbol.module_prefix
                symbol.symbol_name
            else if symbol.symbol_name <> "" then
              Printf.sprintf "%s %s"
                params_string
                symbol.symbol_name
            else
              params_string
        | _ ->
          Printf.sprintf "(%s) %s.%s"
            params_string
            symbol.module_prefix
            symbol.symbol_name
    in
    if symbol.optional
    then type_string ^ " Js.optdef"
    else type_string

  let map_symbols_to_strings current_module class_cat symbols =
    List.map
      (to_string current_module class_cat)
      symbols

end

module SymbolTable =
struct
  type t = (string, Symbol.t) Hashtbl.t

  let add_symbol table id symbol =
    Hashtbl.add table id symbol;
    symbol

  let add_type
        table ?(params = []) id prefix name =
    let symbol = {
      Symbol.module_prefix = prefix;
      symbol_name = name;
      params;
      optional = false;
    } in
    add_symbol table id symbol

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
      ~params:[Symbol.Type Symbol.date] "Date" "Js" "t"
      |> ignore;
    add_symbol table "Object" Symbol.js_object |> ignore;
    add_type table
      ~params:[Symbol.TypeVariable] "Function" "Js" "callback"
      |> ignore;
    add_type table "undefined" "" "unit" |> ignore;
    add_type
      ~params:[Symbol.Type (
        { Symbol.module_prefix = "Dom_html";
          symbol_name = "element";
          params = [];
          optional = false;
        })] table "HTMLElement" "Js" "t"
      |> ignore;
    add_type
      ~params:[Symbol.Type (
        { Symbol.module_prefix = "Dom_html";
          symbol_name = "event";
          params = [];
          optional = false;
        })] table "Event" "Js" "t"
      |> ignore;
    add_type
      ~params:[Symbol.Type (
        { Symbol.module_prefix = "Regexp";
          symbol_name = "regexp";
          params = [];
          optional = false;
        })] table "RegExp" "Js" "t"
      |> ignore;
    add_type
      ~params:[Symbol.Type (
        { Symbol.module_prefix = "XmlHttpRequest";
          symbol_name = "xmlHttpRequest";
          params = [];
          optional = false;
        })] table "XMLHttpRequest" "Js" "t"
      |> ignore;
    add_symbol table "Ext" Symbol.js_object |> ignore;
    (* Undefined types *)
    add_type table "Error" "" "" |> ignore;
    add_symbol table "Mixed" Symbol.js_object |> ignore;
    (* Map enumerations to strings, because enum types exist primarily for
     * documentation purposes. *)
    add_type table "Ext.enums.Feature" "Js" "js_string" |> ignore;
    add_type table "Ext.enums.Layout" "Js" "js_string" |> ignore;
    add_type table "Ext.enums.Plugin" "Js" "js_string" |> ignore;
    add_type table "Ext.enums.Widget" "Js" "js_string" |> ignore;
    table

  let rec lookup_type table id =
    let trimmed_id = String.trim id in
    let lookup_other_class_cat n symbol_name =
      (* TODO: refactor *)
      let stripped_id = String.rchop ~n trimmed_id in
      try
        let symbol = lookup_type table stripped_id in
          if symbol.Symbol.symbol_name <> "" then
            { symbol with Symbol.symbol_name }
          else symbol
      with Not_found ->
        let prefix =
          OCamlName.get_ocaml_name ModuleName stripped_id in
        add_type table trimmed_id prefix symbol_name
    in
    try
      Hashtbl.find table trimmed_id
    with Not_found ->
      if String.ends_with trimmed_id "_events" then
        lookup_other_class_cat 7 "events"
      else if String.ends_with trimmed_id "_configs" then
        lookup_other_class_cat 8 "configs"
      else if String.ends_with trimmed_id "_statics" then
        lookup_other_class_cat 8 "statics"
      else if String.starts_with trimmed_id "Ext." then
        let prefix =
          OCamlName.get_ocaml_name ModuleName trimmed_id in
        add_type table trimmed_id prefix "t"
      else failwith ("Unsupported type: " ^ trimmed_id)

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
            optional = false;
          }
      | s when String.ends_with s "..." ->
          (* varargs are not supported *)
          lookup_type table (String.rchop ~n:3 s)
      | s when String.starts_with s "Ext." ->
          let inner_type =
            lookup_type table s in
          { Symbol.module_prefix = "Js";
            symbol_name = "t";
            params = [Symbol.Type inner_type];
            optional = false;
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
      optional = false;
    };
  }

end

module Param =
struct
  type t = {
    id : string;
    name : string;
    ptype : Type.t;
    doc : string;
    default : string;
    optional : bool;
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
	let default = {
		Lens.get = (fun x -> x.default);
		Lens.set = (fun v x -> { x with default = v })
	}
	let optional = {
		Lens.get = (fun x -> x.optional);
		Lens.set = (fun v x -> { x with optional = v })
	}

  let create id ptype doc default optional = {
    id;
    name = OCamlName.get_ocaml_name ParameterName id;
    ptype;
    doc;
    default;
    optional;
  }

  let unit_param = {
    id = "";
    name = "()";
    ptype = Type.unit_type;
    doc = "";
    default = "";
    optional = false;
  }

end

module Function =
struct
  type t = {
    id : string;
    name : string;
    doc : string;
    owner : string;
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
    params = if params = [] then [Param.unit_param] else params;
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
    suffix : string;
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
	let suffix = {
		Lens.get = (fun x -> x.suffix);
		Lens.set = (fun v x -> { x with suffix = v })
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

  let create
        id doc readonly template suffix method_type params return =
    let name =
      OCamlName.get_ocaml_name ValueName id ^
      (if suffix <> "" then ("_" ^ suffix) else "") in
    { id;
      name;
      doc;
      readonly;
      template;
      suffix;
      method_type;
      params;
      return
    }

  let create_property id doc readonly suffix return =
    create
      id
      doc
      readonly
      false
      suffix
      Property
      []
      return

  let create_method id doc template suffix params return =
    create
      id
      doc
      false
      template
      suffix
      Method
      (if params = [] then [Param.unit_param] else params)
      return

  let create_event id doc suffix params =
    create
      id
      doc
      false
      false
      suffix
      Callback
      params
      Param.unit_param

end

module ClassType =
struct
  type t = {
    id : string;
    name : string;
    doc : string;
    superclasses : string list;
    methods : Method.t list;
    class_cat : class_cat;
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
	let class_cat = {
		Lens.get = (fun x -> x.class_cat);
		Lens.set = (fun v x -> { x with class_cat = v })
	}

  let create id = {
    id;
    name = "t";
    doc = "";
    superclasses = [];
    methods = [];
    class_cat = StandardClass;
  }

  let create_event_class id = {
    id = id ^ "_events";
    name = "events";
    doc = "";
    superclasses = [];
    methods = [];
    class_cat = EventClass;
  }

  let create_config_class id = {
    id = id ^ "_configs";
    name = "configs";
    doc = "";
    superclasses = [];
    methods = [];
    class_cat = ConfigClass;
  }

  let create_static_class id = {
    id = id ^ "_statics";
    name = "statics";
    doc = "";
    superclasses = [];
    methods = [];
    class_cat = StaticClass;
  }

end

module Module =
struct
  type t = {
    id : string;
    name : string;
    shortdoc : string;
    doc : string;
    toplevel : bool;
    class_types : ClassType.t list;
    functions : Function.t list;
    singleton : bool;
  }

	let id = {
		Lens.get = (fun x -> x.id);
		Lens.set = (fun v x -> { x with id = v })
	}
	let name = {
		Lens.get = (fun x -> x.name);
		Lens.set = (fun v x -> { x with name = v })
	}
	let shortdoc = {
		Lens.get = (fun x -> x.shortdoc);
		Lens.set = (fun v x -> { x with shortdoc = v })
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
	let singleton = {
		Lens.get = (fun x -> x.singleton);
		Lens.set = (fun v x -> { x with singleton = v })
	}

  let create toplevel = {
    id = "";
    name = "";
    shortdoc = "";
    doc = "";
    toplevel;
    class_types = [];
    functions = [];
    singleton = false;
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

