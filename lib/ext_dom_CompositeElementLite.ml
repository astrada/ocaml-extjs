class type t =
object('self)
  inherit Ext_Base.t
  
  method elements : Dom_html.element Js.t Js.js_array Js.t Js.readonly_prop
  method isComposite : bool Js.t Js.prop
  method add : _ Js.t -> 'self Js.t Js.meth
  method clear : bool Js.t Js.optdef -> unit Js.meth
  method contains : _ Js.t -> bool Js.t Js.meth
  method each : _ Js.callback -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method fill : _ Js.t -> 'self Js.t Js.meth
  method filter : _ Js.t -> 'self Js.t Js.meth
  method first : Ext_dom_Element.t Js.t Js.meth
  method getCount : Js.number Js.t Js.meth
  method indexOf : _ Js.t -> Js.number Js.t Js.meth
  method item : Js.number Js.t -> Ext_dom_Element.t Js.t Js.meth
  method last : Ext_dom_Element.t Js.t Js.meth
  method removeElement : _ Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  method replaceElement : _ Js.t -> _ Js.t -> bool Js.t Js.optdef ->
    'self Js.t Js.meth
  method slice : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    Dom_html.element Js.t Js.js_array Js.t Js.meth
  
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

let get_static () = Js.Unsafe.variable "Ext.dom.CompositeElementLite"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

