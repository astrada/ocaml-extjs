class type t =
object('self)
  inherit Ext_Base.t
  
  method alignTo : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  method anchorTo : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> _ Js.callback Js.optdef -> 'self Js.t Js.meth
  method calculateConstrainedPosition : _ Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> bool Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.meth
  method getAlignToXY : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.meth
  method getAnchorXY : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    _ Js.t Js.optdef -> Js.number Js.t Js.js_array Js.t Js.meth
  method getBox : bool Js.t Js.optdef -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method getConstrainVector : _ Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.meth
  method getLocalX : Js.number Js.t Js.meth
  method getLocalXY : Js.number Js.t Js.js_array Js.t Js.meth
  method getLocalY : Js.number Js.t Js.meth
  method getOffsetsTo : _ Js.t -> Js.number Js.t Js.js_array Js.t Js.meth
  method getRegion : Ext_util_Region.t Js.t Js.meth
  method getViewRegion : Ext_util_Region.t Js.t Js.meth
  method getX : Js.number Js.t Js.meth
  method getXY : Js.number Js.t Js.js_array Js.t Js.meth
  method getY : Js.number Js.t Js.meth
  method move : Js.js_string Js.t -> Js.number Js.t -> _ Js.t Js.optdef ->
    unit Js.meth
  method removeAnchor : 'self Js.t Js.meth
  method setBox : _ Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method setLocalX : Js.number Js.t -> 'self Js.t Js.meth
  method setLocalXY : _ Js.t -> Js.number Js.t Js.optdef -> 'self Js.t
    Js.meth
  method setLocalY : Js.number Js.t -> 'self Js.t Js.meth
  method setRegion : Ext_util_Region.t Js.t -> _ Js.t Js.optdef -> 'self Js.t
    Js.meth
  method setX : Js.number Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method setXY : Js.number Js.t Js.js_array Js.t -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  method setY : Js.number Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method translatePoints : _ Js.t -> Js.number Js.t Js.optdef -> _ Js.t
    Js.meth
  
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
  
  
end

let get_static () = Js.Unsafe.variable "Ext.util.Positionable"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

