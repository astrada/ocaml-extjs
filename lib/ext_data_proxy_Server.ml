class type t =
object('self)
  inherit Ext_data_proxy_Proxy.t
  
  method afterRequest : Ext_data_Request.t Js.t -> bool Js.t -> unit Js.meth
  method buildRequest : Ext_data_Operation.t Js.t -> Ext_data_Request.t Js.t
    Js.meth
  method buildUrl : Ext_data_Request.t Js.t -> Js.js_string Js.t Js.meth
  method create : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  method destroy : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  method doRequest : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  method encodeFilters : Ext_util_Filter.t Js.js_array Js.t ->
    Js.js_string Js.t Js.meth
  method encodeSorters : Ext_util_Sorter.t Js.js_array Js.t ->
    Js.js_string Js.t Js.meth
  method read : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t -> unit
    Js.meth
  method setExtraParam : Js.js_string Js.t -> _ Js.t -> unit Js.meth
  method update : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_data_proxy_Proxy.configs
  
  method api : _ Js.t Js.prop
  method cacheString : Js.js_string Js.t Js.prop
  method directionParam : Js.js_string Js.t Js.prop
  method extraParams : _ Js.t Js.prop
  method filterParam : Js.js_string Js.t Js.prop
  method groupDirectionParam : Js.js_string Js.t Js.prop
  method groupParam : Js.js_string Js.t Js.prop
  method idParam : Js.js_string Js.t Js.prop
  method limitParam : Js.js_string Js.t Js.prop
  method noCache : bool Js.t Js.prop
  method pageParam : Js.js_string Js.t Js.prop
  method simpleGroupMode : bool Js.t Js.prop
  method simpleSortMode : bool Js.t Js.prop
  method sortParam : Js.js_string Js.t Js.prop
  method startParam : Js.js_string Js.t Js.prop
  method timeout : Js.number Js.t Js.prop
  method url : Js.js_string Js.t Js.prop
  method afterRequest : ('self Js.t, Ext_data_Request.t Js.t -> bool Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_data_proxy_Proxy.events
  
  method _exception : (#Ext_data_proxy_Proxy.t Js.t -> _ Js.t ->
    Ext_data_Operation.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_data_proxy_Proxy.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.data.proxy.Server"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

