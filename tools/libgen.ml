open Batteries
open Yojson
open Lens.Infix
open Lens.StateInfix
open SourceModel

(* Configuration *)
let output_path = ref "tools/generated"
let no_overwrite = ref false
(* END Configuration *)

(* Monad *)
module ContextM =
struct
  include Context.ContextStateMonad

  include StateMonad.MakeMonadCombinators(Context.ContextStateMonad)

end

open ContextM.Infix
(* END Monad *)

(* JSON *)
let get_json_elements = function
    `Assoc assoc -> assoc
  | _ ->
      failwith "get_json_elements: Unexpected JSON content"

let get_json_array = function
    `List arr -> arr
  | _ ->
      failwith "get_json_array: Unexpected JSON content"

let get_json_element name json_elements =
  try
    List.find (fun (n, _) -> n = name) json_elements |> snd
  with Not_found -> `String ""

let get_json_string = function
    `String s -> s
  | _ ->
      failwith "get_json_string: Unexpected JSON content"

let check_meta_content predicate name json_elements =
  List.exists
    (fun (n, e) ->
       n = "meta" &&
       List.exists
         (fun (n', e') ->
            n' = name && predicate e')
         (get_json_elements e))
    json_elements

let check_meta_flag =
  check_meta_content (fun e -> e = `Bool true)

let is_deprecated =
  check_meta_content (fun _ -> true) "deprecated"

let is_readonly =
  check_meta_flag "readonly"

let is_private =
  check_meta_flag "private"

let is_template =
  check_meta_flag "template"
(* END JSON *)

(* Superclasses *)
let add_superclasses json_elements current_class_type =
  Lens.get_state Context.symbol_table >>= fun table ->
  let superclasses =
    List.map
      (fun json ->
         let superclass_id = get_json_string json in
         let superclass_symbol =
           SymbolTable.lookup_type table superclass_id
         in
         Symbol.to_string superclass_symbol)
      json_elements
      |> List.filter (fun s -> s <> "")
  in
  let updated_class_type =
    current_class_type
      |> ClassType.superclasses ^%= (fun s -> s @ superclasses)
  in
  ContextM.return updated_class_type
(* END Superclasses *)

(* Members *)
let parse_param table json_object =
  let es = get_json_elements json_object in
  let name = get_json_element "name" es |> get_json_string in
  let doc = get_json_element "doc" es |> get_json_string in
  let ext_type =
    get_json_element "type" es |> get_json_string in
  let ptype = SymbolTable.map_type table ext_type |> Type.create ext_type in
  Param.create name ptype doc

let create_and_add_members create_member json_array current_class_type =
  ContextM.foldM
    (fun current json_object ->
       let es = get_json_elements json_object in
       if is_private es || is_deprecated es then
         ContextM.return current
       else
         Lens.get_state Context.symbol_table >>= fun table ->
         let name = get_json_element "name" es |> get_json_string in
         if name = "constructor" then
           ContextM.return current
         else
           let doc = get_json_element "doc" es |> get_json_string in
           let member = create_member es table name doc in
           let updated =
             current
               |> ClassType.methods ^%= (fun m -> m @ [member])
           in
           ContextM.return updated)
    current_class_type
    json_array

let add_properties =
  create_and_add_members
    (fun es table name doc ->
       let readonly = is_readonly es in
       let return_type_ext =
         get_json_element "type" es |> get_json_string in
       let return_type =
         SymbolTable.map_type table return_type_ext in
       let return = Type.create return_type_ext return_type in
       let return_param = Param.create "" return "" in
       Method.create_property name doc readonly return_param)

let add_methods =
  create_and_add_members
    (fun es table name doc ->
       let template = is_template es in
       let params =
         get_json_element "params" es |> get_json_array
           |> List.map (parse_param table) in
       let return =
         get_json_element "return" es |> parse_param table in
       Method.create_method name doc template params return)

let add_events =
  create_and_add_members
    (fun es table name doc ->
         let params =
           get_json_element "params" es |> get_json_array
             |> List.map (parse_param table) in
         Method.create_event name doc params)

let add_members json_elements current_class_type =
  ContextM.foldM
    (fun current -> function
         ("property", `List xs)
       | ("cfg", `List xs) ->
           add_properties xs current
       | ("method", `List xs) ->
           add_methods xs current
       | ("event", `List xs) ->
           add_events xs current
       | _ ->
           ContextM.return current
    )
    current_class_type
    json_elements
(* END Members *)

(* Class types *)
let add_class_type json_elements current_module =
  let empty_class_type =
    ClassType.create current_module.Module.id
  in
  ContextM.foldM
    (fun current -> function
         ("doc", `String s) ->
           ContextM.return (current |> ClassType.doc ^= s)
       | ("superclasses", `List xs) ->
           add_superclasses xs current
       | ("mixins", `List xs) ->
           add_superclasses xs current
       | ("members", `Assoc xs) ->
           add_members xs current
       | _ ->
           ContextM.return current
    )
    empty_class_type
    json_elements >>= fun created_class_type ->
  let updated_module =
    current_module |> Module.class_types ^= [created_class_type]
  in
  Lens.get_state Context.symbol_table >>= fun table ->
  SymbolTable.add_type table
    created_class_type.ClassType.id
    current_module.Module.name
    created_class_type.ClassType.name
    |> ignore;
  ContextM.return updated_module
(* END Class types *)

(* Statics *)
let create_and_add_statics create_function json_array current_module =
  ContextM.foldM
    (fun current json_object ->
       let es = get_json_elements json_object in
       if is_private es || is_deprecated es then
         ContextM.return current
       else
         Lens.get_state Context.symbol_table >>= fun table ->
         let name = get_json_element "name" es |> get_json_string in
         let doc = get_json_element "doc" es |> get_json_string in
         let f = create_function es table name doc in
         let updated =
           current
             |> Module.functions ^%= (fun fs -> fs @ [f])
         in
         ContextM.return updated)
    current_module
    json_array

let add_static_properties =
  create_and_add_statics
    (fun es table name doc ->
       let owner = get_json_element "owner" es |> get_json_string in
       let readonly = is_readonly es in
       let return_type_ext =
         get_json_element "type" es |> get_json_string in
       let return_type =
         SymbolTable.map_type table return_type_ext in
       let return = Type.create return_type_ext return_type in
       let return_param = Param.create "" return "" in
       Function.create_property name doc owner readonly return_param)

let add_static_methods =
  create_and_add_statics
    (fun es table name doc ->
       let owner = get_json_element "owner" es |> get_json_string in
       let params =
         get_json_element "params" es |> get_json_array
           |> List.map (parse_param table) in
       let return =
         get_json_element "return" es |> parse_param table in
       Function.create name doc owner params return)

let add_static_events =
  create_and_add_statics
    (fun es table name doc ->
       failwith ("Static events are not supported: " ^ name))

let add_statics json_elements current_module =
  ContextM.foldM
    (fun current -> function
         ("property", `List xs)
       | ("cfg", `List xs) ->
           add_static_properties xs current
       | ("method", `List xs) ->
           add_static_methods xs current
       | ("event", `List xs) ->
           add_static_events xs current
       | _ ->
           ContextM.return current
    )
    current_module
    json_elements
(* END Statics *)

let build_module json_elements toplevel =
  let empty_module = Module.create toplevel in
  ContextM.foldM
    (fun current -> function
         ("name", `String s) ->
           ContextM.return (current |> Module.set_id s)
       | ("tagname", `String "class") ->
           (* TODO: check singleton *)
           add_class_type json_elements current
       | ("doc", `String s) ->
           ContextM.return (current |> Module.doc ^= s)
       | ("statics", `Assoc xs) ->
           add_statics xs current
       | _ ->
           ContextM.return current
    )
    empty_module
    json_elements >>= fun created_module ->
  Lens.get_state Context.symbol_table >>= fun table ->
  ContextM.return created_module

let build_modules json =
  let toplevel_json = get_json_elements json in
  build_module toplevel_json true >>= fun toplevel_module ->
  let modules = [toplevel_module] in
  (Context.current_file |-- File.modules) ^=! modules >>
  ContextM.return modules

let build_file json_file =
  let basename = Filename.basename json_file |> Filename.chop_extension in
  let file = File.create basename in
  let context = Context.create file in
  let json = Safe.from_file json_file in
  let final_context = build_modules json context |> snd in
  final_context |. Context.current_file
    
(* File opening and closing *)
let open_file file_name =
  let () =
    if (Sys.file_exists file_name) && !no_overwrite then begin
      Printf.fprintf stderr "\nError: File %s already exists.\n" file_name;
      exit 1
    end in
  let oc = open_out file_name in
  let formatter = Format.formatter_of_out_channel oc in
    (oc, formatter)

let close_file oc formatter =
  Format.fprintf formatter "@?";
  close_out oc
(* END File opening and closing *)

(* File write *)
let write_method formatter m =
  Format.fprintf formatter "@[<hov 2>method %s :@ " m.Method.name;
  begin match m.Method.method_type with
      Method.Property ->
        let return_type =
          m.Method.return.Param.ptype.Type.symbol in
        Format.fprintf formatter "%s@ %s"
          (Symbol.to_string return_type)
          (if m.Method.readonly
           then "Js.readonly_prop"
           else "Js.prop")
    | Method.Method ->
        let param_types =
          List.map
            (fun param -> param.Param.ptype.Type.symbol)
            m.Method.params in
        let return_type =
          m.Method.return.Param.ptype.Type.symbol in
        if param_types = [] then
          let return_string = Symbol.to_string return_type in
          if m.Method.template then
            Format.fprintf formatter
              "('self,@ %s)@ Js.meth_callback@ Js.writeonly_prop"
              return_string
          else
            Format.fprintf formatter "%s@ Js.meth"
              return_string
        else
          let params_string = Symbol.symbols_to_string " -> " param_types in
          let return_string = Symbol.to_string return_type in
          if m.Method.template then
            Format.fprintf formatter
              "('self,@ %s@ ->@ %s)@ Js.meth_callback@ Js.writeonly_prop"
              params_string
              return_string
          else
            Format.fprintf formatter "(%s@ ->@ %s)@ Js.meth"
              params_string
              return_string
    | Method.Callback ->
        let param_types =
          List.map
            (fun param -> param.Param.ptype.Type.symbol)
            m.Method.params in
        let return_type =
          m.Method.return.Param.ptype.Type.symbol in
        let params_string = Symbol.symbols_to_string " -> " param_types in
        let return_string = Symbol.to_string return_type in
        Format.fprintf formatter
          "('self,@ %s@ ->@ %s)@ Js.meth_callback@ Js.writeonly_prop"
          params_string
          return_string
  end;
  Format.fprintf formatter "@]@\n"

let write_class_type formatter ct =
  Format.fprintf formatter "class type %s =@\n@[<v 2>object('self)@\n"
    ct.ClassType.name;
  List.iter
    (Format.fprintf formatter "inherit %s@\n")
    ct.ClassType.superclasses;
  Format.fprintf formatter "@\n";
  List.iter
    (write_method formatter)
    ct.ClassType.methods;
  Format.fprintf formatter "@]@,end@\n@\n"

let write_function formatter f =
  if f.Function.property then begin
    Format.fprintf formatter
      "@[<hov 2>let get_%s@ ()@ =@,@[<hv 2>Js.Unsafe.get@ (Js.Unsafe.variable \"%s\")@ (Js.Unsafe.variable \"%s\")@]@]@\n@\n"
      f.Function.name
      f.Function.owner
      f.Function.id;
    if not f.Function.readonly then begin
      Format.fprintf formatter
        "@[<hov 2>let set_%s@ v =@,@[<hv 2>Js.Unsafe.set@ (Js.Unsafe.variable \"%s\")@ (Js.Unsafe.variable \"%s\")@ v@]@]@\n@\n"
        f.Function.name
        f.Function.owner
        f.Function.id;
    end;
  end else begin
    Format.fprintf formatter "@[<hov 2>let %s@ " f.Function.name;
    List.iter
      (fun param -> Format.fprintf formatter "%s@ " param.Param.name)
      f.Function.params;
    Format.fprintf formatter
      "=@,@[<hv 2>Js.Unsafe.fun_call@ (Js.Unsafe.variable \"%s.%s\")@ @[<hv 2>[|"
      f.Function.owner
      f.Function.id;
    List.iter
      (fun param ->
         if param.Param.name <> "()" then
           Format.fprintf formatter "Js.Unsafe.inject@ %s;@ " param.Param.name)
      f.Function.params;
    Format.fprintf formatter "@]|]@]@]@\n@\n"
  end

let write_module formatter m =
  if not m.Module.toplevel then begin
    Format.fprintf formatter "module %s =@\n@[<v 2>struct@,"
      m.Module.name
  end;
  List.iter
    (write_class_type formatter)
    m.Module.class_types;
  List.iter
    (write_function formatter)
    m.Module.functions;
  if not m.Module.toplevel then begin
    Format.fprintf formatter "@]@\nend@\n"
  end

let generate_ml file =
  let file_name =
    Filename.concat !output_path file.File.name ^ ".ml" in
  let (oc, formatter) = open_file file_name in
    List.iter
      (write_module formatter)
      file.File.modules;
    close_file oc formatter
(* END File write *)

let () =
  let file = build_file "tools/jsduck/Ext.Error.json" in
  generate_ml file

