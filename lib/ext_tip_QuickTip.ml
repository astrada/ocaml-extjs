class type t =
object('self)
  inherit Ext_tip_ToolTip.t
  
  method cancelShow : _ Js.t -> unit Js.meth
  method register : _ Js.t -> unit Js.meth
  method unregister : _ Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_tip_ToolTip.configs
  
  method interceptTitles : bool Js.t Js.prop
  method target : _ Js.t Js.prop
  method title : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_tip_ToolTip.events
  
  
end

class type statics =
object
  inherit Ext_tip_ToolTip.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.tip.QuickTip"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

