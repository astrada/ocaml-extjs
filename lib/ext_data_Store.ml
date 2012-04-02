class type t = object
  method fields : Js.js_string Js.t Js.js_array Js.t Js.prop
  method data : 'a Js.t Js.js_array Js.t Js.prop
  method model : Js.js_string Js.t Js.prop
  method autoLoad : bool Js.t Js.prop
  method proxy : 'a Js.t Js.prop
end

let config
      ?fields ?data () =
  let constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let instance = jsnew constr () in
  begin match fields with
      None -> ()
    | Some v -> instance##fields <- Js.array (Array.map Js.string v)
  end;
  begin match data with
      None -> ()
    | Some v -> instance##data <- Js.array v
  end;
  instance

