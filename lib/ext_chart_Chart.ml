class type t =
object('self)
  inherit Ext_draw_Component.t
  inherit Ext_chart_Mask.t
  inherit Ext_chart_Navigation.t
  inherit Ext_chart_theme_Theme.t
  inherit Ext_util_Bindable.t
  inherit Ext_util_Observable.t
  
  method bindStore : _ Js.t Js.optdef -> unit Js.meth
  method getStoreListeners : Ext_data_Store.t Js.t -> _ Js.t Js.meth
  method initComponent : unit Js.meth
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method redraw : bool Js.t Js.optdef -> unit Js.meth
  method save : _ Js.t Js.optdef -> _ Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_draw_Component.configs
  inherit Ext_chart_Mask.configs
  inherit Ext_chart_Navigation.configs
  inherit Ext_chart_theme_Theme.configs
  inherit Ext_util_Bindable.configs
  inherit Ext_util_Observable.configs
  
  method animate : _ Js.t Js.prop
  method axes : Ext_chart_axis_Axis.t Js.js_array Js.t Js.prop
  method background : _ Js.t Js.prop
  method gradients : _ Js.t Js.js_array Js.t Js.prop
  method insetPadding : Js.number Js.t Js.prop
  method legend : _ Js.t Js.prop
  method series : Ext_chart_series_Series.t Js.js_array Js.t Js.prop
  method store : Ext_data_Store.t Js.t Js.prop
  method theme : Js.js_string Js.t Js.prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_draw_Component.events
  inherit Ext_chart_Mask.events
  inherit Ext_chart_Navigation.events
  inherit Ext_chart_theme_Theme.events
  inherit Ext_util_Bindable.events
  inherit Ext_util_Observable.events
  
  method beforerefresh : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method refresh : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_draw_Component.statics
  inherit Ext_chart_Mask.statics
  inherit Ext_chart_Navigation.statics
  inherit Ext_chart_theme_Theme.statics
  inherit Ext_util_Bindable.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.chart.Chart"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

