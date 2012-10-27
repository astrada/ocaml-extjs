class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method isProxy : bool Js.t Js.prop
  method batch : _ Js.t -> Ext_data_Batch.t Js.t Js.meth
  method create : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  method destroy : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  method getModel : Ext_data_Model.t Js.t Js.meth
  method getReader : Ext_data_reader_Reader.t Js.t Js.meth
  method getWriter : Ext_data_writer_Writer.t Js.t Js.meth
  method read : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t -> unit
    Js.meth
  method setModel : _ Js.t -> bool Js.t -> unit Js.meth
  method setReader : _ Js.t -> Ext_data_reader_Reader.t Js.t Js.meth
  method setWriter : _ Js.t -> Ext_data_writer_Writer.t Js.t Js.meth
  method update : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method batchActions : bool Js.t Js.prop
  method batchOrder : Js.js_string Js.t Js.prop
  method model : _ Js.t Js.prop
  method reader : _ Js.t Js.prop
  method writer : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method metachange : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.data.proxy.Proxy"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

