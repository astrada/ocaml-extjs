class type t =
object('self)
  inherit Ext_dd_DDProxy.t
  
  method dragData : _ Js.t Js.prop
  method afterDragDrop : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> unit Js.meth
  method afterDragEnter : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> unit Js.meth
  method afterDragOut : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> unit Js.meth
  method afterDragOver : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> unit Js.meth
  method afterInvalidDrop : Dom_html.event Js.t -> Js.js_string Js.t -> unit
    Js.meth
  method afterValidDrop : _ Js.t -> Dom_html.event Js.t -> Js.js_string Js.t
    -> unit Js.meth
  method alignElWithMouse : Dom_html.element Js.t -> Js.number Js.t ->
    Js.number Js.t -> unit Js.meth
  method beforeDragDrop : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> bool Js.t Js.meth
  method beforeDragEnter : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> bool Js.t Js.meth
  method beforeDragOut : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> bool Js.t Js.meth
  method beforeDragOver : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> bool Js.t Js.meth
  method beforeInvalidDrop : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t
    -> Js.js_string Js.t -> bool Js.t Js.meth
  method destroy : unit Js.meth
  method getDragData : _ Js.t -> _ Js.t Js.meth
  method getProxy : Ext_dd_StatusProxy.t Js.t Js.meth
  method hideProxy : unit Js.meth
  method onBeforeDrag : _ Js.t -> Dom_html.event Js.t -> bool Js.t Js.meth
  method onStartDrag : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_dd_DDProxy.configs
  
  method animRepair : bool Js.t Js.prop
  method ddGroup : Js.js_string Js.t Js.prop
  method dropAllowed : Js.js_string Js.t Js.prop
  method dropNotAllowed : Js.js_string Js.t Js.prop
  method repairHighlightColor : Js.js_string Js.t Js.prop
  method beforeDragDrop : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  method beforeDragEnter : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  method beforeDragOut : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  method beforeDragOver : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  method beforeInvalidDrop : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  method onBeforeDrag : ('self Js.t, _ Js.t -> Dom_html.event Js.t ->
    bool Js.t) Js.meth_callback Js.writeonly_prop
  method onStartDrag : ('self Js.t, Js.number Js.t -> Js.number Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_dd_DDProxy.events
  
  
end

class type statics =
object
  inherit Ext_dd_DDProxy.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.dd.DragSource"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

