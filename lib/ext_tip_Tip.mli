(** This is the base class for Ext.tip.QuickTip and <a ...
  
  {% <p>This is the base class for <a href="#!/api/Ext.tip.QuickTip" rel="Ext.tip.QuickTip" class="docClass">Ext.tip.QuickTip</a> and <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">Ext.tip.ToolTip</a> that provides the basic layout and
positioning that all tip-based classes require. This class can be used directly for simple, statically-positioned
tips that are displayed programmatically, or it can be extended to provide custom tip implementations.</p> %}
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
  method showAt_arr : Js.number Js.t Js.js_array Js.t -> unit Js.meth
  (** {% <p>Shows this tip at the specified XY position.  Example usage:</p>

<pre><code>// Show the tip at x:50 and y:100
tip.showAt([50,100]);
</code></pre> %}
    
    {b Parameters}:
    {ul {- xy: [Js.number Js.t Js.js_array Js.t]
    {% <p>An array containing the x and y coordinates</p> %}
    }
    }
    *)
  method showBy : _ Js.t -> Js.js_string Js.t Js.optdef -> unit Js.meth
  (** {% <p><strong>Experimental</strong>. Shows this tip at a position relative to another element using
a standard <a href="#!/api/Ext.dom.Element-method-alignTo" rel="Ext.dom.Element-method-alignTo" class="docClass">Ext.Element.alignTo</a> anchor position value.  Example usage:</p>

<p>   // Show the tip at the default position ('tl-br?')
   tip.showBy('my-el');</p>

<p>   // Show the tip's top-left corner anchored to the element's top-right corner
   tip.showBy('my-el', 'tl-tr');</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>An HTMLElement, <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> or string
id of the target element to align to.</p> %}
    }
    {- position: [Js.js_string Js.t] (optional)
    {% <p>A valid <a href="#!/api/Ext.dom.Element-method-alignTo" rel="Ext.dom.Element-method-alignTo" class="docClass">Ext.Element.alignTo</a> anchor position.</p>

<p>Defaults to 'tl-br?' or <a href="#!/api/Ext.tip.Tip-cfg-defaultAlign" rel="Ext.tip.Tip-cfg-defaultAlign" class="docClass">defaultAlign</a> if specified.</p> %}
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
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method autoRender_bool : bool Js.t Js.prop
  (** {% <p>private panel overrides</p>

<p>This config is intended mainly for non-<a href="#!/api/Ext.tip.Tip-cfg-floating" rel="Ext.tip.Tip-cfg-floating" class="docClass">floating</a> Components which may or may not be shown. Instead of using
<a href="#!/api/Ext.tip.Tip-cfg-renderTo" rel="Ext.tip.Tip-cfg-renderTo" class="docClass">renderTo</a> in the configuration, and rendering upon construction, this allows a Component to render itself
upon first <em><a href="#!/api/Ext.Component-method-show" rel="Ext.Component-method-show" class="docClass">show</a></em>. If <a href="#!/api/Ext.tip.Tip-cfg-floating" rel="Ext.tip.Tip-cfg-floating" class="docClass">floating</a> is true, the value of this config is omited as if it is <code>true</code>.</p>

<p>Specify as <code>true</code> to have this Component render to the document body upon first show.</p>

<p>Specify as an element, or the ID of an element to have this Component render to a specific element upon first
show.</p> %}
    
    Defaults to: [true]
    *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this panel's element.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'tip']
    *)
  method closable : bool Js.t Js.prop
  (** {% <p>True to render a close tool button into the tooltip header.</p> %}
    
    Defaults to: [false]
    *)
  method closeAction : Js.js_string Js.t Js.prop
  (** {% <p>The action to take when the close header tool is clicked:</p>

<ul>
<li><p><strong><a href="#!/api/Ext.tip.Tip" rel="Ext.tip.Tip" class="docClass">destroy</a></strong> : <a href="#!/api/Ext.tip.Tip-method-remove" rel="Ext.tip.Tip-method-remove" class="docClass">remove</a> the window from the DOM and
<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">destroy</a> it and all descendant Components. The
window will <strong>not</strong> be available to be redisplayed via the <a href="#!/api/Ext.tip.Tip-method-show" rel="Ext.tip.Tip-method-show" class="docClass">show</a> method.</p></li>
<li><p><strong><a href="#!/api/Ext.tip.Tip-method-hide" rel="Ext.tip.Tip-method-hide" class="docClass">hide</a></strong> : <strong>Default.</strong> <a href="#!/api/Ext.tip.Tip-method-hide" rel="Ext.tip.Tip-method-hide" class="docClass">hide</a> the window by setting visibility
to hidden and applying negative offsets. The window will be available to be
redisplayed via the <a href="#!/api/Ext.tip.Tip-method-show" rel="Ext.tip.Tip-method-show" class="docClass">show</a> method.</p></li>
</ul>


<p><strong>Note:</strong> This behavior has changed! setting <em>does</em> affect the <a href="#!/api/Ext.tip.Tip-method-close" rel="Ext.tip.Tip-method-close" class="docClass">close</a> method
which will invoke the approriate closeAction.</p> %}
    
    Defaults to: ['hide']
    *)
  method constrainPosition : bool Js.t Js.prop
  (** {% <p>If true, then the tooltip will be automatically constrained to stay within
the browser viewport.</p> %}
    
    Defaults to: [true]
    *)
  method defaultAlign : Js.js_string Js.t Js.prop
  (** {% <p><strong>Experimental</strong>. The default <a href="#!/api/Ext.dom.Element-method-alignTo" rel="Ext.dom.Element-method-alignTo" class="docClass">Ext.Element.alignTo</a> anchor position value
for this tip relative to its element of origin.</p> %}
    
    Defaults to: ["tl-bl?"]
    *)
  method floating_obj : _ Js.t Js.prop
  (** {% <p>Specify as true to float the Component outside of the document flow using CSS absolute positioning.</p>

<p>Components such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s and <a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">Menu</a>s are floating by default.</p>

<p>Floating Components that are programatically <a href="#!/api/Ext.Component-method-render" rel="Ext.Component-method-render" class="docClass">rendered</a> will register
themselves with the global <a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">ZIndexManager</a></p>

<h3>Floating Components as child items of a Container</h3>

<p>A floating Component may be used as a child item of a Container. This just allows the floating Component to seek
a ZIndexManager by examining the ownerCt chain.</p>

<p>When configured as floating, Components acquire, at render time, a <a href="#!/api/Ext.ZIndexManager" rel="Ext.ZIndexManager" class="docClass">ZIndexManager</a> which
manages a stack of related floating Components. The ZIndexManager brings a single floating Component to the top
of its stack when the Component's <a href="#!/api/Ext.tip.Tip-method-toFront" rel="Ext.tip.Tip-method-toFront" class="docClass">toFront</a> method is called.</p>

<p>The ZIndexManager is found by traversing up the <a href="#!/api/Ext.tip.Tip-property-ownerCt" rel="Ext.tip.Tip-property-ownerCt" class="docClass">ownerCt</a> chain to find an ancestor which itself is
floating. This is so that descendant floating Components of floating <em>Containers</em> (Such as a ComboBox dropdown
within a Window) can have its zIndex managed relative to any siblings, but always <strong>above</strong> that floating
ancestor Container.</p>

<p>If no floating ancestor is found, a floating Component registers itself with the default <a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">ZIndexManager</a>.</p>

<p>Floating components <em>do not participate in the Container's layout</em>. Because of this, they are not rendered until
you explicitly <a href="#!/api/Ext.tip.Tip-method-show" rel="Ext.tip.Tip-method-show" class="docClass">show</a> them.</p>

<p>After rendering, the ownerCt reference is deleted, and the <a href="#!/api/Ext.tip.Tip-property-floatParent" rel="Ext.tip.Tip-property-floatParent" class="docClass">floatParent</a> property is set to the found
floating ancestor Container. If no floating ancestor Container was found the <a href="#!/api/Ext.tip.Tip-property-floatParent" rel="Ext.tip.Tip-property-floatParent" class="docClass">floatParent</a> property will
not be set.</p> %}
    
    Defaults to: [{shadow: true, shim: true, constrain: true}]
    *)
  method focusOnToFront : bool Js.t Js.prop
  (** {% <p>Specifies whether the floated component should be automatically <a href="#!/api/Ext.Component-method-focus" rel="Ext.Component-method-focus" class="docClass">focused</a> when
it is <a href="#!/api/Ext.tip.Tip-method-toFront" rel="Ext.tip.Tip-method-toFront" class="docClass">brought to the front</a>.</p> %}
    
    Defaults to: [false]
    *)
  method frameHeader : bool Js.t Js.prop
  (** {% <p>True to apply a frame to the panel panels header (if 'frame' is true).</p> %}
    
    Defaults to: [false]
    *)
  method hidden : bool Js.t Js.prop
  (** {% <p>True to hide the component.</p> %}
    
    Defaults to: [true]
    *)
  method maxWidth : Js.number Js.t Js.prop
  (** {% <p>The maximum width of the tip in pixels.  The maximum supported value is 500.</p> %}
    
    Defaults to: [300]
    *)
  method minWidth : Js.number Js.t Js.prop
  (** {% <p>The minimum width of the tip in pixels.</p> %}
    
    Defaults to: [40]
    *)
  method shadow : _ Js.t Js.prop
  (** {% <p>True or "sides" for the default effect, "frame" for 4-way shadow, and "drop"
for bottom-right shadow.</p> %}
    
    Defaults to: ["sides"]
    *)
  method width : Js.number Js.t Js.prop
  (** {% <p>Width in pixels of the tip.  Width will be ignored if it
exceeds the bounds of <a href="#!/api/Ext.tip.Tip-cfg-minWidth" rel="Ext.tip.Tip-cfg-minWidth" class="docClass">minWidth</a> or <a href="#!/api/Ext.tip.Tip-cfg-maxWidth" rel="Ext.tip.Tip-cfg-maxWidth" class="docClass">maxWidth</a>.  The maximum
supported value is 500.</p>

<p>Defaults to auto.</p> %}
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
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

