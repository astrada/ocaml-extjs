class type t = object
  inherit Ext_panel_Panel.t
  method store : Ext_data_Store.t Js.t Js.prop
  method columns : Ext_grid_column_Column.t Js.t Js.js_array Js.t Js.prop
end

