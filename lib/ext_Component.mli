(** Base class for all Ext components.The Component ba ...
  
  {% <p>Base class for all Ext components.</p>

<p>The Component base class has built-in support for basic hide/show and enable/disable and size control behavior.</p>

<h2>xtypes</h2>

<p>Every component has a specific xtype, which is its Ext-specific type name, along with methods for checking the xtype
like <a href="#!/api/Ext.Component-method-getXType" rel="Ext.Component-method-getXType" class="docClass">getXType</a> and <a href="#!/api/Ext.Component-method-isXType" rel="Ext.Component-method-isXType" class="docClass">isXType</a>. See the <a href="#!/guide/components">Component Guide</a> for more information on xtypes and the
Component hierarchy.</p>

<h2>Finding components</h2>

<p>All Components are registered with the <a href="#!/api/Ext.ComponentManager" rel="Ext.ComponentManager" class="docClass">Ext.ComponentManager</a> on construction so that they can be referenced at
any time via <a href="#!/api/Ext-method-getCmp" rel="Ext-method-getCmp" class="docClass">Ext.getCmp</a>, passing the <a href="#!/api/Ext.Component-cfg-id" rel="Ext.Component-cfg-id" class="docClass">id</a>.</p>

<p>Additionally the <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> provides a CSS-selectors-like way to look up components by their xtype
and many other attributes.  For example the following code will find all textfield components inside component with
<code>id: 'myform'</code>:</p>

<pre><code><a href="#!/api/Ext.ComponentQuery-method-query" rel="Ext.ComponentQuery-method-query" class="docClass">Ext.ComponentQuery.query</a>('#myform textfield');
</code></pre>

<h2>Extending <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a></h2>

<p>All subclasses of Component may participate in the automated Ext component
lifecycle of creation, rendering and destruction which is provided by the <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a>
class. Components may be added to a Container through the <a href="#!/api/Ext.container.Container-cfg-items" rel="Ext.container.Container-cfg-items" class="docClass">items</a> config option
at the time the Container is created, or they may be added dynamically via the
<a href="#!/api/Ext.container.Container-method-add" rel="Ext.container.Container-method-add" class="docClass">add</a> method.</p>

<p>All user-developed visual widgets that are required to participate in automated lifecycle and size management should
subclass Component.</p>

<p>See the Creating new UI controls chapter in <a href="#!/guide/components">Component Guide</a> for details on how and to either extend
or augment Ext JS base classes to create custom Components.</p>

<h2>The <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> class by itself</h2>

<p>Usually one doesn't need to instantiate the <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> class. There are subclasses which implement
specialized use cases, covering most application needs. However it is possible to instantiate a base
Component, and it can be rendered to document, or handled by layouts as the child item of a Container:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>', {
    html: 'Hello world!',
    width: 300,
    height: 200,
    padding: 20,
    style: {
        color: '#FFFFFF',
        backgroundColor:'#000000'
    },
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
});
</code></pre>

