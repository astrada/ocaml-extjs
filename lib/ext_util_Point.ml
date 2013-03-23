class type t =
object('self)
  inherit Ext_util_Region.t
  
  method equals_point : _ Js.t -> bool Js.t Js.meth
  method isContainedBy : _ Js.t -> bool Js.t Js.meth
  method isWithin : _ Js.t -> _ Js.t -> bool Js.t Js.meth
  method roundedEquals : _ Js.t -> bool Js.t Js.meth
  method toString : Js.js_string Js.t Js.meth
  method translate : _ Js.t -> Js.number Js.t -> Ext_util_Region.t Js.t
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_util_Region.configs
  
  
end

class type events =
object
  inherit Ext_util_Region.events
  
  
end

class type statics =
object
  inherit Ext_util_Region.statics
  
  method fromEvent : _ Js.t -> 'self Js.t Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.util.Point"

let static = get_static ()

let fromEvent e =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "fromEvent")
    [|Js.Unsafe.inject e; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

