class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dd_DragTracker.t
  
  method onDrag : Ext_EventObject.t Js.t -> unit Js.meth
  method onEnd : Ext_EventObject.t Js.t -> unit Js.meth
  method onStart : Ext_EventObject.t Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_dd_DragTracker.configs
  
  method onDrag : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onEnd : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onStart : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method constrain : bool Js.t Js.prop
  method constrainDelegate : bool Js.t Js.prop
  method delegate_element : 'a Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_dd_DragTracker.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_dd_DragTracker.statics
  
  
end

let static = Js.Unsafe.variable "Ext.util.ComponentDragger"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

