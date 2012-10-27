class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_view_AbstractView.t
  inherit Ext_view_View.t
  
  method addRowCls : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  method afterRender : unit Js.meth
  method beforeDestroy : unit Js.meth
  method collectData : Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t ->
    _ Js.t Js.js_array Js.t Js.meth
  method focusRow : _ Js.t -> unit Js.meth
  method getFeature : Js.js_string Js.t -> Ext_grid_feature_Feature.t Js.t
    Js.meth
  method getPosition : bool Js.t Js.optdef -> Js.number Js.t Js.js_array Js.t
    Js.meth
  method getRowClass : Ext_data_Model.t Js.t -> Js.number Js.t -> _ Js.t ->
    Ext_data_Store.t Js.t -> Js.js_string Js.t Js.meth
  method getTableChunker : unit Js.meth
  method initComponent : unit Js.meth
  method refresh : unit Js.meth
  method removeRowCls : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_view_AbstractView.configs
  inherit Ext_view_View.configs
  
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method baseCls : Js.js_string Js.t Js.prop
  method componentLayout : _ Js.t Js.prop
  method enableTextSelection : bool Js.t Js.prop
  method firstCls : Js.js_string Js.t Js.prop
  method itemSelector : Js.js_string Js.t Js.prop
  method lastCls : Js.js_string Js.t Js.prop
  method markDirty : bool Js.t Js.prop
  method overItemCls : Js.js_string Js.t Js.prop
  method selectedItemCls : Js.js_string Js.t Js.prop
  method stripeRows : bool Js.t Js.prop
  method trackOver : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_view_AbstractView.events
  inherit Ext_view_View.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_view_AbstractView.statics
  inherit Ext_view_View.statics
  
  
end

let static = Js.Unsafe.variable "Ext.view.Table"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