<p>The Component above creates its encapsulating <code>div</code> upon render, and use the configured HTML as content. More complex
internal structure may be created using the <a href="#!/api/Ext.Component-cfg-renderTpl" rel="Ext.Component-cfg-renderTpl" class="docClass">renderTpl</a> configuration, although to display database-derived
mass data, it is recommended that an ExtJS data-backed Component such as a <a href="#!/api/Ext.view.View" rel="Ext.view.View" class="docClass">View</a>,
<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">GridPanel</a>, or <a href="#!/api/Ext.tree.Panel" rel="Ext.tree.Panel" class="docClass">TreePanel</a> be used.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_util_Floating.t
  
  method floatParent : _ Js.t Js.readonly_prop
  (** {% <p>Only present for <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components which were inserted as child items of Containers.</p>

<p>Floating Components that are programatically <a href="#!/api/Ext.Component-method-render" rel="Ext.Component-method-render" class="docClass">rendered</a> will not have a <code>floatParent</code>
property.</p>

<p>For <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components which are child items of a Container, the floatParent will be the owning Container.</p>

<p>For example, the dropdown <a href="#!/api/Ext.view.BoundList" rel="Ext.view.BoundList" class="docClass">BoundList</a> of a ComboBox which is in a Window will have the
Window as its <code>floatParent</code></p>

<p>See <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> and <a href="#!/api/Ext.Component-property-zIndexManager" rel="Ext.Component-property-zIndexManager" class="docClass">zIndexManager</a></p> %}
    *)
  method zIndexManager : Ext_ZIndexManager.t Js.t Js.readonly_prop
  (** {% <p>Only present for <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components after they have been rendered.</p>

<p>A reference to the ZIndexManager which is managing this Component's z-index.</p>

<p>The <a href="#!/api/Ext.ZIndexManager" rel="Ext.ZIndexManager" class="docClass">ZIndexManager</a> maintains a stack of floating Component z-indices, and also provides
a single modal mask which is insert just beneath the topmost visible modal floating Component.</p>

<p>Floating Components may be <a href="#!/api/Ext.Component-method-toFront" rel="Ext.Component-method-toFront" class="docClass">brought to the front</a> or <a href="#!/api/Ext.Component-method-toBack" rel="Ext.Component-method-toBack" class="docClass">sent to the back</a> of the
z-index stack.</p>

<p>This defaults to the global <a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">ZIndexManager</a> for floating Components that are
programatically <a href="#!/api/Ext.Component-method-render" rel="Ext.Component-method-render" class="docClass">rendered</a>.</p>

<p>For <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components which are added to a Container, the ZIndexManager is acquired from the first
ancestor Container found which is floating. If no floating ancestor is found, the global <a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">ZIndexManager</a> is
used.</p>

<p>See <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> and <a href="#!/api/Ext.Component-property-zIndexParent" rel="Ext.Component-property-zIndexParent" class="docClass">zIndexParent</a></p> %}
    *)
  method zIndexParent : _ Js.t Js.readonly_prop
  (** {% <p>Only present for <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components which were inserted as child items of Containers, and which have a floating
Container in their containment ancestry.</p>

<p>For <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components which are child items of a Container, the zIndexParent will be a floating
ancestor Container which is responsible for the base z-index value of all its floating descendants. It provides
a <a href="#!/api/Ext.ZIndexManager" rel="Ext.ZIndexManager" class="docClass">ZIndexManager</a> which provides z-indexing services for all its descendant floating
Components.</p>

<p>Floating Components that are programatically <a href="#!/api/Ext.Component-method-render" rel="Ext.Component-method-render" class="docClass">rendered</a> will not have a <code>zIndexParent</code>
property.</p>

<p>For example, the dropdown <a href="#!/api/Ext.view.BoundList" rel="Ext.view.BoundList" class="docClass">BoundList</a> of a ComboBox which is in a Window will have the
Window as its <code>zIndexParent</code>, and will always show above that Window, wherever the Window is placed in the z-index stack.</p>

<p>See <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> and <a href="#!/api/Ext.Component-property-zIndexManager" rel="Ext.Component-property-zIndexManager" class="docClass">zIndexManager</a></p> %}
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
  method afterHide : _ Js.callback Js.optdef -> _ Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Invoked after the Component has been hidden.</p>

<p>Gets passed the same <code>callback</code> and <code>scope</code> parameters that <a href="#!/api/Ext.Component-method-onHide" rel="Ext.Component-method-onHide" class="docClass">onHide</a> received.</p> %}
    
    {b Parameters}:
    {ul {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method afterRender : unit Js.meth
  (** {% <p>private</p>

<p>Allows addition of behavior after rendering is complete. At this stage the Component’s Element
will have been styled according to the configuration, will have had any configured CSS class
names added, and will be in the configured visibility and the configured enable state.</p> %}
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
  method afterShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Invoked after the Component is shown (after <a href="#!/api/Ext.Component-method-onShow" rel="Ext.Component-method-onShow" class="docClass">onShow</a> is called).</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.Component-event-show" rel="Ext.Component-event-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method beforeShow : unit Js.meth
  (** {% <p>Invoked before the Component is shown.</p> %}
    *)
  method bubble : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Bubbles up the component/container heirarchy, calling the specified function with each component. The scope
(<em>this</em>) of function call will be the scope provided or the current component. The arguments to the function will
be the args provided or the current component. If the function returns false at any point, the bubble is stopped.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to call</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope of the function. Defaults to current node.</p> %}
    }
    {- args: [_ Js.js_array Js.t] (optional)
    {% <p>The args to call the function with. Defaults to passing the current component.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method cancelFocus : unit Js.meth
  (** {% <p>Cancel any deferred focus on this component</p> %}
    *)
  method cloneConfig : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Clone the current component using the original config values passed into this instance by default.</p> %}
    
    {b Parameters}:
    {ul {- overrides: [_ Js.t]
    {% <p>A new config containing any properties to override in the cloned version.
An id property can be passed on this object, otherwise one will be generated to avoid duplicates.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>clone The cloned copy of this component</p> %}
    }
    }
    *)
  method findParentBy : _ Js.callback -> _ Js.t Js.meth
  (** {% <p>Find a container above this component at any level by a custom function. If the passed function returns true, the
container will be returned.</p>

<p>See also the <a href="#!/api/Ext.Component-method-up" rel="Ext.Component-method-up" class="docClass">up</a> method.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The custom function to call with the arguments (container, this component).</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_container_Container.t Js.t]
    {% <p>The first Container for which the custom function returns true</p> %}
    }
    }
    *)
  method findParentByType : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Find a container above this component at any level by xtype or class</p>

