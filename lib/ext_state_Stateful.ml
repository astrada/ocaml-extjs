class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method addStateEvents : _ Js.t -> unit Js.meth
  method applyState : _ Js.t -> unit Js.meth
  method destroy : unit Js.meth
  method getState : _ Js.t Js.meth
  method savePropToState : Js.js_string Js.t -> _ Js.t ->
    Js.js_string Js.t Js.optdef -> bool Js.t Js.meth
  method savePropsToState : _ Js.t -> _ Js.t -> _ Js.t Js.meth
  method saveState : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method saveDelay : Js.number Js.t Js.prop
  method stateEvents : Js.js_string Js.t Js.js_array Js.t Js.prop
  method stateId : Js.js_string Js.t Js.prop
  method stateful : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method beforestaterestore : (t Js.t -> _ Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method beforestatesave : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method staterestore : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method statesave : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.state.Stateful"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

