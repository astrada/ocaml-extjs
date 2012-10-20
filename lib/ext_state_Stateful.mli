(** A mixin for being able to save the state of an obj ...
  
  {% <p>A mixin for being able to save the state of an object to an underlying
<a href="#!/api/Ext.state.Provider" rel="Ext.state.Provider" class="docClass">Ext.state.Provider</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method addStateEvents : _ Js.t -> unit Js.meth
  (** {% <p>Add events that will trigger the state to be saved. If the first argument is an
array, each element of that array is the name of a state event. Otherwise, each
argument passed to this method is the name of a state event.</p> %}
    
    {b Parameters}:
    {ul {- events: [_ Js.t]
    {% <p>The event name or an array of event names.</p> %}
    }
    }
    *)
  method applyState : _ Js.t -> unit Js.meth
  (** {% <p>Applies the state to the object. This should be overridden in subclasses to do
more complex state operations. By default it applies the state properties onto
the current object.</p> %}
    
    {b Parameters}:
    {ul {- state: [_ Js.t] {% <p>The state</p> %}
    }
    }
    *)
  method destroy : unit Js.meth
  (** {% <p>Destroys this stateful object.</p> %}
    *)
  method getState : _ Js.t Js.meth
  (** {% <p>Gets the current state of the object. By default this function returns null,
it should be overridden in subclasses to implement methods for getting the state.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The current state</p> %}
    }
    }
    *)
  method savePropToState : Js.js_string Js.t -> _ Js.t ->
    Js.js_string Js.t Js.optdef -> bool Js.t Js.meth
  (** {% <p>Conditionally saves a single property from this object to the given state object.
The idea is to only save state which has changed from the initial state so that
current software settings do not override future software settings. Only those
values that are user-changed state should be saved.</p> %}
    
    {b Parameters}:
    {ul {- propName: [Js.js_string Js.t]
    {% <p>The name of the property to save.</p> %}
    }
    {- state: [_ Js.t]
    {% <p>The state object in to which to save the property.</p> %}
    }
    {- stateName: [Js.js_string Js.t] (optional)
    {% <p>The name to use for the property in state.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the property was saved, false if not.</p> %}
    }
    }
    *)
  method savePropsToState : _ Js.t -> _ Js.t -> _ Js.t Js.meth
  (** {% <p>Gathers additional named properties of the instance and adds their current values
to the passed state object.</p> %}
    
    {b Parameters}:
    {ul {- propNames: [_ Js.t]
    {% <p>The name (or array of names) of the property to save.</p> %}
    }
    {- state: [_ Js.t]
    {% <p>The state object in to which to save the property values.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>state</p> %}
    }
    }
    *)
  method saveState : unit Js.meth
  (** {% <p>Saves the state of the object to the persistence store.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method saveDelay : Js.number Js.t Js.prop
  (** {% <p>A buffer to be applied if many state events are fired within a short period.</p> %}
    
    Defaults to: [100]
    *)
  method stateEvents : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>An array of events that, when fired, should trigger this object to
save its state. Defaults to none. <code>stateEvents</code> may be any type
of event supported by this object, including browser or custom events
(e.g., <tt>['click', 'customerchange']</tt>).</p>


<p>See <code><a href="#!/api/Ext.state.Stateful-cfg-stateful" rel="Ext.state.Stateful-cfg-stateful" class="docClass">stateful</a></code> for an explanation of saving and
restoring object state.</p> %}
    *)
  method stateId : Js.js_string Js.t Js.prop
  (** {% <p>The unique id for this object to use for state management purposes.</p>

<p>See <a href="#!/api/Ext.state.Stateful-cfg-stateful" rel="Ext.state.Stateful-cfg-stateful" class="docClass">stateful</a> for an explanation of saving and restoring state.</p> %}
    *)
  method stateful : bool Js.t Js.prop
  (** {% <p>A flag which causes the object to attempt to restore the state of
internal properties from a saved state on startup. The object must have
a <a href="#!/api/Ext.state.Stateful-cfg-stateId" rel="Ext.state.Stateful-cfg-stateId" class="docClass">stateId</a> for state to be managed.</p>

<p>Auto-generated ids are not guaranteed to be stable across page loads and
cannot be relied upon to save and restore the same state for a object.<p></p>

<p>For state saving to work, the state manager's provider must have been
set to an implementation of <a href="#!/api/Ext.state.Provider" rel="Ext.state.Provider" class="docClass">Ext.state.Provider</a> which overrides the
<a href="#!/api/Ext.state.Provider-method-set" rel="Ext.state.Provider-method-set" class="docClass">set</a> and <a href="#!/api/Ext.state.Provider-method-get" rel="Ext.state.Provider-method-get" class="docClass">get</a>
methods to save and recall name/value pairs. A built-in implementation,
<a href="#!/api/Ext.state.CookieProvider" rel="Ext.state.CookieProvider" class="docClass">Ext.state.CookieProvider</a> is available.</p>

<p>To set the state provider for the current page:</p>

<p>   <a href="#!/api/Ext.state.Manager-method-setProvider" rel="Ext.state.Manager-method-setProvider" class="docClass">Ext.state.Manager.setProvider</a>(new <a href="#!/api/Ext.state.CookieProvider" rel="Ext.state.CookieProvider" class="docClass">Ext.state.CookieProvider</a>({</p>

<pre><code>   expires: new Date(new Date().getTime()+(1000*60*60*24*7)), //7 days from now
</code></pre>

<p>   }));</p>

<p>A stateful object attempts to save state when one of the events
listed in the <a href="#!/api/Ext.state.Stateful-cfg-stateEvents" rel="Ext.state.Stateful-cfg-stateEvents" class="docClass">stateEvents</a> configuration fires.</p>

<p>To save state, a stateful object first serializes its state by
calling <em><a href="#!/api/Ext.state.Stateful-method-getState" rel="Ext.state.Stateful-method-getState" class="docClass">getState</a></em>.</p>

<p>The Component base class implements <a href="#!/api/Ext.state.Stateful-method-getState" rel="Ext.state.Stateful-method-getState" class="docClass">getState</a> to save its width and height within the state
only if they were initially configured, and have changed from the configured value.</p>

<p>The Panel class saves its collapsed state in addition to that.</p>

<p>The Grid class saves its column state in addition to its superclass state.</p>

<p>If there is more application state to be save, the developer must provide an implementation which
first calls the superclass method to inherit the above behaviour, and then injects new properties
into the returned object.</p>

<p>The value yielded by getState is passed to <a href="#!/api/Ext.state.Manager-method-set" rel="Ext.state.Manager-method-set" class="docClass">Ext.state.Manager.set</a>
which uses the configured <a href="#!/api/Ext.state.Provider" rel="Ext.state.Provider" class="docClass">Ext.state.Provider</a> to save the object
keyed by the <a href="#!/api/Ext.state.Stateful-cfg-stateId" rel="Ext.state.Stateful-cfg-stateId" class="docClass">stateId</a>.</p>

<p>During construction, a stateful object attempts to <em>restore</em> its state by calling
<a href="#!/api/Ext.state.Manager-method-get" rel="Ext.state.Manager-method-get" class="docClass">Ext.state.Manager.get</a> passing the <a href="#!/api/Ext.state.Stateful-cfg-stateId" rel="Ext.state.Stateful-cfg-stateId" class="docClass">stateId</a></p>

<p>The resulting object is passed to <a href="#!/api/Ext.state.Stateful-method-applyState" rel="Ext.state.Stateful-method-applyState" class="docClass">applyState</a>*. The default implementation of
<a href="#!/api/Ext.state.Stateful-method-applyState" rel="Ext.state.Stateful-method-applyState" class="docClass">applyState</a> simply copies properties into the object, but a developer may
override this to support restoration of more complex application state.</p>

<p>You can perform extra processing on state save and restore by attaching
handlers to the <a href="#!/api/Ext.state.Stateful-event-beforestaterestore" rel="Ext.state.Stateful-event-beforestaterestore" class="docClass">beforestaterestore</a>, <a href="#!/api/Ext.state.Stateful-event-staterestore" rel="Ext.state.Stateful-event-staterestore" class="docClass">staterestore</a>,
<a href="#!/api/Ext.state.Stateful-event-beforestatesave" rel="Ext.state.Stateful-event-beforestatesave" class="docClass">beforestatesave</a> and <a href="#!/api/Ext.state.Stateful-event-statesave" rel="Ext.state.Stateful-event-statesave" class="docClass">statesave</a> events.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method beforestaterestore : (t Js.t -> _ Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires before the state of the object is restored. Return false from an event handler to stop the restore.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_state_Stateful.t Js.t]
    }
    {- state: [_ Js.t]
    {% <p>The hash of state values returned from the StateProvider. If this
event is not vetoed, then the state object is passed to <b><tt>applyState</tt></b>. By default,
that simply copies property values into this object. The method maybe overriden to
provide custom state restoration.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforestatesave : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before the state of the object is saved to the configured state provider. Return false to stop the save.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_state_Stateful.t Js.t]
    }
    {- state: [_ Js.t]
    {% <p>The hash of state values. This is determined by calling
<b><tt>getState()</tt></b> on the object. This method must be provided by the
developer to return whetever representation of state is required, by default, <a href="#!/api/Ext.state.Stateful" rel="Ext.state.Stateful" class="docClass">Ext.state.Stateful</a>
has a null implementation.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method staterestore : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after the state of the object is restored.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_state_Stateful.t Js.t]
    }
    {- state: [_ Js.t]
    {% <p>The hash of state values returned from the StateProvider. This is passed
to <b><tt>applyState</tt></b>. By default, that simply copies property values into this
object. The method maybe overriden to provide custom state restoration.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method statesave : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after the state of the object is saved to the configured state provider.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_state_Stateful.t Js.t]
    }
    {- state: [_ Js.t]
    {% <p>The hash of state values. This is determined by calling
<b><tt>getState()</tt></b> on the object. This method must be provided by the
developer to return whetever representation of state is required, by default, <a href="#!/api/Ext.state.Stateful" rel="Ext.state.Stateful" class="docClass">Ext.state.Stateful</a>
has a null implementation.</p> %}
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

