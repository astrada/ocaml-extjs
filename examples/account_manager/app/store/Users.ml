class type data = object
  method name : Js.js_string Js.t Js.prop
  method email : Js.js_string Js.t Js.prop
end
let data_row name email =
  let constr : data Js.t Js.constr = Js.Unsafe.variable "Object" in
  let instance = jsnew constr () in
  instance##name <- Js.string name;
  instance##email <- Js.string email;
  instance

class type t = object
  inherit Ext_Class.t
  inherit Ext_data_Store.t
end

let () =
  let store_constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let store_conf = jsnew store_constr () in
  store_conf##extend <- Js.string "Ext.data.Store";
  store_conf##fields <- Js.array [|Js.string "name";
                                   Js.string "email"|];
  store_conf##data <- Js.array [|
    data_row "Ed" "ed@sencha.com";
    data_row "Tommy" "tommy@sencha.com";
  |];
  Ext.define
    ~className:"AM.store.Users"
    ~data:store_conf
    ()

