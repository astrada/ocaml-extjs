let _ =
  let model : Ext_data_Model.configs Js.t = {| |} in
  (ExtUtils.to_class_configs model)##extend <- Js.string "Ext.data.Model";
  model##fields <- Js.array [|Js.string "name";
                              Js.string "email"|];

  Ext.instance##define(
    Js.string "AM.model.User",
    model,
    ExtUtils.undef)

