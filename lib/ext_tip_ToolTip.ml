class type t =
object('self)
  inherit Ext_tip_Tip.t
  
  method triggerElement : Dom_html.element Js.t Js.prop
  method beforeDestroy : unit Js.meth
  method hide_tooltip : unit Js.meth
  method setTarget : _ Js.t -> unit Js.meth
  method show_tooltip : unit Js.meth
  method showAt_arr : Js.number Js.t Js.js_array Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_tip_Tip.configs
  
  method anchor : Js.js_string Js.t Js.prop
  method anchorOffset : Js.number Js.t Js.prop
  method anchorToTarget : bool Js.t Js.prop
  method autoHide : bool Js.t Js.prop
  method delegate : Js.js_string Js.t Js.prop
  method dismissDelay : Js.number Js.t Js.prop
  method hideDelay : Js.number Js.t Js.prop
  method mouseOffset : Js.number Js.t Js.js_array Js.t Js.prop
  method showDelay : Js.number Js.t Js.prop
  method target : _ Js.t Js.prop
  method trackMouse : bool Js.t Js.prop
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_tip_Tip.events
  
  
end

class type statics =
object
  inherit Ext_tip_Tip.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.tip.ToolTip"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

