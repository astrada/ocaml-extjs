class type t =
object('self)
  inherit Ext_Component.t
  
  method surface : Ext_draw_Surface.t Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_Component.configs
  
  method autoSize : bool Js.t Js.prop
  method baseCls : Js.js_string Js.t Js.prop
  method componentLayout : _ Js.t Js.prop
  method enginePriority : Js.js_string Js.t Js.js_array Js.t Js.prop
  method gradients : _ Js.t Js.js_array Js.t Js.prop
  method items : Ext_draw_Sprite.t Js.js_array Js.t Js.prop
  method shrinkWrap : _ Js.t Js.prop
  method viewBox : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Component.events
  
  method click : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method dblclick : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mousedown : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mouseenter : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mouseleave : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mousemove : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mouseup : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Component.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.draw.Component"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

