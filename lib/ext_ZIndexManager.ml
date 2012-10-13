class type t =
object('self)
  inherit Ext_Base.t
  
  method bringToFront : 'a Js.t -> bool Js.t Js.meth
  method each : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  method eachBottomUp : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  method eachTopDown : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  method get : 'a Js.t -> 'b Js.t Js.meth
  method getActive : 'a Js.t Js.meth
  method getBy : 'a Js.callback -> 'b Js.t Js.optdef -> 'c Js.js_array Js.t
    Js.meth
  method hideAll : unit Js.meth
  method register : 'a Js.t -> unit Js.meth
  method sendToBack : 'a Js.t -> 'b Js.t Js.meth
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

let static = Js.Unsafe.variable "Ext.ZIndexManager"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

