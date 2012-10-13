class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dd_DragDrop.t
  
  method addInvalidHandleClass_2 : unit Js.meth
  method addInvalidHandleId_2 : unit Js.meth
  method addInvalidHandleType_2 : unit Js.meth
  method clearConstraints_2 : unit Js.meth
  method clearTicks_2 : unit Js.meth
  method endDrag_2 : unit Js.meth
  method getDragEl_2 : unit Js.meth
  method isValidHandleChild_2 : unit Js.meth
  method onDrag_2 : unit Js.meth
  method onDragDrop_2 : unit Js.meth
  method onDragEnter_2 : unit Js.meth
  method onDragOut_2 : unit Js.meth
  method onDragOver_2 : unit Js.meth
  method onInvalidDrop_2 : unit Js.meth
  method onMouseDown_2 : unit Js.meth
  method onMouseUp_2 : unit Js.meth
  method removeInvalidHandleClass_2 : unit Js.meth
  method removeInvalidHandleId_2 : unit Js.meth
  method removeInvalidHandleType_2 : unit Js.meth
  method resetConstraints_2 : unit Js.meth
  method setDragElId_2 : unit Js.meth
  method setHandleElId_2 : unit Js.meth
  method setInitPosition_2 : unit Js.meth
  method setOuterHandleElId_2 : unit Js.meth
  method setXConstraint_2 : unit Js.meth
  method setYConstraint_2 : unit Js.meth
  method startDrag_2 : unit Js.meth
  method toString : Js.js_string Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_dd_DragDrop.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_dd_DragDrop.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_dd_DragDrop.statics
  
  
end

let static = Js.Unsafe.variable "Ext.dd.DDTarget"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

