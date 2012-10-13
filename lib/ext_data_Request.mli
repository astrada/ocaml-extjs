(** Simple class that represents a Request that will b ...
  
  {% <p>Simple class that represents a Request that will be made by any <a href="#!/api/Ext.data.proxy.Server" rel="Ext.data.proxy.Server" class="docClass">Ext.data.proxy.Server</a> subclass.
All this class does is standardize the representation of a Request as used by any ServerProxy subclass,
it does not contain any actual logic or perform the request itself.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method action : Js.js_string Js.t Js.prop
  (** {% <p>The name of the action this Request represents. Usually one of 'create', 'read', 'update' or 'destroy'.</p> %}
    *)
  method method_ : Js.js_string Js.t Js.prop
  (** {% <p>The HTTP method to use on this Request. Should be one of 'GET', 'POST', 'PUT' or 'DELETE'.</p> %}
    
    Defaults to: ['GET']
    *)
  method params : 'a Js.t Js.prop
  (** {% <p>HTTP request params. The Proxy and its Writer have access to and can modify this object.</p> %}
    *)
  method url : Js.js_string Js.t Js.prop
  (** {% <p>The url to access on this Request</p> %}
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

