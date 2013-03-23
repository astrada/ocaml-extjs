class type t =
object('self)
  inherit Ext_panel_Table.t
  
  method reconfigure : Ext_data_Store.t Js.t Js.optdef ->
    _ Js.t Js.js_array Js.t Js.optdef -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_panel_Table.configs
  
  method columns : _ Js.t Js.prop
  method rowLines : bool Js.t Js.prop
  method viewType : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_panel_Table.events
  
  method beforereconfigure : (t Js.t -> Ext_data_Store.t Js.t ->
    _ Js.t Js.js_array Js.t -> Ext_data_Store.t Js.t ->
    Ext_grid_column_Column.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method reconfigure : (t Js.t -> Ext_data_Store.t Js.t ->
    _ Js.t Js.js_array Js.t -> Ext_data_Store.t Js.t ->
    Ext_grid_column_Column.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_panel_Table.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.grid.Panel"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

