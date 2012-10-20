class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method current : Js.number Js.t Js.prop
  method exceptions : Ext_data_Operation.t Js.js_array Js.t Js.prop
  method hasException : bool Js.t Js.prop
  method isComplete : bool Js.t Js.prop
  method isRunning : bool Js.t Js.prop
  method operations : Ext_data_Operation.t Js.js_array Js.t Js.prop
  method total : Js.number Js.t Js.prop
  method add : 'a Js.t -> 'self Js.t Js.meth
  method pause : 'self Js.t Js.meth
  method retry : 'self Js.t Js.meth
  method runOperation : Js.number Js.t -> 'self Js.t Js.meth
  method start : 'a Js.t -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method autoStart : bool Js.t Js.prop
  method pauseOnException : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method complete : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  method _exception : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  method operationcomplete : (t Js.t -> 'a Js.t -> 'b Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.data.Batch"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

