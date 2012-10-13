class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_view_AbstractView.t
  inherit Ext_view_View.t
  inherit Ext_view_Table.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_view_AbstractView.configs
  inherit Ext_view_View.configs
  inherit Ext_view_Table.configs
  
  method autoScroll : bool Js.t Js.prop
  method stripeRows : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_view_AbstractView.events
  inherit Ext_view_View.events
  inherit Ext_view_Table.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_view_AbstractView.statics
  inherit Ext_view_View.statics
  inherit Ext_view_Table.statics
  
  
end

let static = Js.Unsafe.variable "Ext.grid.View"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

