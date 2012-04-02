class type t = object
  inherit Ext_Class.t
  inherit Ext_data_Model.t
end

let () =
  let model_constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let model_conf = jsnew model_constr () in
  model_conf##extend <- Js.string "Ext.data.Model";
  model_conf##fields <- Js.array [|Js.string "name";
                                   Js.string "email"|];
  Ext.define
    ~className:"AM.model.User"
    ~data:model_conf
    ()

