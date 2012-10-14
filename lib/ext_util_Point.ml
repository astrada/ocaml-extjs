class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Region.t
  
  method equals_point : 'a Js.t -> bool Js.t Js.meth
  method isWithin : 'a Js.t -> 'b Js.t -> bool Js.t Js.meth
  method roundedEquals : 'a Js.t -> bool Js.t Js.meth
  method toString : Js.js_string Js.t Js.meth
  method translate : 'a Js.t -> Js.number Js.t -> Ext_util_Region.t Js.t
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Region.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Region.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Region.statics
  
  method fromEvent : Dom_html.event Js.t -> 'self Js.t Js.meth
  
end

let static = Js.Unsafe.variable "Ext.util.Point"

let fromEvent e =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "fromEvent")
    [|Js.Unsafe.inject e; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

