class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dd_DragDrop.t
  
  method scroll : bool Js.t Js.prop
  method alignElWithMouse : Dom_html.element Js.t -> Js.number Js.t ->
    Js.number Js.t -> unit Js.meth
  method applyConfig : unit Js.meth
  method autoOffset : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method b4Drag : 'a Js.t -> unit Js.meth
  method b4MouseDown : 'a Js.t -> unit Js.meth
  method cachePosition : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef
    -> unit Js.meth
  method setDelta : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method setDragElPos : Js.number Js.t -> Js.number Js.t -> unit Js.meth
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

let static = Js.Unsafe.variable "Ext.dd.DD"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

