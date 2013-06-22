class type t =
object('self)
  inherit Ext_util_Observable.t
  
  method disabled : bool Js.t Js.prop
  method eventPrefix : Js.js_string Js.t Js.prop
  method eventSelector : Js.js_string Js.t Js.prop
  method grid : _ Js.t Js.prop
  method hasFeatureEvent : bool Js.t Js.prop
  method view : _ Js.t Js.prop
  method disable : unit Js.meth
  method enable : unit Js.meth
  method getFireEventArgs : _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_util_Observable.configs
  
  method getFireEventArgs : ('self Js.t, _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t
    -> unit) Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_util_Observable.events
  
  
end

class type statics =
object
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.grid.feature.Feature"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

