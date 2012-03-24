class type t = object
  method text : Js.js_string Js.t Js.prop
  method dataIndex : Js.js_string Js.t Js.prop
  method flex : int Js.prop
end

let config
      ?text ?dataIndex ?flex () =
  let constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let instance = jsnew constr () in
  begin match text with
      None -> ()
    | Some v -> instance##text <- Js.string v
  end;
  begin match dataIndex with
      None -> ()
    | Some v -> instance##dataIndex <- Js.string v
  end;
  begin match flex with
      None -> ()
    | Some v -> instance##flex <- v
  end;
  instance

