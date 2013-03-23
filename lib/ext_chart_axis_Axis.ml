class type t =
object('self)
  inherit Ext_chart_axis_Abstract.t
  
  method drawAxis : _ Js.t -> unit Js.meth
  method drawGrid : unit Js.meth
  method drawLabel : unit Js.meth
  method setTitle : Js.js_string Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_chart_axis_Abstract.configs
  
  method adjustEnd : bool Js.t Js.prop
  method dashSize : Js.number Js.t Js.prop
  method grid : _ Js.t Js.prop
  method length : Js.number Js.t Js.prop
  method majorTickSteps : Js.number Js.t Js.prop
  method minorTickSteps : Js.number Js.t Js.prop
  method position : Js.js_string Js.t Js.prop
  method title : Js.js_string Js.t Js.prop
  method width : Js.number Js.t Js.prop
  
end

class type events =
object
  inherit Ext_chart_axis_Abstract.events
  
  
end

class type statics =
object
  inherit Ext_chart_axis_Abstract.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.chart.axis.Axis"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

