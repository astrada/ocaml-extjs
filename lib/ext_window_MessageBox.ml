class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  inherit Ext_window_Window.t
  
  method _CANCEL : Js.number Js.t Js.prop
  method _ERROR : Js.js_string Js.t Js.prop
  method _INFO : Js.js_string Js.t Js.prop
  method _NO : Js.number Js.t Js.prop
  method _OK : Js.number Js.t Js.prop
  method _OKCANCEL : Js.number Js.t Js.prop
  method _QUESTION : Js.js_string Js.t Js.prop
  method _WARNING : Js.js_string Js.t Js.prop
  method _YES : Js.number Js.t Js.prop
  method _YESNO : Js.number Js.t Js.prop
  method _YESNOCANCEL : Js.number Js.t Js.prop
  method buttonText : _ Js.t Js.prop
  method defaultTextHeight : Js.number Js.t Js.prop
  method minProgressWidth : Js.number Js.t Js.prop
  method minPromptWidth : Js.number Js.t Js.prop
  method alert : Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.callback Js.optdef -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method confirm : Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.callback Js.optdef -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method hide_component : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  method initComponent : unit Js.meth
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method progress : Js.js_string Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method prompt : Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.callback Js.optdef -> _ Js.t Js.optdef -> _ Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method setIcon_chainable : Js.js_string Js.t -> 'self Js.t Js.meth
  method show_messagebox : _ Js.t -> 'self Js.t Js.meth
  method updateProgress : Js.number Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  method wait : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  
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
  inherit Ext_window_Window.configs
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method closeAction : Js.js_string Js.t Js.prop
  method cls : Js.js_string Js.t Js.prop
  method constrain : bool Js.t Js.prop
  method height : Js.number Js.t Js.prop
  method hideMode : Js.js_string Js.t Js.prop
  method layout : _ Js.t Js.prop
  method maxHeight : Js.number Js.t Js.prop
  method maxWidth : Js.number Js.t Js.prop
  method minHeight : Js.number Js.t Js.prop
  method minWidth : Js.number Js.t Js.prop
  method resizable : _ Js.t Js.prop
  method title : Js.js_string Js.t Js.prop
  method width : Js.number Js.t Js.prop
  
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
  inherit Ext_window_Window.events
  
  
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
  inherit Ext_window_Window.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.window.MessageBox"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

