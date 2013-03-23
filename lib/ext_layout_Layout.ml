class type t =
object('self)
  inherit Ext_Base.t
  
  method afterRemove : _ Js.t -> unit Js.meth
  method beginLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method beginLayoutCycle : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method calculate : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method completeLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method configureItem : #Ext_Component.t Js.t -> unit Js.meth
  method destroy : unit Js.meth
  method finalizeLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method finishedLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method getItemSizePolicy : #Ext_Component.t Js.t ->
    Ext_layout_SizePolicy.t Js.t Js.meth
  method getLayoutItems_empty : unit Js.meth
  method initLayout : unit Js.meth
  method isValidParent : _ Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  method notifyOwner : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method onContentChange : #Ext_Component.t Js.t -> bool Js.t Js.meth
  method renderItems : _ Js.t -> _ Js.t -> unit Js.meth
  method _done : bool Js.t Js.prop
  method isLayout : bool Js.t Js.readonly_prop
  
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

let get_static () = Js.Unsafe.variable "Ext.layout.Layout"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

