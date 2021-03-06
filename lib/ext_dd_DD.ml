class type t =
object('self)
  inherit Ext_dd_DragDrop.t
  
  method scroll : bool Js.t Js.prop
  method alignElWithMouse : Dom_html.element Js.t -> Js.number Js.t ->
    Js.number Js.t -> unit Js.meth
  method applyConfig : unit Js.meth
  method autoOffset : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method b4Drag : _ Js.t -> unit Js.meth
  method b4MouseDown : _ Js.t -> unit Js.meth
  method cachePosition : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef
    -> unit Js.meth
  method setDelta : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method setDragElPos : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method toString : Js.js_string Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_dd_DragDrop.configs
  
  
end

class type events =
object
  inherit Ext_dd_DragDrop.events
  
  
end

class type statics =
object
  inherit Ext_dd_DragDrop.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.dd.DD"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

