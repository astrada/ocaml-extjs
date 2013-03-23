(** Base class that provides a common interface for pu ...
  
  {% <p>Base class that provides a common interface for publishing events. Subclasses are expected to to have a property
"events" with all the events defined, and, optionally, a property "listeners" with configured listeners defined.</p>

<p>For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Employee', \{
    mixins: \{
        observable: '<a href="#!/api/Ext.util.Observable" rel="Ext.util.Observable" class="docClass">Ext.util.Observable</a>'
    \},

    constructor: function (config) \{
        // The Observable constructor copies all of the properties of `config` on
        // to `this` using <a href="#!/api/Ext-method-apply" rel="Ext-method-apply" class="docClass">Ext.apply</a>. Further, the `listeners` property is
        // processed to add listeners.
        //
        this.mixins.observable.constructor.call(this, config);

        this.addEvents(
            'fired',
            'quit'
        );
    \}
\});
</code></pre>

<p>This could then be used like this:</p>

<pre><code>var newEmployee = new Employee(\{
    name: employeeName,
    listeners: \{
        quit: function() \{
            // By default, "this" will be the object that fired the event.
            alert(this.name + " has quit!");
        \}
    \}
\});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method addEvents : _ Js.t -> unit Js.meth
  (** {% <p>Adds the specified events to the list of events which this Observable may fire.</p> %}
    
    {b Parameters}:
    {ul {- eventNames: [_ Js.t]
    {% <p>Either an object with event names as properties with
a value of <code>true</code>. For example:</p>

<pre><code>this.addEvents(\{
    storeloaded: true,
    storecleared: true
\});
</code></pre>

<p>Or any number of event names as separate parameters. For example:</p>

<pre><code>this.addEvents('storeloaded', 'storecleared');
</code></pre> %}
    }
    }
    *)
  method addListener : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef
    -> _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Appends an event handler to this object.  For example:</p>

<pre><code>myGridPanel.on("mouseover", this.onMouseOver, this);
</code></pre>

<p>The method also allows for a single argument to be passed which is a config object
containing properties which specify multiple events. For example:</p>

<pre><code>myGridPanel.on(\{
    cellClick: this.onCellClick,
    mouseover: this.onMouseOver,
    mouseout: this.onMouseOut,
    scope: this // Important. Ensure "this" is correct during handler execution
\});
</code></pre>

<p>One can also specify options for each event handler separately:</p>

<pre><code>myGridPanel.on(\{
    cellClick: \{fn: this.onCellClick, scope: this, single: true\},
    mouseover: \{fn: panel.onMouseOver, scope: panel\}
\});
</code></pre>

<p><em>Names</em> of methods in a specified scope may also be used. Note that
<code>scope</code> MUST be specified to use this option:</p>

<pre><code>myGridPanel.on(\{
    cellClick: \{fn: 'onCellClick', scope: this, single: true\},
    mouseover: \{fn: 'onMouseOver', scope: panel\}
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- eventName: [_ Js.t]
    {% <p>The name of the event to listen for.
May also be an object who's property names are event names.</p> %}
    }
    {- fn: [_ Js.callback] (optional)
    {% <p>The method the event invokes, or <em>if <code>scope</code> is specified, the </em>name* of the method within
the specified <code>scope</code>.  Will be called with arguments
given to <a href="#!/api/Ext.util.Observable-method-fireEvent" rel="Ext.util.Observable-method-fireEvent" class="docClass">fireEvent</a> plus the <code>options</code> parameter described below.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the handler function is
executed. <strong>If omitted, defaults to the object which fired the event.</strong></p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>An object containing handler configuration.</p>




<p><strong>Note:</strong> Unlike in ExtJS 3.x, the options object will also be passed as the last
argument to every event handler.</p>




<p>This object may contain any of the following properties:</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p><strong>Only when the <code>destroyable</code> option is specified. </strong></p>




<p> A <code>Destroyable</code> object. An object which implements the <code>destroy</code> method which removes all listeners added in this call. For example:</p>




<pre><code>this.btnListeners =  = myButton.on(\{
    destroyable: true
    mouseover:   function() \{ console.log('mouseover'); \},
    mouseout:    function() \{ console.log('mouseout'); \},
    click:       function() \{ console.log('click'); \}
\});
</code></pre>




<p>And when those listeners need to be removed:</p>




<pre><code><a href="#!/api/Ext-method-destroy" rel="Ext-method-destroy" class="docClass">Ext.destroy</a>(this.btnListeners);
</code></pre>




<p>or</p>




<pre><code>this.btnListeners.destroy();
</code></pre> %}
    }
    }
    *)
  method addManagedListener : _ Js.t -> _ Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Adds listeners to any Observable object (or <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>) which are automatically removed when this Component is
