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
  | `Null -> []
  | _ ->
      failwith "get_json_elements: Unexpected JSON content"

let get_json_array = function
    `List arr -> arr
  | `Null -> []
  | _ ->
      failwith "get_json_array: Unexpected JSON content"

let get_json_element name json_elements =
  try
    List.find (fun (n, _) -> n = name) json_elements |> snd
  with Not_found -> `Null

let get_json_string = function
    `String s -> s
  | `Null -> ""
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

let is_singleton json_elements =
  List.exists
    (fun (n, e) -> n = "singleton" && e = `Bool true)
    json_elements
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
         Symbol.to_string "" superclass_symbol)
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
  let ext_type = get_json_element "type" es |> get_json_string in
  let default = get_json_element "default" es |> get_json_string in
  let ptype = SymbolTable.map_type table ext_type |> Type.create ext_type in
  Param.create name ptype doc default

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
       let ext_type = get_json_element "type" es |> get_json_string in
       let default = get_json_element "default" es |> get_json_string in
       let return_type = SymbolTable.map_type table ext_type in
       let return = Type.create ext_type return_type in
       let return_param = Param.create "" return "" default in
       Method.create_property name doc readonly return_param)

let add_methods =
  create_and_add_members
    (fun es table name doc ->
       let template = is_template es in
       let params =
         get_json_element "params" es |> get_json_array
           |> List.map (parse_param table) in
       let return = get_json_element "return" es |> parse_param table in
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
  let empty_class_type = ClassType.create current_module.Module.id in
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
       let ext_type = get_json_element "type" es |> get_json_string in
       let return_type = SymbolTable.map_type table ext_type in
       let return = Type.create ext_type return_type in
       let default = get_json_element "default" es |> get_json_string in
       let return_param = Param.create "" return "" default in
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

let tag_regexp = Str.regexp "<[^>]+>"

let build_module json_elements toplevel =
  let empty_module = Module.create toplevel in
  ContextM.foldM
    (fun current -> function
         ("name", `String s) ->
           ContextM.return (current |> Module.set_id s)
       | ("tagname", `String "class") ->
           if is_singleton json_elements then
             ContextM.return current
           else
             add_class_type json_elements current
       | ("doc", `String s) ->
           let stripped =
             Str.global_replace tag_regexp "" (String.left s 200) in
           let shortdoc = String.left stripped 50 |> String.trim in
           ContextM.return (current
                              |> Module.doc ^= s
                              |> Module.shortdoc ^= shortdoc)
       | ("members", `Assoc xs) ->
           if is_singleton json_elements then
             add_statics xs current
           else
             ContextM.return current
       | ("statics", `Assoc xs) ->
           add_statics xs current
       | _ ->
           ContextM.return current)
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

(* Utils *)
let print_param_types formatter pts =
  List.iter (fun s -> Format.fprintf formatter "%s@ ->@ " s) pts

let print_meth formatter print_type =
  Format.fprintf formatter "(";
  print_type ();
  Format.fprintf formatter ")@ Js.meth"

let print_callback_prop formatter print_type =
  Format.fprintf formatter "('self,@ ";
  print_type ();
  Format.fprintf formatter ")@ Js.meth_callback@ Js.writeonly_prop"

let get_return_string current_module param =
  Symbol.to_string current_module.Module.name param.Param.ptype.Type.symbol

let get_param_strings current_module params =
  let param_types =
    List.map (fun param -> param.Param.ptype.Type.symbol) params in
  Symbol.map_symbols_to_strings current_module.Module.name param_types

let get_param_and_return_strings current_module params return =
  let param_types =
    List.map
      (fun param -> param.Param.ptype.Type.symbol)
      (params @ [return]) in
  let all_strings =
    Symbol.map_symbols_to_strings current_module.Module.name param_types in
  let (param_strings, return_strings) =
    List.split_at (List.length all_strings - 1) all_strings in
  (param_strings, List.hd return_strings)
(* END utils *)

