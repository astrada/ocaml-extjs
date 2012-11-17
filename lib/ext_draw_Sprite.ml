class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Animate.t
  inherit Ext_util_Observable.t
  
  method dd : Ext_dd_DragSource.t Js.t Js.prop
  method isSprite : bool Js.t Js.prop
  method addCls : _ Js.t -> 'self Js.t Js.meth
  method destroy : unit Js.meth
  method getBBox : _ Js.t Js.meth
  method hide : bool Js.t -> 'self Js.t Js.meth
  method redraw : 'self Js.t Js.meth
  method remove : bool Js.t Js.meth
  method removeCls : _ Js.t -> 'self Js.t Js.meth
  method setAttributes : _ Js.t -> bool Js.t -> 'self Js.t Js.meth
  method setStyle : _ Js.t -> Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  method show : bool Js.t -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Animate.configs
  inherit Ext_util_Observable.configs
  
  method draggable : bool Js.t Js.prop
  method fill : Js.js_string Js.t Js.prop
  method font : Js.js_string Js.t Js.prop
  method group : _ Js.t Js.prop
  method height : Js.number Js.t Js.prop
  method opacity : Js.number Js.t Js.prop
  method path : Js.js_string Js.t Js.prop
  method radius : Js.number Js.t Js.prop
  method radiusX : Js.number Js.t Js.prop
  method radiusY : Js.number Js.t Js.prop
  method src : Js.js_string Js.t Js.prop
  method stroke : Js.js_string Js.t Js.prop
  method stroke_width : Js.number Js.t Js.prop
  method text : Js.js_string Js.t Js.prop
  method _type : Js.js_string Js.t Js.prop
  method width : Js.number Js.t Js.prop
  method x : Js.number Js.t Js.prop
  method y : Js.number Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Animate.events
  inherit Ext_util_Observable.events
  
  method beforedestroy : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method click : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method destroy : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mousedown : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mousemove : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseout : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseover : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseup : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method render : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Animate.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.draw.Sprite"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

