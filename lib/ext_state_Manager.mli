(** This is the global state manager. By default all c ...
  
  {% <p>This is the global state manager. By default all components that are "state aware" check this class
for state information if you don't pass them a custom state provider. In order for this class
to be useful, it must be initialized with a provider when your application initializes. Example usage:</p>

<pre><code>// in your initialization function
init : function(){
   <a href="#!/api/Ext.state.Manager-method-setProvider" rel="Ext.state.Manager-method-setProvider" class="docClass">Ext.state.Manager.setProvider</a>(new <a href="#!/api/Ext.state.CookieProvider" rel="Ext.state.CookieProvider" class="docClass">Ext.state.CookieProvider</a>());
}
 </code></pre>


<p>This class passes on calls from components to the underlying <a href="#!/api/Ext.state.Provider" rel="Ext.state.Provider" class="docClass">Ext.state.Provider</a> so that
there is a common interface that can be used without needing to refer to a specific provider instance
in every component.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method clear : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Clears a value from the state</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t] {% <p>The key name</p> %}
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
    {% <p>The default value to return if the key lookup does not match</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The state data</p> %}
    }
    }
    *)
  method getProvider : Ext_state_Provider.t Js.t Js.meth
  (** {% <p>Gets the currently configured state provider</p> %}
    
    {b Returns}:
    {ul {- [Ext_state_Provider.t Js.t] {% <p>The state provider</p> %}
    }
    }
    *)
  method set : Js.js_string Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Sets the value for a key</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    {% <p>The key name</p> %}
    }
    {- value: [_ Js.t] {% <p>The state data</p> %}
    }
    }
    *)
  method setProvider : Ext_state_Provider.t Js.t -> unit Js.meth
  (** {% <p>Configures the default state provider for your application</p> %}
    
    {b Parameters}:
    {ul {- stateProvider: [Ext_state_Provider.t Js.t]
    {% <p>The state provider to set</p> %}
    }
    }
    *)
  
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

val get_instance : unit -> t Js.t
(** Singleton instance for lazy-loaded modules. *)

val instance : t Js.t
(** Singleton instance. *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

