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

let check_flag name json_elements =
  List.exists
    (fun (n, e) -> n = name && e = `Bool true)
    json_elements

let is_optional =
  check_flag "optional"
(* END JSON *)

(* Docs *)
let at_regexp = Str.regexp "@"
(* HACK: Specific regexp to match an unbalanced quote *)
let quote_regexp = Str.regexp (Str.quote "', and \"")

let clean_doc s =
  String.trim s
    |> Str.global_replace at_regexp "\\\\\\0"
    |> Str.global_replace quote_regexp "', and &quot;"
(* END Docs *)

(* Superclasses *)
let add_superclasses json_elements current_class_type =
  Lens.get_state Context.symbol_table >>= fun table ->
  let superclasses =
    List.map
      (fun json ->
         let superclass_id = get_json_string json in
         let id =
           match current_class_type.ClassType.class_cat with
               EventClass ->
                 superclass_id ^ "_events"
             | ConfigClass ->
                 superclass_id ^ "_configs"
             | StaticClass ->
                 superclass_id ^ "_statics"
             | StandardClass ->
                 superclass_id
         in
         let superclass_symbol =
           SymbolTable.lookup_type table id
         in
         Symbol.to_string
           "" current_class_type.ClassType.class_cat superclass_symbol)
      json_elements
      |> List.filter (fun s -> s <> "")
      |> List.unique
  in
  let updated_class_type =
    current_class_type
      |> ClassType.superclasses ^%= (fun s -> s @ superclasses)
  in
  ContextM.return updated_class_type
(* END Superclasses *)

(* Members *)
type member_type =
    Property
  | Method
  | Cfg
  | Event

module Overrides =
struct
  type override_type =
      Suffix of string
    | Disable
    | NoOverride
    | Override of Param.t list * Param.t option

  let overrides =
    let make_param ?(name = "") ?(optional = false) symbol = {
      Param.id = "";
      name;
      ptype = {
        Type.id = "";
        symbol;
      };
      doc = "";
      default = "";
      optional;
    } in
    let make_param_js_t ?name ?optional type_param =
      make_param ?name ?optional (Symbol.js_t (Symbol.Type type_param))
    in
    let make_param_ext_js_t ?name ?optional module_name =
      make_param_js_t ?name ?optional {
        Symbol.module_prefix = module_name;
        symbol_name = "t";
        params = [];
        optional = false;
      }
    in
    let tbl = Hashtbl.create 64 in
    List.iter
      (fun (module_name, name, member_type, override) ->
         Hashtbl.add tbl (module_name, name, member_type) override)
      [("Ext.util.Point", "equals", Method, Suffix "point");
       ("Ext.dd.DDTarget", "addInvalidHandleClass", Method, Disable);
       ("Ext.dd.DDTarget", "addInvalidHandleId", Method, Disable);
       ("Ext.dd.DDTarget", "addInvalidHandleType", Method, Disable);
       ("Ext.dd.DDTarget", "clearConstraints", Method, Disable);
       ("Ext.dd.DDTarget", "clearTicks", Method, Disable);
       ("Ext.dd.DDTarget", "endDrag", Method, Disable);
       ("Ext.dd.DDTarget", "getDragEl", Method, Disable);
       ("Ext.dd.DDTarget", "isValidHandleChild", Method, Disable);
       ("Ext.dd.DDTarget", "onDrag", Method, Disable);
       ("Ext.dd.DDTarget", "onDragDrop", Method, Disable);
       ("Ext.dd.DDTarget", "onDragEnter", Method, Disable);
       ("Ext.dd.DDTarget", "onDragOut", Method, Disable);
       ("Ext.dd.DDTarget", "onDragOver", Method, Disable);
       ("Ext.dd.DDTarget", "onInvalidDrop", Method, Disable);
       ("Ext.dd.DDTarget", "onMouseDown", Method, Disable);
       ("Ext.dd.DDTarget", "onMouseUp", Method, Disable);
       ("Ext.dd.DDTarget", "removeInvalidHandleClass", Method, Disable);
       ("Ext.dd.DDTarget", "removeInvalidHandleId", Method, Disable);
       ("Ext.dd.DDTarget", "removeInvalidHandleType", Method, Disable);
       ("Ext.dd.DDTarget", "resetConstraints", Method, Disable);
       ("Ext.dd.DDTarget", "setDragElId", Method, Disable);
       ("Ext.dd.DDTarget", "setHandleElId", Method, Disable);
       ("Ext.dd.DDTarget", "setInitPosition", Method, Disable);
       ("Ext.dd.DDTarget", "setOuterHandleElId", Method, Disable);
       ("Ext.dd.DDTarget", "setXConstraint", Method, Disable);
       ("Ext.dd.DDTarget", "setYConstraint", Method, Disable);
       ("Ext.dd.DDTarget", "startDrag", Method, Disable);
       ("Ext.dom.Element", "getAlignToXY", Method, Suffix "number");
       ("Ext.dom.Element", "getAnchorXY", Method, Suffix "number");
       ("Ext.dom.Element", "getOffsetsTo", Method, Suffix "number");
       ("Ext.dom.Element", "getXY", Method, Suffix "number");
       ("Ext.dom.Element", "mask", Method, Suffix "element");
       ("Ext.dom.Element", "setXY", Method, Suffix "number");
       ("Ext.dom.Element", "update", Method, Suffix "html");
       ("Ext.ComponentLoader", "renderer", Cfg, Suffix "2");
       ("Ext.Component", "draggable", Cfg, Suffix "obj");
       ("Ext.layout.Layout", "getLayoutItems", Method, Suffix "empty");
       ("Ext.layout.container.Container", "beginLayout", Method, Suffix "obj");
       ("Ext.layout.container.Container", "configureItem", Method,
        Suffix "obj");
       ("Ext.container.AbstractContainer", "disable", Method,
        Suffix "chainable");
       ("Ext.container.Container", "onAdded", Method, Suffix "container");
       ("Ext.dd.StatusProxy", "hide", Method, Suffix "proxy");
       ("Ext.dd.StatusProxy", "update", Method, Suffix "html");
       ("Ext.util.ComponentDragger", "delegate", Cfg, Suffix "element");
       ("Ext.window.Window", "dd", Property, Suffix "dragger");
       ("Ext.window.Window", "activate", Event, Suffix "window");
       ("Ext.window.Window", "deactivate", Event, Suffix "window");
       ("Ext.window.Window", "resize", Event, Suffix "window");
       ("Ext.window.MessageBox", "hide", Method, Suffix "component");
       ("Ext.window.MessageBox", "setIcon", Method, Suffix "chainable");
       ("Ext.window.MessageBox", "show", Method, Suffix "messagebox");
       ("Ext.data.AbstractStore", "create", Method, Suffix "store");
       ("Ext.data.Store", "load", Method, Suffix "store");
       ("Ext.data.Store", "removeAll", Method, Suffix "bool");
       ("Ext.view.AbstractView", "bindStore", Method, Suffix "view");
       ("Ext.view.AbstractView", "getStore", Method, Suffix "view");
       ("Ext.grid.plugin.Editing", "init", Method, Suffix "component");
       ("Ext.menu.Menu", "getBubbleTarget", Method, Suffix "container");
       ("Ext.menu.Menu", "hide", Method, Suffix "menu");
       ("Ext.menu.Menu", "show", Method, Suffix "menu");
       ("Ext.grid.column.Column", "resizable", Cfg, Suffix "bool");
       ("Ext.grid.column.Column", "hide", Method, Suffix "column");
       ("Ext.grid.column.Column", "show", Method, Suffix "column");
       ("Ext.app.Application", "getController", Method, Suffix "app");
       ("Ext.form.Panel", "layout", Cfg, Suffix "str");
       ("Ext.form.field.Base", "doComponentLayout", Method, Suffix "container");
       ("Ext.form.field.Base", "getInputId", Method, Disable);
       ("Ext.form.field.Base", "getSubTplMarkup", Method, Disable);
       ("Ext.form.field.Text", "processRawValue", Method, Suffix "str");
       ("Ext.tip.Tip", "showAt", Method, Suffix "arr");
       ("Ext.tip.ToolTip", "hide", Method, Suffix "tooltip");
       ("Ext.tip.ToolTip", "setPagePosition", Method, Disable);
       ("Ext.tip.ToolTip", "show", Method, Suffix "tooltip");
       ("Ext.tip.ToolTip", "showAt", Method, Suffix "arr");
       ("Ext.tip.QuickTip", "hide", Method, Disable);
       ("Ext.tip.QuickTip", "showAt", Method, Disable);
       ("Ext", "createByAlias", Method,
        Override ([make_param ~name:"alias"
                     (Symbol.js_t (Symbol.Type (Symbol.js_type "js_string")));
                   make_param ~name:"args" Symbol.js_object],
                  Some (make_param Symbol.js_object))
       );
       ("Ext", "exclude", Method,
        Override ([make_param_js_t ~name:"excludes" Symbol.generic_js_array],
                  Some (make_param Symbol.js_object))
       );
       ("Ext", "getBody", Method,
        Override ([],
                  Some (make_param_ext_js_t "Ext_dom_Element"))
       );
       ("Ext", "getClass", Method,
        Override ([make_param ~name:"object" Symbol.js_object],
                  Some (make_param_ext_js_t "Ext_Class"))
       );
       ("Ext", "getClassName", Method,
        Override ([make_param ~name:"object" Symbol.js_object],
                  Some (make_param
                          (Symbol.js_t
                             (Symbol.Type (Symbol.js_type "js_string")))))
       );
       ("Ext", "getDoc", Method,
        Override ([],
                  Some (make_param_ext_js_t "Ext_dom_Element"))
       );
       ("Ext", "getHead", Method,
        Override ([],
                  Some (make_param_ext_js_t "Ext_dom_Element"))
       );
       ("Ext", "onDocumentReady", Method,
        Override ([make_param ~name:"fn"
                     { Symbol.module_prefix = "Js";
                       symbol_name = "callback";
                       params = [Symbol.TypeVariable];
                       optional = false;
                     };
                   make_param ~name:"scope" ~optional:true Symbol.js_object;
                   make_param ~name:"options" ~optional:true Symbol.js_object],
                  None)
       );
       ("Ext", "onReady", Method,
        Override ([make_param ~name:"fn"
                     { Symbol.module_prefix = "Js";
                       symbol_name = "callback";
                       params = [Symbol.TypeVariable];
                       optional = false;
                     };
                   make_param ~name:"scope" Symbol.js_object;
                   make_param ~name:"options" Symbol.js_object],
                  None)
       );
       ("Ext", "require", Method,
        Override ([make_param ~name:"expressions" Symbol.js_object;
                   make_param ~name:"fn" ~optional:true
                     { Symbol.module_prefix = "Js";
                       symbol_name = "callback";
                       params = [Symbol.TypeVariable];
                       optional = false;
                     };
                   make_param ~name:"scope" ~optional:true Symbol.js_object;
                   make_param ~name:"excludes" ~optional:true Symbol.js_object],
                  None)
       );
       ("Ext", "syncRequire", Method,
        Override ([make_param ~name:"expressions" Symbol.js_object;
                   make_param ~name:"fn" ~optional:true
                     { Symbol.module_prefix = "Js";
                       symbol_name = "callback";
                       params = [Symbol.TypeVariable];
                       optional = false;
                     };
                   make_param ~name:"scope" ~optional:true Symbol.js_object;
                   make_param ~name:"excludes" ~optional:true Symbol.js_object],
                  None)
       );
      ];
    tbl

  let get_override current_module name member_type =
    try
      Hashtbl.find overrides (current_module, name, member_type)
    with Not_found -> NoOverride

end

let parse_param table json_object =
  let es = get_json_elements json_object in
  let name = get_json_element "name" es |> get_json_string in
  let doc =
    get_json_element "doc" es |> get_json_string |> clean_doc in
  let ext_type = get_json_element "type" es |> get_json_string in
  let default = get_json_element "default" es |> get_json_string in
  let optional = is_optional es in
  let ptype = SymbolTable.map_type table ext_type |> Type.create ext_type in
  Param.create name ptype doc default optional

let create_and_add_members member_type
      create_member json_array current_module current_class_type =
  ContextM.foldM
    (fun current json_object ->
       let es = get_json_elements json_object in
       let owner = get_json_element "owner" es |> get_json_string in
       let name = get_json_element "name" es |> get_json_string in
       let override =
         Overrides.get_override current_module.Module.id name member_type in
       if owner <> current_module.Module.id ||
          is_private es ||
          is_deprecated es ||
          name = "" ||
          override = Overrides.Disable then
         ContextM.return current
       else
         Lens.get_state Context.symbol_table >>= fun table ->
         if name = "constructor" then
           ContextM.return current
         else
           let doc =
             get_json_element "doc" es |> get_json_string |> clean_doc in
           let member = create_member es table name doc override in
           let updated =
             current |> ClassType.methods ^%= (fun m -> m @ [member])
           in
           ContextM.return updated)
    current_class_type
    json_array

let get_suffix = function
    Overrides.Suffix s -> s
  | Overrides.NoOverride
  | Overrides.Override _ -> ""
  | Overrides.Disable -> assert false

let get_params = function
    Overrides.Suffix _
  | Overrides.NoOverride -> []
  | Overrides.Override (params, _) -> params
  | Overrides.Disable -> assert false

let get_return = function
    Overrides.Suffix _
  | Overrides.NoOverride -> None
  | Overrides.Override (_, return) -> return
  | Overrides.Disable -> assert false

let create_property es table name doc override =
  let readonly = is_readonly es in
  let ext_type = get_json_element "type" es |> get_json_string in
  let default = get_json_element "default" es |> get_json_string in
  let suffix = get_suffix override in
  let return_param =
    match get_return override with
        None ->
          let return_type = SymbolTable.map_type table ext_type in
          let return = Type.create ext_type return_type in
          Param.create "" return "" default false
      | Some r -> r
  in
  Method.create_property name doc readonly suffix return_param

let add_properties =
  create_and_add_members Property create_property

let add_configs =
  create_and_add_members Cfg create_property

let add_methods =
  create_and_add_members Method
    (fun es table name doc override ->
       let template = is_template es in
       let params =
         match get_params override with
             [] ->
               get_json_element "params" es |> get_json_array
                 |> List.map (parse_param table)
           | p -> p
       in
       let return =
         match get_return override with
             None ->
               get_json_element "return" es |> parse_param table
           | Some r -> r
       in
       let suffix = get_suffix override in
       Method.create_method name doc template suffix params return)

let add_events =
  create_and_add_members Event
    (fun es table name doc override ->
       let params =
         match get_params override with
             [] ->
               get_json_element "params" es |> get_json_array
                 |> List.map (parse_param table)
           | p -> p
       in
       let suffix = get_suffix override in
       Method.create_event name doc suffix params)

let add_members json_elements current_module current_class_type =
  ContextM.foldM
    (fun current -> function
         ("property", `List xs) ->
           add_properties xs current_module current
       | ("method", `List xs) ->
           add_methods xs current_module current
       | _ ->
           ContextM.return current
    )
    current_class_type
    json_elements

let add_events_to_class json_elements current_module current_class_type =
  ContextM.foldM
    (fun current -> function
         ("event", `List xs) ->
           add_events xs current_module current
       | _ ->
           ContextM.return current
    )
    current_class_type
    json_elements

