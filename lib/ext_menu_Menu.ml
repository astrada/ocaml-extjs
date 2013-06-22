class type t =
object('self)
  inherit Ext_panel_Panel.t
  
  method isMenu : bool Js.t Js.prop
  method parentMenu : 'self Js.t Js.prop
  method afterShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method beforeShow : unit Js.meth
  method canActivateItem : _ Js.t -> bool Js.t Js.meth
  method deactivateActiveItem : _ Js.t -> unit Js.meth
  method hide_menu : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  method isVisible : bool Js.t Js.optdef -> bool Js.t Js.meth
  method onDestroy : unit Js.meth
  method showBy_menu : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> #Ext_Component.t Js.t
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_panel_Panel.configs
  
  method allowOtherMenus : bool Js.t Js.prop
  method enableKeyNav : bool Js.t Js.prop
  method floating : bool Js.t Js.prop
  method hidden : bool Js.t Js.prop
  method hideMode : Js.js_string Js.t Js.prop
  method ignoreParentClicks : bool Js.t Js.prop
  method minWidth : Js.number Js.t Js.prop
  method plain : bool Js.t Js.prop
  method showSeparator : bool Js.t Js.prop
  method afterShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef
    -> _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method beforeShow : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_panel_Panel.events
  
  method click : (t Js.t -> #Ext_Component.t Js.t -> Ext_EventObject.t Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseenter : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method mouseleave : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method mouseover : (t Js.t -> #Ext_Component.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_panel_Panel.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.menu.Menu"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

