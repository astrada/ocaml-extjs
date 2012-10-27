(** An abstract base class which provides shared metho ...
  
  {% <p>An abstract base class which provides shared methods for Components across the Sencha product line.</p>

<p>Please refer to sub class's documentation</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_state_Stateful.t
  inherit Ext_util_Animate.t
  inherit Ext_util_ElementContainer.t
  inherit Ext_util_Observable.t
  inherit Ext_util_Renderable.t
  
  method _isLayoutRoot : bool Js.t Js.prop
  (** {% <p>Setting this property to <code>true</code> causes the <a href="#!/api/Ext.AbstractComponent-method-isLayoutRoot" rel="Ext.AbstractComponent-method-isLayoutRoot" class="docClass">isLayoutRoot</a> method to return
<code>true</code> and stop the search for the top-most component for a layout.</p> %}
    
    Defaults to: [false]
    *)
  method draggable : bool Js.t Js.readonly_prop
  (** {% <p>Indicates whether or not the component can be dragged.</p> %}
    
    Defaults to: [false]
    *)
  method frameSize : _ Js.t Js.readonly_prop
  (** {% <p>Indicates the width of any framing elements which were added within the encapsulating element
to provide graphical, rounded borders. See the <a href="#!/api/Ext.AbstractComponent-cfg-frame" rel="Ext.AbstractComponent-cfg-frame" class="docClass">frame</a> config.</p>

<p>This is an object containing the frame width in pixels for all four sides of the Component containing the
following properties:</p> %}
    
    Defaults to: [{left: 0, top: 0, right: 0, bottom: 0, width: 0, height: 0}]
    *)
  method isComponent : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Component, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method maskOnDisable : bool Js.t Js.prop
  (** {% <p>This is an internal flag that you use when creating custom components. By default this is set to true which means
that every component gets a mask when it's disabled. Components like FieldContainer, FieldSet, Field, Button, Tab
override this property to false since they want to implement custom disable logic.</p> %}
    
    Defaults to: [true]
    *)
  method ownerCt : _ Js.t Js.readonly_prop
  (** {% <p>This Component's owner <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a> (is set automatically
when this Component is added to a Container).</p>

<p><strong>Note</strong>: to access items within the Container see <a href="#!/api/Ext.AbstractComponent-cfg-itemId" rel="Ext.AbstractComponent-cfg-itemId" class="docClass">itemId</a>.</p> %}
    *)
  method rendered : bool Js.t Js.readonly_prop
  (** {% <p>Indicates whether or not the component has been rendered.</p> %}
    
    Defaults to: [false]
    *)
  method addCls : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Adds a CSS class to the top level element representing this component.</p> %}
    
    {b Parameters}:
    {ul {- cls: [_ Js.t]
    {% <p>The CSS class name to add</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>Returns the Component to allow method chaining.</p> %}
    }
    }
    *)
  method addClsWithUI : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Adds a cls to the uiCls array, which will also call <a href="#!/api/Ext.AbstractComponent-method-addUIClsToElement" rel="Ext.AbstractComponent-method-addUIClsToElement" class="docClass">addUIClsToElement</a> and adds to all elements of this
component.</p> %}
    
    {b Parameters}:
    {ul {- classes: [_ Js.t]
    {% <p>A string or an array of strings to add to the uiCls</p> %}
    }
    {- skip: [_ Js.t]
    {% <p>(Boolean) skip True to skip adding it to the class and do it later (via the return)</p> %}
    }
    }
    *)
  method addListener : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef
    -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Appends an event handler to this object.  For example:</p>

<pre><code>myGridPanel.on("mouseover", this.onMouseOver, this);
</code></pre>

<p>The method also allows for a single argument to be passed which is a config object
containing properties which specify multiple events. For example:</p>

<pre><code>myGridPanel.on({
    cellClick: this.onCellClick,
    mouseover: this.onMouseOver,
    mouseout: this.onMouseOut,
    scope: this // Important. Ensure "this" is correct during handler execution
});
</code></pre>

<p>One can also specify options for each event handler separately:</p>

<pre><code>myGridPanel.on({
    cellClick: {fn: this.onCellClick, scope: this, single: true},
    mouseover: {fn: panel.onMouseOver, scope: panel}
});
</code></pre>

<p><em>Names</em> of methods in a specified scope may also be used. Note that
<code>scope</code> MUST be specified to use this option:</p>

<pre><code>myGridPanel.on({
    cellClick: {fn: 'onCellClick', scope: this, single: true},
    mouseover: {fn: 'onMouseOver', scope: panel}
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- eventName: [_ Js.t]
    {% <p>The name of the event to listen for.
May also be an object who's property names are event names.</p> %}
    }
    {- fn: [_ Js.callback] (optional)
    {% <p>The method the event invokes, or <em>if <code>scope</code> is specified, the </em>name* of the method within
the specified <code>scope</code>.  Will be called with arguments
given to <a href="#!/api/Ext.AbstractComponent-method-fireEvent" rel="Ext.AbstractComponent-method-fireEvent" class="docClass">fireEvent</a> plus the <code>options</code> parameter described below.</p> %}
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
    *)
  method addPropertyToState : _ Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.optdef -> bool Js.t Js.meth
  (** {% <p>Save a property to the given state object if it is not its default or configured
value.</p> %}
    
    {b Parameters}:
    {ul {- state: [_ Js.t]
    {% <p>The state object</p> %}
    }
    {- propName: [Js.js_string Js.t]
    {% <p>The name of the property on this object to save.</p> %}
    }
    {- value: [Js.js_string Js.t] (optional)
    {% <p>The value of the state property (defaults to <code>this[propName]</code>).</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>The state object or a new object if state was null and the property
was saved.</p> %}
    }
    }
    *)
  method addUIClsToElement : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Method which adds a specified UI + uiCls to the components element. Can be overridden to remove the UI from more
than just the components element.</p> %}
    
    {b Parameters}:
    {ul {- ui: [Js.js_string Js.t]
    {% <p>The UI to remove from the element</p> %}
    }
    }
    *)
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Called by the layout system after the Component has been layed out.</p> %}
    
    {b Parameters}:
    {ul {- width: [Js.number Js.t]
    {% <p>The width that was set</p> %}
    }
    {- height: [Js.number Js.t]
    {% <p>The height that was set</p> %}
    }
    {- oldWidth: [Js.number Js.t]
    {% <p>The old width. <code>undefined</code> if this was the initial layout.</p> %}
    }
    {- oldHeight: [Js.number Js.t]
    {% <p>The old height. <code>undefined</code> if this was the initial layout.</p> %}
    }
    }
    *)
  method afterSetPosition : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Template method called after a Component has been positioned.</p> %}
    
    {b Parameters}:
    {ul {- x: [Js.number Js.t]
    }
    {- y: [Js.number Js.t]
    }
    }
    *)
  method animate : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Performs custom animation on this object.</p>

<p>This method is applicable to both the <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a> class and the <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Sprite</a>
class. It performs animated transitions of certain properties of this object over a specified timeline.</p>

<h3>Animating a <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a></h3>

<p>When animating a Component, the following properties may be specified in <code>from</code>, <code>to</code>, and <code>keyframe</code> objects:</p>

<ul>
<li><p><code>x</code> - The Component's page X position in pixels.</p></li>
<li><p><code>y</code> - The Component's page Y position in pixels</p></li>
<li><p><code>left</code> - The Component's <code>left</code> value in pixels.</p></li>
<li><p><code>top</code> - The Component's <code>top</code> value in pixels.</p></li>
<li><p><code>width</code> - The Component's <code>width</code> value in pixels.</p></li>
<li><p><code>width</code> - The Component's <code>width</code> value in pixels.</p></li>
<li><p><code>dynamic</code> - Specify as true to update the Component's layout (if it is a Container) at every frame of the animation.
<em>Use sparingly as laying out on every intermediate size change is an expensive operation.</em></p></li>
</ul>


<p>For example, to animate a Window to a new size, ensuring that its internal layout and any shadow is correct:</p>

<pre><code>myWindow = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>', {
    title: 'Test Component animation',
    width: 500,
    height: 300,
    layout: {
        type: 'hbox',
        align: 'stretch'
    },
    items: [{
        title: 'Left: 33%',
        margins: '5 0 5 5',
        flex: 1
    }, {
        title: 'Left: 66%',
        margins: '5 5 5 5',
        flex: 2
    }]
});
myWindow.show();
myWindow.header.el.on('click', function() {
    myWindow.animate({
        to: {
            width: (myWindow.getWidth() == 500) ? 700 : 500,
            height: (myWindow.getHeight() == 300) ? 400 : 300
        }
    });
});
</code></pre>

