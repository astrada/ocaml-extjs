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
  let api_constr : 'a Js.t Js.constr = Js.Unsafe.variable "Object" in
  let api_conf = jsnew api_constr () in
  api_conf##read <- Js.string "data/users.json";
  api_conf##update <- Js.string "data/updateUsers.json";
  let reader_constr : Ext_data_reader_Reader.t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let reader_conf = jsnew reader_constr () in
  reader_conf##_type <- Js.string "json";
  reader_conf##root <- Js.string "users";
  reader_conf##successProperty <- Js.string "success";
  let proxy_constr : Ext_data_proxy_Ajax.t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let proxy_conf = jsnew proxy_constr () in
  proxy_conf##_type <- Js.string "ajax";
  proxy_conf##api <- api_conf;
  proxy_conf##reader <- reader_conf;
  let store_constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let store_conf = jsnew store_constr () in
  store_conf##extend <- Js.string "Ext.data.Store";
  store_conf##model <- Js.string "AM.model.User";
  store_conf##autoLoad <- Js.bool true;
  store_conf##proxy <- proxy_conf;
  Ext.define
    ~className:"AM.store.Users"
    ~data:store_conf
    ()