destroyed.</p> %}
    
    {b Parameters}:
    {ul {- item: [_ Js.t]
    {% <p>The item to which to add a listener/listeners.</p> %}
    }
    {- ename: [_ Js.t]
    {% <p>The event name, or an object containing event name properties.</p> %}
    }
    {- fn: [_ Js.callback] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the handler function.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the scope (<code>this</code> reference)
in which the handler function is executed.</p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the
<a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a> options.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p><strong>Only when the <code>destroyable</code> option is specified. </strong></p>




<p> A <code>Destroyable</code> object. An object which implements the <code>destroy</code> method which removes all listeners added in this call. For example:</p>




<pre><code>this.btnListeners =  = myButton.mon(\{
    destroyable: true
    mouseover:   function() \{ console.log('mouseover'); \},
    mouseout:    function() \{ console.log('mouseout'); \},
    click:       function() \{ console.log('click'); \}
\});
</code></pre>




<p>And when those listeners need to be removed:</p>




<pre><code><a href="#!/api/Ext-method-destroy" rel="Ext-method-destroy" class="docClass">Ext.destroy</a>(this.btnListeners);
</code></pre>




<p>or</p>




<pre><code>this.btnListeners.destroy();
</code></pre> %}
    }
    }
    *)
  method clearListeners : unit Js.meth
  (** {% <p>Removes all listeners for this object including the managed listeners</p> %}
    *)
  method clearManagedListeners : unit Js.meth
  (** {% <p>Removes all managed listeners for this object.</p> %}
    *)
  method enableBubble : _ Js.t -> unit Js.meth
  (** {% <p>Enables events fired by this Observable to bubble up an owner hierarchy by calling <code>this.getBubbleTarget()</code> if
present. There is no implementation in the Observable base class.</p>

<p>This is commonly used by Ext.Components to bubble events to owner Containers.
See <a href="#!/api/Ext.Component-method-getBubbleTarget" rel="Ext.Component-method-getBubbleTarget" class="docClass">Ext.Component.getBubbleTarget</a>. The default implementation in <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> returns the
Component's immediate owner. But if a known target is required, this can be overridden to access the
required target more quickly.</p>

<p>Example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Ext.overrides.form.field.Base', \{
    override: '<a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a>',

    //  Add functionality to Field's initComponent to enable the change event to bubble
    initComponent: function () \{
        this.callParent();
        this.enableBubble('change');
    \}
\});

var myForm = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>', \{
    title: 'User Details',
    items: [\{
        ...
    \}],
    listeners: \{
        change: function() \{
            // Title goes red if form has been modified.
            myForm.header.setStyle('color', 'red');
        \}
    \}
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- eventNames: [_ Js.t]
    {% <p>The event name to bubble, or an Array of event names.</p> %}
    }
    }
    *)
  method fireEvent : Js.js_string Js.t -> _ Js.t -> bool Js.t Js.meth
  (** {% <p>Fires the specified event with the passed parameters (minus the event name, plus the <code>options</code> object passed
to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a>).</p>

<p>An event may be set to bubble up an Observable parent hierarchy (See <a href="#!/api/Ext.Component-method-getBubbleTarget" rel="Ext.Component-method-getBubbleTarget" class="docClass">Ext.Component.getBubbleTarget</a>) by
calling <a href="#!/api/Ext.util.Observable-method-enableBubble" rel="Ext.util.Observable-method-enableBubble" class="docClass">enableBubble</a>.</p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The name of the event to fire.</p> %}
    }
    {- args: [_ Js.t]
    {% <p>Variable number of parameters are passed to handlers.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>returns false if any of the handlers return false otherwise it returns true.</p> %}
    }
    }
    *)
  method fireEventArgs : Js.js_string Js.t -> _ Js.t Js.js_array Js.t ->
    bool Js.t Js.meth
  (** {% <p>Fires the specified event with the passed parameter list.</p>

<p>An event may be set to bubble up an Observable parent hierarchy (See <a href="#!/api/Ext.Component-method-getBubbleTarget" rel="Ext.Component-method-getBubbleTarget" class="docClass">Ext.Component.getBubbleTarget</a>) by
calling <a href="#!/api/Ext.util.Observable-method-enableBubble" rel="Ext.util.Observable-method-enableBubble" class="docClass">enableBubble</a>.</p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The name of the event to fire.</p> %}
    }
    {- args: [_ Js.t Js.js_array Js.t]
    {% <p>An array of parameters which are passed to handlers.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>returns false if any of the handlers return false otherwise it returns true.</p> %}
    }
    }
    *)
  method hasListener : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Checks to see if this object has any listeners for a specified event, or whether the event bubbles. The answer
