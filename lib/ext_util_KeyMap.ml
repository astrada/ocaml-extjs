class type t =
object('self)
  inherit Ext_Base.t
  
  method addBinding : 'a Js.t -> unit Js.meth
  method destroy : bool Js.t -> unit Js.meth
  method disable : unit Js.meth
  method enable : unit Js.meth
  method isEnabled : bool Js.t Js.meth
  method on : 'a Js.t -> 'b Js.callback -> 'c Js.t Js.optdef -> unit Js.meth
  method setDisabled : bool Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method binding : 'a Js.t Js.prop
  method eventName : Js.js_string Js.t Js.prop
  method ignoreInputFields : bool Js.t Js.prop
  method processEvent : 'a Js.callback Js.prop
  method processEventScope : 'a Js.t Js.prop
  method target : 'a Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.util.KeyMap"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

