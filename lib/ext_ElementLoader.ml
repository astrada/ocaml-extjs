class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method isLoader : bool Js.t Js.prop
  method abort : unit Js.meth
  method destroy : unit Js.meth
  method getTarget : _ Js.t Js.meth
  method isAutoRefreshing : bool Js.t Js.meth
  method load : _ Js.t -> unit Js.meth
  method setTarget : _ Js.t -> unit Js.meth
  method startAutoRefresh : Js.number Js.t -> _ Js.t Js.optdef -> unit
    Js.meth
  method stopAutoRefresh : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method ajaxOptions : _ Js.t Js.prop
  method autoLoad : _ Js.t Js.prop
  method baseParams : _ Js.t Js.prop
  method callback : _ Js.callback Js.prop
  method failure : _ Js.callback Js.prop
  method loadMask : _ Js.t Js.prop
  method params : _ Js.t Js.prop
  method renderer : _ Js.callback Js.prop
  method scope : _ Js.t Js.prop
  method scripts : bool Js.t Js.prop
  method success : _ Js.callback Js.prop
  method target : _ Js.t Js.prop
  method url : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method beforeload : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method _exception : (t Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method load : (t Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.ElementLoader"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

