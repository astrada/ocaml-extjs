class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method application : _ Js.t Js.readonly_prop
  method addRef : _ Js.t -> unit Js.meth
  method control : _ Js.t -> _ Js.t Js.optdef -> unit Js.meth
  method getApplication : _ Js.t Js.meth
  method getController : Js.js_string Js.t -> 'self Js.t Js.meth
  method getModel : Js.js_string Js.t -> Ext_data_Model.t Js.t Js.meth
  method getStore : Js.js_string Js.t -> Ext_data_Store.t Js.t Js.meth
  method getView : Js.js_string Js.t -> #Ext_Base.t Js.t Js.meth
  method hasRef : _ Js.t -> bool Js.t Js.meth
  method init : _ Js.t -> unit Js.meth
  method listen : _ Js.t -> unit Js.meth
  method onLaunch : _ Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method id : Js.js_string Js.t Js.prop
  method models : _ Js.t Js.prop
  method refs : _ Js.t Js.js_array Js.t Js.prop
  method stores : _ Js.t Js.prop
  method views : _ Js.t Js.prop
  method init : ('self Js.t, _ Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method onLaunch : ('self Js.t, _ Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.app.Controller"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

