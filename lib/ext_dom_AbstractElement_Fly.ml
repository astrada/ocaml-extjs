class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dom_AbstractElement.t
  
  method isFly : bool Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_dom_AbstractElement.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_dom_AbstractElement.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_dom_AbstractElement.statics
  
  
end

let static = Js.Unsafe.variable "Ext.dom.AbstractElement.Fly"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

