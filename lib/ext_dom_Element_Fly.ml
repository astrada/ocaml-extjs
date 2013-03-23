class type t =
object('self)
  inherit Ext_dom_Element.t
  
  method isFly : bool Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_dom_Element.configs
  
  
end

class type events =
object
  inherit Ext_dom_Element.events
  
  
end

class type statics =
object
  inherit Ext_dom_Element.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.dom.Element.Fly"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

