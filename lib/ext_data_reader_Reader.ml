class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method metaData : 'a Js.t Js.readonly_prop
  method rawData : 'a Js.t Js.prop
  method getResponseData : 'a Js.t -> Ext_data_ResultSet.t Js.t Js.meth
  method read : 'a Js.t -> Ext_data_ResultSet.t Js.t Js.meth
  method readRecords : 'a Js.t -> Ext_data_ResultSet.t Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
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
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method exception_ : (t Js.t -> XmlHttpRequest.xmlHttpRequest Js.t ->
    Ext_data_ResultSet.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.data.reader.Reader"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

