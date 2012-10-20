(** Panel is a container that has specific functionali ...
  
  {% <p>Panel is a container that has specific functionality and structural components that make it the perfect building
block for application-oriented user interfaces.</p>

<p>Panels are, by virtue of their inheritance from <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>, capable of being configured with a
<a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a>, and containing child Components.</p>

<p>When either specifying child <a href="#!/api/Ext.panel.Panel-cfg-items" rel="Ext.panel.Panel-cfg-items" class="docClass">items</a> of a Panel, or dynamically <a href="#!/api/Ext.container.Container-method-add" rel="Ext.container.Container-method-add" class="docClass">adding</a>
Components to a Panel, remember to consider how you wish the Panel to arrange those child elements, and whether those
child elements need to be sized using one of Ext's built-in <code><a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a></code>
schemes. By default, Panels use the <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Auto</a> scheme. This simply renders child
components, appending them one after the other inside the Container, and <strong>does not apply any sizing</strong> at all.</p>

<p><p><img src="images/Ext.panel.Panel/panel.png" alt="Panel components"></p></p>

<p>A Panel may also contain <a href="#!/api/Ext.panel.Panel-cfg-bbar" rel="Ext.panel.Panel-cfg-bbar" class="docClass">bottom</a> and <a href="#!/api/Ext.panel.Panel-cfg-tbar" rel="Ext.panel.Panel-cfg-tbar" class="docClass">top</a> toolbars, along with separate <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">header</a>, <a href="#!/api/Ext.panel.Panel-cfg-fbar" rel="Ext.panel.Panel-cfg-fbar" class="docClass">footer</a> and body sections.</p>

<p>Panel also provides built-in <a href="#!/api/Ext.panel.Panel-cfg-collapsible" rel="Ext.panel.Panel-cfg-collapsible" class="docClass">collapsible, expandable</a> and <a href="#!/api/Ext.panel.Panel-cfg-closable" rel="Ext.panel.Panel-cfg-closable" class="docClass">closable</a> behavior. Panels can
be easily dropped into any <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a> or layout, and the layout and rendering pipeline
is <a href="#!/api/Ext.container.Container-method-add" rel="Ext.container.Container-method-add" class="docClass">completely managed by the framework</a>.</p>

<p><strong>Note:</strong> By default, the <code><a href="#!/api/Ext.panel.Panel-cfg-closable" rel="Ext.panel.Panel-cfg-closable" class="docClass">close</a></code> header tool <em>destroys</em> the Panel resulting in removal of the
Panel and the destruction of any descendant Components. This makes the Panel object, and all its descendants
<strong>unusable</strong>. To enable the close tool to simply <em>hide</em> a Panel for later re-use, configure the Panel with
<code><a href="#!/api/Ext.panel.Panel-cfg-closeAction" rel="Ext.panel.Panel-cfg-closeAction" class="docClass">closeAction</a>: 'hide'</code>.</p>

<p>Usually, Panels are used as constituents within an application, in which case, they would be used as child items of
Containers, and would themselves use Ext.Components as child <a href="#!/api/Ext.panel.Panel-cfg-items" rel="Ext.panel.Panel-cfg-items" class="docClass">items</a>. However to illustrate simply rendering a
Panel into the document, here's how to do it:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>', {
    title: 'Hello',
    width: 200,
    html: '&lt;p&gt;World!&lt;/p&gt;',
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
});
</code></pre>

<p>A more realistic scenario is a Panel created to house input fields which will not be rendered, but used as a
constituent part of a Container:</p>

<pre class='inline-example '><code>var filterPanel = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>', {
    bodyPadding: 5,  // Don't want content to crunch against the borders
    width: 300,
    title: 'Filters',
    items: [{
        xtype: 'datefield',
        fieldLabel: 'Start date'
    }, {
        xtype: 'datefield',
        fieldLabel: 'End date'
    }],
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
});
</code></pre>

<p>Note that the Panel above is configured to render into the document and assigned a size. In a real world scenario,
the Panel will often be added inside a Container which will use a <a href="#!/api/Ext.panel.Panel-cfg-layout" rel="Ext.panel.Panel-cfg-layout" class="docClass">layout</a> to render, size and position its
child Components.</p>

<p>Panels will often use specific <a href="#!/api/Ext.panel.Panel-cfg-layout" rel="Ext.panel.Panel-cfg-layout" class="docClass">layout</a>s to provide an application with shape and structure by containing and
arranging child Components:</p>

<pre class='inline-example '><code>var resultsPanel = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>', {
    title: 'Results',
    width: 600,
    height: 400,
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    layout: {
        type: 'vbox',       // Arrange child items vertically
        align: 'stretch',    // Each takes up full width
        padding: 5
    },
    items: [{               // Results grid specified as a config object with an xtype of 'grid'
        xtype: 'grid',
        columns: [{header: 'Column One'}],            // One header just for show. There's no data,
        store: <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.ArrayStore" rel="Ext.data.ArrayStore" class="docClass">Ext.data.ArrayStore</a>', {}), // A dummy empty data store
        flex: 1                                       // Use 1/3 of Container's height (hint to Box layout)
    }, {
        xtype: 'splitter'   // A splitter between the two child items
    }, {                    // Details Panel specified as a config object (no xtype defaults to 'panel').
        title: 'Details',
        bodyPadding: 5,
        items: [{
            fieldLabel: 'Data item',
            xtype: 'textfield'
        }], // An array of form fields
        flex: 2             // Use 2/3 of Container's height (hint to Box layout)
    }]
});
</code></pre>

