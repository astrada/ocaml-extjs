let require = Js.Unsafe.variable "Ext.require"
let application = Js.Unsafe.variable "Ext.application"
let create = Js.Unsafe.variable "Ext.create"

class type application_config = object
  method name : Js.js_string Js.t Js.prop
  method launch : (unit -> unit) Js.callback Js.prop
end

class type viewport_config = object
  method layout : Js.js_string Js.t Js.prop
  method items : Js.Unsafe.any Js.js_array Js.t Js.prop
end

class type content = object
  method title : Js.js_string Js.t Js.prop
  method html : Js.js_string Js.t Js.prop
end

let _ =
  let content_constr : content Js.t Js.constr = Js.Unsafe.variable "Object" in
  let cont = jsnew content_constr () in
  cont##title <- (Js.string "Hello Ext");
  cont##html <- (Js.string "Hello! Welcome to Ext JS.");
  let items = jsnew Js.array_empty () in
  let _ = items##push(Js.Unsafe.inject cont) in
  let view_conf_constr : viewport_config Js.t Js.constr = Js.Unsafe.variable "Object" in
  let view_conf = jsnew view_conf_constr () in
  view_conf##layout <- (Js.string "fit");
  view_conf##items <- items;
  let launch () =
    Ext.create ~name:"Ext.container.Viewport" ~args:view_conf in
  let app_conf_constr : application_config Js.t Js.constr = Js.Unsafe.variable "Object" in
  let config = jsnew app_conf_constr () in
  config##name <- (Js.string "HelloExt");
  config##launch <- Js.wrap_callback launch;
  let callback = (fun () -> Firebug.console##log(Js.string "require callback")) in
  let _ =
    Ext.require
      ~expressions:[|"Ext.container.Viewport"|]
      ~fn:callback () in
  Ext.application ~config

