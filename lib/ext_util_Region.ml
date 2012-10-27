class type t =
object('self)
  inherit Ext_Base.t
  
  method adjust : Js.number Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> 'self Js.t Js.meth
  method constrainTo : 'self Js.t -> 'self Js.t Js.meth
  method contains : 'self Js.t -> bool Js.t Js.meth
  method copy : 'self Js.t Js.meth
  method copyFrom : 'self Js.t -> 'self Js.t Js.meth
  method equals : 'self Js.t -> bool Js.t Js.meth
  method getOutOfBoundOffset : Js.js_string Js.t Js.optdef ->
    _ Js.t Js.optdef -> Ext_util_Offset.t Js.t Js.meth
  method getOutOfBoundOffsetX : Js.number Js.t -> Js.number Js.t Js.meth
  method getOutOfBoundOffsetY : Js.number Js.t -> Js.number Js.t Js.meth
  method intersect : 'self Js.t -> _ Js.t Js.meth
  method isOutOfBound : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    bool Js.t Js.meth
  method isOutOfBoundX : Js.number Js.t -> bool Js.t Js.meth
  method isOutOfBoundY : Js.number Js.t -> bool Js.t Js.meth
  method round : 'self Js.t Js.meth
  method translateBy : _ Js.t -> Js.number Js.t -> 'self Js.t Js.meth
  method union : 'self Js.t -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method from : _ Js.t -> 'self Js.t Js.meth
  method getRegion : _ Js.t -> 'self Js.t Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.util.Region"

let static = get_static ()

let from o =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "from")
    [|Js.Unsafe.inject o; |]

let getRegion el =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "getRegion")
    [|Js.Unsafe.inject el; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

