class type t =
object('self)
  inherit Ext_Base.t
  
  method actionCommitRecordsRe : Regexp.regexp Js.t Js.prop
  method actionSkipSyncRe : Regexp.regexp Js.t Js.prop
  method allowWrite : bool Js.t Js.meth
  method commitRecords : Ext_data_Model.t Js.js_array Js.t -> unit Js.meth
  method getError : _ Js.t Js.meth
  method getRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  method getResultSet : Ext_data_ResultSet.t Js.t Js.meth
  method hasException : bool Js.t Js.meth
  method isComplete : bool Js.t Js.meth
  method isRunning : bool Js.t Js.meth
  method isStarted : bool Js.t Js.meth
  method setCompleted : unit Js.meth
  method setException : _ Js.t Js.optdef -> unit Js.meth
  method setStarted : unit Js.meth
  method setSuccessful : unit Js.meth
  method wasSuccessful : bool Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method action : Js.js_string Js.t Js.prop
  method batch : _ Js.t Js.prop
  method callback : _ Js.callback Js.prop
  method filters : Ext_util_Filter.t Js.js_array Js.t Js.prop
  method groupers : Ext_util_Grouper.t Js.js_array Js.t Js.prop
  method limit : Js.number Js.t Js.prop
  method params : _ Js.t Js.prop
  method scope : _ Js.t Js.prop
  method sorters : Ext_util_Sorter.t Js.js_array Js.t Js.prop
  method start : Js.number Js.t Js.prop
  method synchronous : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.data.Operation"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