let add_configs_to_class json_elements current_module current_class_type =
  ContextM.foldM
    (fun current -> function
         ("cfg", `List xs) ->
           add_configs xs current_module current
       | ("method", `List xs) ->
           add_methods xs current_module current
       | _ ->
           ContextM.return current
    )
    current_class_type
    json_elements
(* END Members *)

(* Class types *)
let add_class_types json_elements current_module =
  let new_class_type =
    ClassType.create current_module.Module.id in
  let new_event_class_type =
    ClassType.create_event_class current_module.Module.id in
  let new_config_class_type =
    ClassType.create_config_class current_module.Module.id in
  ContextM.foldM
    (fun (current, current_event, current_config) -> function
         ("doc", `String s) ->
           ContextM.return
             (current |> ClassType.doc ^= clean_doc s,
              current_event,
              current_config)
       | ("superclasses", `List xs)
       | ("mixins", `List xs) ->
           add_superclasses xs current >>= fun current' ->
           add_superclasses xs current_event >>= fun current_event' ->
           add_superclasses xs current_config >>= fun current_config' ->
           ContextM.return
             (current',
              current_event',
              current_config')
       | ("members", `Assoc xs) ->
           add_members xs current_module current >>= fun current' ->
           add_events_to_class
             xs current_module current_event >>= fun current_event' ->
           add_configs_to_class
             xs current_module current_config >>= fun current_config' ->
           ContextM.return
             (current',
              current_event',
              current_config')
       | _ ->
           ContextM.return
             (current,
              current_event,
              current_config)
    )
    (new_class_type, new_event_class_type, new_config_class_type)
    json_elements >>= fun (class_type, event_class_type, config_class_type) ->
  let updated_module =
    current_module
      |> Module.class_types ^= [class_type;
                                config_class_type;
                                event_class_type]
  in
  Lens.get_state Context.symbol_table >>= fun table ->
  SymbolTable.add_type table
    class_type.ClassType.id
    current_module.Module.name
    class_type.ClassType.name
    |> ignore;
  SymbolTable.add_type table
    event_class_type.ClassType.id
    current_module.Module.name
    event_class_type.ClassType.name
    |> ignore;
  SymbolTable.add_type table
    config_class_type.ClassType.id
    current_module.Module.name
    config_class_type.ClassType.name
    |> ignore;
  ContextM.return updated_module
(* END Class types *)

(* Statics *)
let create_and_add_statics create_function json_array current_module =
  ContextM.foldM
    (fun current json_object ->
       let es = get_json_elements json_object in
       let owner = get_json_element "owner" es |> get_json_string in
       if owner <> current_module.Module.id ||
          is_private es ||
          is_deprecated es then
         ContextM.return current
       else
         Lens.get_state Context.symbol_table >>= fun table ->
         let name = get_json_element "name" es |> get_json_string in
         let doc =
           get_json_element "doc" es |> get_json_string |> clean_doc in
         let f = create_function es table name doc owner in
         let updated =
           current
             |> Module.functions ^%= (fun fs -> fs @ [f])
         in
         ContextM.return updated)
    current_module
    json_array

let add_static_configs =
  create_and_add_statics
    (fun es table name doc owner ->
       failwith ("Static configs are not supported: " ^ name))

let add_static_methods =
  create_and_add_statics
    (fun es table name doc owner ->
       let params =
         get_json_element "params" es |> get_json_array
           |> List.map (parse_param table) in
       let return =
         get_json_element "return" es |> parse_param table in
       Function.create name doc owner params return)

let add_static_events =
  create_and_add_statics
    (fun es table name doc owner ->
       failwith ("Static events are not supported: " ^ name))

let add_statics json_elements current_module parent_elements =
  let new_static_class_type =
    ClassType.create_static_class current_module.Module.id in
  let superclasses =
    get_json_element "superclasses" parent_elements |> get_json_array in
  let mixins =
    get_json_element "mixins" parent_elements |> get_json_array in
  add_superclasses superclasses new_static_class_type >>= fun sct ->
  add_superclasses mixins sct >>= fun sct' ->
  ContextM.foldM
    (fun (current_m, current_ct) -> function
         ("cfg", `List xs) ->
           add_static_configs xs current_m >>= fun current_m' ->
           ContextM.return (current_m', current_ct)
       | ("property", `List xs) ->
           add_properties xs current_m current_ct >>= fun current_ct' ->
           ContextM.return (current_m, current_ct')
       | ("method", `List xs) ->
           add_methods xs current_m current_ct >>= fun current_ct' ->
           add_static_methods xs current_m >>= fun current_m' ->
           ContextM.return (current_m', current_ct')
       | ("event", `List xs) ->
           add_static_events xs current_m >>= fun current_m' ->
           ContextM.return (current_m', current_ct)
       | _ ->
           ContextM.return (current_m, current_ct)
    )
    (current_module, sct')
    json_elements >>= fun (current_module, static_class_type) ->
  let updated_module =
    current_module
      |> Module.class_types ^%= (fun cs -> cs @ [static_class_type])
  in
  ContextM.return updated_module
(* END Statics *)

let tag_regexp = Str.regexp "<[^>]+>"
let reserved_regexp = Str.regexp "[][{}@\n]"

let build_module json_elements toplevel =
  let id = get_json_element "name" json_elements |> get_json_string in
  let new_module = Module.create toplevel |> Module.set_id id in
  ContextM.foldM
    (fun current -> function
       | ("tagname", `String "class") ->
           add_class_types json_elements current
       | ("doc", `String s) ->
           let stripped =
             Str.global_replace tag_regexp "" (String.left s 200) in
           let without_reserved =
             Str.global_replace reserved_regexp "" stripped in
           let shortdoc = String.left without_reserved 50 |> String.trim in
           ContextM.return (current
                              |> Module.doc ^= clean_doc s
                              |> Module.shortdoc ^= shortdoc)
       | ("statics", `Assoc xs) ->
           add_statics xs current json_elements
       | ("singleton", `Bool true) ->
           ContextM.return (current |> Module.singleton ^= true)
       | _ ->
           ContextM.return current)
    new_module
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
  print_type ();
  Format.fprintf formatter "@ Js.meth"

let print_callback_prop formatter print_type =
  Format.fprintf formatter "(";
  print_type ();
  Format.fprintf formatter ")@ Js.callback@ Js.writeonly_prop"

let print_meth_callback_prop formatter print_type =
  Format.fprintf formatter "('self Js.t,@ ";
  print_type ();
  Format.fprintf formatter ")@ Js.meth_callback@ Js.writeonly_prop"

let get_return_string current_module class_cat param =
  Symbol.to_string
    current_module.Module.name class_cat param.Param.ptype.Type.symbol

let get_param_strings current_module class_cat params =
  let param_types =
    List.map
      (fun param ->
         { param.Param.ptype.Type.symbol with
               Symbol.optional = param.Param.optional })
      params in
  Symbol.map_symbols_to_strings
    current_module.Module.name class_cat param_types

let get_param_and_return_strings current_module class_cat params return =
  let param_types =
    List.map
      (fun param ->
         { param.Param.ptype.Type.symbol with
               Symbol.optional = param.Param.optional })
      (params @ [return]) in
  let all_strings =
    Symbol.map_symbols_to_strings
      current_module.Module.name
      class_cat
      param_types in
  let (param_strings, return_strings) =
    List.split_at (List.length all_strings - 1) all_strings in
  (param_strings, List.hd return_strings)
(* END utils *)

(* .ml write *)
let write_method formatter current_module class_cat m =
  if class_cat <> ConfigClass ||
     m.Method.method_type <> Method.Method ||
     m.Method.template then begin
    Format.fprintf formatter "@[<hov 2>method %s :@ " m.Method.name;
  end;
  let (param_strings, return_string) =
    if m.Method.params <> [] then
      get_param_and_return_strings
        current_module class_cat m.Method.params m.Method.return
    else
      ([], get_return_string current_module class_cat m.Method.return)
  in
  begin match m.Method.method_type with
      Method.Property ->
        Format.fprintf formatter "%s@ %s"
          return_string
          (if m.Method.readonly then "Js.readonly_prop" else "Js.prop")
    | Method.Method ->
        if param_strings = [] then
          begin match class_cat with
              ConfigClass when m.Method.template ->
                print_meth_callback_prop formatter
                  (fun () -> Format.fprintf formatter "%s" return_string)
            | StandardClass
            | StaticClass ->
                Format.fprintf formatter "%s@ Js.meth" return_string
            | _ -> ()
          end
        else
          begin match class_cat with
              ConfigClass when m.Method.template ->
                print_meth_callback_prop formatter
                  (fun () ->
                     print_param_types formatter param_strings;
                     Format.fprintf formatter "%s" return_string);
            | StandardClass
            | StaticClass ->
                print_meth formatter
                  (fun () ->
                     if m.Method.params <> [Param.unit_param] then
                       print_param_types formatter param_strings;
                     Format.fprintf formatter "%s" return_string);
            | _ -> ()
          end
    | Method.Callback ->
        print_callback_prop formatter
          (fun () ->
             print_param_types formatter param_strings;
             Format.fprintf formatter "%s" return_string)
  end;
  if class_cat <> ConfigClass ||
     m.Method.method_type <> Method.Method ||
     m.Method.template then begin
    Format.fprintf formatter "@]@\n";
  end

let write_class_type formatter write_method current_module ct =
  Format.fprintf formatter "class type %s =@\n@[<v 2>object%s@\n"
    ct.ClassType.name
    (match ct.ClassType.class_cat with
         EventClass
       | StaticClass -> ""
       | ConfigClass
       | StandardClass -> "('self)");
  List.iter
    (Format.fprintf formatter "inherit %s@\n")
    ct.ClassType.superclasses;
  Format.fprintf formatter "@\n";
  List.iter
    (write_method formatter current_module ct.ClassType.class_cat)
    ct.ClassType.methods;
  Format.fprintf formatter "@]@\nend@\n@\n"

let write_function formatter f =
  Format.fprintf formatter "@[<hv 2>@[<hov 2>let %s@ " f.Function.name;
  List.iter
    (fun param -> Format.fprintf formatter "%s@ " param.Param.name)
    f.Function.params;
  Format.fprintf formatter
    "=@]@\n@[<hv 2>Js.Unsafe.meth_call@ static@ (Js.Unsafe.variable \"%s\")@ @[<hv 2>[|"
    f.Function.id;
  List.iter
    (fun param ->
       if param.Param.name <> "()" then
         Format.fprintf formatter "Js.Unsafe.inject@ %s;@ " param.Param.name)
    f.Function.params;
  Format.fprintf formatter "@]|]@]@]@\n@\n"

let write_module formatter m =
  if not m.Module.toplevel then begin
    Format.fprintf formatter "module %s =@\n@[<v 2>struct@,"
      m.Module.name
  end;
  List.iter
    (write_class_type formatter write_method m)
    m.Module.class_types;
  Format.fprintf formatter
    "@[<hov 2>let static =@ Js.Unsafe.variable \"%s\"@]@\n@\n"
    m.Module.id;
  List.iter
    (write_function formatter)
    m.Module.functions;
  if m.Module.singleton then begin
    Format.fprintf formatter
      "@[<hov 2>let get_instance () =@ Js.Unsafe.variable \"%s\"@]@\n@\n"
      m.Module.id;
    Format.fprintf formatter
      "@[<hov 2>let instance =@ get_instance ()@]@\n@\n";
  end;
  Format.fprintf formatter "let of_configs c = Js.Unsafe.coerce c@\n@\n";
  Format.fprintf formatter "let to_configs o = Js.Unsafe.coerce o@\n@\n";
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
let regexp_dash = Str.regexp_string "- "

let print_param_doc formatter params =
  if params <> [] &&
     (params |. Lens.head |. Param.ptype) <> Type.unit_type then begin
    Format.fprintf formatter "@\n{b Parameters}:@\n{ul ";
    List.iter
      (fun param ->
         if param.Param.name <> "()" then begin
           Format.fprintf formatter "{- %s: [%s]%s"
             param.Param.name
             (Symbol.to_string "" StandardClass param.Param.ptype.Type.symbol)
             (if param.Param.optional then " (optional)" else "");
           if param.Param.doc <> "" then begin
             Format.fprintf formatter "@ {%% %s %%}"
               (Str.global_replace regexp_dash "* " param.Param.doc);
           end;
           if param.Param.default <> "" then begin
             Format.fprintf formatter "@\n@ Defaults to: %s"
               param.Param.default;
           end;
           Format.fprintf formatter "@\n}@\n";
         end)
      params;
    Format.fprintf formatter "}@\n";
  end

let print_return_doc formatter return =
  if return.Param.ptype <> Type.unit_type &&
     return.Param.doc <> "" then begin
    Format.fprintf formatter "@\n{b Returns}:@\n{ul ";
    Format.fprintf formatter "{- [%s]@ {%% %s %%}@\n"
      (Symbol.to_string "" StandardClass return.Param.ptype.Type.symbol)
      return.Param.doc;
    if return.Param.default <> "" then begin
      Format.fprintf formatter "@ Defaults to: %s@\n" return.Param.default;
    end;
    Format.fprintf formatter "}@\n}@\n";
  end

let write_method_with_docs formatter current_module class_cat m =
  write_method formatter current_module class_cat m;
  if m.Method.doc <> "" &&
     (class_cat <> ConfigClass ||
      m.Method.method_type <> Method.Method) then begin
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
  end else if class_cat = ConfigClass && m.Method.template then begin
    Format.fprintf formatter "(** See method [t.%s] *)@\n"
      m.Method.name;
  end

let write_class_type_with_docs formatter current_module ct =
  write_class_type formatter write_method_with_docs current_module ct

let write_function_declaration formatter current_module f =
  let (param_strings, return_string) =
    get_param_and_return_strings
        current_module StandardClass f.Function.params f.Function.return in
  let param_strings =
    get_param_strings current_module StandardClass f.Function.params in
  Format.fprintf formatter "@[<hov 2>val %s@ :@ " f.Function.name;
  print_param_types formatter param_strings;
  Format.fprintf formatter "%s@]@\n" return_string;
  Format.fprintf formatter "(** See method [statics.%s] *)@\n@\n"
    f.Function.name

let write_module_interface formatter m =
  if m.Module.toplevel then begin
    Format.fprintf formatter "@[<hov 2>(** %s ...@\n@\n"
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
    (fun ct ->
       if ct.ClassType.class_cat = StaticClass &&
          List.length ct.ClassType.methods > 0 then begin
         Format.fprintf formatter
           "val static : %s Js.t@\n(** Static instance. *)@\n@\n"
           ct.ClassType.name;
       end)
    m.Module.class_types;
  List.iter
    (write_function_declaration formatter m)
    m.Module.functions;
  if m.Module.singleton then begin
    Format.fprintf formatter
      "val get_instance : unit -> t Js.t@\n\
       (** Singleton instance for lazy-loaded modules. *)@\n@\n";
    Format.fprintf formatter
      "val instance : t Js.t@\n(** Singleton instance. *)@\n@\n";
  end;
  Format.fprintf formatter "val of_configs : configs Js.t -> t Js.t@\n";
  Format.fprintf formatter
    "(** [of_configs c] casts a config object [c] to an instance of \
     class [t] *)@\n@\n";
  Format.fprintf formatter "val to_configs : t Js.t -> configs Js.t@\n";
  Format.fprintf formatter
    "(** [to_configs o] casts instance [o] of class [t] to a config object \
     *)@\n@\n";
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

