(** ToolTip is a Ext.tip.Tip implementation that handl ...
  
  {% <p>ToolTip is a <a href="#!/api/Ext.tip.Tip" rel="Ext.tip.Tip" class="docClass">Ext.tip.Tip</a> implementation that handles the common case of displaying a
tooltip when hovering over a certain element or elements on the page. It allows fine-grained
control over the tooltip's alignment relative to the target element or mouse, and the timing
of when it is automatically shown and hidden.</p>

<p>This implementation does <strong>not</strong> have a built-in method of automatically populating the tooltip's
text based on the target element; you must either configure a fixed <a href="#!/api/Ext.tip.ToolTip-cfg-html" rel="Ext.tip.ToolTip-cfg-html" class="docClass">html</a> value for each
ToolTip instance, or implement custom logic (e.g. in a <a href="#!/api/Ext.tip.ToolTip-event-beforeshow" rel="Ext.tip.ToolTip-event-beforeshow" class="docClass">beforeshow</a> event listener) to
generate the appropriate tooltip content on the fly. See <a href="#!/api/Ext.tip.QuickTip" rel="Ext.tip.QuickTip" class="docClass">Ext.tip.QuickTip</a> for a more
convenient way of automatically populating and configuring a tooltip based on specific DOM
attributes of each target element.</p>

<h1>Basic Example</h1>

<pre><code>var tip = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">Ext.tip.ToolTip</a>', {
    target: 'clearButton',
    html: 'Press this button to clear the form'
});
</code></pre>

<p><p><img src="images/Ext.tip.ToolTip/Ext.tip.ToolTip1.png" alt="Basic Ext.tip.ToolTip"></p></p>

<h1>Delegation</h1>

<p>In addition to attaching a ToolTip to a single element, you can also use delegation to attach
one ToolTip to many elements under a common parent. This is more efficient than creating many
ToolTip instances. To do this, point the <a href="#!/api/Ext.tip.ToolTip-cfg-target" rel="Ext.tip.ToolTip-cfg-target" class="docClass">target</a> config to a common ancestor of all the
elements, and then set the <a href="#!/api/Ext.tip.ToolTip-cfg-delegate" rel="Ext.tip.ToolTip-cfg-delegate" class="docClass">delegate</a> config to a CSS selector that will select all the
appropriate sub-elements.</p>

<p>When using delegation, it is likely that you will want to programmatically change the content
of the ToolTip based on each delegate element; you can do this by implementing a custom
listener for the <a href="#!/api/Ext.tip.ToolTip-event-beforeshow" rel="Ext.tip.ToolTip-event-beforeshow" class="docClass">beforeshow</a> event. Example:</p>

<pre><code>var store = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.ArrayStore" rel="Ext.data.ArrayStore" class="docClass">Ext.data.ArrayStore</a>', {
    fields: ['company', 'price', 'change'],
    data: [
        ['3m Co',                               71.72, 0.02],
        ['Alcoa Inc',                           29.01, 0.42],
        ['Altria Group Inc',                    83.81, 0.28],
        ['American Express Company',            52.55, 0.01],
        ['American International Group, Inc.',  64.13, 0.31],
        ['AT&amp;T Inc.',                           31.61, -0.48]
    ]
});

var grid = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', {
    title: 'Array Grid',
    store: store,
    columns: [
        {text: 'Company', flex: 1, dataIndex: 'company'},
        {text: 'Price', width: 75, dataIndex: 'price'},
        {text: 'Change', width: 75, dataIndex: 'change'}
    ],
    height: 200,
    width: 400,
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
});

grid.getView().on('render', function(view) {
    view.tip = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">Ext.tip.ToolTip</a>', {
        // The overall target element.
        target: view.el,
        // Each grid row causes its own separate show and hide.
        delegate: view.itemSelector,
        // Moving within the row should not hide the tip.
        trackMouse: true,
        // Render immediately so that tip.body can be referenced prior to the first show.
        renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
        listeners: {
            // Change content dynamically depending on which element triggered the show.
            beforeshow: function updateTipBody(tip) {
                tip.update('Over company "' + view.getRecord(tip.triggerElement).get('company') + '"');
            }
        }
    });
});
</code></pre>

<p><p><img src="images/Ext.tip.ToolTip/Ext.tip.ToolTip2.png" alt="Ext.tip.ToolTip with delegation"></p></p>

<h1>Alignment</h1>

<p>The following configuration properties allow control over how the ToolTip is aligned relative to
the target element and/or mouse pointer:</p>

