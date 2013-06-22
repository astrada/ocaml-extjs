class type t =
object('self)
  inherit Ext_Base.t
  
  method syncRowHeights : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method lockedGridConfig : _ Js.t Js.prop
  method lockedViewConfig : _ Js.t Js.prop
  method normalGridConfig : _ Js.t Js.prop
  method normalViewConfig : _ Js.t Js.prop
  method scrollDelta : Js.number Js.t Js.prop
  method subGridXType : Js.js_string Js.t Js.prop
  method syncRowHeight : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  method filterchange : (Ext_data_Store.t Js.t ->
    Ext_util_Filter.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method lockcolumn : (_ Js.t -> Ext_grid_column_Column.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method processcolumns : (Ext_grid_column_Column.t Js.js_array Js.t ->
    Ext_grid_column_Column.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method unlockcolumn : (_ Js.t -> Ext_grid_column_Column.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.grid.locking.Lockable"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

