class type t =
object('self)
  inherit Ext_Base.t
  
  method done_ : bool Js.t Js.prop
  method isLayout : bool Js.t Js.prop
  method afterRemove : 'a Js.t -> unit Js.meth
  method beginLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method beginLayoutCycle : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method calculate : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method completeLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method configureItem : #Ext_Component.t Js.t -> unit Js.meth
  method destroy : unit Js.meth
  method finalizeLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method finishedLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method getItemSizePolicy : #Ext_Component.t Js.t -> 'a Js.t Js.meth
  method getLayoutItems_2 : unit Js.meth
  method initLayout : unit Js.meth
  method isValidParent : 'a Js.t -> 'b Js.t -> 'c Js.t -> unit Js.meth
  method notifyOwner : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method onContentChange : #Ext_Component.t Js.t -> bool Js.t Js.meth
  method renderItems : 'a Js.t -> 'b Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.layout.Layout"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

