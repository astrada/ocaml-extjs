class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_app_Controller.t
  
  method control : _ Js.t -> _ Js.t -> unit Js.meth
  method getController_app : Js.js_string Js.t -> Ext_app_Controller.t Js.t
    Js.meth
  method getModel : Js.js_string Js.t -> Ext_data_Model.t Js.t Js.meth
  method getStore : Js.js_string Js.t -> Ext_data_Store.t Js.t Js.meth
  method getView : Js.js_string Js.t -> #Ext_Base.t Js.t Js.meth
  method launch : Js.js_string Js.t -> bool Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_app_Controller.configs
  
  method launch : ('self Js.t, Js.js_string Js.t -> bool Js.t)
    Js.meth_callback Js.writeonly_prop
  method appFolder : Js.js_string Js.t Js.prop
  method autoCreateViewport : bool Js.t Js.prop
  method controllers : Js.js_string Js.t Js.js_array Js.t Js.prop
  method enableQuickTips : bool Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method paths : _ Js.t Js.prop
  method scope : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_app_Controller.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_app_Controller.statics
  
  
end

let static = Js.Unsafe.variable "Ext.app.Application"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

