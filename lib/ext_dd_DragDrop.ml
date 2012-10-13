class type t =
object('self)
  inherit Ext_Base.t
  
  method available : bool Js.t Js.prop
  method config : 'a Js.t Js.prop
  method defaultPadding : 'a Js.t Js.prop
  method groups : 'a Js.t Js.prop
  method hasOuterHandles : bool Js.t Js.prop
  method id : Js.js_string Js.t Js.prop
  method ignoreSelf : bool Js.t Js.prop
  method invalidHandleClasses : Js.js_string Js.t Js.js_array Js.t Js.prop
  method invalidHandleIds : 'a Js.t Js.prop
  method invalidHandleTypes : 'a Js.t Js.prop
  method isTarget : bool Js.t Js.prop
  method maintainOffset : bool Js.t Js.prop
  method moveOnly : bool Js.t Js.prop
  method padding : Js.number Js.t Js.js_array Js.t Js.prop
  method primaryButtonOnly : bool Js.t Js.prop
  method xTicks : Js.number Js.t Js.js_array Js.t Js.prop
  method yTicks : Js.number Js.t Js.js_array Js.t Js.prop
  method addInvalidHandleClass : Js.js_string Js.t -> unit Js.meth
  method addInvalidHandleId : Js.js_string Js.t -> unit Js.meth
  method addInvalidHandleType : Js.js_string Js.t -> unit Js.meth
  method addToGroup : Js.js_string Js.t -> unit Js.meth
  method applyConfig : unit Js.meth
  method clearConstraints : unit Js.meth
  method clearTicks : unit Js.meth
  method constrainTo : 'a Js.t -> 'b Js.t Js.optdef -> bool Js.t Js.optdef ->
    unit Js.meth
  method endDrag : Dom_html.event Js.t -> unit Js.meth
  method getDragEl : Dom_html.element Js.t Js.meth
  method getEl : Dom_html.element Js.t Js.meth
  method init : Js.js_string Js.t -> Js.js_string Js.t -> 'a Js.t -> unit
    Js.meth
  method initTarget : Js.js_string Js.t -> Js.js_string Js.t -> 'a Js.t ->
    unit Js.meth
  method isLocked : bool Js.t Js.meth
  method isValidHandleChild : Dom_html.element Js.t -> bool Js.t Js.meth
  method lock : unit Js.meth
  method onAvailable : unit Js.meth
  method onDrag : Dom_html.event Js.t -> unit Js.meth
  method onDragDrop : Dom_html.event Js.t -> 'a Js.t -> unit Js.meth
  method onDragEnter : Dom_html.event Js.t -> 'a Js.t -> unit Js.meth
  method onDragOut : Dom_html.event Js.t -> 'a Js.t -> unit Js.meth
  method onDragOver : Dom_html.event Js.t -> 'a Js.t -> unit Js.meth
  method onInvalidDrop : Dom_html.event Js.t -> unit Js.meth
  method onMouseDown : Dom_html.event Js.t -> unit Js.meth
  method onMouseUp : Dom_html.event Js.t -> unit Js.meth
  method removeFromGroup : Js.js_string Js.t -> unit Js.meth
  method removeInvalidHandleClass : Js.js_string Js.t -> unit Js.meth
  method removeInvalidHandleId : Js.js_string Js.t -> unit Js.meth
  method removeInvalidHandleType : Js.js_string Js.t -> unit Js.meth
  method resetConstraints : bool Js.t -> unit Js.meth
  method setDragElId : Js.js_string Js.t -> unit Js.meth
  method setHandleElId : Js.js_string Js.t -> unit Js.meth
  method setInitPosition : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method setOuterHandleElId : Js.js_string Js.t -> unit Js.meth
  method setPadding : Js.number Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> unit Js.meth
  method setXConstraint : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t Js.optdef -> unit Js.meth
  method setYConstraint : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t Js.optdef -> unit Js.meth
  method startDrag : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method toString : Js.js_string Js.t Js.meth
  method unlock : unit Js.meth
  method unreg : unit Js.meth
  
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

let static = Js.Unsafe.variable "Ext.dd.DragDrop"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

