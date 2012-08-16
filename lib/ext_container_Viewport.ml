class type configs = object
  inherit Ext_container_AbstractContainer.configs
end

class type t = object
  inherit configs

end

let config
      ?layout ?(items : 'a Js.t array option) () =
  let constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let instance = jsnew constr () in
  begin match layout with
      None -> ()
    | Some v -> instance##layout <- Js.string v
  end;
  begin match items with
      None -> ()
    | Some v -> instance##items <- Js.array v;
  end;
  instance

