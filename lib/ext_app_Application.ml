class type t =
object('self)
  inherit Ext_app_Controller.t
  
  method getApplication_app : 'self Js.t Js.meth
  method getController_app : Js.js_string Js.t -> Ext_app_Controller.t Js.t
    Js.meth
  method launch : Js.js_string Js.t -> bool Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_app_Controller.configs
  
  method launch : ('self Js.t, Js.js_string Js.t -> bool Js.t)
    Js.meth_callback Js.writeonly_prop
  method appFolder : Js.js_string Js.t Js.prop
  method appProperty : Js.js_string Js.t Js.prop
  method autoCreateViewport : bool Js.t Js.prop
  method controllers : Js.js_string Js.t Js.js_array Js.t Js.prop
  method enableQuickTips : bool Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method namespaces : Js.js_string Js.t Js.js_array Js.t Js.prop
  method paths : _ Js.t Js.prop
  method scope : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_app_Controller.events
  
  
end

class type statics =
object
  inherit Ext_app_Controller.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.app.Application"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

