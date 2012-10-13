class type t =
object('self)
  inherit Ext_Base.t
  
  method animate : 'a Js.t -> 'b Js.t Js.meth
  method getActiveAnimation : 'a Js.t Js.meth
  method sequenceFx : 'a Js.t Js.meth
  method stopAnimation : Ext_dom_Element.t Js.t Js.meth
  method syncFx : 'a Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.util.Animate"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

