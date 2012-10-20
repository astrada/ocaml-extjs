class type t =
object('self)
  inherit Ext_Base.t
  
  method afterRender : unit Js.meth
  method doAutoRender : unit Js.meth
  method ensureAttachedToBody : bool Js.t Js.optdef -> unit Js.meth
  method getInsertPosition : _ Js.t -> Dom_html.element Js.t Js.meth
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  method render : _ Js.t Js.optdef -> _ Js.t Js.optdef -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.util.Renderable"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

