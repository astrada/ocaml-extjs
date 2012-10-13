class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  
  method isMenu : bool Js.t Js.prop
  method parentMenu : 'self Js.t Js.prop
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method canActivateItem : 'a Js.t -> bool Js.t Js.meth
  method deactivateActiveItem : 'a Js.t -> unit Js.meth
  method getBubbleTarget_2 : #Ext_container_Container.t Js.t Js.meth
  method hide_2 : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  method onDestroy : unit Js.meth
  method show_2 : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  method showBy : 'a Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  inherit Ext_container_Container.configs
  inherit Ext_panel_AbstractPanel.configs
  inherit Ext_panel_Panel.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method allowOtherMenus : bool Js.t Js.prop
  method defaultAlign : Js.js_string Js.t Js.prop
  method enableKeyNav : bool Js.t Js.prop
  method floating : bool Js.t Js.prop
  method hidden : bool Js.t Js.prop
  method hideMode : Js.js_string Js.t Js.prop
  method ignoreParentClicks : bool Js.t Js.prop
  method minWidth : Js.number Js.t Js.prop
  method plain : bool Js.t Js.prop
  method showSeparator : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  inherit Ext_container_Container.events
  inherit Ext_panel_AbstractPanel.events
  inherit Ext_panel_Panel.events
  
  method click : (t Js.t -> #Ext_Component.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseenter : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method mouseleave : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method mouseover : (t Js.t -> #Ext_Component.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_panel_AbstractPanel.statics
  inherit Ext_panel_Panel.statics
  
  
end

let static = Js.Unsafe.variable "Ext.menu.Menu"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

