class type t =
object('self)
  inherit Ext_panel_Panel.t
  
  method initComponent : unit Js.meth
  method showAt_arr : Js.number Js.t Js.js_array Js.t -> unit Js.meth
  method showBy_tip : _ Js.t -> Js.js_string Js.t Js.optdef -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_panel_Panel.configs
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method autoRender : _ Js.t Js.prop
  method baseCls : Js.js_string Js.t Js.prop
  method closable : bool Js.t Js.prop
  method closeAction : Js.js_string Js.t Js.prop
  method constrainPosition : bool Js.t Js.prop
  method defaultAlign : Js.js_string Js.t Js.prop
  method floating : bool Js.t Js.prop
  method focusOnToFront : bool Js.t Js.prop
  method frameHeader : bool Js.t Js.prop
  method hidden : bool Js.t Js.prop
  method maxWidth : Js.number Js.t Js.prop
  method minWidth : Js.number Js.t Js.prop
  method shadow : _ Js.t Js.prop
  method width : Js.number Js.t Js.prop
  
end

class type events =
object
  inherit Ext_panel_Panel.events
  
  
end

class type statics =
object
  inherit Ext_panel_Panel.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.tip.Tip"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

