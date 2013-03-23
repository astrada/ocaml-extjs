class type t =
object('self)
  inherit Ext_Base.t
  
  method onCreateLabel : Ext_data_Model.t Js.t -> _ Js.t -> Js.number Js.t ->
    bool Js.t -> Ext_draw_Sprite.t Js.t Js.meth
  method onPlaceLabel : Ext_draw_Sprite.t Js.t -> Ext_data_Model.t Js.t ->
    _ Js.t -> Js.number Js.t -> bool Js.t -> bool Js.t -> Js.number Js.t ->
    unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method onCreateLabel : ('self Js.t, Ext_data_Model.t Js.t -> _ Js.t ->
    Js.number Js.t -> bool Js.t -> Ext_draw_Sprite.t Js.t) Js.meth_callback
    Js.writeonly_prop
  method onPlaceLabel : ('self Js.t, Ext_draw_Sprite.t Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> Js.number Js.t -> bool Js.t ->
    bool Js.t -> Js.number Js.t -> unit) Js.meth_callback Js.writeonly_prop
  method label : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.chart.Label"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