<p>See also the <a href="#!/api/Ext.Component-method-up" rel="Ext.Component-method-up" class="docClass">up</a> method.</p> %}
    
    {b Parameters}:
    {ul {- xtype: [_ Js.t]
    {% <p>The xtype string for a component, or the class of the component directly</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_container_Container.t Js.t]
    {% <p>The first Container which matches the given xtype or class</p> %}
    }
    }
    *)
  method focus : bool Js.t Js.optdef -> _ Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Try to focus this component.</p> %}
    
    {b Parameters}:
    {ul {- selectText: [bool Js.t] (optional)
    {% <p>If applicable, true to also select the text in this component</p> %}
    }
    {- delay: [_ Js.t] (optional)
    {% <p>Delay the focus this number of milliseconds (true for 10 milliseconds).</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The focused Component. Usually <code>this</code> Component. Some Containers may
delegate focus to a descendant Component (<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s can do this through their
<a href="#!/api/Ext.window.Window-cfg-defaultFocus" rel="Ext.window.Window-cfg-defaultFocus" class="docClass">defaultFocus</a> config option.</p> %}
    }
    }
    *)
  method getBox : bool Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Gets the current box measurements of the component's underlying element.</p> %}
    
    {b Parameters}:
    {ul {- local: [bool Js.t] (optional)
    {% <p>If true the element's left and top are returned instead of page XY.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>box An object in the format {x, y, width, height}</p> %}
    }
    }
    *)
  method getBubbleTarget : _ Js.t Js.meth
  (** {% <p>The up() method uses this to find the immediate owner.</p>

<p>Provides the link for Observable's fireEvent method to bubble up the ownership hierarchy.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_container_Container.t Js.t]
    {% <p>the Container which owns this Component.</p> %}
    }
    }
    *)
  method getEl : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Retrieves the top level element representing this component.</p> %}
    *)
  method getId : Js.js_string Js.t Js.meth
  (** {% <p>Retrieves the id of this component. Will autogenerate an id if one has not already been set.</p> %}
    *)
  method getPosition : bool Js.t Js.optdef -> Js.number Js.t Js.js_array Js.t
    Js.meth
  (** {% <p>Gets the current XY position of the component's underlying element.</p> %}
    
    {b Parameters}:
    {ul {- local: [bool Js.t] (optional)
    {% <p>If true the element's left and top are returned instead of page XY.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t]
    {% <p>The XY position of the element (e.g., [100, 200])</p> %}
    }
    }
    *)
  method getXType : Js.js_string Js.t Js.meth
  (** {% <p>Gets the xtype for this component as registered with <a href="#!/api/Ext.ComponentManager" rel="Ext.ComponentManager" class="docClass">Ext.ComponentManager</a>. For a list of all available
xtypes, see the <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> header. Example usage:</p>

<pre><code>var t = new <a href="#!/api/Ext.form.field.Text" rel="Ext.form.field.Text" class="docClass">Ext.form.field.Text</a>();
alert(t.getXType());  // alerts 'textfield'
</code></pre> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The xtype</p> %}
    }
    }
    *)
  method hide : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Hides this Component, setting it to invisible using the configured <a href="#!/api/Ext.Component-cfg-hideMode" rel="Ext.Component-cfg-hideMode" class="docClass">hideMode</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    {% <p><strong>only valid for <a href="#!/api/Ext.window.MessageBox-cfg-floating" rel="Ext.window.MessageBox-cfg-floating" class="docClass">floating</a> Components
such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s or <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">ToolTip</a>s, or regular Components which have
been configured with <code>floating: true</code>.</strong>. The target to which the Component should animate while hiding.</p> %}
     Defaults to: null
    }
    {- callback: [_ Js.callback] (optional)
    {% <p>A callback function to call after the Component is hidden.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the callback is executed.
Defaults to this Component.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
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
  (** {% <p>Allows addition of behavior to the destroy operation.
After calling the superclass’s onDestroy, the Component will be destroyed.</p> %}
    *)
  method onHide : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Possibly animates down to a target element.</p>

<p>Allows addition of behavior to the hide operation. After
calling the superclass’s onHide, the Component will be hidden.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.Component-method-hide" rel="Ext.Component-method-hide" class="docClass">hide</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method onResize : unit Js.meth
  (** {% <p>Deprecate 5.0</p>

<p>Allows addition of behavior to the resize operation.</p>

<p>Called when Ext.resizer.Resizer#drag event is fired.</p> %}
    *)
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Allows addition of behavior to the show operation. After
calling the superclass's onShow, the Component will be visible.</p>

<p>Override in subclasses where more complex behaviour is needed.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.Component-event-show" rel="Ext.Component-event-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method onShowComplete : _ Js.callback Js.optdef -> _ Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Invoked after the <a href="#!/api/Ext.Component-method-afterShow" rel="Ext.Component-method-afterShow" class="docClass">afterShow</a> method is complete.</p>

<p>Gets passed the same <code>callback</code> and <code>scope</code> parameters that <a href="#!/api/Ext.Component-method-afterShow" rel="Ext.Component-method-afterShow" class="docClass">afterShow</a> received.</p> %}
    
    {b Parameters}:
    {ul {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method scrollBy : _ Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Scrolls this Component's <a href="#!/api/Ext.Component-method-getTargetEl" rel="Ext.Component-method-getTargetEl" class="docClass">target element</a> by the passed delta values, optionally animating.</p>

<p>All of the following are equivalent:</p>

<pre><code> comp.scrollBy(10, 10, true);
 comp.scrollBy([10, 10], true);
 comp.scrollBy({ x: 10, y: 10 }, true);
</code></pre> %}
    
    {b Parameters}:
    {ul {- deltaX: [_ Js.t]
    {% <p>Either the x delta, an Array specifying x and y deltas or
an object with "x" and "y" properties.</p> %}
    }
    {- deltaY: [_ Js.t]
    {% <p>Either the y delta, or an animate flag or config object.</p> %}
    }
    {- animate: [_ Js.t]
    {% <p>Animate flag/config object if the delta values were passed separately.</p> %}
    }
    }
    *)
  method setAutoScroll : bool Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the overflow on the content element of the component.</p> %}
    
    {b Parameters}:
    {ul {- scroll: [bool Js.t]
    {% <p>True to allow the Component to auto scroll.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setLoading : _ Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>This method allows you to show or hide a LoadMask on top of this component.</p> %}
    
    {b Parameters}:
    {ul {- load: [_ Js.t]
    {% <p>True to show the default LoadMask, a config object that will be passed to the
LoadMask constructor, or a message String to show. False to hide the current LoadMask.</p> %}
    }
    {- targetEl: [bool Js.t] (optional)
    {% <p>True to mask the targetEl of this Component instead of the <code>this.el</code>. For example,
setting this to true on a Panel will cause only the body to be masked.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Ext_LoadMask.t Js.t]
    {% <p>The LoadMask instance that has just been shown.</p> %}
    }
    }
    *)
  method setOverflowXY : Js.js_string Js.t -> Js.js_string Js.t -> 'self Js.t
    Js.meth
  (** {% <p>Sets the overflow x/y on the content element of the component. The x/y overflow
values can be any valid CSS overflow (e.g., 'auto' or 'scroll'). By default, the
value is 'hidden'. Passing null for one of the values will erase the inline style.
Passing <code>undefined</code> will preserve the current value.</p> %}
    
    {b Parameters}:
    {ul {- overflowX: [Js.js_string Js.t]
    {% <p>The overflow-x value.</p> %}
    }
    {- overflowY: [Js.js_string Js.t]
    {% <p>The overflow-y value.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setPagePosition : Js.number Js.t -> Js.number Js.t ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the page XY position of the component. To set the left and top instead, use <a href="#!/api/Ext.Component-method-setPosition" rel="Ext.Component-method-setPosition" class="docClass">setPosition</a>.
This method fires the <a href="#!/api/Ext.Component-event-move" rel="Ext.Component-event-move" class="docClass">move</a> event.</p> %}
    
    {b Parameters}:
    {ul {- x: [Js.number Js.t]
    {% <p>The new x position</p> %}
    }
    {- y: [Js.number Js.t]
    {% <p>The new y position</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>True to animate the Component into its new position. You may also pass an
animation configuration.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method show : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Shows this Component, rendering it first if <a href="#!/api/Ext.Component-cfg-autoRender" rel="Ext.Component-cfg-autoRender" class="docClass">autoRender</a> or <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> are <code>true</code>.</p>

<p>After being shown, a <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Component (such as a <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>), is activated it and
brought to the front of its <a href="#!/api/Ext.Component-property-zIndexManager" rel="Ext.Component-property-zIndexManager" class="docClass">z-index stack</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    {% <p><strong>only valid for <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s or <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">ToolTip</a>s, or regular Components which have been configured
with <code>floating: true</code>.</strong> The target from which the Component should animate from while opening.</p> %}
     Defaults to: null
    }
    {- callback: [_ Js.callback] (optional)
    {% <p>A callback function to call after the Component is displayed.
Only necessary if animation was specified.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the callback is executed.
Defaults to this Component.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method showAt : Js.number Js.t -> Js.number Js.t -> _ Js.t Js.optdef ->
    unit Js.meth
  (** {% <p>Displays component at specific xy position.
A floating component (like a menu) is positioned relative to its ownerCt if any.
Useful for popping up a context menu:</p>

<pre><code>listeners: {
    itemcontextmenu: function(view, record, item, index, event, options) {
        <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">Ext.menu.Menu</a>', {
            width: 100,
            height: 100,
            margin: '0 0 10 0',
            items: [{
                text: 'regular item 1'
            },{
                text: 'regular item 2'
            },{
                text: 'regular item 3'
            }]
        }).showAt(event.getXY());
    }
}
</code></pre> %}
    
    {b Parameters}:
    {ul {- x: [Js.number Js.t]
    {% <p>The new x position</p> %}
    }
    {- y: [Js.number Js.t]
    {% <p>The new y position</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>True to animate the Component into its new position. You may also pass an
animation configuration.</p> %}
    }
    }
    *)
  method updateBox : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the current box measurements of the component's underlying element.</p> %}
    
    {b Parameters}:
    {ul {- box: [_ Js.t]
    {% <p>An object in the format {x, y, width, height}</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_util_Floating.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterComponentLayout] *)
  method afterHide : ('self Js.t, _ Js.callback Js.optdef -> _ Js.t Js.optdef
    -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.afterHide] *)
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterRender] *)
  method afterSetPosition : ('self Js.t, Js.number Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.afterSetPosition] *)
  method afterShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef
    -> _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.afterShow] *)
  method beforeShow : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeShow] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDestroy] *)
  method onHide : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onHide] *)
  method onResize : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onResize] *)
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onShow] *)
  method onShowComplete : ('self Js.t, _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onShowComplete] *)
  method autoScroll : bool Js.t Js.prop
  (** {% <p><code>true</code> to use overflow:'auto' on the components layout element and show scroll bars automatically when necessary,
<code>false</code> to clip any overflowing content.
This should not be combined with <a href="#!/api/Ext.Component-cfg-overflowX" rel="Ext.Component-cfg-overflowX" class="docClass">overflowX</a> or  <a href="#!/api/Ext.Component-cfg-overflowY" rel="Ext.Component-cfg-overflowY" class="docClass">overflowY</a>.</p> %}
    
    Defaults to: [false]
    *)
  method columnWidth : _ Js.t Js.prop
  (** {% <p>Defines the column width inside <a href="#!/api/Ext.layout.container.Column" rel="Ext.layout.container.Column" class="docClass">column layout</a>.</p>

<p>Can be specified as a number or as a percentage.</p> %}
    
    Defaults to: [undefined]
    *)
  method draggable_obj : _ Js.t Js.prop
  (** {% <p>Specify as true to make a <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Component draggable using the Component's encapsulating element as
the drag handle.</p>

<p>This may also be specified as a config object for the <a href="#!/api/Ext.util.ComponentDragger" rel="Ext.util.ComponentDragger" class="docClass">ComponentDragger</a> which is
instantiated to perform dragging.</p>

<p>For example to create a Component which may only be dragged around using a certain internal element as the drag
handle, use the delegate option:</p>

<pre><code>new <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>({
    constrain: true,
    floating: true,
    style: {
        backgroundColor: '#fff',
        border: '1px solid black'
    },
    html: '&lt;h1 style="cursor:move"&gt;The title&lt;/h1&gt;&lt;p&gt;The content&lt;/p&gt;',
    draggable: {
        delegate: 'h1'
    }
}).show();
</code></pre> %}
    
    Defaults to: [false]
    *)
  method floating : bool Js.t Js.prop
  (** {% <p>Specify as true to float the Component outside of the document flow using CSS absolute positioning.</p>

<p>Components such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s and <a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">Menu</a>s are floating by default.</p>

<p>Floating Components that are programatically <a href="#!/api/Ext.Component-method-render" rel="Ext.Component-method-render" class="docClass">rendered</a> will register
themselves with the global <a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">ZIndexManager</a></p>

<h3>Floating Components as child items of a Container</h3>

<p>A floating Component may be used as a child item of a Container. This just allows the floating Component to seek
a ZIndexManager by examining the ownerCt chain.</p>

<p>When configured as floating, Components acquire, at render time, a <a href="#!/api/Ext.ZIndexManager" rel="Ext.ZIndexManager" class="docClass">ZIndexManager</a> which
manages a stack of related floating Components. The ZIndexManager brings a single floating Component to the top
of its stack when the Component's <a href="#!/api/Ext.Component-method-toFront" rel="Ext.Component-method-toFront" class="docClass">toFront</a> method is called.</p>

<p>The ZIndexManager is found by traversing up the <a href="#!/api/Ext.Component-property-ownerCt" rel="Ext.Component-property-ownerCt" class="docClass">ownerCt</a> chain to find an ancestor which itself is
floating. This is so that descendant floating Components of floating <em>Containers</em> (Such as a ComboBox dropdown
within a Window) can have its zIndex managed relative to any siblings, but always <strong>above</strong> that floating
ancestor Container.</p>

<p>If no floating ancestor is found, a floating Component registers itself with the default <a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">ZIndexManager</a>.</p>

<p>Floating components <em>do not participate in the Container's layout</em>. Because of this, they are not rendered until
you explicitly <a href="#!/api/Ext.Component-method-show" rel="Ext.Component-method-show" class="docClass">show</a> them.</p>

<p>After rendering, the ownerCt reference is deleted, and the <a href="#!/api/Ext.Component-property-floatParent" rel="Ext.Component-property-floatParent" class="docClass">floatParent</a> property is set to the found
floating ancestor Container. If no floating ancestor Container was found the <a href="#!/api/Ext.Component-property-floatParent" rel="Ext.Component-property-floatParent" class="docClass">floatParent</a> property will
not be set.</p> %}
    
    Defaults to: [false]
    *)
  method formBind : bool Js.t Js.prop
  (** {% <p>When inside FormPanel, any component configured with <code>formBind: true</code> will
be enabled/disabled depending on the validity state of the form.
See <a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a> for more information and example.</p> %}
    
    Defaults to: [false]
    *)
  method overflowX : Js.js_string Js.t Js.prop
  (** {% <p>Possible values are:
 * <code>'auto'</code> to enable automatic horizontal scrollbar (overflow-x: 'auto').
 * <code>'scroll'</code> to always enable horizontal scrollbar (overflow-x: 'scroll').
The default is overflow-x: 'hidden'. This should not be combined with <a href="#!/api/Ext.Component-cfg-autoScroll" rel="Ext.Component-cfg-autoScroll" class="docClass">autoScroll</a>.</p> %}
    *)
  method overflowY : Js.js_string Js.t Js.prop
  (** {% <p>Possible values are:
 * <code>'auto'</code> to enable automatic vertical scrollbar (overflow-y: 'auto').
 * <code>'scroll'</code> to always enable vertical scrollbar (overflow-y: 'scroll').
The default is overflow-y: 'hidden'. This should not be combined with <a href="#!/api/Ext.Component-cfg-autoScroll" rel="Ext.Component-cfg-autoScroll" class="docClass">autoScroll</a>.</p> %}
    *)
  method region : Js.js_string Js.t Js.prop
  (** {% <p>Defines the region inside <a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>.</p>

<p>Possible values:</p>

<ul>
<li>center</li>
<li>north</li>
<li>south</li>
<li>east</li>
<li>west</li>
</ul> %}
    
    Defaults to: [undefined]
    *)
  method resizable : _ Js.t Js.prop
  (** {% <p>Specify as <code>true</code> to apply a <a href="#!/api/Ext.resizer.Resizer" rel="Ext.resizer.Resizer" class="docClass">Resizer</a> to this Component after rendering.</p>

<p>May also be specified as a config object to be passed to the constructor of <a href="#!/api/Ext.resizer.Resizer" rel="Ext.resizer.Resizer" class="docClass">Resizer</a>
to override any defaults. By default the Component passes its minimum and maximum size, and uses
<code><a href="#!/api/Ext.resizer.Resizer-cfg-dynamic" rel="Ext.resizer.Resizer-cfg-dynamic" class="docClass">Ext.resizer.Resizer.dynamic</a>: false</code></p> %}
    *)
  method resizeHandles : Js.js_string Js.t Js.prop
  (** {% <p>A valid <a href="#!/api/Ext.resizer.Resizer" rel="Ext.resizer.Resizer" class="docClass">Ext.resizer.Resizer</a> handles config string. Only applies when resizable = true.</p> %}
    
    Defaults to: ['all']
    *)
  method toFrontOnShow : bool Js.t Js.prop
  (** {% <p>True to automatically call <a href="#!/api/Ext.Component-method-toFront" rel="Ext.Component-method-toFront" class="docClass">toFront</a> when the <a href="#!/api/Ext.Component-method-show" rel="Ext.Component-method-show" class="docClass">show</a> method is called on an already visible,
floating component.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_util_Floating.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_util_Floating.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

