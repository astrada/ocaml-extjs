class type t =
object('self)
  inherit Ext_Component.t
  
  method add : _ Js.t -> _ Js.t Js.meth
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t -> _ Js.t ->
    _ Js.t -> unit Js.meth
  method afterLayout : #Ext_layout_container_Container.t Js.t -> unit Js.meth
  method cascade : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> 'self Js.t Js.meth
  method child : _ Js.t Js.optdef -> _ Js.t Js.meth
  method contains : #Ext_Component.t Js.t -> bool Js.t Js.optdef -> bool Js.t
    Js.meth
  method disable_chainable : bool Js.t Js.optdef -> 'self Js.t Js.meth
  method doLayout : 'self Js.t Js.meth
  method down : _ Js.t Js.optdef -> _ Js.t Js.meth
  method getComponent : _ Js.t -> #Ext_Component.t Js.t Js.meth
  method getLayout : #Ext_layout_container_Container.t Js.t Js.meth
  method getRefItems : _ Js.t -> unit Js.meth
  method insert : Js.number Js.t -> _ Js.t -> #Ext_Component.t Js.t Js.meth
  method isAncestor : #Ext_Component.t Js.t -> unit Js.meth
  method move_container : Js.number Js.t -> Js.number Js.t ->
    #Ext_Component.t Js.t Js.meth
  method onAdd : #Ext_Component.t Js.t -> Js.number Js.t -> unit Js.meth
  method onBeforeAdd : #Ext_Component.t Js.t -> unit Js.meth
  method onPosition : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method onRemove : #Ext_Component.t Js.t -> bool Js.t -> unit Js.meth
  method onResize : _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  method query : Js.js_string Js.t Js.optdef ->
    Ext_Component.t Js.js_array Js.t Js.meth
  method queryBy : _ Js.callback -> _ Js.t Js.optdef ->
    Ext_Component.t Js.js_array Js.t Js.meth
  method queryById : Js.js_string Js.t -> #Ext_Component.t Js.t Js.meth
  method remove : _ Js.t -> bool Js.t Js.optdef -> #Ext_Component.t Js.t
    Js.meth
  method removeAll : bool Js.t Js.optdef -> Ext_Component.t Js.js_array Js.t
    Js.meth
  method items : #Ext_util_AbstractMixedCollection.t Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_Component.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> _ Js.t -> _ Js.t -> unit) Js.meth_callback Js.writeonly_prop
  method afterLayout : ('self Js.t, #Ext_layout_container_Container.t Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method onAdd : ('self Js.t, #Ext_Component.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method onBeforeAdd : ('self Js.t, #Ext_Component.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onPosition : ('self Js.t, Js.number Js.t -> Js.number Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onRemove : ('self Js.t, #Ext_Component.t Js.t -> bool Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onResize : ('self Js.t, _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method activeItem : _ Js.t Js.prop
  method autoDestroy : bool Js.t Js.prop
  method baseCls : Js.js_string Js.t Js.prop
  method bubbleEvents : Js.js_string Js.t Js.js_array Js.t Js.prop
  method defaultType : Js.js_string Js.t Js.prop
  method defaults : _ Js.t Js.prop
  method detachOnRemove : bool Js.t Js.prop
  method items : _ Js.t Js.prop
  method layout : _ Js.t Js.prop
  method renderTpl : _ Js.t Js.prop
  method suspendLayout : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Component.events
  
  method add : (t Js.t -> #Ext_Component.t Js.t -> Js.number Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method afterlayout : (t Js.t -> #Ext_layout_container_Container.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeadd : (t Js.t -> #Ext_Component.t Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeremove : (t Js.t -> #Ext_Component.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method remove : (t Js.t -> #Ext_Component.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Component.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.container.AbstractContainer"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

