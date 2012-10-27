(** An abstract base class which provides shared metho ...
  
  {% <p>An abstract base class which provides shared methods for Containers across the Sencha product line.</p>

<p>Please refer to sub class's documentation</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  
  method items : #Ext_util_AbstractMixedCollection.t Js.t Js.prop
  (** {% <p>The MixedCollection containing all the child items of this container.</p> %}
    *)
  method add : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Adds <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a>(s) to this Container.</p>

<h2>Description:</h2>

<ul>
<li>Fires the <a href="#!/api/Ext.container.AbstractContainer-event-beforeadd" rel="Ext.container.AbstractContainer-event-beforeadd" class="docClass">beforeadd</a> event before adding.</li>
<li>The Container's <a href="#!/api/Ext.container.AbstractContainer-cfg-defaults" rel="Ext.container.AbstractContainer-cfg-defaults" class="docClass">default config values</a> will be applied
accordingly (see <code><a href="#!/api/Ext.container.AbstractContainer-cfg-defaults" rel="Ext.container.AbstractContainer-cfg-defaults" class="docClass">defaults</a></code> for details).</li>
<li>Fires the <code><a href="#!/api/Ext.container.AbstractContainer-event-add" rel="Ext.container.AbstractContainer-event-add" class="docClass">add</a></code> event after the component has been added.</li>
</ul>


<h2>Notes:</h2>

<p>If the Container is <strong>already rendered</strong> when <code>add</code>
is called, it will render the newly added Component into its content area.</p>

<p><strong>If</strong> the Container was configured with a size-managing <a href="#!/api/Ext.container.AbstractContainer-cfg-layout" rel="Ext.container.AbstractContainer-cfg-layout" class="docClass">layout</a> manager,
the Container will recalculate its internal layout at this time too.</p>

<p>Note that the default layout manager simply renders child Components sequentially
into the content area and thereafter performs no sizing.</p>

<p>If adding multiple new child Components, pass them as an array to the <code>add</code> method,
so that only one layout recalculation is performed.</p>

<pre><code>tb = new <a href="#!/api/Ext.toolbar.Toolbar" rel="Ext.toolbar.Toolbar" class="docClass">Ext.toolbar.Toolbar</a>({
    renderTo: document.body
});  // toolbar is rendered
// add multiple items.
// (<a href="#!/api/Ext.container.AbstractContainer-cfg-defaultType" rel="Ext.container.AbstractContainer-cfg-defaultType" class="docClass">defaultType</a> for <a href="#!/api/Ext.toolbar.Toolbar" rel="Ext.toolbar.Toolbar" class="docClass">Toolbar</a> is 'button')
tb.add([{text:'Button 1'}, {text:'Button 2'}]);
</code></pre>

<p>To inject components between existing ones, use the <a href="#!/api/Ext.container.AbstractContainer-method-insert" rel="Ext.container.AbstractContainer-method-insert" class="docClass">insert</a> method.</p>

<h2>Warning:</h2>

<p>Components directly managed by the BorderLayout layout manager may not be removed
or added.  See the Notes for <a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">BorderLayout</a> for
more details.</p> %}
    
    {b Parameters}:
    {ul {- component: [_ Js.t]
    {% <p>Either one or more Components to add or an Array of Components to add.
See <code><a href="#!/api/Ext.container.AbstractContainer-cfg-items" rel="Ext.container.AbstractContainer-cfg-items" class="docClass">items</a></code> for additional information.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The Components that were added.</p> %}
    }
    }
    *)
  method afterLayout : #Ext_layout_container_Container.t Js.t -> unit Js.meth
  (** {% <p>Invoked after the Container has laid out (and rendered if necessary)
its child Components.</p> %}
    
    {b Parameters}:
    {ul {- layout: [#Ext_layout_container_Container.t Js.t]
    }
    }
    *)
  method beforeLayout : unit Js.meth
  (** {% <p>Occurs before componentLayout is run. Returning false from this method
will prevent the containerLayout from being executed.</p> %}
    *)
  method cascade : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Cascades down the component/container heirarchy from this component (passed in
the first call), calling the specified function with each component. The scope
(this reference) of the function call will be the scope provided or the current
component. The arguments to the function will be the args provided or the current
component. If the function returns false at any point, the cascade is stopped on
that branch.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to call</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope of the function (defaults to current component)</p> %}
    }
    {- args: [_ Js.js_array Js.t] (optional)
    {% <p>The args to call the function with. The current component
always passed as the last argument.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_container_Container.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method child : Js.js_string Js.t Js.optdef -> unit Js.meth
  (** {% <p>Retrieves the first direct child of this container which matches the passed selector.
The passed in selector must comply with an <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector.</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>An <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector. If no selector is
specified, the first child will be returned.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [unit]
    {% <p><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a></p> %}
    }
    }
    *)
  method disable_chainable : bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Inherit docs
Disable all immediate children that was previously disabled
Override disable because onDisable only gets called when rendered</p>

<p>Disable the component.</p> %}
    
    {b Parameters}:
    {ul {- silent: [bool Js.t] (optional)
    {% <p>Passing true will supress the 'disable' event from being fired.</p> %}
    
    Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_container_AbstractContainer.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method doLayout : 'self Js.t Js.meth
  (** {% <p>Manually force this container's layout to be recalculated. The framework uses this internally to refresh layouts
form most cases.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_container_Container.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method down : Js.js_string Js.t Js.optdef -> unit Js.meth
  (** {% <p>Retrieves the first descendant of this container which matches the passed selector.
The passed in selector must comply with an <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector.</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>An <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector. If no selector is
specified, the first child will be returned.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [unit]
    {% <p><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a></p> %}
    }
    }
    *)
  method getComponent : _ Js.t -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Examines this container's <a href="#!/api/Ext.container.AbstractContainer-property-items" rel="Ext.container.AbstractContainer-property-items" class="docClass">items</a> <strong>property</strong> and gets a direct child
component of this container.</p> %}
    
    {b Parameters}:
    {ul {- comp: [_ Js.t]
    {% <p>This parameter may be any of the following:</p>

<ul>
<li>a <strong>String</strong> : representing the <a href="#!/api/Ext.Component-cfg-itemId" rel="Ext.Component-cfg-itemId" class="docClass">itemId</a>
or <a href="#!/api/Ext.Component-cfg-id" rel="Ext.Component-cfg-id" class="docClass">id</a> of the child component.</li>
<li>a <strong>Number</strong> : representing the position of the child component
within the <a href="#!/api/Ext.container.AbstractContainer-property-items" rel="Ext.container.AbstractContainer-property-items" class="docClass">items</a> <strong>property</strong></li>
</ul>


<p>For additional information see <a href="#!/api/Ext.util.MixedCollection-method-get" rel="Ext.util.MixedCollection-method-get" class="docClass">Ext.util.MixedCollection.get</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>The component (if found).</p> %}
    }
    }
    *)
  method getLayout : #Ext_layout_container_Container.t Js.t Js.meth
  (** {% <p>Returns the <a href="#!/api/Ext.layout.container.Container" rel="Ext.layout.container.Container" class="docClass">layout</a> instance currently associated with this Container.
If a layout has not been instantiated yet, that is done first</p> %}
    
    {b Returns}:
    {ul {- [#Ext_layout_container_Container.t Js.t]
    {% <p>The layout</p> %}
    }
    }
    *)
  method insert : Js.number Js.t -> #Ext_Component.t Js.t ->
    #Ext_Component.t Js.t Js.meth
  (** {% <p>Inserts a Component into this Container at a specified index. Fires the
<a href="#!/api/Ext.container.AbstractContainer-event-beforeadd" rel="Ext.container.AbstractContainer-event-beforeadd" class="docClass">beforeadd</a> event before inserting, then fires the <a href="#!/api/Ext.container.AbstractContainer-event-add" rel="Ext.container.AbstractContainer-event-add" class="docClass">add</a>
event after the Component has been inserted.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The index at which the Component will be inserted
into the Container's items collection</p> %}
    }
    {- component: [#Ext_Component.t Js.t]
    {% <p>The child Component to insert.</p>

<p>Ext uses lazy rendering, and will only render the inserted Component should
it become necessary.</p>

<p>A Component config object may be passed in order to avoid the overhead of
constructing a real Component object if lazy rendering might mean that the
inserted Component will not be rendered immediately. To take advantage of
this 'lazy instantiation', set the <a href="#!/api/Ext.Component-cfg-xtype" rel="Ext.Component-cfg-xtype" class="docClass">Ext.Component.xtype</a> config
property to the registered type of the Component wanted.</p>

<p>For a list of all available xtypes, see <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>component The Component (or config object) that was
inserted with the Container's default config values applied.</p> %}
    }
    }
    *)
  method isAncestor : #Ext_Component.t Js.t -> unit Js.meth
  (** {% <p>Determines whether <strong>this Container</strong> is an ancestor of the passed Component.
This will return <code>true</code> if the passed Component is anywhere within the subtree
beneath this Container.</p> %}
    
    {b Parameters}:
    {ul {- possibleDescendant: [#Ext_Component.t Js.t]
    {% <p>The Component to test for presence
within this Container's subtree.</p> %}
    }
    }
    *)
  method move : Js.number Js.t -> Js.number Js.t -> #Ext_Component.t Js.t
    Js.meth
  (** {% <p>Moves a Component within the Container</p> %}
    
    {b Parameters}:
    {ul {- fromIdx: [Js.number Js.t]
    {% <p>The index the Component you wish to move is currently at.</p> %}
    }
    {- toIdx: [Js.number Js.t]
    {% <p>The new index for the Component.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>component The Component (or config object) that was moved.</p> %}
    }
    }
    *)
  method onAdd : #Ext_Component.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>This method is invoked after a new Component has been added. It
is passed the Component which has been added. This method may
be used to update any internal structure which may depend upon
the state of the child items.</p> %}
    
    {b Parameters}:
    {ul {- component: [#Ext_Component.t Js.t]
    }
    {- position: [Js.number Js.t]
    }
    }
    *)
  method onBeforeAdd : #Ext_Component.t Js.t -> unit Js.meth
  (** {% <p>This method is invoked before adding a new child Component. It
is passed the new Component, and may be used to modify the
Component, or prepare the Container in some way. Returning
false aborts the add operation.</p> %}
    
    {b Parameters}:
    {ul {- item: [#Ext_Component.t Js.t]
    }
    }
    *)
  method onRemove : #Ext_Component.t Js.t -> bool Js.t -> unit Js.meth
  (** {% <p>This method is invoked after a new Component has been
removed. It is passed the Component which has been
removed. This method may be used to update any internal
structure which may depend upon the state of the child items.</p> %}
    
    {b Parameters}:
    {ul {- component: [#Ext_Component.t Js.t]
    }
    {- autoDestroy: [bool Js.t]
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
  method remove : _ Js.t -> bool Js.t Js.optdef -> #Ext_Component.t Js.t
    Js.meth
  (** {% <p>Removes a component from this container.  Fires the <a href="#!/api/Ext.container.AbstractContainer-event-beforeremove" rel="Ext.container.AbstractContainer-event-beforeremove" class="docClass">beforeremove</a> event
before removing, then fires the <a href="#!/api/Ext.container.AbstractContainer-event-remove" rel="Ext.container.AbstractContainer-event-remove" class="docClass">remove</a> event after the component has
been removed.</p> %}
    
    {b Parameters}:
    {ul {- component: [_ Js.t]
    {% <p>The component reference or id to remove.</p> %}
    }
    {- autoDestroy: [bool Js.t] (optional)
    {% <p>True to automatically invoke the removed Component's
<a href="#!/api/Ext.Component-method-destroy" rel="Ext.Component-method-destroy" class="docClass">Ext.Component.destroy</a> function.</p>

<p>Defaults to the value of this Container's <a href="#!/api/Ext.container.AbstractContainer-cfg-autoDestroy" rel="Ext.container.AbstractContainer-cfg-autoDestroy" class="docClass">autoDestroy</a> config.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>component The Component that was removed.</p> %}
    }
    }
    *)
  method removeAll : bool Js.t Js.optdef -> Ext_Component.t Js.js_array Js.t
    Js.meth
  (** {% <p>Removes all components from this container.</p> %}
    
    {b Parameters}:
    {ul {- autoDestroy: [bool Js.t] (optional)
    {% <p>True to automatically invoke the removed
Component's <a href="#!/api/Ext.Component-method-destroy" rel="Ext.Component-method-destroy" class="docClass">Ext.Component.destroy</a> function.
Defaults to the value of this Container's <a href="#!/api/Ext.container.AbstractContainer-cfg-autoDestroy" rel="Ext.container.AbstractContainer-cfg-autoDestroy" class="docClass">autoDestroy</a> config.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Component.t Js.js_array Js.t]
    {% <p>Array of the removed components</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  
  method afterLayout : ('self Js.t, #Ext_layout_container_Container.t Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.afterLayout] *)
  method beforeLayout : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeLayout] *)
  method onAdd : ('self Js.t, #Ext_Component.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onAdd] *)
  method onBeforeAdd : ('self Js.t, #Ext_Component.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onBeforeAdd] *)
  method onRemove : ('self Js.t, #Ext_Component.t Js.t -> bool Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onRemove] *)
  method activeItem : _ Js.t Js.prop
  (** {% <p>A string component id or the numeric index of the component that should be
initially activated within the container's layout on render.  For example,
activeItem: 'item-1' or activeItem: 0 (index 0 = the first item in the
container's collection).  activeItem only applies to layout styles that can
display items one at a time (like <a href="#!/api/Ext.layout.container.Card" rel="Ext.layout.container.Card" class="docClass">Ext.layout.container.Card</a> and
<a href="#!/api/Ext.layout.container.Fit" rel="Ext.layout.container.Fit" class="docClass">Ext.layout.container.Fit</a>).</p> %}
    *)
  method autoDestroy : bool Js.t Js.prop
  (** {% <p>If true the container will automatically destroy any contained component that is removed
from it, else destruction must be handled manually.</p> %}
    
    Defaults to: [true]
    *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this components's element. This will also be prepended to elements within this
component like Panel's body will get a class x-panel-body. This means that if you create a subclass of Panel, and
you want it to get all the Panels styling for the element and the body, you leave the baseCls x-panel and use
componentCls to add specific styling for this component.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'container']
    *)
  method bubbleEvents : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>An array of events that, when fired, should be bubbled to any parent container.
See <a href="#!/api/Ext.util.Observable-method-enableBubble" rel="Ext.util.Observable-method-enableBubble" class="docClass">Ext.util.Observable.enableBubble</a>.</p> %}
    
    Defaults to: [['add', 'remove']]
    *)
  method defaultType : Js.js_string Js.t Js.prop
  (** {% <p>The default <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">xtype</a> of child Components to create in this Container when
a child item is specified as a raw configuration object, rather than as an instantiated Component.</p> %}
    
    Defaults to: ["panel"]
    *)
  method defaults : _ Js.t Js.prop
  (** {% <p>This option is a means of applying default settings to all added items whether added
through the <a href="#!/api/Ext.container.AbstractContainer-cfg-items" rel="Ext.container.AbstractContainer-cfg-items" class="docClass">items</a> config or via the <a href="#!/api/Ext.container.AbstractContainer-method-add" rel="Ext.container.AbstractContainer-method-add" class="docClass">add</a> or <a href="#!/api/Ext.container.AbstractContainer-method-insert" rel="Ext.container.AbstractContainer-method-insert" class="docClass">insert</a> methods.</p>

<p>Defaults are applied to both config objects and instantiated components conditionally
so as not to override existing properties in the item (see <a href="#!/api/Ext-method-applyIf" rel="Ext-method-applyIf" class="docClass">Ext.applyIf</a>).</p>

<p>If the defaults option is specified as a function, then the function will be called
using this Container as the scope (<code>this</code> reference) and passing the added item as
the first parameter. Any resulting object from that call is then applied to the item
as default properties.</p>

<p>For example, to automatically apply padding to the body of each of a set of
contained <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a> items, you could pass:
<code>defaults: {bodyStyle:'padding:15px'}</code>.</p>

<p>Usage:</p>

<pre><code>defaults: { // defaults are applied to items, not the container
    autoScroll: true
},
items: [
    // default will not be applied here, panel1 will be autoScroll: false
    {
        xtype: 'panel',
        id: 'panel1',
        autoScroll: false
    },
    // this component will have autoScroll: true
    new <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>({
        id: 'panel2'
    })
]
</code></pre> %}
    *)
  method detachOnRemove : bool Js.t Js.prop
  (** {% <p>True to move any component to the <a href="#!/api/Ext-method-getDetachedBody" rel="Ext-method-getDetachedBody" class="docClass">detachedBody</a> when the component is
removed from this container. This option is only applicable when the component is not destroyed while
being removed, see <a href="#!/api/Ext.container.AbstractContainer-cfg-autoDestroy" rel="Ext.container.AbstractContainer-cfg-autoDestroy" class="docClass">autoDestroy</a> and <a href="#!/api/Ext.container.AbstractContainer-method-remove" rel="Ext.container.AbstractContainer-method-remove" class="docClass">remove</a>. If this option is set to false, the DOM
of the component will remain in the current place until it is explicitly moved.</p> %}
    
    Defaults to: [true]
    *)
  method items : _ Js.t Js.prop
  (** {% <p>A single item, or an array of child Components to be added to this container</p>

<p><strong>Unless configured with a <a href="#!/api/Ext.container.AbstractContainer-cfg-layout" rel="Ext.container.AbstractContainer-cfg-layout" class="docClass">layout</a>, a Container simply renders child
Components serially into its encapsulating element and performs no sizing or
positioning upon them.</strong></p>

<p>Example:</p>

<pre><code>// specifying a single item
items: {...},
layout: 'fit',    // The single items is sized to fit

// specifying multiple items
items: [{...}, {...}],
layout: 'hbox', // The items are arranged horizontally
</code></pre>

<p>Each item may be:</p>

<ul>
<li>A <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a></li>
<li>A Component configuration object</li>
</ul>


<p>If a configuration object is specified, the actual type of Component to be
instantiated my be indicated by using the <a href="#!/api/Ext.Component-cfg-xtype" rel="Ext.Component-cfg-xtype" class="docClass">xtype</a> option.</p>

<p>Every Component class has its own <a href="#!/api/Ext.Component-cfg-xtype" rel="Ext.Component-cfg-xtype" class="docClass">xtype</a>.</p>

<p>If an <a href="#!/api/Ext.Component-cfg-xtype" rel="Ext.Component-cfg-xtype" class="docClass">xtype</a> is not explicitly specified, the
<a href="#!/api/Ext.container.AbstractContainer-cfg-defaultType" rel="Ext.container.AbstractContainer-cfg-defaultType" class="docClass">defaultType</a> for the Container is used, which by default is usually <code>panel</code>.</p>

<h1>Notes:</h1>

<p>Ext uses lazy rendering. Child Components will only be rendered
should it become necessary. Items are automatically laid out when they are first
shown (no sizing is done while hidden), or in response to a <a href="#!/api/Ext.container.AbstractContainer-method-doLayout" rel="Ext.container.AbstractContainer-method-doLayout" class="docClass">doLayout</a> call.</p>

<p>Do not specify <a href="#!/api/Ext.panel.Panel-cfg-contentEl" rel="Ext.panel.Panel-cfg-contentEl" class="docClass">contentEl</a> or
<a href="#!/api/Ext.panel.Panel-cfg-html" rel="Ext.panel.Panel-cfg-html" class="docClass">html</a> with <code>items</code>.</p> %}
    *)
  method layout : _ Js.t Js.prop
  (** {% <p><strong>Important</strong>: In order for child items to be correctly sized and
positioned, typically a layout manager <strong>must</strong> be specified through
the <code>layout</code> configuration option.</p>

<p>The sizing and positioning of child <a href="#!/api/Ext.container.AbstractContainer-cfg-items" rel="Ext.container.AbstractContainer-cfg-items" class="docClass">items</a> is the responsibility of
the Container's layout manager which creates and manages the type of layout
you have in mind.  For example:</p>

<p>If the <a href="#!/api/Ext.container.AbstractContainer-cfg-layout" rel="Ext.container.AbstractContainer-cfg-layout" class="docClass">layout</a> configuration is not explicitly specified for
a general purpose container (e.g. Container or Panel) the
<a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used
which does nothing but render child components sequentially into the
Container (no sizing or positioning will be performed in this situation).</p>

<p><strong>layout</strong> may be specified as either as an Object or as a String:</p>

<h1>Specify as an Object</h1>

<p>Example usage:</p>

<pre><code>layout: {
    type: 'vbox',
    align: 'left'
}
</code></pre>

<ul>
<li><p><strong>type</strong></p>

<p>The layout type to be used for this container.  If not specified,
a default <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Ext.layout.container.Auto</a> will be created and used.</p>

<p>Valid layout <code>type</code> values are:</p>

<ul>
<li><a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Auto</a> - <strong>Default</strong></li>
<li><a href="#!/api/Ext.layout.container.Card" rel="Ext.layout.container.Card" class="docClass">card</a></li>
<li><a href="#!/api/Ext.layout.container.Fit" rel="Ext.layout.container.Fit" class="docClass">fit</a></li>
<li><a href="#!/api/Ext.layout.container.HBox" rel="Ext.layout.container.HBox" class="docClass">hbox</a></li>
<li><a href="#!/api/Ext.layout.container.VBox" rel="Ext.layout.container.VBox" class="docClass">vbox</a></li>
<li><a href="#!/api/Ext.layout.container.Anchor" rel="Ext.layout.container.Anchor" class="docClass">anchor</a></li>
<li><a href="#!/api/Ext.layout.container.Table" rel="Ext.layout.container.Table" class="docClass">table</a></li>
</ul>
</li>
<li><p>Layout specific configuration properties</p>

<p>Additional layout specific configuration properties may also be
specified. For complete details regarding the valid config options for
each layout type, see the layout class corresponding to the <code>type</code>
specified.</p></li>
</ul>


<h1>Specify as a String</h1>

<p>Example usage:</p>

<pre><code>layout: 'vbox'
</code></pre>

<ul>
<li><p><strong>layout</strong></p>

<p>The layout <code>type</code> to be used for this container (see list
of valid layout type values above).</p>

<p>Additional layout specific configuration properties. For complete
details regarding the valid config options for each layout type, see the
layout class corresponding to the <code>layout</code> specified.</p></li>
</ul>


<h1>Configuring the default layout type</h1>

<pre><code>If a certain Container class has a default layout (For example a <a href="#!/api/Ext.toolbar.Toolbar" rel="Ext.toolbar.Toolbar" class="docClass">Toolbar</a>
with a default `Box` layout), then to simply configure the default layout,
use an object, but without the `type` property:


xtype: 'toolbar',
layout: {
    pack: 'center'
}
</code></pre> %}
    *)
  method renderTpl : _ Js.t Js.prop
  (** {% <p>End Definitions</p>

<p>An <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a> used to create the internal structure inside this Component's encapsulating
<a href="#!/api/Ext.container.AbstractContainer-method-getEl" rel="Ext.container.AbstractContainer-method-getEl" class="docClass">Element</a>.</p>

<p>You do not normally need to specify this. For the base classes <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> and
<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>, this defaults to <strong><code>null</code></strong> which means that they will be initially rendered
with no internal structure; they render their <a href="#!/api/Ext.container.AbstractContainer-method-getEl" rel="Ext.container.AbstractContainer-method-getEl" class="docClass">Element</a> empty. The more specialized ExtJS and Touch
classes which use a more complex DOM structure, provide their own template definitions.</p>

<p>This is intended to allow the developer to create application-specific utility Components with customized
internal structure.</p>

<p>Upon rendering, any created child elements may be automatically imported into object properties using the
<a href="#!/api/Ext.container.AbstractContainer-cfg-renderSelectors" rel="Ext.container.AbstractContainer-cfg-renderSelectors" class="docClass">renderSelectors</a> and <a href="#!/api/Ext.container.AbstractContainer-cfg-childEls" rel="Ext.container.AbstractContainer-cfg-childEls" class="docClass">childEls</a> options.</p> %}
    
    Defaults to: ['{%this.renderContainer(out,values)%}']
    *)
  method suspendLayout : bool Js.t Js.prop
  (** {% <p>If true, suspend calls to doLayout. Useful when batching multiple adds to a container
and not passing them as multiple arguments or an array.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  
  method add : (t Js.t -> #Ext_Component.t Js.t -> Js.number Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after any <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> is added or inserted into the container.</p>

<p><strong>This event bubbles:</strong> 'add' will also be fired when Component is added to any of
the child containers or their childern or ...</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_container_Container.t Js.t]
    }
    {- component: [#Ext_Component.t Js.t]
    {% <p>The component that was added</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The index at which the component was added to the container's items collection</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method afterlayout : (t Js.t -> #Ext_layout_container_Container.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the components in this container are arranged by the associated layout manager.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_container_Container.t Js.t]
    }
    {- layout: [#Ext_layout_container_Container.t Js.t]
    {% <p>The ContainerLayout implementation for this container</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeadd : (t Js.t -> #Ext_Component.t Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before any <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> is added or inserted into the container.
A handler can return false to cancel the add.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_container_Container.t Js.t]
    }
    {- component: [#Ext_Component.t Js.t]
    {% <p>The component being added</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The index at which the component will be added to the container's items collection</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeremove : (t Js.t -> #Ext_Component.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires before any <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> is removed from the container.  A handler can return
false to cancel the remove.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_container_Container.t Js.t]
    }
    {- component: [#Ext_Component.t Js.t]
    {% <p>The component being removed</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method remove : (t Js.t -> #Ext_Component.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires after any <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> is removed from the container.</p>

<p><strong>This event bubbles:</strong> 'remove' will also be fired when Component is removed from any of
the child containers or their children or ...</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_container_Container.t Js.t]
    }
    {- component: [#Ext_Component.t Js.t]
    {% <p>The component that was removed</p> %}
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
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

