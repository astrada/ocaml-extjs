(** Abstract base class for state provider implementat ...
  
  {% <p>Abstract base class for state provider implementations. The provider is responsible
for setting values  and extracting values to/from the underlying storage source. The 
storage source can vary and the details should be implemented in a subclass. For example
a provider could use a server side database or the browser localstorage where supported.</p>




<p>This class provides methods for encoding and decoding <b>typed</b> variables including 
dates and defines the Provider interface. By default these methods put the value and the
type information into a delimited string that can be stored. These should be overridden in 
a subclass if you want to change the format of the encoded value and subsequent decoding.</p> %}
  *)

class type t =
object('self)
  inherit Ext_util_Observable.t
  inherit Ext_Base.t
  
  method clear : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Clears a value from the state</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t] {% <p>The key name</p> %}
    }
    }
    *)
  method decodeValue : Js.js_string Js.t -> _ Js.t Js.meth
  (** {% <p>Decodes a string previously encoded with <a href="#!/api/Ext.state.Provider-method-encodeValue" rel="Ext.state.Provider-method-encodeValue" class="docClass">encodeValue</a>.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.js_string Js.t]
    {% <p>The value to decode</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The decoded value</p> %}
    }
    }
    *)
  method encodeValue : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Encodes a value including type information.  Decode with <a href="#!/api/Ext.state.Provider-method-decodeValue" rel="Ext.state.Provider-method-decodeValue" class="docClass">decodeValue</a>.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The value to encode</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The encoded value</p> %}
    }
    }
    *)
  method get : Js.js_string Js.t -> _ Js.t -> _ Js.t Js.meth
  (** {% <p>Returns the current value for a key</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    {% <p>The key name</p> %}
    }
    {- defaultValue: [_ Js.t]
    {% <p>A default value to return if the key's value is not found</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The state data</p> %}
    }
    }
    *)
  method set : Js.js_string Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Sets the value for a key</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    {% <p>The key name</p> %}
    }
    {- value: [_ Js.t] {% <p>The value to set</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_util_Observable.configs
  inherit Ext_Base.configs
  
  method prefix : Js.js_string Js.t Js.prop
  (** {% <p>A string to prefix to items stored in the underlying state store.
Defaults to <tt>'ext-'</tt></p> %}
    
    Defaults to: ['ext-']
    *)
  
end

class type events =
object
  inherit Ext_util_Observable.events
  inherit Ext_Base.events
  
  method statechange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a state change occurs.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_state_Provider.t Js.t]
    {% <p>This state provider</p> %}
    }
    {- key: [Js.js_string Js.t]
    {% <p>The state key which was changed</p> %}
    }
    {- value: [Js.js_string Js.t]
    {% <p>The encoded value for the state</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