<p>The example illustrates one possible method of displaying search results. The Panel contains a grid with the
resulting data arranged in rows. Each selected row may be displayed in detail in the Panel below. The <a href="#!/api/Ext.layout.container.VBox" rel="Ext.layout.container.VBox" class="docClass">vbox</a> layout is used to arrange the two vertically. It is configured to stretch child items
horizontally to full width. Child items may either be configured with a numeric height, or with a <code>flex</code> value to
distribute available space proportionately.</p>

<p>This Panel itself may be a child item of, for exaple, a <a href="#!/api/Ext.tab.Panel" rel="Ext.tab.Panel" class="docClass">Ext.tab.Panel</a> which will size its child items to fit
within its content area.</p>

<p>Using these techniques, as long as the <strong>layout</strong> is chosen and configured correctly, an application may have any
level of nested containment, all dynamically sized according to configuration, the user's preference and available
browser size.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  
  method dd : Ext_dd_DragSource.t Js.t Js.prop
  (** {% <p>If this Panel is configured <a href="#!/api/Ext.panel.Panel-cfg-draggable" rel="Ext.panel.Panel-cfg-draggable" class="docClass">draggable</a>, this property will contain an instance of <a href="#!/api/Ext.dd.DragSource" rel="Ext.dd.DragSource" class="docClass">Ext.dd.DragSource</a> which handles dragging the Panel.</p>

<p>The developer must provide implementations of the abstract methods of <a href="#!/api/Ext.dd.DragSource" rel="Ext.dd.DragSource" class="docClass">Ext.dd.DragSource</a> in order to
supply behaviour for each stage of the drag/drop process. See <a href="#!/api/Ext.panel.Panel-cfg-draggable" rel="Ext.panel.Panel-cfg-draggable" class="docClass">draggable</a>.</p> %}
    *)
  method afterCollapse : bool Js.t -> unit Js.meth
  (** {% <p>Invoked after the Panel is Collapsed.</p> %}
    
    {b Parameters}:
    {ul {- animated: [bool Js.t]
    }
    }
    *)
  method afterExpand : bool Js.t -> unit Js.meth
  (** {% <p>Invoked after the Panel is Expanded.</p> %}
    
    {b Parameters}:
    {ul {- animated: [bool Js.t]
    }
    }
    *)
  method beforeDestroy : unit Js.meth
  (** {% <p>Invoked before the Component is destroyed.</p> %}
    *)
  method close : unit Js.meth
  (** {% <p>Closes the Panel. By default, this method, removes it from the DOM, <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">destroy</a>s the
Panel object and all its descendant Components. The <a href="#!/api/Ext.panel.Panel-event-beforeclose" rel="Ext.panel.Panel-event-beforeclose" class="docClass">beforeclose</a> event is fired before the
close happens and will cancel the close action if it returns false.</p>

<p><strong>Note:</strong> This method is also affected by the <a href="#!/api/Ext.panel.Panel-cfg-closeAction" rel="Ext.panel.Panel-cfg-closeAction" class="docClass">closeAction</a> setting. For more explicit control use
<a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">destroy</a> and <a href="#!/api/Ext.panel.Panel-method-hide" rel="Ext.panel.Panel-method-hide" class="docClass">hide</a> methods.</p> %}
    *)
  method collapse : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Collapses the panel body so that the body becomes hidden. Docked Components parallel to the border towards which
the collapse takes place will remain visible. Fires the <a href="#!/api/Ext.panel.Panel-event-beforecollapse" rel="Ext.panel.Panel-event-beforecollapse" class="docClass">beforecollapse</a> event which will cancel the
collapse action if it returns false.</p> %}
    
    {b Parameters}:
    {ul {- direction: [Js.js_string Js.t] (optional)
    {% <p>The direction to collapse towards. Must be one of</p>

<ul>
<li><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.DIRECTION_TOP</li>
<li><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.DIRECTION_RIGHT</li>
<li><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.DIRECTION_BOTTOM</li>
<li><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.DIRECTION_LEFT</li>
</ul>


<p>Defaults to <a href="#!/api/Ext.panel.Panel-cfg-collapseDirection" rel="Ext.panel.Panel-cfg-collapseDirection" class="docClass">collapseDirection</a>.</p> %}
    }
    {- animate: [bool Js.t] (optional)
    {% <p>True to animate the transition, else false (defaults to the value of the
<a href="#!/api/Ext.panel.Panel-cfg-animCollapse" rel="Ext.panel.Panel-cfg-animCollapse" class="docClass">animCollapse</a> panel config)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_panel_Panel.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method expand : bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Expands the panel body so that it becomes visible.  Fires the <a href="#!/api/Ext.panel.Panel-event-beforeexpand" rel="Ext.panel.Panel-event-beforeexpand" class="docClass">beforeexpand</a> event which will
cancel the expand action if it returns false.</p> %}
    
    {b Parameters}:
    {ul {- animate: [bool Js.t] (optional)
    {% <p>True to animate the transition, else false (defaults to the value of the
<a href="#!/api/Ext.panel.Panel-cfg-animCollapse" rel="Ext.panel.Panel-cfg-animCollapse" class="docClass">animCollapse</a> panel config)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_panel_Panel.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method getCollapsed : _ Js.t Js.meth
  (** {% <p>Returns the current collapsed state of the panel.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>False when not collapsed, otherwise the value of <a href="#!/api/Ext.panel.Panel-cfg-collapseDirection" rel="Ext.panel.Panel-cfg-collapseDirection" class="docClass">collapseDirection</a>.</p> %}
    }
    }
    *)
  method getHeader : unit Js.meth
  (** {% <p>Gets the <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">Header</a> for this panel.</p> %}
    *)
  method getState : _ Js.t Js.meth
  (** {% <p>The supplied default state gathering method for the AbstractComponent class.</p>

<p>This method returns dimension settings such as <code>flex</code>, <code>anchor</code>, <code>width</code> and <code>height</code> along with <code>collapsed</code>
state.</p>

<p>Subclasses which implement more complex state should call the superclass's implementation, and apply their state
to the result if this basic state is to be saved.</p>

<p>Note that Component state will only be saved if the Component has a <a href="#!/api/Ext.panel.Panel-cfg-stateId" rel="Ext.panel.Panel-cfg-stateId" class="docClass">stateId</a> and there as a StateProvider
configured for the document.</p> %}
    *)
  method isLayoutRoot : unit Js.meth
  (** {% <p>Determines whether this Component is the root of a layout. This returns <code>true</code> if
this component can run its layout without assistance from or impact on its owner.
If this component cannot run its layout given these restrictions, <code>false</code> is returned
and its owner will be considered as the next candidate for the layout root.</p>

<p>Setting the <a href="#!/api/Ext.panel.Panel-property-_isLayoutRoot" rel="Ext.panel.Panel-property-_isLayoutRoot" class="docClass">_isLayoutRoot</a> property to <code>true</code> causes this method to always
return <code>true</code>. This may be useful when updating a layout of a Container which shrink
wraps content, and you know that it will not change size, and so can safely be the
topmost participant in the layout run.</p> %}
    *)
  method isVisible : bool Js.t Js.optdef -> bool Js.t Js.meth
  (** {% <p>inherit docs</p>

<p>Returns true if this component is visible.</p> %}
    
    {b Parameters}:
    {ul {- deep: [bool Js.t] (optional)
    {% <p>Pass <code>true</code> to interrogate the visibility status of all parent Containers to
determine whether this Component is truly visible to the user.</p>

<p>Generally, to determine whether a Component is hidden, the no argument form is needed. For example when creating
dynamically laid out UIs in a hidden Container before showing them.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this component is visible, false otherwise.</p> %}
    }
    }
    *)
  method onHide : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>inherit docs</p>

<p>Possibly animates down to a target element.</p>

<p>Allows addition of behavior to the hide operation. After
calling the superclass’s onHide, the Component will be hidden.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.panel.Panel-event-hide" rel="Ext.panel.Panel-event-hide" class="docClass">hide</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method onRemoved : bool Js.t -> unit Js.meth
  (** {% <p>Method to manage awareness of when components are removed from their
respective Container, firing a <a href="#!/api/Ext.panel.Panel-event-removed" rel="Ext.panel.Panel-event-removed" class="docClass">removed</a> event. References are properly
cleaned up after removing a component from its owning container.</p>

<p>Allows addition of behavior when a Component is removed from
its parent Container. At this stage, the Component has been
removed from its parent Container's collection of child items,
but has not been destroyed (It will be destroyed if the parent
Container's autoDestroy is true, or if the remove call was
passed a truthy second parameter). After calling the
superclass's onRemoved, the ownerCt and the refOwner will not
be present.</p> %}
    
    {b Parameters}:
    {ul {- destroying: [bool Js.t]
    {% <p>Will be passed as true if the Container performing the remove operation will delete this
Component upon remove.</p> %}
    }
    }
    *)
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>inherit docs</p>

<p>Allows addition of behavior to the show operation. After
calling the superclass's onShow, the Component will be visible.</p>

<p>Override in subclasses where more complex behaviour is needed.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.panel.Panel-event-show" rel="Ext.panel.Panel-event-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method setBorder : _ Js.t -> unit Js.meth
  (** {% <p>inherit docs</p> %}
    
    {b Parameters}:
    {ul {- border: [_ Js.t]
    {% <p>The border, see <a href="#!/api/Ext.panel.Panel-cfg-border" rel="Ext.panel.Panel-cfg-border" class="docClass">border</a>. If a falsey value is passed
the border will be removed.</p> %}
    }
    }
    *)
  method setIcon : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Set the icon for the panel's header. See <a href="#!/api/Ext.panel.Header-cfg-icon" rel="Ext.panel.Header-cfg-icon" class="docClass">Ext.panel.Header.icon</a>. It will fire the
<a href="#!/api/Ext.panel.Panel-event-iconchange" rel="Ext.panel.Panel-event-iconchange" class="docClass">iconchange</a> event after completion.</p> %}
    
    {b Parameters}:
    {ul {- newIcon: [Js.js_string Js.t] {% <p>The new icon path</p> %}
    }
    }
    *)
  method setIconCls : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Set the iconCls for the panel's header. See <a href="#!/api/Ext.panel.Header-cfg-iconCls" rel="Ext.panel.Header-cfg-iconCls" class="docClass">Ext.panel.Header.iconCls</a>. It will fire the
<a href="#!/api/Ext.panel.Panel-event-iconclschange" rel="Ext.panel.Panel-event-iconclschange" class="docClass">iconclschange</a> event after completion.</p> %}
    
    {b Parameters}:
    {ul {- newIconCls: [Js.js_string Js.t]
    {% <p>The new CSS class name</p> %}
    }
    }
    *)
  method setTitle : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Set a title for the panel's header. See <a href="#!/api/Ext.panel.Header-cfg-title" rel="Ext.panel.Header-cfg-title" class="docClass">Ext.panel.Header.title</a>.</p> %}
    
    {b Parameters}:
    {ul {- newTitle: [Js.js_string Js.t]
    }
    }
    *)
  method setUI : Js.js_string Js.t -> unit Js.meth
  (** {% <p>inherit docs</p>

<p>Sets the UI for the component. This will remove any existing UIs on the component. It will also loop through any
uiCls set on the component and rename them so they include the new UI</p> %}
    
    {b Parameters}:
    {ul {- ui: [Js.js_string Js.t]
    {% <p>The new UI for the component</p> %}
    }
    }
    *)
  method toggleCollapse : 'self Js.t Js.meth
  (** {% <p>Shortcut for performing an <a href="#!/api/Ext.panel.Panel-method-expand" rel="Ext.panel.Panel-method-expand" class="docClass">expand</a> or <a href="#!/api/Ext.panel.Panel-method-collapse" rel="Ext.panel.Panel-method-collapse" class="docClass">collapse</a> based on the current state of the panel.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_panel_Panel.t Js.t] {% <p>this</p> %}
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
  
  method afterCollapse : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterCollapse] *)
  method afterExpand : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterExpand] *)
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDestroy] *)
  method onHide : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onHide] *)
  method onRemoved : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onRemoved] *)
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onShow] *)
  method animCollapse : bool Js.t Js.prop
  (** {% <p><code>true</code> to animate the transition when the panel is collapsed, <code>false</code> to skip the animation (defaults to <code>true</code>
if the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> class is available, otherwise <code>false</code>). May also be specified as the animation
duration in milliseconds.</p> %}
    *)
  method bbar : _ Js.t Js.prop
  (** {% <p>Convenience config. Short for 'Bottom Bar'.</p>

<pre><code>bbar: [
  { xtype: 'button', text: 'Button 1' }
]
</code></pre>

<p>is equivalent to</p>

<pre><code>dockedItems: [{
    xtype: 'toolbar',
    dock: 'bottom',
    items: [
        { xtype: 'button', text: 'Button 1' }
    ]
}]
</code></pre> %}
    *)
  method buttonAlign : Js.js_string Js.t Js.prop
  (** {% <p>The alignment of any buttons added to this panel. Valid values are 'right', 'left' and 'center' (defaults to
'right' for buttons/fbar, 'left' for other toolbar types).</p>

<p><strong>NOTE:</strong> The prefered way to specify toolbars is to use the dockedItems config. Instead of buttonAlign you
would add the layout: { pack: 'start' | 'center' | 'end' } option to the dockedItem config.</p> %}
    *)
  method buttons : _ Js.t Js.prop
  (** {% <p>Convenience config used for adding buttons docked to the bottom of the panel. This is a
synonym for the <a href="#!/api/Ext.panel.Panel-cfg-fbar" rel="Ext.panel.Panel-cfg-fbar" class="docClass">fbar</a> config.</p>

<pre><code>buttons: [
  { text: 'Button 1' }
]
</code></pre>

<p>is equivalent to</p>

<pre><code>dockedItems: [{
    xtype: 'toolbar',
    dock: 'bottom',
    ui: 'footer',
    defaults: {minWidth: <a href="#!/api/Ext.panel.Panel-cfg-minButtonWidth" rel="Ext.panel.Panel-cfg-minButtonWidth" class="docClass">minButtonWidth</a>},
    items: [
        { xtype: 'component', flex: 1 },
        { xtype: 'button', text: 'Button 1' }
    ]
}]
</code></pre>

<p>The <a href="#!/api/Ext.panel.Panel-cfg-minButtonWidth" rel="Ext.panel.Panel-cfg-minButtonWidth" class="docClass">minButtonWidth</a> is used as the default <a href="#!/api/Ext.button.Button-cfg-minWidth" rel="Ext.button.Button-cfg-minWidth" class="docClass">minWidth</a> for
each of the buttons in the buttons toolbar.</p> %}
    *)
  method closable : bool Js.t Js.prop
  (** {% <p>True to display the 'close' tool button and allow the user to close the window, false to hide the button and
disallow closing the window.</p>

<p>By default, when close is requested by clicking the close button in the header, the <a href="#!/api/Ext.panel.Panel-method-close" rel="Ext.panel.Panel-method-close" class="docClass">close</a> method will be
called. This will <em><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">destroy</a></em> the Panel and its content meaning that it may not be
reused.</p>

<p>To make closing a Panel <em>hide</em> the Panel so that it may be reused, set <a href="#!/api/Ext.panel.Panel-cfg-closeAction" rel="Ext.panel.Panel-cfg-closeAction" class="docClass">closeAction</a> to 'hide'.</p> %}
    
    Defaults to: [false]
    *)
  method closeAction : Js.js_string Js.t Js.prop
  (** {% <p>The action to take when the close header tool is clicked:</p>

<ul>
<li><p><strong><code>'<a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">destroy</a>'</code></strong> :</p>

<p><a href="#!/api/Ext.panel.Panel-method-remove" rel="Ext.panel.Panel-method-remove" class="docClass">remove</a> the window from the DOM and <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">destroy</a> it and all descendant
Components. The window will <strong>not</strong> be available to be redisplayed via the <a href="#!/api/Ext.panel.Panel-method-show" rel="Ext.panel.Panel-method-show" class="docClass">show</a> method.</p></li>
<li><p><strong><code>'<a href="#!/api/Ext.panel.Panel-method-hide" rel="Ext.panel.Panel-method-hide" class="docClass">hide</a>'</code></strong> :</p>

<p><a href="#!/api/Ext.panel.Panel-method-hide" rel="Ext.panel.Panel-method-hide" class="docClass">hide</a> the window by setting visibility to hidden and applying negative offsets. The window will be
available to be redisplayed via the <a href="#!/api/Ext.panel.Panel-method-show" rel="Ext.panel.Panel-method-show" class="docClass">show</a> method.</p></li>
</ul>


<p><strong>Note:</strong> This behavior has changed! setting <em>does</em> affect the <a href="#!/api/Ext.panel.Panel-method-close" rel="Ext.panel.Panel-method-close" class="docClass">close</a> method which will invoke the
approriate closeAction.</p> %}
    
    Defaults to: ['destroy']
    *)
  method collapseDirection : Js.js_string Js.t Js.prop
  (** {% <p>The direction to collapse the Panel when the toggle button is clicked.</p>

<p>Defaults to the <a href="#!/api/Ext.panel.Panel-cfg-headerPosition" rel="Ext.panel.Panel-cfg-headerPosition" class="docClass">headerPosition</a></p>

<p><strong>Important: This config is <em>ignored</em> for <a href="#!/api/Ext.panel.Panel-cfg-collapsible" rel="Ext.panel.Panel-cfg-collapsible" class="docClass">collapsible</a> Panels which are direct child items of a <a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>.</strong></p>

<p>Specify as <code>'top'</code>, <code>'bottom'</code>, <code>'left'</code> or <code>'right'</code>.</p> %}
    *)
  method collapseFirst : bool Js.t Js.prop
  (** {% <p><code>true</code> to make sure the collapse/expand toggle button always renders first (to the left of) any other tools in
the panel's title bar, <code>false</code> to render it last.</p> %}
    
    Defaults to: [true]
    *)
  method collapseMode : Js.js_string Js.t Js.prop
  (** {% <p><strong>Important: this config is only effective for <a href="#!/api/Ext.panel.Panel-cfg-collapsible" rel="Ext.panel.Panel-cfg-collapsible" class="docClass">collapsible</a> Panels which are direct child items of a
<a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>.</strong></p>

<p>When <em>not</em> a direct child item of a <a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>, then the Panel's header
remains visible, and the body is collapsed to zero dimensions. If the Panel has no header, then a new header
(orientated correctly depending on the <a href="#!/api/Ext.panel.Panel-cfg-collapseDirection" rel="Ext.panel.Panel-cfg-collapseDirection" class="docClass">collapseDirection</a>) will be inserted to show a the title and a re-
expand tool.</p>

<p>When a child item of a <a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>, this config has three possible values:</p>

<ul>
<li><p><code>undefined</code> - When collapsed, a placeholder <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">Header</a> is injected into the layout to
represent the Panel and to provide a UI with a Tool to allow the user to re-expand the Panel.</p></li>
<li><p><code>"header"</code> - The Panel collapses to leave its header visible as when not inside a
<a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>.</p></li>
<li><p><code>"mini"</code> - The Panel collapses without a visible header.</p></li>
</ul> %}
    *)
  method collapsed : bool Js.t Js.prop
  (** {% <p><code>true</code> to render the panel collapsed, <code>false</code> to render it expanded.</p> %}
    
    Defaults to: [false]
    *)
  method collapsedCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class to add to the panel's element after it has been collapsed.</p> %}
    
    Defaults to: ['collapsed']
    *)
  method collapsible : bool Js.t Js.prop
  (** {% <p>True to make the panel collapsible and have an expand/collapse toggle Tool added into the header tool button
area. False to keep the panel sized either statically, or by an owning layout manager, with no toggle Tool.</p>

<p>See <a href="#!/api/Ext.panel.Panel-cfg-collapseMode" rel="Ext.panel.Panel-cfg-collapseMode" class="docClass">collapseMode</a> and <a href="#!/api/Ext.panel.Panel-cfg-collapseDirection" rel="Ext.panel.Panel-cfg-collapseDirection" class="docClass">collapseDirection</a></p> %}
    
    Defaults to: [false]
    *)
  method dockedItems : _ Js.t Js.prop
  (** {% <p>A component or series of components to be added as docked items to this panel. The docked items can be docked to
either the top, right, left or bottom of a panel. This is typically used for things like toolbars or tab bars:</p>

<pre><code>var panel = new <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>({
    dockedItems: [{
        xtype: 'toolbar',
        dock: 'top',
        items: [{
            text: 'Docked to the top'
        }]
    }]
});
</code></pre> %}
    *)
  method fbar : _ Js.t Js.prop
  (** {% <p>Convenience config used for adding items to the bottom of the panel. Short for Footer Bar.</p>

<pre><code>fbar: [
  { type: 'button', text: 'Button 1' }
]
</code></pre>

<p>is equivalent to</p>

<pre><code>dockedItems: [{
    xtype: 'toolbar',
    dock: 'bottom',
    ui: 'footer',
    defaults: {minWidth: <a href="#!/api/Ext.panel.Panel-cfg-minButtonWidth" rel="Ext.panel.Panel-cfg-minButtonWidth" class="docClass">minButtonWidth</a>},
    items: [
        { xtype: 'component', flex: 1 },
        { xtype: 'button', text: 'Button 1' }
    ]
}]
</code></pre>

<p>The <a href="#!/api/Ext.panel.Panel-cfg-minButtonWidth" rel="Ext.panel.Panel-cfg-minButtonWidth" class="docClass">minButtonWidth</a> is used as the default <a href="#!/api/Ext.button.Button-cfg-minWidth" rel="Ext.button.Button-cfg-minWidth" class="docClass">minWidth</a> for
each of the buttons in the fbar.</p> %}
    *)
  method floatable : bool Js.t Js.prop
  (** {% <p><strong>Important: This config is only effective for <a href="#!/api/Ext.panel.Panel-cfg-collapsible" rel="Ext.panel.Panel-cfg-collapsible" class="docClass">collapsible</a> Panels which are direct child items of a
<a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>.</strong></p>

<p>true to allow clicking a collapsed Panel's <a href="#!/api/Ext.panel.Panel-cfg-placeholder" rel="Ext.panel.Panel-cfg-placeholder" class="docClass">placeholder</a> to display the Panel floated above the layout,
false to force the user to fully expand a collapsed region by clicking the expand button to see it again.</p> %}
    
    Defaults to: [true]
    *)
  method frame : bool Js.t Js.prop
  (** {% <p>True to apply a frame to the panel.</p> %}
    
    Defaults to: [false]
    *)
  method frameHeader : bool Js.t Js.prop
  (** {% <p>True to apply a frame to the panel panels header (if 'frame' is true).</p> %}
    
    Defaults to: [true]
    *)
  method header : _ Js.t Js.prop
  (** {% <p>Pass as <code>false</code> to prevent a Header from being created and shown.</p>

<p>Pass as a config object (optionally containing an <code>xtype</code>) to custom-configure this Panel's header.</p> %}
    *)
  method headerPosition : Js.js_string Js.t Js.prop
  (** {% <p>Specify as <code>'top'</code>, <code>'bottom'</code>, <code>'left'</code> or <code>'right'</code>.</p> %}
    
    Defaults to: ['top']
    *)
  method hideCollapseTool : bool Js.t Js.prop
  (** {% <p><code>true</code> to hide the expand/collapse toggle button when <code><a href="#!/api/Ext.panel.Panel-cfg-collapsible" rel="Ext.panel.Panel-cfg-collapsible" class="docClass">collapsible</a> == true</code>, <code>false</code> to display it.</p> %}
    
    Defaults to: [false]
    *)
  method icon : Js.js_string Js.t Js.prop
  (** {% <p>Path to image for an icon in the header. Used for displaying an icon to the left of a title.</p> %}
    *)
  method iconCls : Js.js_string Js.t Js.prop
  (** {% <p>CSS class for an icon in the header. Used for displaying an icon to the left of a title.</p> %}
    *)
  method lbar : _ Js.t Js.prop
  (** {% <p>Convenience config. Short for 'Left Bar' (left-docked, vertical toolbar).</p>

<pre><code>lbar: [
  { xtype: 'button', text: 'Button 1' }
]
</code></pre>

<p>is equivalent to</p>

<pre><code>dockedItems: [{
    xtype: 'toolbar',
    dock: 'left',
    items: [
        { xtype: 'button', text: 'Button 1' }
    ]
}]
</code></pre> %}
    *)
  method manageHeight : bool Js.t Js.prop
  (** {% <p>: When true, the dock component layout writes
height information to the panel's DOM elements based on its shrink wrap height
calculation. This ensures that the browser respects the calculated height.
When false, the dock component layout will not write heights on the panel or its
body element. In some simple layout cases, not writing the heights to the DOM may
be desired because this allows the browser to respond to direct DOM manipulations
(like animations).</p> %}
    
    Defaults to: [true]
    *)
  method minButtonWidth : Js.number Js.t Js.prop
  (** {% <p>Minimum width of all footer toolbar buttons in pixels. If set, this will be used as the default
value for the <a href="#!/api/Ext.button.Button-cfg-minWidth" rel="Ext.button.Button-cfg-minWidth" class="docClass">Ext.button.Button.minWidth</a> config of each Button added to the <strong>footer toolbar</strong> via the
<a href="#!/api/Ext.panel.Panel-cfg-fbar" rel="Ext.panel.Panel-cfg-fbar" class="docClass">fbar</a> or <a href="#!/api/Ext.panel.Panel-cfg-buttons" rel="Ext.panel.Panel-cfg-buttons" class="docClass">buttons</a> configurations. It will be ignored for buttons that have a minWidth configured
some other way, e.g. in their own config object or via the <a href="#!/api/Ext.container.Container-cfg-defaults" rel="Ext.container.Container-cfg-defaults" class="docClass">defaults</a> of
their parent container.</p> %}
    
    Defaults to: [75]
    *)
  method overlapHeader : bool Js.t Js.prop
  (** {% <p>True to overlap the header in a panel over the framing of the panel itself. This is needed when frame:true (and
is done automatically for you). Otherwise it is undefined. If you manually add rounded corners to a panel header
which does not have frame:true, this will need to be set to true.</p> %}
    *)
  method placeholder : _ Js.t Js.prop
  (** {% <p><strong>Important: This config is only effective for <a href="#!/api/Ext.panel.Panel-cfg-collapsible" rel="Ext.panel.Panel-cfg-collapsible" class="docClass">collapsible</a> Panels which are direct child items of a
<a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a> when not using the <code>'header'</code> <a href="#!/api/Ext.panel.Panel-cfg-collapseMode" rel="Ext.panel.Panel-cfg-collapseMode" class="docClass">collapseMode</a>.</strong></p>

<p><strong>Optional.</strong> A Component (or config object for a Component) to show in place of this Panel when this Panel is
collapsed by a <a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>. Defaults to a generated <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">Header</a> containing a <a href="#!/api/Ext.panel.Tool" rel="Ext.panel.Tool" class="docClass">Tool</a> to re-expand the Panel.</p> %}
    *)
  method placeholderCollapseHideMode : Js.number Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.dom.Element-method-setVisibilityMode" rel="Ext.dom.Element-method-setVisibilityMode" class="docClass">mode</a> for hiding collapsed panels when
using <a href="#!/api/Ext.panel.Panel-cfg-collapseMode" rel="Ext.panel.Panel-cfg-collapseMode" class="docClass">collapseMode</a> "placeholder".</p> %}
    *)
  method rbar : _ Js.t Js.prop
  (** {% <p>Convenience config. Short for 'Right Bar' (right-docked, vertical toolbar).</p>

<pre><code>rbar: [
  { xtype: 'button', text: 'Button 1' }
]
</code></pre>

<p>is equivalent to</p>

<pre><code>dockedItems: [{
    xtype: 'toolbar',
    dock: 'right',
    items: [
        { xtype: 'button', text: 'Button 1' }
    ]
}]
</code></pre> %}
    *)
  method tbar : _ Js.t Js.prop
  (** {% <p>Convenience config. Short for 'Top Bar'.</p>

<pre><code>tbar: [
  { xtype: 'button', text: 'Button 1' }
]
</code></pre>

<p>is equivalent to</p>

<pre><code>dockedItems: [{
    xtype: 'toolbar',
    dock: 'top',
    items: [
        { xtype: 'button', text: 'Button 1' }
    ]
}]
</code></pre> %}
    *)
  method title : Js.js_string Js.t Js.prop
  (** {% <p>The title text to be used to display in the <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">panel header</a>. When a
<code>title</code> is specified the <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">Ext.panel.Header</a> will automatically be created and displayed unless
<a href="#!/api/Ext.panel.Panel-cfg-header" rel="Ext.panel.Panel-cfg-header" class="docClass">header</a> is set to <code>false</code>.</p> %}
    
    Defaults to: ['']
    *)
  method titleAlign : Js.js_string Js.t Js.prop
  (** {% <p>May be <code>"left"</code>, <code>"right"</code> or <code>"center"</code>.</p>

<p>The alignment of the title text within the available space between the icon and the tools.</p> %}
    
    Defaults to: ['left']
    *)
  method titleCollapse : bool Js.t Js.prop
  (** {% <p><code>true</code> to allow expanding and collapsing the panel (when <code><a href="#!/api/Ext.panel.Panel-cfg-collapsible" rel="Ext.panel.Panel-cfg-collapsible" class="docClass">collapsible</a> = true</code>) by clicking anywhere in
the header bar, <code>false</code>) to allow it only by clicking to tool button).</p> %}
    
    Defaults to: [false]
    *)
  method tools : _ Js.t Js.prop
  (** {% <p>An array of <a href="#!/api/Ext.panel.Tool" rel="Ext.panel.Tool" class="docClass">Ext.panel.Tool</a> configs/instances to be added to the header tool area. The tools are stored as
child components of the header container. They can be accessed using <a href="#!/api/Ext.panel.Panel-method-down" rel="Ext.panel.Panel-method-down" class="docClass">down</a> and {<a href="#!/api/Ext.panel.Panel-method-query" rel="Ext.panel.Panel-method-query" class="docClass">query</a>}, as well as the
other component methods. The toggle tool is automatically created if <a href="#!/api/Ext.panel.Panel-cfg-collapsible" rel="Ext.panel.Panel-cfg-collapsible" class="docClass">collapsible</a> is set to true.</p>

<p>Note that, apart from the toggle tool which is provided when a panel is collapsible, these tools only provide the
visual button. Any required functionality must be provided by adding handlers that implement the necessary
behavior.</p>

<p>Example usage:</p>

<pre><code>tools:[{
    type:'refresh',
    tooltip: 'Refresh form Data',
    // hidden:true,
    handler: function(event, toolEl, panel){
        // refresh logic
    }
},
{
    type:'help',
    tooltip: 'Get Help',
    handler: function(event, toolEl, panel){
        // show help here
    }
}]
</code></pre> %}
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
  
  method beforeclose : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before the user closes the panel. Return false from any listener to stop the close event being
fired</p> %}
    
    {b Parameters}:
    {ul {- panel: [#Ext_panel_Panel.t Js.t]
    {% <p>The Panel object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecollapse : (t Js.t -> Js.js_string Js.t -> bool Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before this panel is collapsed. Return false to prevent the collapse.</p> %}
    
    {b Parameters}:
    {ul {- p: [#Ext_panel_Panel.t Js.t]
    {% <p>The Panel being collapsed.</p> %}
    }
    {- direction: [Js.js_string Js.t]
    {% <p>. The direction of the collapse. One of</p>

<ul>
<li><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.DIRECTION_TOP</li>
<li><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.DIRECTION_RIGHT</li>
<li><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.DIRECTION_BOTTOM</li>
<li><a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.DIRECTION_LEFT</li>
</ul> %}
    }
    {- animate: [bool Js.t]
    {% <p>True if the collapse is animated, else false.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeexpand : (t Js.t -> bool Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before this panel is expanded. Return false to prevent the expand.</p> %}
    
    {b Parameters}:
    {ul {- p: [#Ext_panel_Panel.t Js.t]
    {% <p>The Panel being expanded.</p> %}
    }
    {- animate: [bool Js.t]
    {% <p>True if the expand is animated, else false.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method close : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the user closes the panel.</p> %}
    
    {b Parameters}:
    {ul {- panel: [#Ext_panel_Panel.t Js.t]
    {% <p>The Panel object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method collapse : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after this Panel hass collapsed.</p> %}
    
    {b Parameters}:
    {ul {- p: [#Ext_panel_Panel.t Js.t]
    {% <p>The Panel that has been collapsed.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method expand : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after this Panel has expanded.</p> %}
    
    {b Parameters}:
    {ul {- p: [#Ext_panel_Panel.t Js.t]
    {% <p>The Panel that has been expanded.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method iconchange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the Panel icon has been set or changed.</p> %}
    
    {b Parameters}:
    {ul {- p: [#Ext_panel_Panel.t Js.t]
    {% <p>The Panel which has the icon changed.</p> %}
    }
    {- newIcon: [Js.js_string Js.t]
    {% <p>The path to the new icon image.</p> %}
    }
    {- oldIcon: [Js.js_string Js.t]
    {% <p>The path to the previous panel icon image.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method iconclschange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the Panel iconCls has been set or changed.</p> %}
    
    {b Parameters}:
    {ul {- p: [#Ext_panel_Panel.t Js.t]
    {% <p>The Panel which has the iconCls changed.</p> %}
    }
    {- newIconCls: [Js.js_string Js.t]
    {% <p>The new iconCls.</p> %}
    }
    {- oldIconCls: [Js.js_string Js.t]
    {% <p>The previous panel iconCls.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method titlechange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the Panel title has been set or changed.</p> %}
    
    {b Parameters}:
    {ul {- p: [#Ext_panel_Panel.t Js.t]
    {% <p>the Panel which has been resized.</p> %}
    }
    {- newTitle: [Js.js_string Js.t]
    {% <p>The new title.</p> %}
    }
    {- oldTitle: [Js.js_string Js.t]
    {% <p>The previous panel title.</p> %}
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
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_panel_AbstractPanel.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

