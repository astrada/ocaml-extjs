class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method add : _ Js.t -> _ Js.t Js.meth
  method addCls : _ Js.t -> _ Js.t -> unit Js.meth
  method addGradient : _ Js.t -> unit Js.meth
  method destroy : unit Js.meth
  method getGroup : Js.js_string Js.t -> _ Js.t Js.meth
  method getId : unit Js.meth
  method remove : Ext_draw_Sprite.t Js.t -> bool Js.t -> unit Js.meth
  method removeAll : bool Js.t -> unit Js.meth
  method removeCls : _ Js.t -> _ Js.t -> unit Js.meth
  method setSize : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method setStyle : _ Js.t -> _ Js.t -> unit Js.meth
  method setText : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method height : Js.number Js.t Js.prop
  method items : Ext_draw_Sprite.t Js.js_array Js.t Js.prop
  method width : Js.number Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
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
  method mouseout : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mouseover : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mouseup : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  method create_surface : _ Js.t ->
    Js.js_string Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.meth
  method save : 'self Js.t -> _ Js.t Js.optdef -> _ Js.t Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.draw.Surface"

let static = get_static ()

let create config enginePriority =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "create")
    [|Js.Unsafe.inject config; Js.Unsafe.inject enginePriority; |]

let save surface config =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "save")
    [|Js.Unsafe.inject surface; Js.Unsafe.inject config; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