indicates whether the event needs firing or not.</p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The name of the event to check for</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p><code>true</code> if the event is being listened for or bubbles, else <code>false</code></p> %}
    }
    }
    *)
  method mon : _ Js.t -> _ Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Shorthand for <a href="#!/api/Ext.util.Observable-method-addManagedListener" rel="Ext.util.Observable-method-addManagedListener" class="docClass">addManagedListener</a>.</p>

<p>Adds listeners to any Observable object (or <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>) which are automatically removed when this Component is
destroyed.</p> %}
    
    {b Parameters}:
    {ul {- item: [_ Js.t]
    {% <p>The item to which to add a listener/listeners.</p> %}
    }
    {- ename: [_ Js.t]
    {% <p>The event name, or an object containing event name properties.</p> %}
    }
    {- fn: [_ Js.callback] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the handler function.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the scope (<code>this</code> reference)
in which the handler function is executed.</p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the
<a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a> options.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p><strong>Only when the <code>destroyable</code> option is specified. </strong></p>




<p> A <code>Destroyable</code> object. An object which implements the <code>destroy</code> method which removes all listeners added in this call. For example:</p>




<pre><code>this.btnListeners =  = myButton.mon(\{
    destroyable: true
    mouseover:   function() \{ console.log('mouseover'); \},
    mouseout:    function() \{ console.log('mouseout'); \},
    click:       function() \{ console.log('click'); \}
\});
</code></pre>




<p>And when those listeners need to be removed:</p>




<pre><code><a href="#!/api/Ext-method-destroy" rel="Ext-method-destroy" class="docClass">Ext.destroy</a>(this.btnListeners);
</code></pre>




<p>or</p>




<pre><code>this.btnListeners.destroy();
</code></pre> %}
    }
    }
    *)
  method mun : _ Js.t -> _ Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Shorthand for <a href="#!/api/Ext.util.Observable-method-removeManagedListener" rel="Ext.util.Observable-method-removeManagedListener" class="docClass">removeManagedListener</a>.</p>

<p>Removes listeners that were added by the <a href="#!/api/Ext.util.Observable-method-mon" rel="Ext.util.Observable-method-mon" class="docClass">mon</a> method.</p> %}
    
    {b Parameters}:
    {ul {- item: [_ Js.t]
    {% <p>The item from which to remove a listener/listeners.</p> %}
    }
    {- ename: [_ Js.t]
    {% <p>The event name, or an object containing event name properties.</p> %}
    }
    {- fn: [_ Js.callback] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the handler function.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the scope (<code>this</code> reference)
in which the handler function is executed.</p> %}
    }
    }
    *)
  method on : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Shorthand for <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a>.</p>

<p>Appends an event handler to this object.  For example:</p>

<pre><code>myGridPanel.on("mouseover", this.onMouseOver, this);
</code></pre>

<p>The method also allows for a single argument to be passed which is a config object
containing properties which specify multiple events. For example:</p>

<pre><code>myGridPanel.on(\{
    cellClick: this.onCellClick,
    mouseover: this.onMouseOver,
    mouseout: this.onMouseOut,
    scope: this // Important. Ensure "this" is correct during handler execution
\});
</code></pre>

