class type t =
object('self)
  inherit Ext_dd_DD.t
  
  method centerFrame : bool Js.t Js.prop
  method resizeFrame : bool Js.t Js.prop
  method applyConfig : unit Js.meth
  method b4MouseDown : _ Js.t -> unit Js.meth
  method createFrame : unit Js.meth
  method endDrag : Dom_html.event Js.t -> unit Js.meth
  method initFrame : unit Js.meth
  method toString : Js.js_string Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_dd_DD.configs
  
  
end

class type events =
object
  inherit Ext_dd_DD.events
  
  
end

class type statics =
object
  inherit Ext_dd_DD.statics
  
  method dragElId : Js.js_string Js.t Js.prop
  
end

let get_static () = Js.Unsafe.variable "Ext.dd.DDProxy"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