<p>For performance reasons, by default, the internal layout is only updated when the Window reaches its final <code>"to"</code>
size. If dynamic updating of the Window's child Components is required, then configure the animation with
<code>dynamic: true</code> and the two child items will maintain their proportions during the animation.</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t]
    {% <p>Configuration for <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a>.
Note that the <a href="#!/api/Ext.fx.Anim-cfg-to" rel="Ext.fx.Anim-cfg-to" class="docClass">to</a> config is required.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>this</p> %}
    }
    }
    *)
  method beforeComponentLayout : Js.number Js.t -> Js.number Js.t -> unit
    Js.meth
  (** {% <p>Occurs before componentLayout is run. Returning false from this method will prevent the componentLayout from
being executed.</p> %}
    
    {b Parameters}:
    {ul {- adjWidth: [Js.number Js.t]
    {% <p>The box-adjusted width that was set</p> %}
    }
    {- adjHeight: [Js.number Js.t]
    {% <p>The box-adjusted height that was set</p> %}
    }
    }
    *)
  method beforeDestroy : unit Js.meth
  (** {% <p>Invoked before the Component is destroyed.</p> %}
    *)
  method destroy : unit Js.meth
  (** {% <p>Destroys the Component.</p> %}
    *)
  method disable : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Disable the component.</p> %}
    
    {b Parameters}:
    {ul {- silent: [bool Js.t] (optional)
    {% <p>Passing true will supress the 'disable' event from being fired.</p> %}
     Defaults to: false
    }
    }
    *)
  method doComponentLayout : _ Js.t Js.meth
  (** {% <p>This method needs to be called whenever you change something on this component that requires the Component's
layout to be recalculated.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_container_Container.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method enable : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Enable the component</p> %}
    
    {b Parameters}:
    {ul {- silent: [bool Js.t] (optional)
    {% <p>Passing true will supress the 'enable' event from being fired.</p> %}
     Defaults to: false
    }
    }
    *)
  method getBubbleTarget : _ Js.t Js.meth
  (** {% <p>Provides the link for Observable's fireEvent method to bubble up the ownership hierarchy.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_container_Container.t Js.t]
    {% <p>the Container which owns this Component.</p> %}
    }
    }
    *)
  method getEl : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Retrieves the top level element representing this component.</p> %}
    *)
  method getHeight : Js.number Js.t Js.meth
  (** {% <p>Gets the current height of the component's underlying element.</p> %}
    *)
  method getId : Js.js_string Js.t Js.meth
  (** {% <p>Retrieves the id of this component. Will autogenerate an id if one has not already been set.</p> %}
    *)
  method getItemId : Js.js_string Js.t Js.meth
  (** {% <p>Returns the value of <a href="#!/api/Ext.AbstractComponent-cfg-itemId" rel="Ext.AbstractComponent-cfg-itemId" class="docClass">itemId</a> assigned to this component, or when that
is not set, returns the value of <a href="#!/api/Ext.AbstractComponent-cfg-id" rel="Ext.AbstractComponent-cfg-id" class="docClass">id</a>.</p> %}
    *)
  method getLoader : Ext_ComponentLoader.t Js.t Js.meth
  (** {% <p>Gets the <a href="#!/api/Ext.ComponentLoader" rel="Ext.ComponentLoader" class="docClass">Ext.ComponentLoader</a> for this Component.</p> %}
    
    {b Returns}:
    {ul {- [Ext_ComponentLoader.t Js.t]
    {% <p>The loader instance, null if it doesn't exist.</p> %}
    }
    }
    *)
  method getPlugin : Js.js_string Js.t -> Ext_AbstractPlugin.t Js.t Js.meth
  (** {% <p>Retrieves a plugin by its pluginId which has been bound to this component.</p> %}
    
    {b Parameters}:
    {ul {- pluginId: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_AbstractPlugin.t Js.t] {% <p>plugin instance.</p> %}
    }
    }
    *)
  method getSize : _ Js.t Js.meth
  (** {% <p>Gets the current size of the component's underlying element.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>An object containing the element's size {width: (element width), height: (element height)}</p> %}
    }
    }
    *)
  method getSizeModel : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Returns an object that describes how this component's width and height are managed.
All of these objects are shared and should not be modified.</p> %}
    
    {b Parameters}:
    {ul {- ownerCtSizeModel: [_ Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The size model for this component.</p> %}
    }
    }
    *)
  method getState : _ Js.t Js.meth
  (** {% <p>The supplied default state gathering method for the AbstractComponent class.</p>

<p>This method returns dimension settings such as <code>flex</code>, <code>anchor</code>, <code>width</code> and <code>height</code> along with <code>collapsed</code>
state.</p>

<p>Subclasses which implement more complex state should call the superclass's implementation, and apply their state
to the result if this basic state is to be saved.</p>

<p>Note that Component state will only be saved if the Component has a <a href="#!/api/Ext.AbstractComponent-cfg-stateId" rel="Ext.AbstractComponent-cfg-stateId" class="docClass">stateId</a> and there as a StateProvider
configured for the document.</p> %}
    *)
  method getWidth : Js.number Js.t Js.meth
  (** {% <p>Gets the current width of the component's underlying element.</p> %}
    *)
  method getXTypes : Js.js_string Js.t Js.meth
  (** {% <p>Returns this Component's xtype hierarchy as a slash-delimited string. For a list of all available xtypes, see the
<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> header.</p>

<p><strong>If using your own subclasses, be aware that a Component must register its own xtype to participate in
determination of inherited xtypes.</strong></p>

<p>Example usage:</p>

<pre><code>var t = new <a href="#!/api/Ext.form.field.Text" rel="Ext.form.field.Text" class="docClass">Ext.form.field.Text</a>();
alert(t.getXTypes());  // alerts 'component/field/textfield'
</code></pre> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The xtype hierarchy string</p> %}
    }
    }
    *)
  method hasCls : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Checks if the specified CSS class exists on this element's DOM node.</p> %}
    
    {b Parameters}:
    {ul {- className: [Js.js_string Js.t]
    {% <p>The CSS class to check for</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the class exists, else false</p> %}
    }
    }
    *)
  method hasUICls : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Checks if there is currently a specified uiCls</p> %}
    
    {b Parameters}:
    {ul {- cls: [Js.js_string Js.t] {% <p>The cls to check</p> %}
    }
    }
    *)
  method is : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Tests whether this Component matches the selector string.</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The selector string to test against.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this Component matches the selector.</p> %}
    }
    }
    *)
  method isDescendantOf : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Determines whether this component is the descendant of a particular container.</p> %}
    
    {b Parameters}:
    {ul {- container: [Ext_container_Container.t Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if it is.</p> %}
    }
    }
    *)
  method isDisabled : bool Js.t Js.meth
  (** {% <p>Method to determine whether this Component is currently disabled.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>the disabled state of this Component.</p> %}
    }
    }
    *)
  method isDraggable : bool Js.t Js.meth
  (** {% <p>Method to determine whether this Component is draggable.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>the draggable state of this component.</p> %}
    }
    }
    *)
  method isDroppable : bool Js.t Js.meth
  (** {% <p>Method to determine whether this Component is droppable.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>the droppable state of this component.</p> %}
    }
    }
    *)
  method isFloating : bool Js.t Js.meth
  (** {% <p>Method to determine whether this Component is floating.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>the floating state of this component.</p> %}
    }
    }
    *)
  method isHidden : bool Js.t Js.meth
  (** {% <p>Method to determine whether this Component is currently set to hidden.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>the hidden state of this Component.</p> %}
    }
    }
    *)
  method isLayoutRoot : unit Js.meth
  (** {% <p>Determines whether this Component is the root of a layout. This returns <code>true</code> if
this component can run its layout without assistance from or impact on its owner.
If this component cannot run its layout given these restrictions, <code>false</code> is returned
and its owner will be considered as the next candidate for the layout root.</p>

<p>Setting the <a href="#!/api/Ext.AbstractComponent-property-_isLayoutRoot" rel="Ext.AbstractComponent-property-_isLayoutRoot" class="docClass">_isLayoutRoot</a> property to <code>true</code> causes this method to always
return <code>true</code>. This may be useful when updating a layout of a Container which shrink
wraps content, and you know that it will not change size, and so can safely be the
topmost participant in the layout run.</p> %}
    *)
  method isLayoutSuspended : bool Js.t Js.meth
  (** {% <p>Returns true if layout is suspended for this component. This can come from direct
suspension of this component's layout activity (<a href="#!/api/Ext.container.Container-cfg-suspendLayout" rel="Ext.container.Container-cfg-suspendLayout" class="docClass">Ext.Container.suspendLayout</a>) or if one
of this component's containers is suspended.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True layout of this component is suspended.</p> %}
    }
    }
    *)
  method isVisible : bool Js.t Js.optdef -> bool Js.t Js.meth
  (** {% <p>Returns true if this component is visible.</p> %}
    
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
  method isXType : Js.js_string Js.t -> bool Js.t Js.optdef -> bool Js.t
    Js.meth
  (** {% <p>Tests whether or not this Component is of a specific xtype. This can test whether this Component is descended
from the xtype (default) or whether it is directly of the xtype specified (shallow = true).</p>

<p><strong>If using your own subclasses, be aware that a Component must register its own xtype to participate in
determination of inherited xtypes.</strong></p>

<p>For a list of all available xtypes, see the <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> header.</p>

<p>Example usage:</p>

<pre><code>var t = new <a href="#!/api/Ext.form.field.Text" rel="Ext.form.field.Text" class="docClass">Ext.form.field.Text</a>();
var isText = t.isXType('textfield');        // true
var isBoxSubclass = t.isXType('field');       // true, descended from <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a>
var isBoxInstance = t.isXType('field', true); // false, not a direct <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a> instance
</code></pre> %}
    
    {b Parameters}:
    {ul {- xtype: [Js.js_string Js.t]
    {% <p>The xtype to check for this Component</p> %}
    }
    {- shallow: [bool Js.t] (optional)
    {% <p>True to check whether this Component is directly of the specified xtype, false to
check whether this Component is descended from the xtype.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this component descends from the specified xtype, false otherwise.</p> %}
    }
    }
    *)
  method nextNode : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Returns the next node in the Component tree in tree traversal order.</p>

<p>Note that this is not limited to siblings, and if invoked upon a node with no matching siblings, will walk the
tree to attempt to find a match. Contrast with <a href="#!/api/Ext.AbstractComponent-method-nextSibling" rel="Ext.AbstractComponent-method-nextSibling" class="docClass">nextSibling</a>.</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>A <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a> selector to filter the following nodes.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The next node (or the next node which matches the selector).
Returns null if there is no matching node.</p> %}
    }
    }
    *)
  method nextSibling : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Returns the next sibling of this Component.</p>

