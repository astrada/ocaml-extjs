class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_container_DockingContainer.t
  
  method isPanel : bool Js.t Js.prop
  method addBodyCls : Js.js_string Js.t -> 'self Js.t Js.meth
  method addUIClsToElement : Js.js_string Js.t -> unit Js.meth
  method beforeDestroy : unit Js.meth
  method getComponent : 'a Js.t -> #Ext_Component.t Js.t Js.meth
  method initComponent : unit Js.meth
  method removeBodyCls : Js.js_string Js.t -> 'self Js.t Js.meth
  method removeUIClsFromElement : Js.js_string Js.t -> unit Js.meth
  method setBodyStyle : 'a Js.t -> Js.js_string Js.t -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  inherit Ext_container_Container.configs
  inherit Ext_container_DockingContainer.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method baseCls : Js.js_string Js.t Js.prop
  method bodyBorder : bool Js.t Js.prop
  method bodyCls : 'a Js.t Js.prop
  method bodyPadding : 'a Js.t Js.prop
  method bodyStyle : 'a Js.t Js.prop
  method componentLayout_2 : Js.js_string Js.t Js.prop
  method dockedItems : 'a Js.t Js.prop
  method renderTpl : 'a Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  inherit Ext_container_Container.events
  inherit Ext_container_DockingContainer.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_container_DockingContainer.statics
  
  
end

let static = Js.Unsafe.variable "Ext.panel.AbstractPanel"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

