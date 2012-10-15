class type t =
object('self)
  inherit Ext_Base.t
  
  method destroy : unit Js.meth
  method disable : unit Js.meth
  method enable : unit Js.meth
  method getQuickTip : Ext_tip_QuickTip.t Js.t Js.meth
  method init : bool Js.t Js.optdef -> 'a Js.t Js.optdef -> unit Js.meth
  method isEnabled : bool Js.t Js.meth
  method register : 'a Js.t -> unit Js.meth
  method tips : 'a Js.t -> unit Js.meth
  method unregister : 'a Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.tip.QuickTipManager"

let get_instance () = Js.Unsafe.variable "Ext.tip.QuickTipManager"

let instance = get_instance ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