<p>Optionally selects the next sibling which matches the passed <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a> selector.</p>

<p>May also be refered to as <strong><code>next()</code></strong></p>

<p>Note that this is limited to siblings, and if no siblings of the item match, <code>null</code> is returned. Contrast with
<a href="#!/api/Ext.AbstractComponent-method-nextNode" rel="Ext.AbstractComponent-method-nextNode" class="docClass">nextNode</a></p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>A <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a> selector to filter the following items.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The next sibling (or the next sibling which matches the selector).
Returns null if there is no matching sibling.</p> %}
    }
    }
    *)
  method onAdded : _ Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Method to manage awareness of when components are added to their
respective Container, firing an <a href="#!/api/Ext.AbstractComponent-event-added" rel="Ext.AbstractComponent-event-added" class="docClass">added</a> event. References are
established at add time rather than at render time.</p>

<p>Allows addition of behavior when a Component is added to a
Container. At this stage, the Component is in the parent
Container's collection of child items. After calling the
superclass's onAdded, the ownerCt reference will be present,
and if configured with a ref, the refOwner will be set.</p> %}
    
    {b Parameters}:
    {ul {- container: [#Ext_container_Container.t Js.t]
    {% <p>Container which holds the component</p> %}
    }
    {- pos: [Js.number Js.t]
    {% <p>Position at which the component was added</p> %}
    }
    }
    *)
  method onDisable : unit Js.meth
  (** {% <p>Allows addition of behavior to the disable operation.
After calling the superclass’s onDisable, the Component will be disabled.</p> %}
    *)
  method onEnable : unit Js.meth
  (** {% <p>Allows addition of behavior to the enable operation.
After calling the superclass’s onEnable, the Component will be enabled.</p> %}
    *)
  method onPosition : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Called after the component is moved, this method is empty by default but can be implemented by any
subclass that needs to perform custom logic after a move occurs.</p> %}
    
    {b Parameters}:
    {ul {- x: [Js.number Js.t]
    {% <p>The new x position</p> %}
    }
    {- y: [Js.number Js.t] {% <p>The new y position</p> %}
    }
    }
    *)
  method onRemoved : bool Js.t -> unit Js.meth
  (** {% <p>Method to manage awareness of when components are removed from their
respective Container, firing a <a href="#!/api/Ext.AbstractComponent-event-removed" rel="Ext.AbstractComponent-event-removed" class="docClass">removed</a> event. References are properly
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
  method onResize : unit Js.meth
  (** {% <p>Allows addition of behavior to the resize operation.</p>

<p>Called when Ext.resizer.Resizer#drag event is fired.</p> %}
    *)
  method previousNode : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Returns the previous node in the Component tree in tree traversal order.</p>

<p>Note that this is not limited to siblings, and if invoked upon a node with no matching siblings, will walk the
tree in reverse order to attempt to find a match. Contrast with <a href="#!/api/Ext.AbstractComponent-method-previousSibling" rel="Ext.AbstractComponent-method-previousSibling" class="docClass">previousSibling</a>.</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>A <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a> selector to filter the preceding nodes.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The previous node (or the previous node which matches the selector).
Returns null if there is no matching node.</p> %}
    }
    }
    *)
  method previousSibling : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Returns the previous sibling of this Component.</p>

<p>Optionally selects the previous sibling which matches the passed <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a>
selector.</p>

<p>May also be refered to as <strong><code>prev()</code></strong></p>

<p>Note that this is limited to siblings, and if no siblings of the item match, <code>null</code> is returned. Contrast with
<a href="#!/api/Ext.AbstractComponent-method-previousNode" rel="Ext.AbstractComponent-method-previousNode" class="docClass">previousNode</a></p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>A <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a> selector to filter the preceding items.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The previous sibling (or the previous sibling which matches the selector).
Returns null if there is no matching sibling.</p> %}
    }
    }
    *)
  method registerFloatingItem : _ Js.t -> unit Js.meth
  (** {% <p>Called by Component#doAutoRender</p>

<p>Register a Container configured <code>floating: true</code> with this Component's <a href="#!/api/Ext.ZIndexManager" rel="Ext.ZIndexManager" class="docClass">ZIndexManager</a>.</p>

<p>Components added in ths way will not participate in any layout, but will be rendered
upon first show in the way that <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s are.</p> %}
    
    {b Parameters}:
    {ul {- cmp: [_ Js.t]
    }
    }
    *)
  method removeCls : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Removes a CSS class from the top level element representing this component.</p> %}
    
    {b Parameters}:
    {ul {- cls: [_ Js.t]
    {% <p>The CSS class name to remove</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>Returns the Component to allow method chaining.</p> %}
    }
    }
    *)
  method removeClsWithUI : _ Js.t -> unit Js.meth
  (** {% <p>Removes a cls to the uiCls array, which will also call <a href="#!/api/Ext.AbstractComponent-method-removeUIClsFromElement" rel="Ext.AbstractComponent-method-removeUIClsFromElement" class="docClass">removeUIClsFromElement</a> and removes it from all
elements of this component.</p> %}
    
    {b Parameters}:
    {ul {- cls: [_ Js.t]
    {% <p>A string or an array of strings to remove to the uiCls</p> %}
    }
    }
    *)
  method removeUIClsFromElement : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Method which removes a specified UI + uiCls from the components element. The cls which is added to the element
will be: <code>this.baseCls + '-' + ui</code></p> %}
    
    {b Parameters}:
    {ul {- ui: [Js.js_string Js.t]
    {% <p>The UI to add to the element</p> %}
    }
    }
    *)
  method setBorder : _ Js.t -> unit Js.meth
  method setDisabled : bool Js.t -> unit Js.meth
  (** {% <p>Enable or disable the component.</p> %}
    
    {b Parameters}:
    {ul {- disabled: [bool Js.t] {% <p>True to disable.</p> %}
    }
    }
    *)
  method setDocked : _ Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the dock position of this component in its parent panel. Note that this only has effect if this item is part