(* .ml write *)
let write_method formatter current_module m =
  Format.fprintf formatter "@[<hov 2>method %s :@ " m.Method.name;
  let (param_strings, return_string) =
    if m.Method.params <> [] then
      get_param_and_return_strings
        current_module m.Method.params m.Method.return
    else
      ([], get_return_string current_module m.Method.return)
  in
  begin match m.Method.method_type with
      Method.Property ->
        Format.fprintf formatter "%s@ %s"
          return_string
          (if m.Method.readonly then "Js.readonly_prop" else "Js.prop")
    | Method.Method ->
        if param_strings = [] then
          if m.Method.template then
            print_callback_prop formatter
              (fun () -> Format.fprintf formatter "%s" return_string)
          else
            Format.fprintf formatter "%s@ Js.meth" return_string
        else
          if m.Method.template then begin
            print_callback_prop formatter
              (fun () ->
                 print_param_types formatter param_strings;
                 Format.fprintf formatter "%s" return_string);
          end else begin
            print_meth formatter
              (fun () ->
                 print_param_types formatter param_strings;
                 Format.fprintf formatter "%s" return_string);
          end
    | Method.Callback ->
        print_callback_prop formatter
          (fun () ->
             print_param_types formatter param_strings;
             Format.fprintf formatter "%s" return_string)
  end;
  Format.fprintf formatter "@]@\n"

let write_class_type formatter write_method current_module ct =
  Format.fprintf formatter "class type %s =@\n@[<v 2>object('self)@\n"
    ct.ClassType.name;
  List.iter
    (Format.fprintf formatter "inherit %s@\n")
    ct.ClassType.superclasses;
  Format.fprintf formatter "@\n";
  List.iter
    (write_method formatter current_module)
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
    Format.fprintf formatter "@[<hv 2>@[<hov 2>let %s@ " f.Function.name;
    List.iter
      (fun param -> Format.fprintf formatter "%s@ " param.Param.name)
      f.Function.params;
    Format.fprintf formatter
      "=@]@\n@[<hv 2>Js.Unsafe.fun_call@ (Js.Unsafe.variable \"%s.%s\")@ @[<hv 2>[|"
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
    (write_class_type formatter write_method m)
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
(* END .ml write *)

(* .mli write *)
let print_param_doc formatter params =
  if params <> [] &&
     (params |. Lens.head |. Param.ptype) <> Type.unit_type then begin
    Format.fprintf formatter "@\n{b Parameters}:@\n";
    List.iter
      (fun param ->
         if param.Param.name <> "()" then begin
           Format.fprintf formatter "- %s: [%s]@ {%% %s %%}@\n"
             param.Param.name
             (Symbol.to_string "" param.Param.ptype.Type.symbol)
             param.Param.doc;
           if param.Param.default <> "" then begin
             Format.fprintf formatter "@ Defaults to: %s@\n"
               param.Param.default;
           end
         end)
      params;
    Format.fprintf formatter "@\n";
  end

let print_return_doc formatter return =
  if return.Param.ptype <> Type.unit_type &&
     return.Param.doc <> "" &&
     return.Param.doc <> "\n" then begin
    Format.fprintf formatter "@\n{b Returns}:@\n";
    Format.fprintf formatter "- [%s]@ {%% %s %%}@\n"
      (Symbol.to_string "" return.Param.ptype.Type.symbol)
      return.Param.doc;
    if return.Param.default <> "" then begin
      Format.fprintf formatter "@ Defaults to: %s@\n" return.Param.default;
    end;
    Format.fprintf formatter "@\n";
  end

let write_method_with_docs formatter current_module m =
  write_method formatter current_module m;
  if m.Method.doc <> "" then begin
    Format.fprintf formatter "@[<hov 2>(** {%% %s %%}@\n"
      m.Method.doc;
    begin match m.Method.method_type with
        Method.Property ->
          if m.Method.return.Param.default <> "" then begin
            Format.fprintf formatter "@\nDefaults to: [%s]@\n"
              m.Method.return.Param.default;
          end;
      | Method.Method ->
          print_param_doc formatter m.Method.params;
          print_return_doc formatter m.Method.return;
      | Method.Callback ->
          print_param_doc formatter m.Method.params;
    end;
    Format.fprintf formatter "*)@]@\n";
  end

