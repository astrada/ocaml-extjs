(** Handles mapping key events to handling functions f ...
  
  {% <p>Handles mapping key events to handling functions for an element or a Component. One KeyMap can be used for multiple
actions.</p>

<p>A KeyMap must be configured with a <a href="#!/api/Ext.util.KeyMap-cfg-target" rel="Ext.util.KeyMap-cfg-target" class="docClass">target</a> as an event source which may be an Element or a Component.</p>

<p>If the target is an element, then the <code>keydown</code> event will trigger the invocation of <a href="#!/api/Ext.util.KeyMap-cfg-binding" rel="Ext.util.KeyMap-cfg-binding" class="docClass">binding</a>s.</p>

<p>It is possible to configure the KeyMap with a custom <a href="#!/api/Ext.util.KeyMap-cfg-eventName" rel="Ext.util.KeyMap-cfg-eventName" class="docClass">eventName</a> to listen for. This may be useful when the
<a href="#!/api/Ext.util.KeyMap-cfg-target" rel="Ext.util.KeyMap-cfg-target" class="docClass">target</a> is a Component.</p>

<p>The KeyMap's event handling requires that the first parameter passed is a key event. So if the Component's event
signature is different, specify a <a href="#!/api/Ext.util.KeyMap-cfg-processEvent" rel="Ext.util.KeyMap-cfg-processEvent" class="docClass">processEvent</a> configuration which accepts the event's parameters and
returns a key event.</p>

<p>Functions specified in <a href="#!/api/Ext.util.KeyMap-cfg-binding" rel="Ext.util.KeyMap-cfg-binding" class="docClass">binding</a>s are called with this signature : <code>(String key, <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> e)</code> (if the
match is a multi-key combination the callback will still be called only once). A KeyMap can also handle a string
representation of keys. By default KeyMap starts enabled.</p>

<p>Usage:</p>

<pre><code>// map one key by key code
var map = new <a href="#!/api/Ext.util.KeyMap" rel="Ext.util.KeyMap" class="docClass">Ext.util.KeyMap</a>(\{
    target: "my-element",
    key: 13, // or <a href="#!/api/Ext.EventObject-property-ENTER" rel="Ext.EventObject-property-ENTER" class="docClass">Ext.EventObject.ENTER</a>
    fn: myHandler,
    scope: myObject
\});

// map multiple keys to one action by string
var map = new <a href="#!/api/Ext.util.KeyMap" rel="Ext.util.KeyMap" class="docClass">Ext.util.KeyMap</a>(\{
    target: "my-element",
    key: "a\r\n\t",
    fn: myHandler,
    scope: myObject
\});

// map multiple keys to multiple actions by strings and array of codes
var map = new <a href="#!/api/Ext.util.KeyMap" rel="Ext.util.KeyMap" class="docClass">Ext.util.KeyMap</a>(\{
    target: "my-element",
    binding: [\{
        key: [10,13],
        fn: function()\{ alert("Return was pressed"); \}
    \}, \{
        key: "abc",
        fn: function()\{ alert('a, b or c was pressed'); \}
    \}, \{
        key: "\t",
        ctrl:true,
        shift:true,
        fn: function()\{ alert('Control + shift + tab was pressed.'); \}
    \}]
\});
</code></pre>

<p>Since 4.1.0, KeyMaps can bind to Components and process key-based events fired by Components.</p>

<p>To bind to a Component, use the single parameter form of constructor and include the Component event name
to listen for, and a <code>processEvent</code> implementation which returns the key event for further processing by
the KeyMap:</p>

<pre><code>var map = new <a href="#!/api/Ext.util.KeyMap" rel="Ext.util.KeyMap" class="docClass">Ext.util.KeyMap</a>(\{
    target: myGridView,
    eventName: 'itemkeydown',
    processEvent: function(view, record, node, index, event) \{

        // Load the event with the extra information needed by the mappings
        event.view = view;
        event.store = view.getStore();
        event.record = record;
        event.index = index;
        return event;
    \},
    binding: \{
        key: <a href="#!/api/Ext.EventObject-property-DELETE" rel="Ext.EventObject-property-DELETE" class="docClass">Ext.EventObject.DELETE</a>,
        fn: function(keyCode, e) \{
            e.store.remove(e.record);

            // Attempt to select the record that's now in its place
            e.view.getSelectionModel().select(e.index);
            e.view.el.focus();
        \}
    \}
\});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method addBinding : _ Js.t -> unit Js.meth
  (** {% <p>Add a new binding to this KeyMap.</p>

<p>Usage:</p>

<pre><code>// Create a KeyMap
var map = new <a href="#!/api/Ext.util.KeyMap" rel="Ext.util.KeyMap" class="docClass">Ext.util.KeyMap</a>(document, \{
    key: <a href="#!/api/Ext.EventObject-property-ENTER" rel="Ext.EventObject-property-ENTER" class="docClass">Ext.EventObject.ENTER</a>,
    fn: handleKey,
    scope: this
\});

//Add a new binding to the existing KeyMap later
map.addBinding(\{
    key: 'abc',
    shift: true,
    fn: handleKey,
    scope: this
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- binding: [_ Js.t]
    {% <p>A single KeyMap config or an array of configs.
The following config object properties are supported:</p> %}
    }
    }
    *)
  method destroy : bool Js.t -> unit Js.meth
  (** {% <p>Destroys the KeyMap instance and removes all handlers.</p> %}
    
    {b Parameters}:
    {ul {- removeTarget: [bool Js.t]
    {% <p>True to also remove the <a href="#!/api/Ext.util.KeyMap-cfg-target" rel="Ext.util.KeyMap-cfg-target" class="docClass">target</a></p> %}
    }
    }
    *)
  method disable : unit Js.meth
  (** {% <p>Disable this KeyMap</p> %}
    *)
  method enable : unit Js.meth
  (** {% <p>Enables this KeyMap</p> %}
    *)
  method isEnabled : bool Js.t Js.meth
  (** {% <p>Returns true if this KeyMap is enabled</p> %}
    *)
  method on : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Shorthand for adding a single key listener.</p> %}
    
    {b Parameters}:
    {ul {- key: [_ Js.t]
    {% <p>Either the numeric key code, array of key codes or an object with the
following options: <code>\{key: (number or array), shift: (true/false), ctrl: (true/false), alt: (true/false)\}</code></p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The function to call</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the function is executed.
Defaults to the browser window.</p> %}
    }
    }
    *)
  method removeBinding : _ Js.t -> unit Js.meth
  (** {% <p>Remove a binding from this KeyMap.</p> %}
    
    {b Parameters}:
    {ul {- binding: [_ Js.t]
    {% <p>See <a href="#!/api/Ext.util.KeyMap-method-addBinding" rel="Ext.util.KeyMap-method-addBinding" class="docClass">for options</a></p> %}
    }
    }
    *)
  method setDisabled : bool Js.t -> unit Js.meth
  (** {% <p>Convenience function for setting disabled/enabled by boolean.</p> %}
    
    {b Parameters}:
    {ul {- disabled: [bool Js.t]
    }
    }
    *)
  method un : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Shorthand for removing a single key listener.</p> %}
    
    {b Parameters}:
    {ul {- key: [_ Js.t]
    {% <p>Either the numeric key code, array of key codes or an object with the
following options: <code>\{key: (number or array), shift: (true/false), ctrl: (true/false), alt: (true/false)\}</code></p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The function to call</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the function is executed.
Defaults to the browser window.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method binding : _ Js.t Js.prop
  (** {% <p>Either a single object describing a handling function for s specified key (or set of keys), or
an array of such objects.</p> %}
    *)
  method eventName : Js.js_string Js.t Js.prop
  (** {% <p>The event to listen for to pick up key events.</p> %}
    
    Defaults to: ['keydown']
    *)
  method ignoreInputFields : bool Js.t Js.prop
  (** {% <p>Configure this as <code>true</code> if there are any input fields within the <a href="#!/api/Ext.util.KeyMap-cfg-target" rel="Ext.util.KeyMap-cfg-target" class="docClass">target</a>, and this KeyNav
should not process events from input fields, (<code>&amp;lt;input&gt;, &amp;lt;textarea&gt; and elements with</code>contentEditable="true"`)</p> %}
    
    Defaults to: [false]
    *)
  method processEvent : _ Js.callback Js.prop
  (** {% <p>An optional event processor function which accepts the argument list provided by the
<a href="#!/api/Ext.util.KeyMap-cfg-eventName" rel="Ext.util.KeyMap-cfg-eventName" class="docClass">configured event</a> of the <a href="#!/api/Ext.util.KeyMap-cfg-target" rel="Ext.util.KeyMap-cfg-target" class="docClass">target</a>, and returns a keyEvent for processing by the KeyMap.</p>

<p>This may be useful when the <a href="#!/api/Ext.util.KeyMap-cfg-target" rel="Ext.util.KeyMap-cfg-target" class="docClass">target</a> is a Component with s complex event signature, where the event is not
the first parameter. Extra information from the event arguments may be injected into the event for use by the handler
functions before returning it.</p> %}
    *)
  method processEventScope : _ Js.t Js.prop
  (** {% <p>The scope (<code>this</code> context) in which the <a href="#!/api/Ext.util.KeyMap-cfg-processEvent" rel="Ext.util.KeyMap-cfg-processEvent" class="docClass">processEvent</a> method is executed.</p> %}
    
    Defaults to: [this]
    *)
  method target : _ Js.t Js.prop
  (** {% <p>The object on which to listen for the event specified by the <a href="#!/api/Ext.util.KeyMap-cfg-eventName" rel="Ext.util.KeyMap-cfg-eventName" class="docClass">eventName</a> config option.</p> %}
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