of the dockedItems collection of a parent that has a DockLayout (note that any Panel has a DockLayout by default)</p> %}
    
    {b Parameters}:
    {ul {- dock: [_ Js.t]
    {% <p>The dock position.</p> %}
    }
    {- layoutParent: [bool Js.t] (optional)
    {% <p>True to re-layout parent.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setHeight : Js.number Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the height of the component. This method fires the <a href="#!/api/Ext.AbstractComponent-event-resize" rel="Ext.AbstractComponent-event-resize" class="docClass">resize</a> event.</p> %}
    
    {b Parameters}:
    {ul {- height: [Js.number Js.t]
    {% <p>The new height to set. This may be one of:</p>

<ul>
<li>A Number specifying the new height in the <a href="#!/api/Ext.AbstractComponent-method-getEl" rel="Ext.AbstractComponent-method-getEl" class="docClass">Element</a>'s <a href="#!/api/Ext.dom.Element-property-defaultUnit" rel="Ext.dom.Element-property-defaultUnit" class="docClass">Ext.Element.defaultUnit</a>s (by default, pixels).</li>
<li>A String used to set the CSS height style.</li>
<li><em>undefined</em> to leave the height unchanged.</li>
</ul> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setPosition : Js.number Js.t -> Js.number Js.t -> _ Js.t Js.optdef
    -> 'self Js.t Js.meth
  (** {% <p>Sets the left and top of the component. To set the page XY position instead, use <a href="#!/api/Ext.Component-method-setPagePosition" rel="Ext.Component-method-setPagePosition" class="docClass">setPagePosition</a>. This
method fires the <a href="#!/api/Ext.AbstractComponent-event-move" rel="Ext.AbstractComponent-event-move" class="docClass">move</a> event.</p> %}
    
    {b Parameters}:
    {ul {- left: [Js.number Js.t]
    {% <p>The new left</p> %}
    }
    {- top: [Js.number Js.t]
    {% <p>The new top</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>If true, the Component is <em>animated</em> into its new position. You may also pass an
animation configuration.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setSize : _ Js.t -> _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the width and height of this Component. This method fires the <a href="#!/api/Ext.AbstractComponent-event-resize" rel="Ext.AbstractComponent-event-resize" class="docClass">resize</a> event. This method can accept
either width and height as separate arguments, or you can pass a size object like <code>{width:10, height:20}</code>.</p> %}
    
    {b Parameters}:
    {ul {- width: [_ Js.t]
    {% <p>The new width to set. This may be one of:</p>

<ul>
<li>A Number specifying the new width in the <a href="#!/api/Ext.AbstractComponent-method-getEl" rel="Ext.AbstractComponent-method-getEl" class="docClass">Element</a>'s <a href="#!/api/Ext.dom.Element-property-defaultUnit" rel="Ext.dom.Element-property-defaultUnit" class="docClass">Ext.Element.defaultUnit</a>s (by default, pixels).</li>
<li>A String used to set the CSS width style.</li>
<li>A size object in the format <code>{width: widthValue, height: heightValue}</code>.</li>
<li><code>undefined</code> to leave the width unchanged.</li>
</ul> %}
    }
    {- height: [_ Js.t]
    {% <p>The new height to set (not required if a size object is passed as the first arg).
This may be one of:</p>

<ul>
<li>A Number specifying the new height in the <a href="#!/api/Ext.AbstractComponent-method-getEl" rel="Ext.AbstractComponent-method-getEl" class="docClass">Element</a>'s <a href="#!/api/Ext.dom.Element-property-defaultUnit" rel="Ext.dom.Element-property-defaultUnit" class="docClass">Ext.Element.defaultUnit</a>s (by default, pixels).</li>
<li>A String used to set the CSS height style. Animation may <strong>not</strong> be used.</li>
<li><code>undefined</code> to leave the height unchanged.</li>
</ul> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setUI : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Sets the UI for the component. This will remove any existing UIs on the component. It will also loop through any
uiCls set on the component and rename them so they include the new UI</p> %}
    
    {b Parameters}:
    {ul {- ui: [Js.js_string Js.t]
    {% <p>The new UI for the component</p> %}
    }
    }
    *)
  method setVisible : bool Js.t -> 'self Js.t Js.meth
  (** {% <p>Convenience function to hide or show this component by boolean.</p> %}
    
    {b Parameters}:
    {ul {- visible: [bool Js.t]
    {% <p>True to show, false to hide</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setWidth : Js.number Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the width of the component. This method fires the <a href="#!/api/Ext.AbstractComponent-event-resize" rel="Ext.AbstractComponent-event-resize" class="docClass">resize</a> event.</p> %}
    
    {b Parameters}:
    {ul {- width: [Js.number Js.t]
    {% <p>The new width to setThis may be one of:</p>

<ul>
<li>A Number specifying the new width in the <a href="#!/api/Ext.AbstractComponent-method-getEl" rel="Ext.AbstractComponent-method-getEl" class="docClass">Element</a>'s <a href="#!/api/Ext.dom.Element-property-defaultUnit" rel="Ext.dom.Element-property-defaultUnit" class="docClass">Ext.Element.defaultUnit</a>s (by default, pixels).</li>
<li>A String used to set the CSS width style.</li>
</ul> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method up : Js.js_string Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Walks up the <code>ownerCt</code> axis looking for an ancestor Container which matches the passed simple selector.</p>

<p>Example:</p>

<pre><code>var owningTabPanel = grid.up('tabpanel');
</code></pre> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>The simple selector to test.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_container_Container.t Js.t]
    {% <p>The matching ancestor Container (or <code>undefined</code> if no match was found).</p> %}
    }
    }
    *)
  method update : _ Js.t -> bool Js.t Js.optdef -> _ Js.callback Js.optdef ->
    unit Js.meth
  (** {% <p>Update the content area of a component.</p> %}
    
    {b Parameters}:
    {ul {- htmlOrData: [_ Js.t]
    {% <p>If this component has been configured with a template via the tpl config then
it will use this argument as data to populate the template. If this component was not configured with a template,
the components content area will be updated via <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> update</p> %}
    }
    {- loadScripts: [bool Js.t] (optional)
    {% <p>Only legitimate when using the html configuration.</p> %}
     Defaults to: false
    }
    {- callback: [_ Js.callback] (optional)
    {% <p>Only legitimate when using the html configuration. Callback to execute when
scripts have finished loading</p> %}
    }
    }
    *)
  method updateLayout : _ Js.t -> unit Js.meth
  (** {% <p>Updates this component's layout. If this update effects this components <a href="#!/api/Ext.AbstractComponent-property-ownerCt" rel="Ext.AbstractComponent-property-ownerCt" class="docClass">ownerCt</a>,
that component's <code>updateLayout</code> method will be called to perform the layout instead.
Otherwise, just this component (and its child items) will layout.</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t] {% <p>An object with layout options.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_state_Stateful.configs
  inherit Ext_util_Animate.configs
  inherit Ext_util_ElementContainer.configs
  inherit Ext_util_Observable.configs
  inherit Ext_util_Renderable.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterComponentLayout] *)
  method afterSetPosition : ('self Js.t, Js.number Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.afterSetPosition] *)
  method beforeComponentLayout : ('self Js.t, Js.number Js.t ->
    Js.number Js.t -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.beforeComponentLayout] *)
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDestroy] *)
  method onAdded : ('self Js.t, _ Js.t -> Js.number Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onAdded] *)
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDisable] *)
  method onEnable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onEnable] *)
  method onPosition : ('self Js.t, Js.number Js.t -> Js.number Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onPosition] *)
  method onRemoved : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onRemoved] *)
  method onResize : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onResize] *)
  method autoEl : _ Js.t Js.prop
  (** {% <p>A tag name or <a href="#!/api/Ext.DomHelper" rel="Ext.DomHelper" class="docClass">DomHelper</a> spec used to create the <a href="#!/api/Ext.AbstractComponent-method-getEl" rel="Ext.AbstractComponent-method-getEl" class="docClass">Element</a> which will
encapsulate this Component.</p>

<p>You do not normally need to specify this. For the base classes <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> and
<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>, this defaults to <strong>'div'</strong>. The more complex Sencha classes use a more
complex DOM structure specified by their own <a href="#!/api/Ext.AbstractComponent-cfg-renderTpl" rel="Ext.AbstractComponent-cfg-renderTpl" class="docClass">renderTpl</a>s.</p>

<p>This is intended to allow the developer to create application-specific utility Components encapsulated by
different DOM elements. Example usage:</p>

<pre><code>{
    xtype: 'component',
    autoEl: {
        tag: 'img',
        src: 'http://www.example.com/example.jpg'
    }
}, {
    xtype: 'component',
    autoEl: {
        tag: 'blockquote',
        html: 'autoEl is cool!'
    }
}, {
    xtype: 'container',
    autoEl: 'ul',
    cls: 'ux-unordered-list',
    items: {
        xtype: 'component',
        autoEl: 'li',
        html: 'First list item'
    }
}
</code></pre> %}
    *)
  method autoRender : _ Js.t Js.prop
  (** {% <p>This config is intended mainly for non-<a href="#!/api/Ext.AbstractComponent-cfg-floating" rel="Ext.AbstractComponent-cfg-floating" class="docClass">floating</a> Components which may or may not be shown. Instead of using
<a href="#!/api/Ext.AbstractComponent-cfg-renderTo" rel="Ext.AbstractComponent-cfg-renderTo" class="docClass">renderTo</a> in the configuration, and rendering upon construction, this allows a Component to render itself
upon first <em><a href="#!/api/Ext.Component-method-show" rel="Ext.Component-method-show" class="docClass">show</a></em>. If <a href="#!/api/Ext.AbstractComponent-cfg-floating" rel="Ext.AbstractComponent-cfg-floating" class="docClass">floating</a> is true, the value of this config is omited as if it is <code>true</code>.</p>

<p>Specify as <code>true</code> to have this Component render to the document body upon first show.</p>

<p>Specify as an element, or the ID of an element to have this Component render to a specific element upon first
show.</p> %}
    
    Defaults to: [false]
    *)
  method autoShow : bool Js.t Js.prop
  (** {% <p>True to automatically show the component upon creation. This config option may only be used for
<a href="#!/api/Ext.AbstractComponent-cfg-floating" rel="Ext.AbstractComponent-cfg-floating" class="docClass">floating</a> components or components that use <a href="#!/api/Ext.AbstractComponent-cfg-autoRender" rel="Ext.AbstractComponent-cfg-autoRender" class="docClass">autoRender</a>. Defaults to false.</p> %}
    
    Defaults to: [false]
    *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this components's element. This will also be prepended to elements within this
component like Panel's body will get a class x-panel-body. This means that if you create a subclass of Panel, and
you want it to get all the Panels styling for the element and the body, you leave the baseCls x-panel and use
componentCls to add specific styling for this component.</p> %}
    
    Defaults to: ['x-component']
    *)
  method border : _ Js.t Js.prop
  (** {% <p>Specifies the border size for this component. The border can be a single numeric value to apply to all sides or it can
be a CSS style specification for each style, for example: '10 5 3 10'.</p>

<p>For components that have no border by default, setting this won't make the border appear by itself.
You also need to specify border color and style:</p>

<pre><code>border: 5,
style: {
    borderColor: 'red',
    borderStyle: 'solid'
}
</code></pre>

<p>To turn off the border, use <code>border: false</code>.</p> %}
    *)
  method childEls : _ Js.t Js.js_array Js.t Js.prop
  (** {% <p>An array describing the child elements of the Component. Each member of the array
is an object with these properties:</p>

<ul>
<li><code>name</code> - The property name on the Component for the child element.</li>
<li><code>itemId</code> - The id to combine with the Component's id that is the id of the child element.</li>
<li><code>id</code> - The id of the child element.</li>
</ul>


<p>If the array member is a string, it is equivalent to <code>{ name: m, itemId: m }</code>.</p>

<p>For example, a Component which renders a title and body text:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    renderTpl: [
        '&lt;h1 id="{id}-title"&gt;{title}&lt;/h1&gt;',
        '&lt;p&gt;{msg}&lt;/p&gt;',
    ],
    renderData: {
        title: "Error",
        msg: "Something went wrong"
    },
    childEls: ["title"],
    listeners: {
        afterrender: function(cmp){
            // After rendering the component will have a title property
            cmp.title.setStyle({color: "red"});
        }
    }
});
</code></pre>

<p>A more flexible, but somewhat slower, approach is <a href="#!/api/Ext.AbstractComponent-cfg-renderSelectors" rel="Ext.AbstractComponent-cfg-renderSelectors" class="docClass">renderSelectors</a>.</p> %}
    *)
  method cls : Js.js_string Js.t Js.prop
  (** {% <p>An optional extra CSS class that will be added to this component's Element. This can be useful
for adding customized styles to the component or any of its children using standard CSS rules.</p> %}
    
    Defaults to: ['']
    *)
  method componentCls : Js.js_string Js.t Js.prop
  (** {% <p>CSS Class to be added to a components root level element to give distinction to it via styling.</p> %}
    *)
  method componentLayout : _ Js.t Js.prop
  (** {% <p>The sizing and positioning of a Component's internal Elements is the responsibility of the Component's layout
manager which sizes a Component's internal structure in response to the Component being sized.</p>

<p>Generally, developers will not use this configuration as all provided Components which need their internal
elements sizing (Such as <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">input fields</a>) come with their own componentLayout managers.</p>

<p>The <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used on instances of the base <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>
class which simply sizes the Component's encapsulating element to the height and width specified in the
<a href="#!/api/Ext.AbstractComponent-method-setSize" rel="Ext.AbstractComponent-method-setSize" class="docClass">setSize</a> method.</p> %}
    *)
  method contentEl : Js.js_string Js.t Js.prop
  (** {% <p>Specify an existing HTML element, or the <code>id</code> of an existing HTML element to use as the content for this component.</p>

<p>This config option is used to take an existing HTML element and place it in the layout element of a new component
(it simply moves the specified DOM element <em>after the Component is rendered</em> to use as the content.</p>

<p><strong>Notes:</strong></p>

<p>The specified HTML element is appended to the layout element of the component <em>after any configured
<a href="#!/api/Ext.AbstractComponent-cfg-html" rel="Ext.AbstractComponent-cfg-html" class="docClass">HTML</a> has been inserted</em>, and so the document will not contain this element at the time
the <a href="#!/api/Ext.AbstractComponent-event-render" rel="Ext.AbstractComponent-event-render" class="docClass">render</a> event is fired.</p>

<p>The specified HTML element used will not participate in any <strong><code><a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a></code></strong>
scheme that the Component may use. It is just HTML. Layouts operate on child
<strong><code><a href="#!/api/Ext.container.Container-cfg-items" rel="Ext.container.Container-cfg-items" class="docClass">items</a></code></strong>.</p>

<p>Add either the <code>x-hidden</code> or the <code>x-hide-display</code> CSS class to prevent a brief flicker of the content before it
is rendered to the panel.</p> %}
    *)
  method data : _ Js.t Js.prop
  (** {% <p>The initial set of data to apply to the <code><a href="#!/api/Ext.AbstractComponent-cfg-tpl" rel="Ext.AbstractComponent-cfg-tpl" class="docClass">tpl</a></code> to update the content area of the Component.</p> %}
    *)
  method disabled : bool Js.t Js.prop
  (** {% <p>True to disable the component.</p> %}
    
    Defaults to: [false]
    *)
  method disabledCls : Js.js_string Js.t Js.prop
  (** {% <p>CSS class to add when the Component is disabled. Defaults to 'x-item-disabled'.</p> %}
    
    Defaults to: ['x-item-disabled']
    *)
  method draggable : bool Js.t Js.prop
  (** {% <p>Allows the component to be dragged.</p> %}
    
    Defaults to: [false]
    *)
  method floating : bool Js.t Js.prop
  (** {% <p>Create the Component as a floating and use absolute positioning.</p>

<p>The z-index of floating Components is handled by a ZIndexManager. If you simply render a floating Component into the DOM, it will be managed
by the global <a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">WindowManager</a>.</p>

<p>If you include a floating Component as a child item of a Container, then upon render, ExtJS will seek an ancestor floating Component to house a new
ZIndexManager instance to manage its descendant floaters. If no floating ancestor can be found, the global WindowManager will be used.</p>

<p>When a floating Component which has a ZindexManager managing descendant floaters is destroyed, those descendant floaters will also be destroyed.</p> %}
    
    Defaults to: [false]
    *)
  method frame : bool Js.t Js.prop
  (** {% <p>Specify as <code>true</code> to have the Component inject framing elements within the Component at render time to provide a
graphical rounded frame around the Component content.</p>

<p>This is only necessary when running on outdated, or non standard-compliant browsers such as Microsoft's Internet
Explorer prior to version 9 which do not support rounded corners natively.</p>

<p>The extra space taken up by this framing is available from the read only property <a href="#!/api/Ext.AbstractComponent-property-frameSize" rel="Ext.AbstractComponent-property-frameSize" class="docClass">frameSize</a>.</p> %}
    *)
  method height : Js.number Js.t Js.prop
  (** {% <p>The height of this component in pixels.</p> %}
    *)
  method hidden : bool Js.t Js.prop
  (** {% <p>True to hide the component.</p> %}
    
    Defaults to: [false]
    *)
  method hideMode : Js.js_string Js.t Js.prop
  (** {% <p>A String which specifies how this Component's encapsulating DOM element will be hidden. Values may be:</p>

<ul>
<li><code>'display'</code> : The Component will be hidden using the <code>display: none</code> style.</li>
<li><code>'visibility'</code> : The Component will be hidden using the <code>visibility: hidden</code> style.</li>
<li><code>'offsets'</code> : The Component will be hidden by absolutely positioning it out of the visible area of the document.
This is useful when a hidden Component must maintain measurable dimensions. Hiding using <code>display</code> results in a
Component having zero dimensions.</li>
</ul> %}
    
    Defaults to: ['display']
    *)
  method html : _ Js.t Js.prop
  (** {% <p>An HTML fragment, or a <a href="#!/api/Ext.DomHelper" rel="Ext.DomHelper" class="docClass">DomHelper</a> specification to use as the layout element content.
The HTML content is added after the component is rendered, so the document will not contain this HTML at the time
the <a href="#!/api/Ext.AbstractComponent-event-render" rel="Ext.AbstractComponent-event-render" class="docClass">render</a> event is fired. This content is inserted into the body <em>before</em> any configured <a href="#!/api/Ext.AbstractComponent-cfg-contentEl" rel="Ext.AbstractComponent-cfg-contentEl" class="docClass">contentEl</a>
is appended.</p> %}
    
    Defaults to: ['']
    *)
  method id : Js.js_string Js.t Js.prop
  (** {% <p>The <strong>unique id of this component instance.</strong></p>

<p>It should not be necessary to use this configuration except for singleton objects in your application. Components
created with an id may be accessed globally using <a href="#!/api/Ext-method-getCmp" rel="Ext-method-getCmp" class="docClass">Ext.getCmp</a>.</p>

<p>Instead of using assigned ids, use the <a href="#!/api/Ext.AbstractComponent-cfg-itemId" rel="Ext.AbstractComponent-cfg-itemId" class="docClass">itemId</a> config, and <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a>
which provides selector-based searching for Sencha Components analogous to DOM querying. The <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a> class contains <a href="#!/api/Ext.container.Container-method-down" rel="Ext.container.Container-method-down" class="docClass">shortcut methods</a> to query
its descendant Components by selector.</p>

<p>Note that this id will also be used as the element id for the containing HTML element that is rendered to the
page for this component. This allows you to write id-based CSS rules to style the specific instance of this
component uniquely, and also to select sub-elements using this component's id as the parent.</p>

<p><strong>Note</strong>: to avoid complications imposed by a unique id also see <code><a href="#!/api/Ext.AbstractComponent-cfg-itemId" rel="Ext.AbstractComponent-cfg-itemId" class="docClass">itemId</a></code>.</p>

<p><strong>Note</strong>: to access the container of a Component see <code><a href="#!/api/Ext.AbstractComponent-property-ownerCt" rel="Ext.AbstractComponent-property-ownerCt" class="docClass">ownerCt</a></code>.</p>

<p>Defaults to an <a href="#!/api/Ext.AbstractComponent-method-getId" rel="Ext.AbstractComponent-method-getId" class="docClass">auto-assigned id</a>.</p> %}
    *)
  method itemId : Js.js_string Js.t Js.prop
  (** {% <p>An itemId can be used as an alternative way to get a reference to a component when no object reference is
available. Instead of using an <code><a href="#!/api/Ext.AbstractComponent-cfg-id" rel="Ext.AbstractComponent-cfg-id" class="docClass">id</a></code> with <a href="#!/api/Ext" rel="Ext" class="docClass">Ext</a>.<a href="#!/api/Ext-method-getCmp" rel="Ext-method-getCmp" class="docClass">getCmp</a>, use <code>itemId</code> with
<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>.<a href="#!/api/Ext.container.Container-method-getComponent" rel="Ext.container.Container-method-getComponent" class="docClass">getComponent</a> which will retrieve
<code>itemId</code>'s or <a href="#!/api/Ext.AbstractComponent-cfg-id" rel="Ext.AbstractComponent-cfg-id" class="docClass">id</a>'s. Since <code>itemId</code>'s are an index to the container's internal MixedCollection, the
<code>itemId</code> is scoped locally to the container -- avoiding potential conflicts with <a href="#!/api/Ext.ComponentManager" rel="Ext.ComponentManager" class="docClass">Ext.ComponentManager</a>
which requires a <strong>unique</strong> <code><a href="#!/api/Ext.AbstractComponent-cfg-id" rel="Ext.AbstractComponent-cfg-id" class="docClass">id</a></code>.</p>

<pre><code>var c = new <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>({ //
    <a href="#!/api/Ext.Component-cfg-height" rel="Ext.Component-cfg-height" class="docClass">height</a>: 300,
    <a href="#!/api/Ext.AbstractComponent-cfg-renderTo" rel="Ext.AbstractComponent-cfg-renderTo" class="docClass">renderTo</a>: document.body,
    <a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a>: 'auto',
    <a href="#!/api/Ext.container.Container-cfg-items" rel="Ext.container.Container-cfg-items" class="docClass">items</a>: [
        {
            itemId: 'p1',
            <a href="#!/api/Ext.panel.Panel-cfg-title" rel="Ext.panel.Panel-cfg-title" class="docClass">title</a>: 'Panel 1',
            <a href="#!/api/Ext.Component-cfg-height" rel="Ext.Component-cfg-height" class="docClass">height</a>: 150
        },
        {
            itemId: 'p2',
            <a href="#!/api/Ext.panel.Panel-cfg-title" rel="Ext.panel.Panel-cfg-title" class="docClass">title</a>: 'Panel 2',
            <a href="#!/api/Ext.Component-cfg-height" rel="Ext.Component-cfg-height" class="docClass">height</a>: 150
        }
    ]
})
p1 = c.<a href="#!/api/Ext.container.Container-method-getComponent" rel="Ext.container.Container-method-getComponent" class="docClass">getComponent</a>('p1'); // not the same as <a href="#!/api/Ext-method-getCmp" rel="Ext-method-getCmp" class="docClass">Ext.getCmp()</a>
p2 = p1.<a href="#!/api/Ext.AbstractComponent-property-ownerCt" rel="Ext.AbstractComponent-property-ownerCt" class="docClass">ownerCt</a>.<a href="#!/api/Ext.container.Container-method-getComponent" rel="Ext.container.Container-method-getComponent" class="docClass">getComponent</a>('p2'); // reference via a sibling
</code></pre>

<p>Also see <a href="#!/api/Ext.AbstractComponent-cfg-id" rel="Ext.AbstractComponent-cfg-id" class="docClass">id</a>, <code><a href="#!/api/Ext.container.Container-method-query" rel="Ext.container.Container-method-query" class="docClass">Ext.container.Container.query</a></code>, <code><a href="#!/api/Ext.container.Container-method-down" rel="Ext.container.Container-method-down" class="docClass">Ext.container.Container.down</a></code> and
<code><a href="#!/api/Ext.container.Container-method-child" rel="Ext.container.Container-method-child" class="docClass">Ext.container.Container.child</a></code>.</p>

<p><strong>Note</strong>: to access the container of an item see <a href="#!/api/Ext.AbstractComponent-property-ownerCt" rel="Ext.AbstractComponent-property-ownerCt" class="docClass">ownerCt</a>.</p> %}
    *)
  method loader : _ Js.t Js.prop
  (** {% <p>A configuration object or an instance of a <a href="#!/api/Ext.ComponentLoader" rel="Ext.ComponentLoader" class="docClass">Ext.ComponentLoader</a> to load remote content
for this Component.</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>', {
    loader: {
        url: 'content.html',
        autoLoad: true
    },
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
});
</code></pre> %}
    *)
  method margin : _ Js.t Js.prop
  (** {% <p>Specifies the margin for this component. The margin can be a single numeric value to apply to all sides or it can
be a CSS style specification for each style, for example: '10 5 3 10'.</p> %}
    *)
  method maxHeight : Js.number Js.t Js.prop
  (** {% <p>The maximum value in pixels which this Component will set its height to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    *)
  method maxWidth : Js.number Js.t Js.prop
  (** {% <p>The maximum value in pixels which this Component will set its width to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    *)
  method minHeight : Js.number Js.t Js.prop
  (** {% <p>The minimum value in pixels which this Component will set its height to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    *)
  method minWidth : Js.number Js.t Js.prop
  (** {% <p>The minimum value in pixels which this Component will set its width to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    *)
  method overCls : Js.js_string Js.t Js.prop
  (** {% <p>An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element,
and removed when the mouse moves out. This can be useful for adding customized 'active' or 'hover' styles to the
component or any of its children using standard CSS rules.</p> %}
    
    Defaults to: ['']
    *)
  method padding : _ Js.t Js.prop
  (** {% <p>Specifies the padding for this component. The padding can be a single numeric value to apply to all sides or it
can be a CSS style specification for each style, for example: '10 5 3 10'.</p> %}
    *)
  method plugins : _ Js.t Js.prop
  (** {% <p>An object or array of objects that will provide custom functionality for this component. The only requirement for
a valid plugin is that it contain an init method that accepts a reference of type <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>. When a component
is created, if any plugins are available, the component will call the init method on each plugin, passing a
reference to itself. Each plugin can then call methods or respond to events on the component as needed to provide
its functionality.</p> %}
    *)
  method renderData : _ Js.t Js.prop
  (** {% <p>The data used by <a href="#!/api/Ext.AbstractComponent-cfg-renderTpl" rel="Ext.AbstractComponent-cfg-renderTpl" class="docClass">renderTpl</a> in addition to the following property values of the component:</p>

<ul>
<li>id</li>
<li>ui</li>
<li>uiCls</li>
<li>baseCls</li>
<li>componentCls</li>
<li>frame</li>
</ul>


<p>See <a href="#!/api/Ext.AbstractComponent-cfg-renderSelectors" rel="Ext.AbstractComponent-cfg-renderSelectors" class="docClass">renderSelectors</a> and <a href="#!/api/Ext.AbstractComponent-cfg-childEls" rel="Ext.AbstractComponent-cfg-childEls" class="docClass">childEls</a> for usage examples.</p> %}
    *)
  method renderSelectors : _ Js.t Js.prop
  (** {% <p>An object containing properties specifying <a href="#!/api/Ext.dom.Query" rel="Ext.dom.Query" class="docClass">DomQuery</a> selectors which identify child elements
created by the render process.</p>

<p>After the Component's internal structure is rendered according to the <a href="#!/api/Ext.AbstractComponent-cfg-renderTpl" rel="Ext.AbstractComponent-cfg-renderTpl" class="docClass">renderTpl</a>, this object is iterated through,
and the found Elements are added as properties to the Component using the <code>renderSelector</code> property name.</p>

<p>For example, a Component which renderes a title and description into its element:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    renderTpl: [
        '&lt;h1 class="title"&gt;{title}&lt;/h1&gt;',
        '&lt;p&gt;{desc}&lt;/p&gt;'
    ],
    renderData: {
        title: "Error",
        desc: "Something went wrong"
    },
    renderSelectors: {
        titleEl: 'h1.title',
        descEl: 'p'
    },
    listeners: {
        afterrender: function(cmp){
            // After rendering the component will have a titleEl and descEl properties
            cmp.titleEl.setStyle({color: "red"});
        }
    }
});
</code></pre>

<p>For a faster, but less flexible, alternative that achieves the same end result (properties for child elements on the
Component after render), see <a href="#!/api/Ext.AbstractComponent-cfg-childEls" rel="Ext.AbstractComponent-cfg-childEls" class="docClass">childEls</a> and <a href="#!/api/Ext.AbstractComponent-method-addChildEls" rel="Ext.AbstractComponent-method-addChildEls" class="docClass">addChildEls</a>.</p> %}
    *)
  method renderTo : _ Js.t Js.prop
  (** {% <p>Specify the id of the element, a DOM element or an existing Element that this component will be rendered into.</p>

<p><strong>Notes:</strong></p>

<p>Do <em>not</em> use this option if the Component is to be a child item of a <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a>.
It is the responsibility of the <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a>'s
<a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout manager</a> to render and manage its child items.</p>

<p>When using this config, a call to render() is not required.</p>

<p>See also: <a href="#!/api/Ext.AbstractComponent-method-render" rel="Ext.AbstractComponent-method-render" class="docClass">render</a>.</p> %}
    *)
  method renderTpl : _ Js.t Js.prop
  (** {% <p>An <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a> used to create the internal structure inside this Component's encapsulating
<a href="#!/api/Ext.AbstractComponent-method-getEl" rel="Ext.AbstractComponent-method-getEl" class="docClass">Element</a>.</p>

<p>You do not normally need to specify this. For the base classes <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> and
<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>, this defaults to <strong><code>null</code></strong> which means that they will be initially rendered
with no internal structure; they render their <a href="#!/api/Ext.AbstractComponent-method-getEl" rel="Ext.AbstractComponent-method-getEl" class="docClass">Element</a> empty. The more specialized ExtJS and Touch
classes which use a more complex DOM structure, provide their own template definitions.</p>

<p>This is intended to allow the developer to create application-specific utility Components with customized
internal structure.</p>

<p>Upon rendering, any created child elements may be automatically imported into object properties using the
<a href="#!/api/Ext.AbstractComponent-cfg-renderSelectors" rel="Ext.AbstractComponent-cfg-renderSelectors" class="docClass">renderSelectors</a> and <a href="#!/api/Ext.AbstractComponent-cfg-childEls" rel="Ext.AbstractComponent-cfg-childEls" class="docClass">childEls</a> options.</p> %}
    
    Defaults to: ['{%this.renderContent(out,values)%}']
    *)
  method shrinkWrap : _ Js.t Js.prop
  (** {% <p>If this property is a number, it is interpreted as follows:</p>

<ul>
<li>0: Neither width nor height depend on content. This is equivalent to <code>false</code>.</li>
<li>1: Width depends on content (shrink wraps), but height does not.</li>
<li>2: Height depends on content (shrink wraps), but width does not. The default.</li>
<li>3: Both width and height depend on content (shrink wrap). This is equivalent to <code>true</code>.</li>
</ul>


<p>In CSS terms, shrink-wrap width is analogous to an inline-block element as opposed
to a block-level element. Some container layouts always shrink-wrap their children,
effectively ignoring this property (e.g., <a href="#!/api/Ext.layout.container.HBox" rel="Ext.layout.container.HBox" class="docClass">Ext.layout.container.HBox</a>,
<a href="#!/api/Ext.layout.container.VBox" rel="Ext.layout.container.VBox" class="docClass">Ext.layout.container.VBox</a>, <a href="#!/api/Ext.layout.component.Dock" rel="Ext.layout.component.Dock" class="docClass">Ext.layout.component.Dock</a>).</p> %}
    
    Defaults to: [2]
    *)
  method style : _ Js.t Js.prop
  (** {% <p>A custom style specification to be applied to this component's Element. Should be a valid argument to
<a href="#!/api/Ext.dom.Element-method-applyStyles" rel="Ext.dom.Element-method-applyStyles" class="docClass">Ext.Element.applyStyles</a>.</p>

<pre><code>new <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>({
    title: 'Some Title',
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    width: 400, height: 300,
    layout: 'form',
    items: [{
        xtype: 'textarea',
        style: {
            width: '95%',
            marginBottom: '10px'
        }
    },
    new <a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>({
        text: 'Send',
        minWidth: '100',
        style: {
            marginBottom: '10px'
        }
    })
    ]
});
</code></pre> %}
    *)
  method styleHtmlCls : Js.js_string Js.t Js.prop
  (** {% <p>The class that is added to the content target when you set styleHtmlContent to true.</p> %}
    
    Defaults to: ['x-html']
    *)
  method styleHtmlContent : bool Js.t Js.prop
  (** {% <p>True to automatically style the html inside the content target of this component (body for panels).</p> %}
    
    Defaults to: [false]
    *)
  method tpl : _ Js.t Js.prop
  (** {% <p>An <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template</a>, <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">Ext.XTemplate</a> or an array of strings to form an <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">Ext.XTemplate</a>. Used in
conjunction with the <code><a href="#!/api/Ext.AbstractComponent-cfg-data" rel="Ext.AbstractComponent-cfg-data" class="docClass">data</a></code> and <code><a href="#!/api/Ext.AbstractComponent-cfg-tplWriteMode" rel="Ext.AbstractComponent-cfg-tplWriteMode" class="docClass">tplWriteMode</a></code> configurations.</p> %}
    *)
  method tplWriteMode : Js.js_string Js.t Js.prop
  (** {% <p>The Ext.(X)Template method to use when updating the content area of the Component.
See <code><a href="#!/api/Ext.XTemplate-method-overwrite" rel="Ext.XTemplate-method-overwrite" class="docClass">Ext.XTemplate.overwrite</a></code> for information on default mode.</p> %}
    
    Defaults to: ['overwrite']
    *)
  method ui : Js.js_string Js.t Js.prop
  (** {% <p>A UI style for a component.</p> %}
    
    Defaults to: ['default']
    *)
  method width : Js.number Js.t Js.prop
  (** {% <p>The width of this component in pixels.</p> %}
    *)
  method xtype : Js.js_string Js.t Js.prop
  (** {% <p>This property provides a shorter alternative to creating objects than using a full
class name. Using <code>xtype</code> is the most common way to define component instances,
especially in a container. For example, the items in a form containing text fields
could be created explicitly like so:</p>

<pre><code> items: [
     <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.form.field.Text" rel="Ext.form.field.Text" class="docClass">Ext.form.field.Text</a>', {
         fieldLabel: 'Foo'
     }),
     <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.form.field.Text" rel="Ext.form.field.Text" class="docClass">Ext.form.field.Text</a>', {
         fieldLabel: 'Bar'
     }),
     <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.form.field.Number" rel="Ext.form.field.Number" class="docClass">Ext.form.field.Number</a>', {
         fieldLabel: 'Num'
     })
 ]
