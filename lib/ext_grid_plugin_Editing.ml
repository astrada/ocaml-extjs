class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractPlugin.t
  inherit Ext_util_Observable.t
  
  method editing : bool Js.t Js.prop
  method cancelEdit : unit Js.meth
  method completeEdit : unit Js.meth
  method init_2 : #Ext_Component.t Js.t -> unit Js.meth
  method startEdit : 'a Js.t -> 'b Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractPlugin.configs
  inherit Ext_util_Observable.configs
  
  method clicksToEdit : Js.number Js.t Js.prop
  method triggerEvent : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractPlugin.events
  inherit Ext_util_Observable.events
  
  method beforeedit : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  method canceledit : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  method edit : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  method validateedit : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractPlugin.statics
  inherit Ext_util_Observable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.grid.plugin.Editing"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o
