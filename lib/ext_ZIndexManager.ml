class type t =
object('self)
  inherit Ext_Base.t
  
  method bringToFront : _ Js.t -> bool Js.t Js.meth
  method each : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  method eachBottomUp : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  method eachTopDown : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  method get : _ Js.t -> _ Js.t Js.meth
  method getActive : _ Js.t Js.meth
  method getBy : _ Js.callback -> _ Js.t Js.optdef -> _ Js.js_array Js.t
    Js.meth
  method hideAll : unit Js.meth
  method register : _ Js.t -> unit Js.meth
  method sendToBack : _ Js.t -> _ Js.t Js.meth
  method unregister : _ Js.t -> unit Js.meth
  
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

let get_static () = Js.Unsafe.variable "Ext.ZIndexManager"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