<ul>
<li><a href="#!/api/Ext.tip.ToolTip-cfg-anchor" rel="Ext.tip.ToolTip-cfg-anchor" class="docClass">anchor</a></li>
<li><a href="#!/api/Ext.tip.ToolTip-cfg-anchorToTarget" rel="Ext.tip.ToolTip-cfg-anchorToTarget" class="docClass">anchorToTarget</a></li>
<li><a href="#!/api/Ext.tip.ToolTip-cfg-anchorOffset" rel="Ext.tip.ToolTip-cfg-anchorOffset" class="docClass">anchorOffset</a></li>
<li><a href="#!/api/Ext.tip.ToolTip-cfg-trackMouse" rel="Ext.tip.ToolTip-cfg-trackMouse" class="docClass">trackMouse</a></li>
<li><a href="#!/api/Ext.tip.ToolTip-cfg-mouseOffset" rel="Ext.tip.ToolTip-cfg-mouseOffset" class="docClass">mouseOffset</a></li>
</ul>


<h1>Showing/Hiding</h1>

<p>The following configuration properties allow control over how and when the ToolTip is automatically
shown and hidden:</p>

<ul>
<li><a href="#!/api/Ext.tip.ToolTip-cfg-autoHide" rel="Ext.tip.ToolTip-cfg-autoHide" class="docClass">autoHide</a></li>
<li><a href="#!/api/Ext.tip.ToolTip-cfg-showDelay" rel="Ext.tip.ToolTip-cfg-showDelay" class="docClass">showDelay</a></li>
<li><a href="#!/api/Ext.tip.ToolTip-cfg-hideDelay" rel="Ext.tip.ToolTip-cfg-hideDelay" class="docClass">hideDelay</a></li>
<li><a href="#!/api/Ext.tip.ToolTip-cfg-dismissDelay" rel="Ext.tip.ToolTip-cfg-dismissDelay" class="docClass">dismissDelay</a></li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  inherit Ext_tip_Tip.t
  
  method triggerElement : Dom_html.element Js.t Js.prop
  (** {% <p>When a ToolTip is configured with the <code><a href="#!/api/Ext.tip.ToolTip-cfg-delegate" rel="Ext.tip.ToolTip-cfg-delegate" class="docClass">delegate</a></code>
option to cause selected child elements of the <code><a href="#!/api/Ext.tip.ToolTip-cfg-target" rel="Ext.tip.ToolTip-cfg-target" class="docClass">target</a></code>
Element to each trigger a separate show event, this property is set to
the DOM element which triggered the show.</p> %}
    *)
  method beforeDestroy : unit Js.meth
  (** {% <p>Invoked before the Component is destroyed.</p> %}
    *)
  method hide_tooltip : unit Js.meth
  (** {% <p>Hides this tooltip if visible.</p> %}
    *)
  method initComponent : unit Js.meth
  (** {% <p>private</p>

<p>The initComponent template method is an important initialization step for a Component. It is intended to be
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

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('DynamicButtonText', {
    extend: '<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>',

    initComponent: function() {
        this.text = new Date();
        this.renderTo = <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>();
        this.callParent();
    }
});

<a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function() {
    <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('DynamicButtonText');
});
</code></pre> %}
    *)
  method onDestroy : unit Js.meth
  (** {% <p>private</p>

<p>Allows addition of behavior to the destroy operation.
After calling the superclass’s onDestroy, the Component will be destroyed.</p> %}
    *)
  method onDisable : unit Js.meth
  (** {% <p>private</p>

<p>Allows addition of behavior to the disable operation.
After calling the superclass’s onDisable, the Component will be disabled.</p> %}
    *)
  method onHide : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>private</p>

<p>Possibly animates down to a target element.</p>

<p>Allows addition of behavior to the hide operation. After
calling the superclass’s onHide, the Component will be hidden.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.tip.ToolTip-event-hide" rel="Ext.tip.ToolTip-event-hide" class="docClass">hide</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>private</p>

<p>Template method called when this Component's DOM structure is created.</p>

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
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>private</p>

<p>Allows addition of behavior to the show operation. After
calling the superclass's onShow, the Component will be visible.</p>

