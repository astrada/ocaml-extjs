class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dd_DragDrop.t
  inherit Ext_dd_DD.t
  
  method centerFrame : bool Js.t Js.prop
  method resizeFrame : bool Js.t Js.prop
  method applyConfig : unit Js.meth
  method b4MouseDown : 'a Js.t -> unit Js.meth
  method createFrame : unit Js.meth
  method endDrag : Dom_html.event Js.t -> unit Js.meth
  method initFrame : unit Js.meth
  method toString : Js.js_string Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_dd_DragDrop.configs
  inherit Ext_dd_DD.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_dd_DragDrop.events
  inherit Ext_dd_DD.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_dd_DragDrop.statics
  inherit Ext_dd_DD.statics
  
  method dragElId : Js.js_string Js.t Js.prop
  
end

let static = Js.Unsafe.variable "Ext.dd.DDProxy"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o
