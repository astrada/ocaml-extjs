(* OASIS_START *)
(* DO NOT EDIT (digest: dc5316b696891148db95a9594b444e5f) *)
module OASISGettext = struct
(* # 21 "src/oasis/OASISGettext.ml" *)

  let ns_ str =
    str

  let s_ str =
    str

  let f_ (str : ('a, 'b, 'c, 'd) format4) =
    str

  let fn_ fmt1 fmt2 n =
    if n = 1 then
      fmt1^^""
    else
      fmt2^^""

  let init =
    []

end

module OASISExpr = struct
(* # 21 "src/oasis/OASISExpr.ml" *)



  open OASISGettext

  type test = string 

  type flag = string 

  type t =
    | EBool of bool
    | ENot of t
    | EAnd of t * t
    | EOr of t * t
    | EFlag of flag
    | ETest of test * string
    

  type 'a choices = (t * 'a) list 

  let eval var_get t =
    let rec eval' =
      function
        | EBool b ->
            b

        | ENot e ->
            not (eval' e)

        | EAnd (e1, e2) ->
            (eval' e1) && (eval' e2)

        | EOr (e1, e2) ->
            (eval' e1) || (eval' e2)

        | EFlag nm ->
            let v =
              var_get nm
            in
              assert(v = "true" || v = "false");
              (v = "true")

        | ETest (nm, vl) ->
            let v =
              var_get nm
            in
              (v = vl)
    in
      eval' t

  let choose ?printer ?name var_get lst =
    let rec choose_aux =
      function
        | (cond, vl) :: tl ->
            if eval var_get cond then
              vl
            else
              choose_aux tl
        | [] ->
            let str_lst =
              if lst = [] then
                s_ "<empty>"
              else
                String.concat
                  (s_ ", ")
                  (List.map
                     (fun (cond, vl) ->
                        match printer with
                          | Some p -> p vl
                          | None -> s_ "<no printer>")
                     lst)
            in
              match name with
                | Some nm ->
                    failwith
                      (Printf.sprintf
                         (f_ "No result for the choice list '%s': %s")
                         nm str_lst)
                | None ->
                    failwith
                      (Printf.sprintf
                         (f_ "No result for a choice list: %s")
                         str_lst)
    in
      choose_aux (List.rev lst)

end


# 117 "myocamlbuild.ml"
module BaseEnvLight = struct
(* # 21 "src/base/BaseEnvLight.ml" *)

  module MapString = Map.Make(String)

  type t = string MapString.t

  let default_filename =
    Filename.concat
      (Sys.getcwd ())
      "setup.data"

  let load ?(allow_empty=false) ?(filename=default_filename) () =
    if Sys.file_exists filename then
      begin
        let chn =
          open_in_bin filename
        in
        let st =
          Stream.of_channel chn
        in
        let line =
          ref 1
        in
        let st_line =
          Stream.from
            (fun _ ->
               try
                 match Stream.next st with
                   | '\n' -> incr line; Some '\n'
                   | c -> Some c
               with Stream.Failure -> None)
        in
        let lexer =
          Genlex.make_lexer ["="] st_line
        in
        let rec read_file mp =
          match Stream.npeek 3 lexer with
            | [Genlex.Ident nm; Genlex.Kwd "="; Genlex.String value] ->
                Stream.junk lexer;
                Stream.junk lexer;
                Stream.junk lexer;
                read_file (MapString.add nm value mp)
            | [] ->
                mp
            | _ ->
                failwith
                  (Printf.sprintf
                     "Malformed data file '%s' line %d"
                     filename !line)
        in
        let mp =
          read_file MapString.empty
        in
          close_in chn;
          mp
      end
    else if allow_empty then
      begin
        MapString.empty
      end
    else
      begin
        failwith
          (Printf.sprintf
             "Unable to load environment, the file '%s' doesn't exist."
             filename)
      end

  let var_get name env =
    let rec var_expand str =
      let buff =
        Buffer.create ((String.length str) * 2)
      in
        Buffer.add_substitute
          buff
          (fun var ->
             try
               var_expand (MapString.find var env)
             with Not_found ->
               failwith
                 (Printf.sprintf
                    "No variable %s defined when trying to expand %S."
                    var
                    str))
          str;
        Buffer.contents buff
    in
      var_expand (MapString.find name env)

  let var_choose lst env =
    OASISExpr.choose
      (fun nm -> var_get nm env)
      lst
end


# 215 "myocamlbuild.ml"
module MyOCamlbuildFindlib = struct
(* # 21 "src/plugins/ocamlbuild/MyOCamlbuildFindlib.ml" *)

  (** OCamlbuild extension, copied from 
    * http://brion.inria.fr/gallium/index.php/Using_ocamlfind_with_ocamlbuild
    * by N. Pouillard and others
    *
    * Updated on 2009/02/28
    *
    * Modified by Sylvain Le Gall 
    *)
  open Ocamlbuild_plugin

  (* these functions are not really officially exported *)
  let run_and_read = 
    Ocamlbuild_pack.My_unix.run_and_read

  let blank_sep_strings = 
    Ocamlbuild_pack.Lexers.blank_sep_strings

  let split s ch =
    let x = 
      ref [] 
    in
    let rec go s =
      let pos = 
        String.index s ch 
      in
        x := (String.before s pos)::!x;
        go (String.after s (pos + 1))
    in
      try
        go s
      with Not_found -> !x

  let split_nl s = split s '\n'

  let before_space s =
    try
      String.before s (String.index s ' ')
    with Not_found -> s

  (* this lists all supported packages *)
  let find_packages () =
    List.map before_space (split_nl & run_and_read "ocamlfind list")

  (* this is supposed to list available syntaxes, but I don't know how to do it. *)
  let find_syntaxes () = ["camlp4o"; "camlp4r"]

  (* ocamlfind command *)
  let ocamlfind x = S[A"ocamlfind"; x]

  let dispatch =
    function
      | Before_options ->
          (* by using Before_options one let command line options have an higher priority *)
          (* on the contrary using After_options will guarantee to have the higher priority *)
          (* override default commands by ocamlfind ones *)
          Options.ocamlc     := ocamlfind & A"ocamlc";
          Options.ocamlopt   := ocamlfind & A"ocamlopt";
          Options.ocamldep   := ocamlfind & A"ocamldep";
          Options.ocamldoc   := ocamlfind & A"ocamldoc";
          Options.ocamlmktop := ocamlfind & A"ocamlmktop"
                                  
      | After_rules ->
          
          (* When one link an OCaml library/binary/package, one should use -linkpkg *)
          flag ["ocaml"; "link"; "program"] & A"-linkpkg";
          
          (* For each ocamlfind package one inject the -package option when
           * compiling, computing dependencies, generating documentation and
           * linking. *)
          List.iter 
            begin fun pkg ->
              flag ["ocaml"; "compile";  "pkg_"^pkg] & S[A"-package"; A pkg];
              flag ["ocaml"; "ocamldep"; "pkg_"^pkg] & S[A"-package"; A pkg];
              flag ["ocaml"; "doc";      "pkg_"^pkg] & S[A"-package"; A pkg];
              flag ["ocaml"; "link";     "pkg_"^pkg] & S[A"-package"; A pkg];
              flag ["ocaml"; "infer_interface"; "pkg_"^pkg] & S[A"-package"; A pkg];
            end 
            (find_packages ());

          (* Like -package but for extensions syntax. Morover -syntax is useless
           * when linking. *)
          List.iter begin fun syntax ->
          flag ["ocaml"; "compile";  "syntax_"^syntax] & S[A"-syntax"; A syntax];
          flag ["ocaml"; "ocamldep"; "syntax_"^syntax] & S[A"-syntax"; A syntax];
          flag ["ocaml"; "doc";      "syntax_"^syntax] & S[A"-syntax"; A syntax];
          flag ["ocaml"; "infer_interface"; "syntax_"^syntax] & S[A"-syntax"; A syntax];
          end (find_syntaxes ());

          (* The default "thread" tag is not compatible with ocamlfind.
           * Indeed, the default rules add the "threads.cma" or "threads.cmxa"
           * options when using this tag. When using the "-linkpkg" option with
           * ocamlfind, this module will then be added twice on the command line.
           *                        
           * To solve this, one approach is to add the "-thread" option when using
           * the "threads" package using the previous plugin.
           *)
          flag ["ocaml"; "pkg_threads"; "compile"] (S[A "-thread"]);
          flag ["ocaml"; "pkg_threads"; "doc"] (S[A "-I"; A "+threads"]);
          flag ["ocaml"; "pkg_threads"; "link"] (S[A "-thread"]);
          flag ["ocaml"; "pkg_threads"; "infer_interface"] (S[A "-thread"])

      | _ -> 
          ()

end

module MyOCamlbuildBase = struct
(* # 21 "src/plugins/ocamlbuild/MyOCamlbuildBase.ml" *)

  (** Base functions for writing myocamlbuild.ml
      @author Sylvain Le Gall
    *)



  open Ocamlbuild_plugin
  module OC = Ocamlbuild_pack.Ocaml_compiler

  type dir = string 
  type file = string 
  type name = string 
  type tag = string 

(* # 56 "src/plugins/ocamlbuild/MyOCamlbuildBase.ml" *)

  type t =
      {
        lib_ocaml: (name * dir list) list;
        lib_c:     (name * dir * file list) list; 
        flags:     (tag list * (spec OASISExpr.choices)) list;
        (* Replace the 'dir: include' from _tags by a precise interdepends in
         * directory.
         *)
        includes:  (dir * dir list) list; 
      } 

  let env_filename =
    Pathname.basename 
      BaseEnvLight.default_filename

  let dispatch_combine lst =
    fun e ->
      List.iter 
        (fun dispatch -> dispatch e)
        lst 

  let tag_libstubs nm =
    "use_lib"^nm^"_stubs"

  let nm_libstubs nm =
    nm^"_stubs"

  let dispatch t e = 
    let env = 
      BaseEnvLight.load 
        ~filename:env_filename 
        ~allow_empty:true
        ()
    in
      match e with 
        | Before_options ->
            let no_trailing_dot s =
              if String.length s >= 1 && s.[0] = '.' then
                String.sub s 1 ((String.length s) - 1)
              else
                s
            in
              List.iter
                (fun (opt, var) ->
                   try 
                     opt := no_trailing_dot (BaseEnvLight.var_get var env)
                   with Not_found ->
                     Printf.eprintf "W: Cannot get variable %s" var)
                [
                  Options.ext_obj, "ext_obj";
                  Options.ext_lib, "ext_lib";
                  Options.ext_dll, "ext_dll";
                ]

        | After_rules -> 
            (* Declare OCaml libraries *)
            List.iter 
              (function
                 | nm, [] ->
                     ocaml_lib nm
                 | nm, dir :: tl ->
                     ocaml_lib ~dir:dir (dir^"/"^nm);
                     List.iter 
                       (fun dir -> 
                          List.iter
                            (fun str ->
                               flag ["ocaml"; "use_"^nm; str] (S[A"-I"; P dir]))
                            ["compile"; "infer_interface"; "doc"])
                       tl)
              t.lib_ocaml;

            (* Declare directories dependencies, replace "include" in _tags. *)
            List.iter 
              (fun (dir, include_dirs) ->
                 Pathname.define_context dir include_dirs)
              t.includes;

            (* Declare C libraries *)
            List.iter
              (fun (lib, dir, headers) ->
                   (* Handle C part of library *)
                   flag ["link"; "library"; "ocaml"; "byte"; tag_libstubs lib]
                     (S[A"-dllib"; A("-l"^(nm_libstubs lib)); A"-cclib";
                        A("-l"^(nm_libstubs lib))]);

                   flag ["link"; "library"; "ocaml"; "native"; tag_libstubs lib]
                     (S[A"-cclib"; A("-l"^(nm_libstubs lib))]);
                        
                   flag ["link"; "program"; "ocaml"; "byte"; tag_libstubs lib]
                     (S[A"-dllib"; A("dll"^(nm_libstubs lib))]);

                   (* When ocaml link something that use the C library, then one
                      need that file to be up to date.
                    *)
                   dep ["link"; "ocaml"; "program"; tag_libstubs lib]
                     [dir/"lib"^(nm_libstubs lib)^"."^(!Options.ext_lib)];

                   dep  ["compile"; "ocaml"; "program"; tag_libstubs lib]
                     [dir/"lib"^(nm_libstubs lib)^"."^(!Options.ext_lib)];

                   (* TODO: be more specific about what depends on headers *)
                   (* Depends on .h files *)
                   dep ["compile"; "c"] 
                     headers;

                   (* Setup search path for lib *)
                   flag ["link"; "ocaml"; "use_"^lib] 
                     (S[A"-I"; P(dir)]);
              )
              t.lib_c;

              (* Add flags *)
              List.iter
              (fun (tags, cond_specs) ->
                 let spec = 
                   BaseEnvLight.var_choose cond_specs env
                 in
                   flag tags & spec)
              t.flags
        | _ -> 
            ()

  let dispatch_default t =
    dispatch_combine 
      [
        dispatch t;
        MyOCamlbuildFindlib.dispatch;
      ]

end


# 476 "myocamlbuild.ml"
open Ocamlbuild_plugin;;
let package_default =
  {
     MyOCamlbuildBase.lib_ocaml =
       [
          ("oextjs", ["lib"]);
          ("generator", ["doc"]);
          ("helloext", ["examples/helloext"]);
          ("account_manager", ["examples/account_manager"]);
          ("basic_array_grid", ["examples/grid/basic_array_grid"]);
          ("basic_tabs", ["examples/tabs/basic_tabs"]);
          ("message_box", ["examples/message_box"]);
          ("window", ["examples/window/window"]);
          ("layout_window", ["examples/window/layout"]);
          ("border_layout", ["examples/layout/border"]);
          ("accordion_layout", ["examples/layout/accordion"]);
          ("quicktips", ["examples/misc/quicktips"]);
          ("basic_templating", ["examples/misc/templates"]);
          ("basic_combobox", ["examples/combobox/basic_combobox"]);
          ("panels", ["examples/misc/panel"]);
          ("area_chart", ["examples/charts/area"]);
          ("menus", ["examples/toolbars/menu"]);
          ("dnd_grid_to_grid", ["examples/dd/grid_to_grid"]);
          ("contact_form", ["examples/forms/contact"]);
          ("sencha_logo", ["examples/drawing/sencha"])
       ];
     lib_c = [("oextjs", "lib", [])];
     flags =
       [
          (["oasis_library_oextjs_ccopt"; "compile"],
            [
               (OASISExpr.EBool true,
                 S [A "-ccopt"; A "-D"; A "-ccopt"; A "OPTION_PASSED"])
            ]);
          (["oasis_library_generator_byte"; "ocaml"; "link"; "byte"],
            [(OASISExpr.EBool true, S [A "-I"; A "+ocamldoc"])]);
          (["oasis_library_generator_native"; "ocaml"; "link"; "native"],
            [(OASISExpr.EBool true, S [A "-I"; A "+ocamldoc"])]);
          (["oasis_library_generator_byte"; "ocaml"; "ocamldep"; "byte"],
            [(OASISExpr.EBool true, S [A "-I"; A "+ocamldoc"])]);
          (["oasis_library_generator_native"; "ocaml"; "ocamldep"; "native"],
            [(OASISExpr.EBool true, S [A "-I"; A "+ocamldoc"])]);
          (["oasis_library_generator_byte"; "ocaml"; "compile"; "byte"],
            [(OASISExpr.EBool true, S [A "-I"; A "+ocamldoc"])]);
          (["oasis_library_generator_native"; "ocaml"; "compile"; "native"],
            [(OASISExpr.EBool true, S [A "-I"; A "+ocamldoc"])])
       ];
     includes =
       [
          ("examples/window/window", ["lib"]);
          ("examples/window/layout", ["lib"]);
          ("examples/toolbars/menu", ["lib"]);
          ("examples/tabs/basic_tabs", ["lib"]);
          ("examples/misc/templates", ["lib"]);
          ("examples/misc/quicktips", ["lib"]);
          ("examples/misc/panel", ["lib"]);
          ("examples/message_box", ["lib"]);
          ("examples/layout/border", ["lib"]);
          ("examples/layout/accordion", ["lib"]);
          ("examples/helloext", ["lib"]);
          ("examples/grid/basic_array_grid", ["lib"]);
          ("examples/forms/contact", ["lib"]);
          ("examples/drawing/sencha", ["lib"]);
          ("examples/dd/grid_to_grid", ["lib"]);
          ("examples/combobox/basic_combobox", ["lib"]);
          ("examples/charts/area", ["lib"]);
          ("examples/account_manager/app/view/user",
            [
               "examples/account_manager";
               "examples/account_manager/app/controller";
               "examples/account_manager/app/model";
               "examples/account_manager/app/store";
               "lib"
            ]);
          ("examples/account_manager/app/store",
            [
               "examples/account_manager";
               "examples/account_manager/app/controller";
               "examples/account_manager/app/model";
               "examples/account_manager/app/view/user";
               "lib"
            ]);
          ("examples/account_manager/app/model",
            [
               "examples/account_manager";
               "examples/account_manager/app/controller";
               "examples/account_manager/app/store";
               "examples/account_manager/app/view/user";
               "lib"
            ]);
          ("examples/account_manager/app/controller",
            [
               "examples/account_manager";
               "examples/account_manager/app/model";
               "examples/account_manager/app/store";
               "examples/account_manager/app/view/user";
               "lib"
            ]);
          ("examples/account_manager",
            [
               "examples/account_manager/app/controller";
               "examples/account_manager/app/model";
               "examples/account_manager/app/store";
               "examples/account_manager/app/view/user";
               "lib"
            ])
       ];
     }
  ;;

let dispatch_default = MyOCamlbuildBase.dispatch_default package_default;;

# 590 "myocamlbuild.ml"
(* OASIS_STOP *)

(* Turn on verbose logging *)
(* Ocamlbuild_pack.Log.classic_display := true;; *)

(* build helloext client scripts if helloext_client dependency is specified in
 * _tags *)
dep ["helloext_client"]
  ["examples/helloext/app.js"];;
(* account manager client *)
dep ["account_manager_client"]
  ["examples/account_manager/app.js";
   "examples/account_manager/app/controller/Users.js";
   "examples/account_manager/app/view/user/List.js";
   "examples/account_manager/app/view/user/Edit.js";
   "examples/account_manager/app/store/Users.js";
   "examples/account_manager/app/model/User.js"];;
(* basic array grid *)
dep ["basic_array_grid"]
  ["examples/grid/basic_array_grid/array_grid.js"];;
(* basic tabs *)
dep ["basic_tabs"]
  ["examples/tabs/basic_tabs/tabs.js"];;
(* message box *)
dep ["message_box"]
  ["examples/message_box/msg_box.js"];;
(* window *)
dep ["window"]
  ["examples/window/window/window.js"];;
(* layout window *)
dep ["layout_window"]
  ["examples/window/layout/layout.js"];;
(* border layout *)
dep ["border_layout"]
  ["examples/layout/border/border.js"];;
(* accordion layout *)
dep ["accordion_layout"]
  ["examples/layout/accordion/accordion.js"];;
(* quicktips *)
dep ["quicktips"]
  ["examples/misc/quicktips/qtips.js"];;
(* basic templating *)
dep ["basic_templating"]
  ["examples/misc/templates/templates.js"];;
(* basic combobox *)
dep ["basic_combobox"]
  ["examples/combobox/basic_combobox/combos.js"];;
(* panels *)
dep ["panels"]
  ["examples/misc/panel/panel.js"];;
(* area chart *)
dep ["area_chart"]
  ["examples/charts/area/example_data.js";
   "examples/charts/area/area.js"];;
(* menus *)
dep ["menus"]
  ["examples/toolbars/menu/menus.js"];;
(* DnD Grid to Grid *)
dep ["dnd_grid_to_grid"]
  ["examples/dd/grid_to_grid/dnd_grid_to_grid.js"];;
(* contact form *)
dep ["contact_form"]
  ["examples/forms/contact/contact_form.js"];;
(* sencha logo *)
dep ["sencha_logo"]
  ["examples/drawing/sencha/Sencha.js"];;

(* js_of_ocaml compiler *)
rule "js_of_ocaml: .byte -> .js" ~deps:["%.byte"] ~prod:"%.js"
  begin fun env _ ->
    Cmd (S [A "js_of_ocaml";
            A "-pretty";
            A "-noinline";
            A (Pathname.pwd / "lib/extUtils.js");
            A (env "%.byte")]);
  end;;

(* copy of the normal ocamldoc rule that uses a custom generator. *)
rule "ocamldoc: document ocaml project odocl & *odoc -> docdir (html+)"
  ~insert:`top
  ~prod:"%.docdir/index.html"
  ~stamp:"%.docdir/html.stamp"
  ~dep:"%.odocl"
  begin
    let my_ocamldoc tags deps docout docdir =
      let tags = tags -- "extension:html" in
        Ocamlbuild_pack.Ocaml_tools.ocamldoc_l_dir tags deps docout docdir
    in
    Ocamlbuild_pack.Ocaml_tools.document_ocaml_project
      ~ocamldoc:my_ocamldoc
      "%.odocl"
      "%.docdir/index.html"
      "%.docdir"
  end;;

let dispatch_ocamlbuild = function
  | After_rules ->
      flag ["doc"; "ocaml"]
        (S [A "-i"; A "doc";
            A "-g"; A "generator.cmo"])
  | e -> dispatch_default e

let () =
  Ocamlbuild_plugin.dispatch
    (MyOCamlbuildBase.dispatch_combine
       [dispatch_default; dispatch_ocamlbuild]);;

