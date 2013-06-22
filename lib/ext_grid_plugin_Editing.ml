class type t =
object('self)
  inherit Ext_AbstractPlugin.t
  inherit Ext_util_Observable.t
  
  method editing : bool Js.t Js.prop
  method cancelEdit : unit Js.meth
  method completeEdit : unit Js.meth
  method startEdit : _ Js.t -> _ Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_AbstractPlugin.configs
  inherit Ext_util_Observable.configs
  
  method clicksToEdit : Js.number Js.t Js.prop
  method triggerEvent : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_AbstractPlugin.events
  inherit Ext_util_Observable.events
  
  method beforeedit : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method canceledit : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method edit : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method validateedit : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_AbstractPlugin.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.grid.plugin.Editing"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

