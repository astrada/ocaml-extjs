class type t =
object('self)
  inherit Ext_Base.t
  
  method addBinding : _ Js.t -> unit Js.meth
  method destroy : bool Js.t -> unit Js.meth
  method disable : unit Js.meth
  method enable : unit Js.meth
  method isEnabled : bool Js.t Js.meth
  method on : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  method removeBinding : _ Js.t -> unit Js.meth
  method setDisabled : bool Js.t -> unit Js.meth
  method un : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method binding : _ Js.t Js.prop
  method eventName : Js.js_string Js.t Js.prop
  method ignoreInputFields : bool Js.t Js.prop
  method processEvent : _ Js.callback Js.prop
  method processEventScope : _ Js.t Js.prop
  method target : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.util.KeyMap"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

