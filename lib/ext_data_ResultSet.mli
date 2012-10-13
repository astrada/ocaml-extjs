(** Simple wrapper class that represents a set of reco ...
  
  {% <p>Simple wrapper class that represents a set of records returned by a Proxy.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method count : Js.number Js.t Js.prop
  (** {% <p>The number of records in this ResultSet. Note that total may differ from this number.</p> %}
    
    Defaults to: [0]
    *)
  method loaded : bool Js.t Js.prop
  (** {% <p>True if the records have already been loaded. This is only meaningful when dealing with
SQL-backed proxies.</p> %}
    
    Defaults to: [true]
    *)
  method records : Ext_data_Model.t Js.js_array Js.t Js.prop
  (** {% <p>The array of record instances.</p> %}
    *)
  method success : bool Js.t Js.prop
  (** {% <p>True if the ResultSet loaded successfully, false if any errors were encountered.</p> %}
    
    Defaults to: [false]
    *)
  method total : Js.number Js.t Js.prop
  (** {% <p>The total number of records reported by the data source. This ResultSet may form a subset of
those records (see <a href="#!/api/Ext.data.ResultSet-cfg-count" rel="Ext.data.ResultSet-cfg-count" class="docClass">count</a>).</p> %}
    
    Defaults to: [0]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

