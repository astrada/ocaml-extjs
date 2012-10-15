class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method clear : Js.js_string Js.t -> unit Js.meth
  method decodeValue : Js.js_string Js.t -> 'a Js.t Js.meth
  method encodeValue : 'a Js.t -> Js.js_string Js.t Js.meth
  method get : Js.js_string Js.t -> 'a Js.t -> 'b Js.t Js.meth
  method set : Js.js_string Js.t -> 'a Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method prefix : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method statechange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.state.Provider"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

