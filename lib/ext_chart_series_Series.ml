class type t =
object('self)
  inherit Ext_chart_Callout.t
  inherit Ext_chart_Highlight.t
  inherit Ext_chart_Label.t
  inherit Ext_chart_Tip.t
  inherit Ext_util_Observable.t
  inherit Ext_Base.t
  
  method eachRecord : _ Js.callback -> _ Js.t -> unit Js.meth
  method getItemForPoint : Js.number Js.t -> Js.number Js.t -> _ Js.t Js.meth
  method getLegendColor : _ Js.t -> unit Js.meth
  method getRecordCount : unit Js.meth
  method hideAll : unit Js.meth
  method isExcluded : _ Js.t -> unit Js.meth
  method setTitle : Js.number Js.t -> Js.js_string Js.t -> unit Js.meth
  method showAll : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_chart_Callout.configs
  inherit Ext_chart_Highlight.configs
  inherit Ext_chart_Label.configs
  inherit Ext_chart_Tip.configs
  inherit Ext_util_Observable.configs
  inherit Ext_Base.configs
  
  method highlight : _ Js.t Js.prop
  method listeners : _ Js.t Js.prop
  method renderer : _ Js.callback Js.prop
  method shadowAttributes : _ Js.js_array Js.t Js.prop
  method showInLegend : bool Js.t Js.prop
  method tips : _ Js.t Js.prop
  method title : Js.js_string Js.t Js.prop
  method _type : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_chart_Callout.events
  inherit Ext_chart_Highlight.events
  inherit Ext_chart_Label.events
  inherit Ext_chart_Tip.events
  inherit Ext_util_Observable.events
  inherit Ext_Base.events
  
  method titlechange : (Js.js_string Js.t -> Js.number Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_chart_Callout.statics
  inherit Ext_chart_Highlight.statics
  inherit Ext_chart_Label.statics
  inherit Ext_chart_Tip.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.chart.series.Series"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

