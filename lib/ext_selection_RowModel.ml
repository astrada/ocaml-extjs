class type t =
object('self)
  inherit Ext_selection_Model.t
  
  method getCurrentPosition : unit Js.meth
  method selectNext : bool Js.t Js.optdef -> bool Js.t Js.optdef -> bool Js.t
    Js.meth
  method selectPrevious : bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_selection_Model.configs
  
  method enableKeyNav : bool Js.t Js.prop
  method ignoreRightMouseSelection : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_selection_Model.events
  
  method beforedeselect : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeselect : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method deselect : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method select : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_selection_Model.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.selection.RowModel"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

