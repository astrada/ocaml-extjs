class type t =
object('self)
  inherit Ext_container_Container.t
  inherit Ext_container_DockingContainer.t
  
  method body : Ext_dom_Element.t Js.t Js.readonly_prop
  method contentPaddingProperty : Js.js_string Js.t Js.prop
  method isPanel : bool Js.t Js.prop
  method addBodyCls : Js.js_string Js.t -> 'self Js.t Js.meth
  method addUIClsToElement : Js.js_string Js.t -> unit Js.meth
  method beforeDestroy : unit Js.meth
  method getComponent : _ Js.t -> #Ext_Component.t Js.t Js.meth
  method getRefItems : _ Js.t -> unit Js.meth
  method initComponent : unit Js.meth
  method removeBodyCls : Js.js_string Js.t -> 'self Js.t Js.meth
  method removeUIClsFromElement : Js.js_string Js.t -> unit Js.meth
  method setBodyStyle : _ Js.t -> Js.js_string Js.t -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_container_Container.configs
  inherit Ext_container_DockingContainer.configs
  
  method baseCls : Js.js_string Js.t Js.prop
  method bodyBorder : bool Js.t Js.prop
  method bodyCls : _ Js.t Js.prop
  method bodyPadding : _ Js.t Js.prop
  method bodyStyle : _ Js.t Js.prop
  method border : _ Js.t Js.prop
  method componentLayout : _ Js.t Js.prop
  method dockedItems : _ Js.t Js.prop
  method renderTpl : _ Js.t Js.prop
  method shrinkWrapDock : _ Js.t Js.prop
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_container_Container.events
  inherit Ext_container_DockingContainer.events
  
  
end

class type statics =
object
  inherit Ext_container_Container.statics
  inherit Ext_container_DockingContainer.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.panel.AbstractPanel"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