let write_class_type_with_docs formatter current_module ct =
  write_class_type formatter write_method_with_docs current_module ct

let write_function_declaration formatter current_module f =
  if f.Function.property then begin
    let return_string = get_return_string current_module f.Function.return in
    Format.fprintf formatter
      "@[<hov 2>val get_%s@ :@ unit@ ->@ %s@]@\n"
      f.Function.name
      return_string;
    if not f.Function.readonly then begin
      Format.fprintf formatter
        "@[<hov 2>val set_%s@ :@ %s@ ->@ unit@]@\n"
        f.Function.name
        return_string;
    end;
    Format.fprintf formatter "@[<hov 2>(**@ {%% %s %%}@\n" f.Function.doc;
    if f.Function.return.Param.default <> "" then begin
      Format.fprintf formatter "@\nDefaults to: [%s]@\n"
        f.Function.return.Param.default;
    end;
    Format.fprintf formatter "*)@]\n@\n";
  end else begin
    let (param_strings, return_string) =
      get_param_and_return_strings
          current_module f.Function.params f.Function.return in
    let param_strings = get_param_strings current_module f.Function.params in
    Format.fprintf formatter "@[<hov 2>val %s@ :@ " f.Function.name;
    print_param_types formatter param_strings;
    Format.fprintf formatter "%s@]@\n" return_string;
    Format.fprintf formatter "@[<hov 2>(**@ {%% %s %%}@\n" f.Function.doc;
    print_param_doc formatter f.Function.params;
    print_return_doc formatter f.Function.return;
    Format.fprintf formatter "*)@]\n@\n";
  end

let write_module_interface formatter m =
  if m.Module.toplevel then begin
    Format.fprintf formatter "@[<hov 2>(** %s...@\n@\n"
      m.Module.shortdoc;
    Format.fprintf formatter "{%% %s %%}@ *)@]@\n@\n"
      m.Module.doc;
  end else begin
    Format.fprintf formatter "module %s :@\n@[<v 2>sig@,"
      m.Module.name
  end;
  List.iter
    (write_class_type_with_docs formatter m)
    m.Module.class_types;
  List.iter
    (write_function_declaration formatter m)
    m.Module.functions;
  if not m.Module.toplevel then begin
    Format.fprintf formatter "@]@\nend@\n";
    Format.fprintf formatter "@[<hov 2>(**@ {%% %s %%}@\n@\n"
      m.Module.shortdoc;
    Format.fprintf formatter "{%% %s %%}@ *)@]@\n@\n"
      m.Module.doc;
  end

let generate_mli file =
  let file_name =
    Filename.concat !output_path file.File.name ^ ".mli" in
  let (oc, formatter) = open_file file_name in
    List.iter
      (write_module_interface formatter)
      file.File.modules;
    close_file oc formatter
(* END .mli write *)

(* Main program *)
let () =
  let path = ref "tools/jsduck" in
  let usage =
    "Usage: " ^ Sys.executable_name ^ " [-nooverwrite] [-outdir <path>] [<json-path>]" in
  let arg_specs =
    Arg.align (
      ["-api",
       Arg.Set no_overwrite,
       " Refuse to overwrite previously generated files.";
       "-outdir",
       Arg.Set_string output_path,
       "<path> Place the generated files into <path> (defaults to: \"./tools/generated/\")."
      ]) in
  let () =
    Arg.parse
      arg_specs
      (fun s -> path := s)
      usage in
  let generate_module filepath =
    let file = build_file filepath in
    generate_ml file;
    generate_mli file in
  if Sys.is_directory !path then begin
    let files = Sys.readdir !path in
      Array.iter
        (fun f ->
           if String.ends_with f ".json" then begin
             print_endline f;
             generate_module (Filename.concat !path f)
           end)
        files
  end else begin
    generate_module !path
  end
(* END Main program *)

