(** A specialized container representing the viewable ...
  
  {% <p>A specialized container representing the viewable application area (the browser viewport).</p>

<p>The Viewport renders itself to the document body, and automatically sizes itself to the size of
the browser viewport and manages window resizing. There may only be one Viewport created
in a page.</p>

<p>Like any <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a>, a Viewport will only perform sizing and positioning
on its child Components if you configure it with a <a href="#!/api/Ext.container.Viewport-cfg-layout" rel="Ext.container.Viewport-cfg-layout" class="docClass">layout</a>.</p>

<p>A Common layout used with Viewports is <a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>, but if the
required layout is simpler, a different layout should be chosen.</p>

<p>For example, to simply make a single child item occupy all available space, use
<a href="#!/api/Ext.layout.container.Fit" rel="Ext.layout.container.Fit" class="docClass">fit layout</a>.</p>

<p>To display one "active" item at full size from a choice of several child items, use
<a href="#!/api/Ext.layout.container.Card" rel="Ext.layout.container.Card" class="docClass">card layout</a>.</p>

<p>Inner layouts are available because all <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Panel</a>s
added to the Viewport, either through its <a href="#!/api/Ext.container.Viewport-cfg-items" rel="Ext.container.Viewport-cfg-items" class="docClass">items</a>, or the <a href="#!/api/Ext.container.Viewport-method-add" rel="Ext.container.Viewport-method-add" class="docClass">add</a>
method of any of its child Panels may themselves have a layout.</p>

<p>The Viewport does not provide scrolling, so child Panels within the Viewport should provide
for scrolling if needed using the <a href="#!/api/Ext.container.Viewport-cfg-autoScroll" rel="Ext.container.Viewport-cfg-autoScroll" class="docClass">autoScroll</a> config.</p>

<p>An example showing a classic application border layout:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.container.Viewport" rel="Ext.container.Viewport" class="docClass">Ext.container.Viewport</a>', \{
    layout: 'border',
    items: [\{
        region: 'north',
        html: '&lt;h1 class="x-panel-header"&gt;Page Title&lt;/h1&gt;',
        border: false,
        margins: '0 0 5 0'
    \}, \{
        region: 'west',
        collapsible: true,
        title: 'Navigation',
        width: 150
        // could use a TreePanel or AccordionLayout for navigational items
    \}, \{
        region: 'south',
        title: 'South Panel',
        collapsible: true,
        html: 'Information goes here',
        split: true,
        height: 100,
        minHeight: 100
    \}, \{
        region: 'east',
        title: 'East Panel',
        collapsible: true,
        split: true,
        width: 150
    \}, \{
        region: 'center',
        xtype: 'tabpanel', // TabPanel itself has no title
        activeTab: 0,      // First tab active by default
        items: \{
            title: 'Default Tab',
            html: 'The first tab\'s content. Others may be added dynamically'
        \}
    \}]
\});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_container_Container.t
  
  method isViewport : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Viewport, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method beforeDestroy : unit Js.meth
  (** {% <p>Invoked before the Component is destroyed.</p> %}
    *)
  method initComponent : unit Js.meth
  (** {% <p>The initComponent template method is an important initialization step for a Component. It is intended to be
implemented by each subclass of <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> to provide any needed constructor logic. The
initComponent method of the class being created is called first, with each initComponent method
up the hierarchy to <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> being called thereafter. This makes it easy to implement and,
if needed, override the constructor logic of the Component at any step in the hierarchy.</p>

<p>The initComponent method <strong>must</strong> contain a call to <a href="#!/api/Ext.Base-method-callParent" rel="Ext.Base-method-callParent" class="docClass">callParent</a> in order
to ensure that the parent class' initComponent method is also called.</p>

<p>All config options passed to the constructor are applied to <code>this</code> before initComponent is called,
so you can simply access them with <code>this.someOption</code>.</p>

<p>The following example demonstrates using a dynamic string for the text of a button at the time of
instantiation of the class.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('DynamicButtonText', \{
    extend: '<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>',

    initComponent: function() \{
        this.text = new Date();
        this.renderTo = <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>();
        this.callParent();
    \}
\});

<a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function() \{
    <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('DynamicButtonText');
\});
</code></pre> %}
    *)
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Template method called when this Component's DOM structure is created.</p>

<p>At this point, this Component's (and all descendants') DOM structure <em>exists</em> but it has not
been layed out (positioned and sized).</p>

<p>Subclasses which override this to gain access to the structure at render time should
call the parent class's method before attempting to access any child elements of the Component.</p> %}
    
    {b Parameters}:
    {ul {- parentNode: [Ext_dom_Element.t Js.t]
    {% <p>The parent Element in which this Component's encapsulating element is contained.</p> %}
    }
    {- containerIdx: [Js.number Js.t]
    {% <p>The index within the parent Container's child collection of this Component.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_container_Container.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDestroy] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onRender] *)
  
end

class type events =
object
  inherit Ext_container_Container.events
  
  
end

class type statics =
object
  inherit Ext_container_Container.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