<p>Override in subclasses where more complex behaviour is needed.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.tip.ToolTip-method-show" rel="Ext.tip.ToolTip-method-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method setTarget : _ Js.t -> unit Js.meth
  (** {% <p>Binds this ToolTip to the specified element. The tooltip will be displayed when the mouse moves over the element.</p> %}
    
    {b Parameters}:
    {ul {- t: [_ Js.t]
    {% <p>The Element, HtmlElement, or ID of an element to bind to</p> %}
    }
    }
    *)
  method show_tooltip : unit Js.meth
  (** {% <p>Shows this tooltip at the current event target XY position.</p> %}
    *)
  method showAt_arr : Js.number Js.t Js.js_array Js.t -> unit Js.meth
  (** {% <p>inherit docs</p>

<p>Shows this tip at the specified XY position.  Example usage:</p>

<pre><code>// Show the tip at x:50 and y:100
tip.showAt([50,100]);
</code></pre> %}
    
    {b Parameters}:
    {ul {- xy: [Js.number Js.t Js.js_array Js.t]
    {% <p>An array containing the x and y coordinates</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  inherit Ext_container_Container.configs
  inherit Ext_panel_AbstractPanel.configs
  inherit Ext_panel_Panel.configs
  inherit Ext_tip_Tip.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDestroy] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDestroy] *)
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDisable] *)
  method onHide : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onHide] *)
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onRender] *)
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onShow] *)
  method anchor : Js.js_string Js.t Js.prop
  (** {% <p>If specified, indicates that the tip should be anchored to a
particular side of the target element or mouse pointer ("top", "right", "bottom",
or "left"), with an arrow pointing back at the target or mouse pointer. If
<a href="#!/api/Ext.tip.ToolTip-cfg-constrainPosition" rel="Ext.tip.ToolTip-cfg-constrainPosition" class="docClass">constrainPosition</a> is enabled, this will be used as a preferred value
only and may be flipped as needed.</p> %}
    *)
  method anchorOffset : Js.number Js.t Js.prop
  (** {% <p>A numeric pixel value used to offset the default position of the anchor arrow.  When the anchor
position is on the top or bottom of the tooltip, <code>anchorOffset</code> will be used as a horizontal offset.
Likewise, when the anchor position is on the left or right side, <code>anchorOffset</code> will be used as
a vertical offset.</p> %}
    
    Defaults to: [0]
    *)
  method anchorToTarget : bool Js.t Js.prop
  (** {% <p>True to anchor the tooltip to the target element, false to anchor it relative to the mouse coordinates.
When <code>anchorToTarget</code> is true, use <code><a href="#!/api/Ext.tip.ToolTip-cfg-defaultAlign" rel="Ext.tip.ToolTip-cfg-defaultAlign" class="docClass">defaultAlign</a></code> to control tooltip alignment to the
target element.  When <code>anchorToTarget</code> is false, use <code><a href="#!/api/Ext.tip.ToolTip-cfg-anchor" rel="Ext.tip.ToolTip-cfg-anchor" class="docClass">anchor</a></code> instead to control alignment.</p> %}
    
    Defaults to: [true]
    *)
  method autoHide : bool Js.t Js.prop
  (** {% <p>True to automatically hide the tooltip after the
mouse exits the target element or after the <code><a href="#!/api/Ext.tip.ToolTip-cfg-dismissDelay" rel="Ext.tip.ToolTip-cfg-dismissDelay" class="docClass">dismissDelay</a></code>
has expired if set.  If <code><a href="#!/api/Ext.tip.ToolTip-cfg-closable" rel="Ext.tip.ToolTip-cfg-closable" class="docClass">closable</a> = true</code>
a close tool button will be rendered into the tooltip header.</p> %}
    
    Defaults to: [true]
    *)
  method delegate : Js.js_string Js.t Js.prop
  (** {% <p>A <a href="#!/api/Ext.dom.Query" rel="Ext.dom.Query" class="docClass">DomQuery</a> selector which allows selection of individual elements within the
<code><a href="#!/api/Ext.tip.ToolTip-cfg-target" rel="Ext.tip.ToolTip-cfg-target" class="docClass">target</a></code> element to trigger showing and hiding the ToolTip as the mouse moves within the
target.</p>

<p>When specified, the child element of the target which caused a show event is placed into the
<code><a href="#!/api/Ext.tip.ToolTip-property-triggerElement" rel="Ext.tip.ToolTip-property-triggerElement" class="docClass">triggerElement</a></code> property before the ToolTip is shown.</p>

<p>This may be useful when a Component has regular, repeating elements in it, each of which need a
ToolTip which contains information specific to that element.</p>

<p>See the delegate example in class documentation of <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">Ext.tip.ToolTip</a>.</p> %}
    *)
  method dismissDelay : Js.number Js.t Js.prop
  (** {% <p>Delay in milliseconds before the tooltip automatically hides. To disable automatic hiding, set
dismissDelay = 0.</p> %}
    
    Defaults to: [5000]
    *)
  method hideDelay : Js.number Js.t Js.prop
  (** {% <p>Delay in milliseconds after the mouse exits the target element but before the tooltip actually hides.
Set to 0 for the tooltip to hide immediately.</p> %}
    
    Defaults to: [200]
    *)
  method mouseOffset : Js.number Js.t Js.js_array Js.t Js.prop
  (** {% <p>An XY offset from the mouse position where the tooltip should be shown.</p> %}
    
    Defaults to: [[15,18]]
    *)
  method showDelay : Js.number Js.t Js.prop
  (** {% <p>Delay in milliseconds before the tooltip displays after the mouse enters the target element.</p> %}
    
    Defaults to: [500]
    *)
  method target : _ Js.t Js.prop
  (** {% <p>The target element or string id to monitor for mouseover events to trigger
showing this ToolTip.</p> %}
    *)
  method trackMouse : bool Js.t Js.prop
  (** {% <p>True to have the tooltip follow the mouse as it moves over the target element.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  inherit Ext_container_Container.events
  inherit Ext_panel_AbstractPanel.events
  inherit Ext_panel_Panel.events
  inherit Ext_tip_Tip.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_panel_AbstractPanel.statics
  inherit Ext_panel_Panel.statics
  inherit Ext_tip_Tip.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

