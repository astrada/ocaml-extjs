class type configs = object
  method title : Js.js_string Js.t Js.prop
  method html : Js.js_string Js.t Js.prop
end

class type t = object
  inherit configs
end

let config
      ?title ?html () =
  let constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let instance = jsnew constr () in
  begin match title with
      None -> ()
    | Some v -> instance##title <- Js.string v
  end;
  begin match html with
      None -> ()
    | Some v -> instance##html <- Js.string v
  end;
  instance

