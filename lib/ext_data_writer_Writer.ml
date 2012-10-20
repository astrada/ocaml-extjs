class type t =
object('self)
  inherit Ext_Base.t
  
  method getRecordData : Ext_data_Model.t Js.t ->
    Ext_data_Operation.t Js.t Js.optdef -> _ Js.t Js.meth
  method write : Ext_data_Request.t Js.t -> Ext_data_Request.t Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method nameProperty : Js.js_string Js.t Js.prop
  method writeAllFields : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.data.writer.Writer"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