</code></pre>

<p>But by using <code>xtype</code>, the above becomes:</p>

<pre><code> items: [
     {
         xtype: 'textfield',
         fieldLabel: 'Foo'
     },
     {
         xtype: 'textfield',
         fieldLabel: 'Bar'
     },
     {
         xtype: 'numberfield',
         fieldLabel: 'Num'
     }
 ]
</code></pre>

<p>When the <code>xtype</code> is common to many items, <a href="#!/api/Ext.container.AbstractContainer-cfg-defaultType" rel="Ext.container.AbstractContainer-cfg-defaultType" class="docClass">Ext.container.AbstractContainer.defaultType</a>
is another way to specify the <code>xtype</code> for all items that don't have an explicit <code>xtype</code>:</p>

<pre><code> defaultType: 'textfield',
 items: [
     { fieldLabel: 'Foo' },
     { fieldLabel: 'Bar' },
     { fieldLabel: 'Num', xtype: 'numberfield' }
 ]
</code></pre>

<p>Each member of the <code>items</code> array is now just a "configuration object". These objects
are used to create and configure component instances. A configuration object can be
manually used to instantiate a component using <a href="#!/api/Ext-method-widget" rel="Ext-method-widget" class="docClass">Ext.widget</a>:</p>

<pre><code> var text1 = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.form.field.Text" rel="Ext.form.field.Text" class="docClass">Ext.form.field.Text</a>', {
     fieldLabel: 'Foo'
 });

 // or alternatively:

 var text1 = <a href="#!/api/Ext-method-widget" rel="Ext-method-widget" class="docClass">Ext.widget</a>({
     xtype: 'textfield',
     fieldLabel: 'Foo'
 });
