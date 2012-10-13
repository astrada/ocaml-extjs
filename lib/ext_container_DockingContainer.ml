class type t =
object('self)
  inherit Ext_Base.t
  
  method addDocked : 'a Js.t -> Js.number Js.t Js.optdef ->
    Ext_Component.t Js.js_array Js.t Js.meth
  method getDockedComponent : 'a Js.t -> #Ext_Component.t Js.t Js.meth
  method getDockedItems : Js.js_string Js.t -> bool Js.t ->
    Ext_Component.t Js.js_array Js.t Js.meth
  method insertDocked : Js.number Js.t -> 'a Js.t -> unit Js.meth
  method onDockedAdd : #Ext_Component.t Js.t -> unit Js.meth
  method onDockedRemove : #Ext_Component.t Js.t -> unit Js.meth
  method removeDocked : #Ext_Component.t Js.t -> bool Js.t Js.optdef -> unit
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method onDockedAdd : ('self Js.t, #Ext_Component.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onDockedRemove : ('self Js.t, #Ext_Component.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method defaultDockWeights : 'a Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.container.DockingContainer"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

