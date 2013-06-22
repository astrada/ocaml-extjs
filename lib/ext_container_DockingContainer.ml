class type t =
object('self)
  inherit Ext_Base.t
  
  method addDocked : _ Js.t -> Js.number Js.t Js.optdef ->
    Ext_Component.t Js.js_array Js.t Js.meth
  method getDockedComponent : _ Js.t -> #Ext_Component.t Js.t Js.meth
  method getDockedItems : Js.js_string Js.t -> bool Js.t ->
    Ext_Component.t Js.js_array Js.t Js.meth
  method insertDocked : Js.number Js.t -> _ Js.t -> unit Js.meth
  method onDockedAdd : #Ext_Component.t Js.t -> unit Js.meth
  method onDockedRemove : #Ext_Component.t Js.t -> unit Js.meth
  method removeDocked : #Ext_Component.t Js.t -> bool Js.t Js.optdef -> unit
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method defaultDockWeights : _ Js.t Js.prop
  method onDockedAdd : ('self Js.t, #Ext_Component.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onDockedRemove : ('self Js.t, #Ext_Component.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  method dockedadd : (_ Js.t -> #Ext_Component.t Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method dockedremove : (_ Js.t -> #Ext_Component.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.container.DockingContainer"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