<p>One can also specify options for each event handler separately:</p>

<pre><code>myGridPanel.on(\{
    cellClick: \{fn: this.onCellClick, scope: this, single: true\},
    mouseover: \{fn: panel.onMouseOver, scope: panel\}
\});
</code></pre>

<p><em>Names</em> of methods in a specified scope may also be used. Note that
<code>scope</code> MUST be specified to use this option:</p>

<pre><code>myGridPanel.on(\{
    cellClick: \{fn: 'onCellClick', scope: this, single: true\},
    mouseover: \{fn: 'onMouseOver', scope: panel\}
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- eventName: [_ Js.t]
    {% <p>The name of the event to listen for.
May also be an object who's property names are event names.</p> %}
    }
    {- fn: [_ Js.callback] (optional)
    {% <p>The method the event invokes, or <em>if <code>scope</code> is specified, the </em>name* of the method within
the specified <code>scope</code>.  Will be called with arguments
given to <a href="#!/api/Ext.util.Observable-method-fireEvent" rel="Ext.util.Observable-method-fireEvent" class="docClass">fireEvent</a> plus the <code>options</code> parameter described below.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the handler function is
executed. <strong>If omitted, defaults to the object which fired the event.</strong></p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>An object containing handler configuration.</p>




<p><strong>Note:</strong> Unlike in ExtJS 3.x, the options object will also be passed as the last
argument to every event handler.</p>




<p>This object may contain any of the following properties:</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p><strong>Only when the <code>destroyable</code> option is specified. </strong></p>




<p> A <code>Destroyable</code> object. An object which implements the <code>destroy</code> method which removes all listeners added in this call. For example:</p>




<pre><code>this.btnListeners =  = myButton.on(\{
    destroyable: true
    mouseover:   function() \{ console.log('mouseover'); \},
    mouseout:    function() \{ console.log('mouseout'); \},
    click:       function() \{ console.log('click'); \}
\});
</code></pre>




<p>And when those listeners need to be removed:</p>




<pre><code><a href="#!/api/Ext-method-destroy" rel="Ext-method-destroy" class="docClass">Ext.destroy</a>(this.btnListeners);
</code></pre>




<p>or</p>




<pre><code>this.btnListeners.destroy();
</code></pre> %}
    }
    }
    *)
  method relayEvents : _ Js.t -> Js.js_string Js.t Js.js_array Js.t ->
    Js.js_string Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Relays selected events from the specified Observable as if the events were fired by <code>this</code>.</p>

<p>For example if you are extending Grid, you might decide to forward some events from store.
So you can do this inside your initComponent:</p>

<pre><code>this.relayEvents(this.getStore(), ['load']);
</code></pre>

<p>The grid instance will then have an observable 'load' event which will be passed the
parameters of the store's load event and any function fired with the grid's load event
would have access to the grid using the <code>this</code> keyword.</p> %}
    
    {b Parameters}:
    {ul {- origin: [_ Js.t]
    {% <p>The Observable whose events this object is to relay.</p> %}
    }
    {- events: [Js.js_string Js.t Js.js_array Js.t]
    {% <p>Array of event names to relay.</p> %}
    }
    {- prefix: [Js.js_string Js.t] (optional)
    {% <p>A common prefix to prepend to the event names. For example:</p>

<pre><code>this.relayEvents(this.getStore(), ['load', 'clear'], 'store');
</code></pre>

<p>Now the grid will forward 'load' and 'clear' events of store as 'storeload' and 'storeclear'.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>A <code>Destroyable</code> object. An object which implements the <code>destroy</code> method which, when destroyed, removes all relayers. For example:</p>

<pre><code>this.storeRelayers = this.relayEvents(this.getStore(), ['load', 'clear'], 'store');
</code></pre>

<p>Can be undone by calling</p>

<pre><code><a href="#!/api/Ext-method-destroy" rel="Ext-method-destroy" class="docClass">Ext.destroy</a>(this.storeRelayers);
</code></pre>

<p>or</p>

<pre><code>this.store.relayers.destroy();
</code></pre> %}
    }
    }
    *)
  method removeListener : Js.js_string Js.t -> _ Js.callback ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Removes an event handler.</p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The type of event the handler was associated with.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The handler to remove. <strong>This must be a reference to the function passed into the
