class type t =
object('self)
  inherit Ext_dom_CompositeElementLite.t
  
  
end

class type configs =
object('self)
  inherit Ext_dom_CompositeElementLite.configs
  
  
end

class type events =
object
  inherit Ext_dom_CompositeElementLite.events
  
  
end

class type statics =
object
  inherit Ext_dom_CompositeElementLite.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.dom.CompositeElement"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

