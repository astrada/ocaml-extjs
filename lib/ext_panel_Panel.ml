class type configs = object
  method xtype : Js.js_string Js.t Js.prop
  method title : Js.js_string Js.t Js.prop
  method html : Js.js_string Js.t Js.prop
  method buttons : 'a Js.t Js.js_array Js.t Js.prop
end

class type t = object
  inherit Ext_container_AbstractContainer.t
  inherit configs
end

let config
      ?xtype ?title ?html () =
  let constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let instance = jsnew constr () in
  begin match xtype with
      None -> ()
    | Some v -> instance##xtype <- Js.string v
  end;
  begin match title with
      None -> ()
    | Some v -> instance##title <- Js.string v
  end;
  begin match html with
      None -> ()
    | Some v -> instance##html <- Js.string v
  end;
  instance

