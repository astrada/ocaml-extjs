class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method active : bool Js.t Js.readonly_prop
  method dragTarget : Dom_html.element Js.t Js.readonly_prop
  method getDragTarget : Ext_dom_Element.t Js.t Js.meth
  method getOffset : _ Js.t -> Js.number Js.t Js.js_array Js.t Js.meth
  method initEl : _ Js.t -> unit Js.meth
  method onBeforeStart : Ext_EventObject.t Js.t -> unit Js.meth
  method onDrag : Ext_EventObject.t Js.t -> unit Js.meth
  method onEnd : Ext_EventObject.t Js.t -> unit Js.meth
  method onStart : Ext_EventObject.t Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method onBeforeStart : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onDrag : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onEnd : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onStart : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method autoStart : _ Js.t Js.prop
  method constrainTo : _ Js.t Js.prop
  method delegate : Js.js_string Js.t Js.prop
  method overCls : Js.js_string Js.t Js.prop
  method preventDefault : bool Js.t Js.prop
  method stopEvent : bool Js.t Js.prop
  method tolerance : Js.number Js.t Js.prop
  method trackOver : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method beforestart : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method drag : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method dragend : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method dragstart : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mousedown : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mousemove : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mouseout : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mouseover : (_ Js.t -> _ Js.t -> Dom_html.element Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method mouseup : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.dd.DragTracker"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

