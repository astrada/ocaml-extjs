class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  
  method getGhost : Ext_dom_Element.t Js.t Js.meth
  method hide_proxy : bool Js.t -> unit Js.meth
  method repair : Js.number Js.t Js.js_array Js.t -> 'a Js.callback ->
    'b Js.t -> unit Js.meth
  method reset : bool Js.t -> unit Js.meth
  method setStatus : Js.js_string Js.t -> unit Js.meth
  method stop : unit Js.meth
  method sync : unit Js.meth
  method update_html : 'a Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  
  method dropAllowed : Js.js_string Js.t Js.prop
  method dropNotAllowed : Js.js_string Js.t Js.prop
  method renderTpl_arr : 'a Js.js_array Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  
  
end

let static = Js.Unsafe.variable "Ext.dd.StatusProxy"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

