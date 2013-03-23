(** This class is used as a mixin.This class is to be ...
  
  {% <p>This class is used as a mixin.</p>

<p>This class is to be used to provide basic methods for binding/unbinding stores to other
classes. In general it will not be used directly.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method bindStore : _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Binds a store to this instance.</p> %}
    
    {b Parameters}:
    {ul {- store: [_ Js.t] (optional)
    {% <p>The store to bind or ID of the store.
When no store given (or when <code>null</code> or <code>undefined</code> passed), unbinds the existing store.</p> %}
    }
    }
    *)
  method bindStoreListeners : #Ext_data_AbstractStore.t Js.t -> unit Js.meth
  (** {% <p>Binds listeners for this component to the store. By default it will add
anything bound by the getStoreListeners method, however it can be overridden
in a subclass to provide any more complicated handling.</p> %}
    
    {b Parameters}:
    {ul {- store: [#Ext_data_AbstractStore.t Js.t]
    {% <p>The store to bind to</p> %}
    }
    }
    *)
  method getStore : #Ext_data_AbstractStore.t Js.t Js.meth
  (** {% <p>Gets the current store instance.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_data_AbstractStore.t Js.t]
    {% <p>The store, null if one does not exist.</p> %}
    }
    }
    *)
  method getStoreListeners : Ext_data_Store.t Js.t -> _ Js.t Js.meth
  (** {% <p>Gets the listeners to bind to a new store.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The Store which is being bound to for which a listeners object should be returned.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The listeners to be bound to the store in object literal form. The scope
may be omitted, it is assumed to be the current instance.</p> %}
    }
    }
    *)
  method onBindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  (** {% <p>Template method, it is called when a new store is bound
to the current instance.</p> %}
    
    {b Parameters}:
    {ul {- store: [#Ext_data_AbstractStore.t Js.t]
    {% <p>The store being bound</p> %}
    }
    {- initial: [bool Js.t]
    {% <p>True if this store is being bound as initialization of the instance.</p> %}
    }
    }
    *)
  method onUnbindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  (** {% <p>Template method, it is called when an existing store is unbound
from the current instance.</p> %}
    
    {b Parameters}:
    {ul {- store: [#Ext_data_AbstractStore.t Js.t]
    {% <p>The store being unbound</p> %}
    }
    {- initial: [bool Js.t]
    {% <p>True if this store is being bound as initialization of the instance.</p> %}
    }
    }
    *)
  method unbindStoreListeners : #Ext_data_AbstractStore.t Js.t -> unit
    Js.meth
  (** {% <p>Unbinds listeners from this component to the store. By default it will remove
anything bound by the bindStoreListeners method, however it can be overridden
in a subclass to provide any more complicated handling.</p> %}
    
    {b Parameters}:
    {ul {- store: [#Ext_data_AbstractStore.t Js.t]
    {% <p>The store to unbind from</p> %}
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

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