<a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a> call.</strong></p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope originally specified for the handler. It must be the same as the
scope argument specified in the original call to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a> or the listener will not be removed.</p> %}
    }
    }
    *)
  method removeManagedListener : _ Js.t -> _ Js.t -> _ Js.callback Js.optdef
    -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Removes listeners that were added by the <a href="#!/api/Ext.util.Observable-method-mon" rel="Ext.util.Observable-method-mon" class="docClass">mon</a> method.</p> %}
    
    {b Parameters}:
    {ul {- item: [_ Js.t]
    {% <p>The item from which to remove a listener/listeners.</p> %}
    }
    {- ename: [_ Js.t]
    {% <p>The event name, or an object containing event name properties.</p> %}
    }
    {- fn: [_ Js.callback] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the handler function.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>If the <code>ename</code> parameter was an event name, this is the scope (<code>this</code> reference)
in which the handler function is executed.</p> %}
    }
    }
    *)
  method resumeEvent : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Resumes firing of the named event(s).</p>

<p>After calling this method to resume events, the events will fire when requested to fire.</p>

<p><strong>Note that if the <a href="#!/api/Ext.util.Observable-method-suspendEvent" rel="Ext.util.Observable-method-suspendEvent" class="docClass">suspendEvent</a> method is called multiple times for a certain event,
this converse method will have to be called the same number of times for it to resume firing.</strong></p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>Multiple event names to resume.</p> %}
    }
    }
    *)
  method resumeEvents : unit Js.meth
  (** {% <p>Resumes firing events (see <a href="#!/api/Ext.util.Observable-method-suspendEvents" rel="Ext.util.Observable-method-suspendEvents" class="docClass">suspendEvents</a>).</p>

<p>If events were suspended using the <code>queueSuspended</code> parameter, then all events fired
during event suspension will be sent to any listeners now.</p> %}
    *)
  method suspendEvent : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Suspends firing of the named event(s).</p>

<p>After calling this method to suspend events, the events will no longer fire when requested to fire.</p>

<p><strong>Note that if this is called multiple times for a certain event, the converse method
<a href="#!/api/Ext.util.Observable-method-resumeEvent" rel="Ext.util.Observable-method-resumeEvent" class="docClass">resumeEvent</a> will have to be called the same number of times for it to resume firing.</strong></p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>Multiple event names to suspend.</p> %}
    }
    }
    *)
  method suspendEvents : bool Js.t -> unit Js.meth
  (** {% <p>Suspends the firing of all events. (see <a href="#!/api/Ext.util.Observable-method-resumeEvents" rel="Ext.util.Observable-method-resumeEvents" class="docClass">resumeEvents</a>)</p> %}
    
    {b Parameters}:
    {ul {- queueSuspended: [bool Js.t]
    {% <p>Pass as true to queue up suspended events to be fired
after the <a href="#!/api/Ext.util.Observable-method-resumeEvents" rel="Ext.util.Observable-method-resumeEvents" class="docClass">resumeEvents</a> call instead of discarding all suspended events.</p> %}
    }
    }
    *)
  method un : Js.js_string Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Shorthand for <a href="#!/api/Ext.util.Observable-method-removeListener" rel="Ext.util.Observable-method-removeListener" class="docClass">removeListener</a>.</p>