</code></pre>

<p>This conversion of configuration objects into instantiated components is done when
a container is created as part of its {<a href="#!/api/Ext.container.AbstractContainer-method-initComponent" rel="Ext.container.AbstractContainer-method-initComponent" class="docClass">Ext.container.AbstractContainer.initComponent</a>}
process. As part of the same process, the <code>items</code> array is converted from its raw
array form into a <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a> instance.</p>

<p>You can define your own <code>xtype</code> on a custom <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">component</a> by specifying
the <code>xtype</code> property in <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>. For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.PressMeButton', {
    extend: '<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>',
    xtype: 'pressmebutton',
    text: 'Press Me'
});
</code></pre>

<p>Care should be taken when naming an <code>xtype</code> in a custom component because there is
a single, shared scope for all xtypes. Third part components should consider using
a prefix to avoid collisions.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Foo.form.CoolButton', {
    extend: '<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>',
    xtype: 'ux-coolbutton',
    text: 'Cool!'
});
</code></pre> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_state_Stateful.events
  inherit Ext_util_Animate.events
  inherit Ext_util_ElementContainer.events
  inherit Ext_util_Observable.events
  inherit Ext_util_Renderable.events
  
  method activate : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after a Component has been visually activated.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method added : (t Js.t -> _ Js.t -> Js.number Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires after a Component had been added to a Container.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- container: [#Ext_container_Container.t Js.t]
    {% <p>Parent Container</p> %}
    }
    {- pos: [Js.number Js.t]
    {% <p>position of Component</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method afterrender : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after the component rendering is finished.</p>

<p>The afterrender event is fired after this Component has been <a href="#!/api/Ext.AbstractComponent-property-rendered" rel="Ext.AbstractComponent-property-rendered" class="docClass">rendered</a>, been postprocesed by any
afterRender method defined for the Component.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeactivate : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before a Component has been visually activated. Returning false from an event listener can prevent
the activate from occurring.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforedeactivate : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before a Component has been visually deactivated. Returning false from an event listener can
prevent the deactivate from occurring.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforedestroy : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before the component is <a href="#!/api/Ext.AbstractComponent-method-destroy" rel="Ext.AbstractComponent-method-destroy" class="docClass">destroy</a>ed. Return false from an event handler to stop the
<a href="#!/api/Ext.AbstractComponent-method-destroy" rel="Ext.AbstractComponent-method-destroy" class="docClass">destroy</a>.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforehide : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before the component is hidden when calling the <a href="#!/api/Ext.Component-method-hide" rel="Ext.Component-method-hide" class="docClass">hide</a> method. Return false from an event
handler to stop the hide.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforerender : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before the component is <a href="#!/api/Ext.AbstractComponent-property-rendered" rel="Ext.AbstractComponent-property-rendered" class="docClass">rendered</a>. Return false from an event handler to stop the
<a href="#!/api/Ext.AbstractComponent-method-render" rel="Ext.AbstractComponent-method-render" class="docClass">render</a>.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeshow : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before the component is shown when calling the <a href="#!/api/Ext.Component-method-show" rel="Ext.Component-method-show" class="docClass">show</a> method. Return false from an event
handler to stop the show.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method blur : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when this Component loses focus.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- the: [Ext_EventObject.t Js.t]
    {% <p>blur event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method boxready : (t Js.t -> Js.number Js.t -> Js.number Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires <em>one time</em> - after the component has been layed out for the first time at its initial size.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- width: [Js.number Js.t]
    {% <p>The initial width</p> %}
    }
    {- height: [Js.number Js.t]
    {% <p>The initial height</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method deactivate : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after a Component has been visually deactivated.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method destroy : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the component is <a href="#!/api/Ext.AbstractComponent-method-destroy" rel="Ext.AbstractComponent-method-destroy" class="docClass">destroy</a>ed.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method disable : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the component is disabled.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method enable : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the component is enabled.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method focus : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when this Component receives focus.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- the: [Ext_EventObject.t Js.t]
    {% <p>focus event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method hide : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the component is hidden. Fires after the component is hidden when calling the <a href="#!/api/Ext.Component-method-hide" rel="Ext.Component-method-hide" class="docClass">hide</a>
method.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method move : (t Js.t -> Js.number Js.t -> Js.number Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the component is moved.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- x: [Js.number Js.t]
    {% <p>The new x position</p> %}
    }
    {- y: [Js.number Js.t] {% <p>The new y position</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method removed : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a component is removed from an <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a></p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- ownerCt: [#Ext_container_Container.t Js.t]
    {% <p>Container which holds the component</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method render : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the component markup is <a href="#!/api/Ext.AbstractComponent-property-rendered" rel="Ext.AbstractComponent-property-rendered" class="docClass">rendered</a>.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method resize : (t Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after the component is resized. Note that this does <em>not</em> fire when the component is first layed out at its initial
size. To hook that point in the lifecycle, use the <a href="#!/api/Ext.AbstractComponent-event-boxready" rel="Ext.AbstractComponent-event-boxready" class="docClass">boxready</a> event.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
    }
    {- width: [Js.number Js.t]
    {% <p>The new width that was set</p> %}
    }
    {- height: [Js.number Js.t]
    {% <p>The new height that was set</p> %}
    }
    {- oldWidth: [Js.number Js.t]
    {% <p>The previous width</p> %}
    }
    {- oldHeight: [Js.number Js.t]
    {% <p>The previous height</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method show : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the component is shown when calling the <a href="#!/api/Ext.Component-method-show" rel="Ext.Component-method-show" class="docClass">show</a> method.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_Component.t Js.t]
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
  inherit Ext_state_Stateful.statics
  inherit Ext_util_Animate.statics
  inherit Ext_util_ElementContainer.statics
  inherit Ext_util_Observable.statics
  inherit Ext_util_Renderable.statics
  
  method cancelLayout : 'self Js.t -> unit Js.meth
  (** {% <p>Cancels layout of a component.</p> %}
    
    {b Parameters}:
    {ul {- comp: [#Ext_Component.t Js.t]
    }
    }
    *)
  method flushLayouts : unit Js.meth
  (** {% <p>Performs all pending layouts that were sceduled while
<a href="#!/api/Ext.AbstractComponent-method-suspendLayouts" rel="Ext.AbstractComponent-method-suspendLayouts" class="docClass">suspendLayouts</a> was in effect.</p> %}
    *)
  method resumeLayouts : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Resumes layout activity in the whole framework.</p>

<p><a href="#!/api/Ext-method-suspendLayouts" rel="Ext-method-suspendLayouts" class="docClass">Ext.suspendLayouts</a> is alias of <a href="#!/api/Ext.AbstractComponent-method-suspendLayouts" rel="Ext.AbstractComponent-method-suspendLayouts" class="docClass">suspendLayouts</a>.</p> %}
    
    {b Parameters}:
    {ul {- flush: [bool Js.t] (optional)
    {% <p>True to perform all the pending layouts. This can also be
achieved by calling <a href="#!/api/Ext.AbstractComponent-static-method-flushLayouts" rel="Ext.AbstractComponent-static-method-flushLayouts" class="docClass">flushLayouts</a> directly.</p> %}
     Defaults to: false
    }
    }
    *)
  method suspendLayouts : unit Js.meth
  (** {% <p>Stops layouts from happening in the whole framework.</p>

<p>It's useful to suspend the layout activity while updating multiple components and
containers:</p>

<pre><code><a href="#!/api/Ext-method-suspendLayouts" rel="Ext-method-suspendLayouts" class="docClass">Ext.suspendLayouts</a>();
// batch of updates...
<a href="#!/api/Ext-method-resumeLayouts" rel="Ext-method-resumeLayouts" class="docClass">Ext.resumeLayouts</a>(true);
</code></pre>

<p><a href="#!/api/Ext-method-suspendLayouts" rel="Ext-method-suspendLayouts" class="docClass">Ext.suspendLayouts</a> is alias of <a href="#!/api/Ext.AbstractComponent-method-suspendLayouts" rel="Ext.AbstractComponent-method-suspendLayouts" class="docClass">suspendLayouts</a>.</p>

<p>See also <a href="#!/api/Ext-method-batchLayouts" rel="Ext-method-batchLayouts" class="docClass">Ext.batchLayouts</a> for more abstract way of doing this.</p> %}
    *)
  method updateLayout : 'self Js.t -> bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Updates layout of a component.</p> %}
    
    {b Parameters}:
    {ul {- comp: [#Ext_Component.t Js.t]
    {% <p>The component to update.</p> %}
    }
    {- defer: [bool Js.t] (optional)
    {% <p>True to just queue the layout if this component.</p> %}
     Defaults to: false
    }
    }
    *)
  
end

val static : statics Js.t
(** Static instance. *)

val cancelLayout : 'self Js.t -> unit
(** See method [statics.cancelLayout] *)

val flushLayouts : unit -> unit
(** See method [statics.flushLayouts] *)

val resumeLayouts : bool Js.t Js.optdef -> unit
(** See method [statics.resumeLayouts] *)

val suspendLayouts : unit -> unit
(** See method [statics.suspendLayouts] *)

val updateLayout : 'self Js.t -> bool Js.t Js.optdef -> unit
(** See method [statics.updateLayout] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

