(** A mixin for providing query related methods for Ex ...
  
  {% <p>A mixin for providing query related methods for <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> for components that
implement getRefItems.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method child : _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Retrieves the first direct child of this container which matches the passed selector or component.
The passed in selector must comply with an <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector, or it can be an actual <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.</p> %}
    
    {b Parameters}:
    {ul {- selector: [_ Js.t] (optional)
    {% <p>An <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector. If no selector is
specified, the first child will be returned.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> The matching child <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> (or <code>null</code> if no match was found).</p> %}
    }
    }
    *)
  method down : _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Retrieves the first descendant of this container which matches the passed selector.
The passed in selector must comply with an <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector, or it can be an actual <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.</p> %}
    
    {b Parameters}:
    {ul {- selector: [_ Js.t] (optional)
    {% <p>An <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector or <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>. If no selector is
specified, the first child will be returned.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> The matching descendant <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> (or <code>null</code> if no match was found).</p> %}
    }
    }
    *)
  method query : Js.js_string Js.t Js.optdef ->
    Ext_Component.t Js.js_array Js.t Js.meth
  (** {% <p>Retrieves all descendant components which match the passed selector.
Executes an <a href="#!/api/Ext.ComponentQuery-method-query" rel="Ext.ComponentQuery-method-query" class="docClass">Ext.ComponentQuery.query</a> using this container as its root.</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>Selector complying to an <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector.
If no selector is specified all items will be returned.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Component.t Js.js_array Js.t]
    {% <p>Components which matched the selector</p> %}
    }
    }
    *)
  method queryBy : _ Js.callback -> _ Js.t Js.optdef ->
    Ext_Component.t Js.js_array Js.t Js.meth
  (** {% <p>Retrieves all descendant components which match the passed function.
The function should return false for components that are to be
excluded from the selection.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The matcher function. It will be called with a single argument,
the component being tested.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope in which to run the function. If not specified,
it will default to the active component.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Component.t Js.js_array Js.t]
    {% <p>Components matched by the passed function</p> %}
    }
    }
    *)
  method queryById : Js.js_string Js.t -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Finds a component at any level under this container matching the id/itemId.
This is a shorthand for calling ct.down('#' + id);</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>The id to find</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The matching id, null if not found</p> %}
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

