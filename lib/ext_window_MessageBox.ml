class type t =
object('self)
  inherit Ext_window_Window.t
  
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
  method setIcon_chainable : Js.js_string Js.t -> Js.number Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> 'self Js.t Js.meth
  method show_messagebox : _ Js.t -> 'self Js.t Js.meth
  method updateProgress : Js.number Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  method wait : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
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
  
end

class type configs =
object('self)
  inherit Ext_window_Window.configs
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method closeAction : Js.js_string Js.t Js.prop
  method cls : Js.js_string Js.t Js.prop
  method constrain : bool Js.t Js.prop
  method hideMode : Js.js_string Js.t Js.prop
  method layout : _ Js.t Js.prop
  method resizable : _ Js.t Js.prop
  method shrinkWrapDock : _ Js.t Js.prop
  method title : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_window_Window.events
  
  
end

class type statics =
object
  inherit Ext_window_Window.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.window.MessageBox"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

