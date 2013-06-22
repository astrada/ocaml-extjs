class type t =
object('self)
  inherit Ext_view_AbstractView.t
  
  method clearHighlight : unit Js.meth
  method focusNode : Ext_data_Model.t Js.t -> unit Js.meth
  method highlightItem : Dom_html.element Js.t -> unit Js.meth
  method initComponent : unit Js.meth
  method refresh : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_view_AbstractView.configs
  
  method mouseOverOutBuffer : Js.number Js.t Js.prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_view_AbstractView.events
  
  method beforecontainerclick : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method beforecontainercontextmenu : (t Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainerdblclick : (t Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainerkeydown : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method beforecontainermousedown : (t Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermouseout : (t Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermouseover : (t Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermouseup : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method beforedeselect : (Ext_selection_DataViewModel.t Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemclick : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemcontextmenu : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemdblclick : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemkeydown : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmousedown : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmouseenter : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmouseleave : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmouseup : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeselect : (Ext_selection_DataViewModel.t Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method containerclick : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method containercontextmenu : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method containerdblclick : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method containerkeydown : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method containermouseout : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method containermouseover : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method containermouseup : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method deselect : (Ext_selection_DataViewModel.t Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method focuschange : (#Ext_selection_Model.t Js.t -> Ext_data_Model.t Js.t
    -> Ext_data_Model.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method highlightitem : (t Js.t -> Ext_dom_Element.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method itemclick : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemcontextmenu : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemdblclick : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemkeydown : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmousedown : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmouseenter : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmouseleave : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmouseup : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method select : (Ext_selection_DataViewModel.t Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method selectionchange : (#Ext_selection_Model.t Js.t ->
    Ext_data_Model.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method unhighlightitem : (t Js.t -> Ext_dom_Element.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_view_AbstractView.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.view.View"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

