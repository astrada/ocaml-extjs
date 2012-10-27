class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  inherit Ext_util_Bindable.t
  
  method selected : Ext_util_MixedCollection.t Js.t Js.readonly_prop
  method bindStore : _ Js.t Js.optdef -> bool Js.t Js.optdef -> unit Js.meth
  method deselect : _ Js.t -> bool Js.t Js.optdef -> unit Js.meth
  method deselectAll : bool Js.t -> unit Js.meth
  method getCount : Js.number Js.t Js.meth
  method getLastSelected : unit Js.meth
  method getSelection : Ext_data_Model.t Js.js_array Js.t Js.meth
  method getSelectionMode : Js.js_string Js.t Js.meth
  method getStoreListeners : _ Js.t Js.meth
  method hasSelection : bool Js.t Js.meth
  method isFocused : Ext_data_Model.t Js.t -> unit Js.meth
  method isLocked : bool Js.t Js.meth
  method isSelected : _ Js.t -> bool Js.t Js.meth
  method select : _ Js.t -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    unit Js.meth
  method selectAll : bool Js.t -> unit Js.meth
  method selectRange : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> unit
    Js.meth
  method setLastFocused : Ext_data_Model.t Js.t -> unit Js.meth
  method setLocked : bool Js.t -> unit Js.meth
  method setSelectionMode : Js.js_string Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  inherit Ext_util_Bindable.configs
  
  method allowDeselect : bool Js.t Js.prop
  method mode : Js.js_string Js.t Js.prop
  method pruneRemoved : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  inherit Ext_util_Bindable.events
  
  method focuschange : (t Js.t -> Ext_data_Model.t Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method selectionchange : (t Js.t -> Ext_data_Model.t Js.js_array Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  inherit Ext_util_Bindable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.selection.Model"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

