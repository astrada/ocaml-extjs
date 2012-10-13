class type data = object
  method name : Js.js_string Js.t Js.prop
  method email : Js.js_string Js.t Js.prop
end

let data_row name email : data Js.t =
  {| name = Js.string name;
      email = Js.string email;
  |}

let _ =
  let reader : Ext_data_reader_Reader.configs Js.t =
    {| root = Js.string "users";
       successProperty = Js.string "success";
    |}
  in
  (Js.Unsafe.coerce reader)##type_ <- Js.string "json";

  let api =
    {| read = Js.string "data/users.json";
       update = Js.string "data/updateUsers.json";
    |}
  in

  let proxy : Ext_data_proxy_Ajax.configs Js.t = {| |} in
  (Js.Unsafe.coerce proxy)##type_ <- Js.string "ajax";
  proxy##api <- api;
  proxy##reader <- reader;

  let store : Ext_data_Store.configs Js.t =
    {| model = Js.string "AM.model.User" |}
  in
  (ExtUtils.to_class_configs store)##extend <- Js.string "Ext.data.Store";
  store##autoLoad <- Js.bool true;
  store##proxy <- proxy;

  Ext.instance##define(
    Js.string "AM.store.Users",
    store,
    ExtUtils.undef)

