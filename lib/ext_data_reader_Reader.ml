class type t =
object('self)
  inherit Ext_util_Observable.t
  inherit Ext_Base.t
  
  method getResponseData : _ Js.t -> Ext_data_ResultSet.t Js.t Js.meth
  method read : _ Js.t -> Ext_data_ResultSet.t Js.t Js.meth
  method readRecords : _ Js.t -> Ext_data_ResultSet.t Js.t Js.meth
  method metaData : _ Js.t Js.readonly_prop
  method rawData : _ Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_util_Observable.configs
  inherit Ext_Base.configs
  
  method idProperty : Js.js_string Js.t Js.prop
  method implicitIncludes : bool Js.t Js.prop
  method messageProperty : Js.js_string Js.t Js.prop
  method readRecordsOnFailure : bool Js.t Js.prop
  method root : Js.js_string Js.t Js.prop
  method successProperty : Js.js_string Js.t Js.prop
  method totalProperty : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_util_Observable.events
  inherit Ext_Base.events
  
  method _exception : (t Js.t -> XmlHttpRequest.xmlHttpRequest Js.t ->
    Ext_data_ResultSet.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.data.reader.Reader"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

