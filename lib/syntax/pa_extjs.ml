(* Based on pa_js.ml of Js_of_ocaml library
 * http://www.ocsigen.org/js_of_ocaml/
 *)

let rnd = Random.State.make [|0x513511d4|]
let random_var () =
  Format.sprintf "a%08Lx" (Random.State.int64 rnd 0x100000000L)

open Camlp4

module Id : Sig.Id = struct
  let name = "Ext JS"
  let version = "1.0"
end

module Make (Syntax : Sig.Camlp4Syntax) = struct
  open Sig
  include Syntax

  let rec filter stream =
    match stream with parser
      [< 'other; rest >] -> [< 'other; filter rest >]

  let _ =
    Token.Filter.define_filter (Gram.get_filter ())
      (fun old_filter stream -> old_filter (filter stream))

  let rec to_sem_expr _loc l =
    match l with
      []        -> assert false
    | [e]       -> e
    | e1 :: rem -> <:expr< $e1$; $to_sem_expr _loc rem$ >>

  let make_array _loc l =
    match l with
      [] -> <:expr< [| |] >>
    | _  -> <:expr< [| $to_sem_expr _loc l$ |] >>

  let with_type e t =
    let _loc = Ast.loc_of_expr e in <:expr< ($e$ : $t$) >>

  let unescape lab =
    assert (lab <> "");
    let lab =
      if lab.[0] = '_' then String.sub lab 1 (String.length lab - 1) else lab
    in
    try
      let i = String.rindex lab '_' in
      if i = 0 then raise Not_found;
      String.sub lab 0 i
    with Not_found ->
      lab

  let fresh_type _loc = <:ctyp< '$random_var ()$ >>

  let rec parse_field_list l =
    match l with
      <:rec_binding< $f1$; $f2$ >> -> f1 :: parse_field_list f2
    | _                            -> [l]

  let parse_field f =
    match f with
      <:rec_binding< $lid:lab$ = $e$ >> ->
        let lab_loc = Ast.loc_of_expr e in
        let t = fresh_type lab_loc in
        (lab, lab_loc, e, t)
    | _ ->
        assert false

  let object_init _loc fields =
    let obj_type = fresh_type _loc in
    let constr_expr =
      List.fold_right
        (fun (lab, lab_loc, _, t) accu ->
           let meth_type =
             <:ctyp< Js.gen_prop <set:$t$->unit; ..> >>
           in
           let constr =
             let y = random_var () in
             let body =
               let o = <:expr< $lid:y$ >> in
               let _loc = lab_loc in <:expr< ($o$#$lab$ : $meth_type$) >>
             in
             <:expr< fun ($lid:y$ : $obj_type$) -> $body$ >>
           in
           <:expr< let _ = $constr$ in $accu$ >>)
        fields
        <:expr< () >>
    in
    let args =
      List.map
        (fun (lab, lab_loc, e, t) ->
           <:expr< ($str:unescape lab$,
                    Js.Unsafe.inject $with_type e t$) >>)
        fields
    in
    let args = make_array _loc args in
    let x = random_var () in
    <:expr<
      let $lid:x$ : Js.t (< .. > as $obj_type$) = Js.Unsafe.obj $args$ in
      let () = $constr_expr$ in
      $lid:x$
    >>

  EXTEND Gram
    expr: LEVEL "simple"
    [[ "{|"; "|}" ->
         <:expr< Js.Unsafe.obj [| |] >>
     | "{|"; l = field_expr_list; "|}" ->
         let field_list = parse_field_list l in
         let fields = List.map parse_field field_list in
         object_init _loc fields ]];
    END

end

module M = Register.OCamlSyntaxExtension(Id)(Make)

