class type t =
object('self)
  inherit Ext_Base.t
  
  method center : _ Js.t Js.meth
  method doConstrain : _ Js.t Js.optdef -> unit Js.meth
  method setActive : bool Js.t Js.optdef -> _ Js.t Js.optdef -> unit Js.meth
  method toBack : _ Js.t Js.meth
  method toFront : bool Js.t Js.optdef -> _ Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method constrain : bool Js.t Js.prop
  method fixed : bool Js.t Js.prop
  method focusOnToFront : bool Js.t Js.prop
  method shadow : _ Js.t Js.prop
  method shadowOffset : Js.number Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.util.Floating"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

