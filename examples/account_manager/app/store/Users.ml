class type data = object
  method name : Js.js_string Js.t Js.prop
  method email : Js.js_string Js.t Js.prop
end

let data_row name email =
  ({| name = Js.string name;
      email = Js.string email;
   |} : data Js.t)

class type t = object
  inherit Ext_Class.t
  inherit Ext_data_Store.t
end

let () =
  let api =
    {| read = Js.string "data/users.json";
       update = Js.string "data/updateUsers.json";
    |}
  in
  let reader : Ext_data_reader_Reader.t Js.t =
    {| _type = Js.string "json";
       root = Js.string "users";
       successProperty = Js.string "success";
    |}
  in
  let proxy : Ext_data_proxy_Ajax.t Js.t =
    {| _type = Js.string "ajax"; |}
  in
  proxy##api <- api;
  proxy##reader <- reader;
  let store : t Js.t =
    {| extend = Js.string "Ext.data.Store";
       model = Js.string "AM.model.User";
       autoLoad = Js.bool true;
    |}
  in
  store##proxy <- proxy;

  Ext.define
    ~className:"AM.store.Users"
    ~data:store
    ()