<p>Removes an event handler.</p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The type of event the handler was associated with.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The handler to remove. <strong>This must be a reference to the function passed into the
<a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a> call.</strong></p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope originally specified for the handler. It must be the same as the
scope argument specified in the original call to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a> or the listener will not be removed.</p> %}
    }
    }
    *)
  method hasListeners : _ Js.t Js.readonly_prop
  (** {% <p>This object holds a key for any event that has a listener. The listener may be set
directly on the instance, or on its class or a super class (via <a href="#!/api/Ext.util.Observable-static-method-observe" rel="Ext.util.Observable-static-method-observe" class="docClass">observe</a>) or
on the <a href="#!/api/Ext.app.EventBus" rel="Ext.app.EventBus" class="docClass">MVC EventBus</a>. The values of this object are truthy
(a non-zero number) and falsy (0 or undefined). They do not represent an exact count
of listeners. The value for an event is truthy if the event must be fired and is
falsy if there is no need to fire the event.</p>

<p>The intended use of this property is to avoid the expense of fireEvent calls when
there are no listeners. This can be particularly helpful when one would otherwise
have to call fireEvent hundreds or thousands of times. It is used like this:</p>

<pre><code> if (this.hasListeners.foo) \{
     this.fireEvent('foo', this, arg1);
 \}
</code></pre> %}
    *)
  method isObservable : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Observable, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method listeners : _ Js.t Js.prop
  (** {% <p>A config object containing one or more event handlers to be added to this object during initialization. This
should be a valid listeners config object as specified in the <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a> example for attaching multiple
handlers at once.</p>

<p><strong>DOM events from Ext JS <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Components</a></strong></p>

<p>While <em>some</em> Ext JS Component classes export selected DOM events (e.g. "click", "mouseover" etc), this is usually
only done when extra value can be added. For example the <a href="#!/api/Ext.view.View" rel="Ext.view.View" class="docClass">DataView</a>'s <strong><code><a href="#!/api/Ext.view.View-event-itemclick" rel="Ext.view.View-event-itemclick" class="docClass">itemclick</a></code></strong> event passing the node clicked on. To access DOM events directly from a
child element of a Component, we need to specify the <code>element</code> option to identify the Component property to add a
DOM listener to:</p>

<pre><code>new <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>(\{
    width: 400,
    height: 200,
    dockedItems: [\{
        xtype: 'toolbar'
    \}],
    listeners: \{
        click: \{
            element: 'el', //bind to the underlying el property on the panel
            fn: function()\{ console.log('click el'); \}
        \},
        dblclick: \{
            element: 'body', //bind to the underlying body property on the panel
            fn: function()\{ console.log('dblclick body'); \}
        \}
    \}
\});
</code></pre> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method capture : 'self Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Starts capture on the specified Observable. All events will be passed to the supplied function with the event
name + standard signature of the event <strong>before</strong> the event is fired. If the supplied function returns false,
the event will not fire.</p> %}
    
    {b Parameters}:
    {ul {- o: [Ext_util_Observable.t Js.t]
    {% <p>The Observable to capture events from.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The function to call when an event is fired.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the function is executed. Defaults to
the Observable firing the event.</p> %}
    }
    }
    *)
  method observe : _ Js.callback -> _ Js.t -> unit Js.meth
  (** {% <p>Sets observability on the passed class constructor.</p>

<p>This makes any event fired on any instance of the passed class also fire a single event through
the <strong>class</strong> allowing for central handling of events on many instances at once.</p>

<p>Usage:</p>

<pre><code><a href="#!/api/Ext.util.Observable-static-method-observe" rel="Ext.util.Observable-static-method-observe" class="docClass">Ext.util.Observable.observe</a>(<a href="#!/api/Ext.data.Connection" rel="Ext.data.Connection" class="docClass">Ext.data.Connection</a>);
<a href="#!/api/Ext.data.Connection-method-on" rel="Ext.data.Connection-method-on" class="docClass">Ext.data.Connection.on</a>('beforerequest', function(con, options) \{
    console.log('Ajax request made to ' + options.url);
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- c: [_ Js.callback]
    {% <p>The class constructor to make observable.</p> %}
    }
    {- listeners: [_ Js.t]
    {% <p>An object containing a series of listeners to add. See <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a>.</p> %}
    }
    }
    *)
  method releaseCapture : 'self Js.t -> unit Js.meth
  (** {% <p>Removes <strong>all</strong> added captures from the Observable.</p> %}
    
    {b Parameters}:
    {ul {- o: [Ext_util_Observable.t Js.t]
    {% <p>The Observable to release</p> %}
    }
    }
    *)
  
end

val get_static : unit -> statics Js.t
(** Static instance for lazy-loaded modules. *)

val static : statics Js.t
(** Static instance. *)

val capture : 'self Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit
(** See method [statics.capture] *)

val observe : _ Js.callback -> _ Js.t -> unit
(** See method [statics.observe] *)

val releaseCapture : 'self Js.t -> unit
(** See method [statics.releaseCapture] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

