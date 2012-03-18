class type configs = object
  method appFolder : Js.js_string Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
end

class type properties = object
  method launch : (unit -> unit) Js.callback Js.prop
end

class type t = object
  inherit configs
  inherit properties
end

let config
      ?appFolder ?name ?launch () =
  let constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let instance = jsnew constr () in
  begin match appFolder with
      None -> ()
    | Some v -> instance##appFolder <- Js.string v
  end;
  begin match name with
      None -> ()
    | Some v -> instance##name <- Js.string v
  end;
  begin match launch with
      None -> ()
    | Some v -> instance##launch <- Js.wrap_callback v;
  end;
  instance

