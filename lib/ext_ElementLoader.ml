class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method isLoader : bool Js.t Js.prop
  method abort : unit Js.meth
  method destroy : unit Js.meth
  method getTarget : 'a Js.t Js.meth
  method isAutoRefreshing : bool Js.t Js.meth
  method load : 'a Js.t -> unit Js.meth
  method setTarget : 'a Js.t -> unit Js.meth
  method startAutoRefresh : Js.number Js.t -> 'a Js.t Js.optdef -> unit
    Js.meth
  method stopAutoRefresh : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method ajaxOptions : 'a Js.t Js.prop
  method autoLoad : 'a Js.t Js.prop
  method baseParams : 'a Js.t Js.prop
  method callback : 'a Js.callback Js.prop
  method failure : 'a Js.callback Js.prop
  method loadMask : 'a Js.t Js.prop
  method params : 'a Js.t Js.prop
  method renderer : 'a Js.callback Js.prop
  method scope : 'a Js.t Js.prop
  method scripts : bool Js.t Js.prop
  method success : 'a Js.callback Js.prop
  method target : 'a Js.t Js.prop
  method url : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method beforeload : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  method _exception : (t Js.t -> 'a Js.t -> 'b Js.t -> 'c Js.t -> unit)
    Js.callback Js.writeonly_prop
  method load : (t Js.t -> 'a Js.t -> 'b Js.t -> 'c Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.ElementLoader"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

