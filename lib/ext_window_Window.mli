(** A specialized panel intended for use as an applica ...
  
  {% <p>A specialized panel intended for use as an application window. Windows are floated, <a href="#!/api/Ext.window.Window-cfg-resizable" rel="Ext.window.Window-cfg-resizable" class="docClass">resizable</a>, and
<a href="#!/api/Ext.window.Window-cfg-draggable" rel="Ext.window.Window-cfg-draggable" class="docClass">draggable</a> by default. Windows can be <a href="#!/api/Ext.window.Window-cfg-maximizable" rel="Ext.window.Window-cfg-maximizable" class="docClass">maximized</a> to fill the viewport, restored to
their prior size, and can be <a href="#!/api/Ext.window.Window-method-minimize" rel="Ext.window.Window-method-minimize" class="docClass">minimize</a>d.</p>

<p>Windows can also be linked to a <a href="#!/api/Ext.ZIndexManager" rel="Ext.ZIndexManager" class="docClass">Ext.ZIndexManager</a> or managed by the <a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">Ext.WindowManager</a> to provide
grouping, activation, to front, to back and other application-specific behavior.</p>

<p>By default, Windows will be rendered to document.body. To <a href="#!/api/Ext.window.Window-cfg-constrain" rel="Ext.window.Window-cfg-constrain" class="docClass">constrain</a> a Window to another element specify
<a href="#!/api/Ext.Component-cfg-renderTo" rel="Ext.Component-cfg-renderTo" class="docClass">renderTo</a>.</p>

<p><strong>As with all <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a>s, it is important to consider how you want the Window to size
and arrange any child Components. Choose an appropriate <a href="#!/api/Ext.window.Window-cfg-layout" rel="Ext.window.Window-cfg-layout" class="docClass">layout</a> configuration which lays out child Components
in the required manner.</strong></p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>', \{
    title: 'Hello',
    height: 200,
    width: 400,
    layout: 'fit',
    items: \{  // Let's put an empty grid in just to illustrate fit layout
        xtype: 'grid',
        border: false,
        columns: [\{header: 'World'\}],                 // One header just for show. There's no data,
        store: <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.ArrayStore" rel="Ext.data.ArrayStore" class="docClass">Ext.data.ArrayStore</a>', \{\}) // A dummy empty data store
    \}
\}).show();
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_panel_Panel.t
  
  method dd_dragger : Ext_util_ComponentDragger.t Js.t Js.prop
  (** {% <p>If this Window is configured <a href="#!/api/Ext.window.Window-cfg-draggable" rel="Ext.window.Window-cfg-draggable" class="docClass">draggable</a>, this property will contain an instance of
<a href="#!/api/Ext.util.ComponentDragger" rel="Ext.util.ComponentDragger" class="docClass">Ext.util.ComponentDragger</a> (A subclass of <a href="#!/api/Ext.dd.DragTracker" rel="Ext.dd.DragTracker" class="docClass">DragTracker</a>) which handles dragging
the Window's DOM Element, and constraining according to the <a href="#!/api/Ext.window.Window-cfg-constrain" rel="Ext.window.Window-cfg-constrain" class="docClass">constrain</a> and <a href="#!/api/Ext.window.Window-cfg-constrainHeader" rel="Ext.window.Window-cfg-constrainHeader" class="docClass">constrainHeader</a> .</p>

<p>This has implementations of <code>onBeforeStart</code>, <code>onDrag</code> and <code>onEnd</code> which perform the dragging action. If
extra logic is needed at these points, use <a href="#!/api/Ext.Function-method-createInterceptor" rel="Ext.Function-method-createInterceptor" class="docClass">createInterceptor</a> or
<a href="#!/api/Ext.Function-method-createSequence" rel="Ext.Function-method-createSequence" class="docClass">createSequence</a> to augment the existing implementations.</p> %}
    *)
  method isWindow : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Window, or subclass thereof.</p> %}
    
    Defaults to: [true]
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
  method applyState : _ Js.t -> unit Js.meth
  (** {% <p>Applies the state to the object. This should be overridden in subclasses to do
more complex state operations. By default it applies the state properties onto
the current object.</p> %}
    
    {b Parameters}:
    {ul {- state: [_ Js.t] {% <p>The state</p> %}
    }
    }
    *)
  method getDefaultFocus : unit Js.meth
  (** {% <p>Gets the configured default focus item.  If a <a href="#!/api/Ext.window.Window-cfg-defaultFocus" rel="Ext.window.Window-cfg-defaultFocus" class="docClass">defaultFocus</a> is set, it will
receive focus when the Window's <code>focus</code> method is called, otherwise the
Window itself will receive focus.</p> %}
    *)
  method maximize : bool Js.t -> 'self Js.t Js.meth
  (** {% <p>Fits the window within its current container and automatically replaces the <a href="#!/api/Ext.window.Window-cfg-maximizable" rel="Ext.window.Window-cfg-maximizable" class="docClass">'maximize' tool
button</a> with the 'restore' tool button. Also see <a href="#!/api/Ext.window.Window-method-toggleMaximize" rel="Ext.window.Window-method-toggleMaximize" class="docClass">toggleMaximize</a>.</p> %}
    
    {b Parameters}:
    {ul {- animate: [bool Js.t]
    {% <p><code>true</code> to animate this Window to full size.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_Window.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method minimize : 'self Js.t Js.meth
  (** {% <p>Placeholder method for minimizing the window. By default, this method simply fires the <a href="#!/api/Ext.window.Window-event-minimize" rel="Ext.window.Window-event-minimize" class="docClass">minimize</a> event
since the behavior of minimizing a window is application-specific. To implement custom minimize behavior, either
the minimize event can be handled or this method can be overridden.</p> %}
    
    {b Returns}:
    {ul {- [Ext_window_Window.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Allows addition of behavior to the show operation. After
calling the superclass's onShow, the Component will be visible.</p>

<p>Override in subclasses where more complex behaviour is needed.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.window.Window-method-show" rel="Ext.window.Window-method-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method restore : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Restores a <a href="#!/api/Ext.window.Window-cfg-maximizable" rel="Ext.window.Window-cfg-maximizable" class="docClass">maximized</a> window back to its original size and position prior to being maximized
and also replaces the 'restore' tool button with the 'maximize' tool button. Also see <a href="#!/api/Ext.window.Window-method-toggleMaximize" rel="Ext.window.Window-method-toggleMaximize" class="docClass">toggleMaximize</a>.</p> %}
    
    {b Parameters}:
    {ul {- animate: [_ Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_Window.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method toggleMaximize : 'self Js.t Js.meth
  (** {% <p>A shortcut method for toggling between <a href="#!/api/Ext.window.Window-method-maximize" rel="Ext.window.Window-method-maximize" class="docClass">maximize</a> and <a href="#!/api/Ext.window.Window-method-restore" rel="Ext.window.Window-method-restore" class="docClass">restore</a> based on the current maximized
state of the window.</p> %}
    
    {b Returns}:
    {ul {- [Ext_window_Window.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_panel_Panel.configs
  
  method animateTarget : _ Js.t Js.prop
  (** {% <p>Id or element from which the window should animate while opening.</p> %}
    
    Defaults to: [null]
    *)
  method autoRender : _ Js.t Js.prop
  (** {% <p>Windows render to the body on first show.</p>

<p>This config is intended mainly for non-<a href="#!/api/Ext.window.Window-cfg-floating" rel="Ext.window.Window-cfg-floating" class="docClass">floating</a> Components which may or may not be shown. Instead of using
<a href="#!/api/Ext.window.Window-cfg-renderTo" rel="Ext.window.Window-cfg-renderTo" class="docClass">renderTo</a> in the configuration, and rendering upon construction, this allows a Component to render itself
upon first <em><a href="#!/api/Ext.Component-method-show" rel="Ext.Component-method-show" class="docClass">show</a></em>. If <a href="#!/api/Ext.window.Window-cfg-floating" rel="Ext.window.Window-cfg-floating" class="docClass">floating</a> is <code>true</code>, the value of this config is omitted as if it is <code>true</code>.</p>

<p>Specify as <code>true</code> to have this Component render to the document body upon first show.</p>

<p>Specify as an element, or the ID of an element to have this Component render to a specific element upon first
show.</p> %}
    
    Defaults to: [true]
    *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this panel's element.</p> %}
    
    Defaults to: ['x-window']
    *)
  method closable : bool Js.t Js.prop
  (** {% <p>True to display the 'close' tool button and allow the user to close the window, false to hide the button and
disallow closing the window.</p>

<p>By default, when close is requested by either clicking the close button in the header or pressing ESC when the
Window has focus, the <a href="#!/api/Ext.window.Window-method-close" rel="Ext.window.Window-method-close" class="docClass">close</a> method will be called. This will <em><a href="#!/api/Ext.Component-method-destroy" rel="Ext.Component-method-destroy" class="docClass">destroy</a></em> the
Window and its content meaning that it may not be reused.</p>

<p>To make closing a Window <em>hide</em> the Window so that it may be reused, set <a href="#!/api/Ext.window.Window-cfg-closeAction" rel="Ext.window.Window-cfg-closeAction" class="docClass">closeAction</a> to 'hide'.</p> %}
    
    Defaults to: [true]
    *)
  method collapsed : bool Js.t Js.prop
  (** {% <p>True to render the window collapsed, false to render it expanded. Note that if <a href="#!/api/Ext.window.Window-cfg-expandOnShow" rel="Ext.window.Window-cfg-expandOnShow" class="docClass">expandOnShow</a>
is true (the default) it will override the <code>collapsed</code> config and the window will always be
expanded when shown.</p> %}
    
    Defaults to: [false]
    *)
  method collapsible : bool Js.t Js.prop
  (** {% <p>inherited docs, same default</p>

<p>True to make the panel collapsible and have an expand/collapse toggle Tool added into the header tool button
area. False to keep the panel sized either statically, or by an owning layout manager, with no toggle Tool.
When a panel is used in a <a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">border layout</a>, the <a href="#!/api/Ext.window.Window-cfg-floatable" rel="Ext.window.Window-cfg-floatable" class="docClass">floatable</a> option
can influence the behavior of collapsing.
See <a href="#!/api/Ext.window.Window-cfg-collapseMode" rel="Ext.window.Window-cfg-collapseMode" class="docClass">collapseMode</a> and <a href="#!/api/Ext.window.Window-cfg-collapseDirection" rel="Ext.window.Window-cfg-collapseDirection" class="docClass">collapseDirection</a></p> %}
    
    Defaults to: [false]
    *)
  method constrain : bool Js.t Js.prop
  (** {% <p>True to constrain the window within its containing element, false to allow it to fall outside of its containing
element. By default the window will be rendered to <code>document.body</code>. To render and constrain the window within
another element specify <a href="#!/api/Ext.window.Window-cfg-renderTo" rel="Ext.window.Window-cfg-renderTo" class="docClass">renderTo</a>. Optionally the header only can be constrained
using <a href="#!/api/Ext.window.Window-cfg-constrainHeader" rel="Ext.window.Window-cfg-constrainHeader" class="docClass">constrainHeader</a>.</p> %}
    
    Defaults to: [false]
    *)
  method constrainHeader : bool Js.t Js.prop
  (** {% <p>True to constrain the window header within its containing element (allowing the window body to fall outside of
its containing element) or false to allow the header to fall outside its containing element.
Optionally the entire window can be constrained using <a href="#!/api/Ext.window.Window-cfg-constrain" rel="Ext.window.Window-cfg-constrain" class="docClass">constrain</a>.</p> %}
    
    Defaults to: [false]
    *)
  method defaultFocus : _ Js.t Js.prop
  (** {% <p>Specifies a Component to receive focus when this Window is focused.</p>

<p>This may be one of:</p>

<ul>
<li>The index of a footer Button.</li>
<li>The id or <a href="#!/api/Ext.AbstractComponent-cfg-itemId" rel="Ext.AbstractComponent-cfg-itemId" class="docClass">Ext.AbstractComponent.itemId</a> of a descendant Component.</li>
<li>A Component.</li>
</ul> %}
    *)
  method draggable : bool Js.t Js.prop
  (** {% <p>True to allow the window to be dragged by the header bar, false to disable dragging. Note that
by default the window will be centered in the viewport, so if dragging is disabled the window may need to be
positioned programmatically after render (e.g., <code>myWindow.setPosition(100, 100);</code>).</p> %}
    
    Defaults to: [true]
    *)
  method expandOnShow : bool Js.t Js.prop
  (** {% <p>True to always expand the window when it is displayed, false to keep it in its current state (which may be
<a href="#!/api/Ext.window.Window-cfg-collapsed" rel="Ext.window.Window-cfg-collapsed" class="docClass">collapsed</a>) when displayed.</p> %}
    
    Defaults to: [true]
    *)
  method ghost : _ Js.t Js.prop
  (** {% <p>Set to false to disable the ghost panel during dragging the window.
Do note that you should not set this to true, by default it is a function.</p> %}
    *)
  method hidden : bool Js.t Js.prop
  (** {% <p>Render this Window hidden. If <code>true</code>, the <a href="#!/api/Ext.window.Window-method-hide" rel="Ext.window.Window-method-hide" class="docClass">hide</a> method will be called internally.</p> %}
    
    Defaults to: [true]
    *)
  method hideMode : Js.js_string Js.t Js.prop
  (** {% <p>Windows hide using offsets in order to preserve the scroll positions of their descendants.</p>

<p>A String which specifies how this Component's encapsulating DOM element will be hidden. Values may be:</p>

<ul>
<li><code>'display'</code> : The Component will be hidden using the <code>display: none</code> style.</li>
<li><code>'visibility'</code> : The Component will be hidden using the <code>visibility: hidden</code> style.</li>
<li><code>'offsets'</code> : The Component will be hidden by absolutely positioning it out of the visible area of the document.
This is useful when a hidden Component must maintain measurable dimensions. Hiding using <code>display</code> results in a
Component having zero dimensions.</li>
</ul> %}
    
    Defaults to: ['offsets']
    *)
  method hideShadowOnDeactivate : bool Js.t Js.prop
  (** {% <p>True to hide this Window's shadow when another floating item in the same z-index stack is activated.</p> %}
    
    Defaults to: [false]
    *)
  method maximizable : bool Js.t Js.prop
  (** {% <p>True to display the 'maximize' tool button and allow the user to maximize the window, false to hide the button
and disallow maximizing the window. Note that when a window is maximized, the tool button
will automatically change to a 'restore' button with the appropriate behavior already built-in that will restore
the window to its previous size.</p> %}
    
    Defaults to: [false]
    *)
  method maximized : bool Js.t Js.prop
  (** {% <p>True to initially display the window in a maximized state.</p> %}
    
    Defaults to: [false]
    *)
  method minHeight : Js.number Js.t Js.prop
  (** {% <p>inherit docs</p>

<p>The minimum value in pixels which this Component will set its height to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    
    Defaults to: [50]
    *)
  method minWidth : Js.number Js.t Js.prop
  (** {% <p>inherit docs</p>

<p>The minimum value in pixels which this Component will set its width to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    
    Defaults to: [50]
    *)
  method minimizable : bool Js.t Js.prop
  (** {% <p>True to display the 'minimize' tool button and allow the user to minimize the window, false to hide the button
and disallow minimizing the window. Note that this button provides no implementation -- the
behavior of minimizing a window is implementation-specific, so the minimize event must be handled and a custom
minimize behavior implemented for this option to be useful.</p> %}
    
    Defaults to: [false]
    *)
  method modal : bool Js.t Js.prop
  (** {% <p>True to make the window modal and mask everything behind it when displayed, false to display it without
restricting access to other UI elements.</p> %}
    
    Defaults to: [false]
    *)
  method onEsc : _ Js.callback Js.prop
  (** {% <p>Allows override of the built-in processing for the escape key. Default action is to close the Window (performing
whatever action is specified in <a href="#!/api/Ext.window.Window-cfg-closeAction" rel="Ext.window.Window-cfg-closeAction" class="docClass">closeAction</a>. To prevent the Window closing when the escape key is
pressed, specify this as <a href="#!/api/Ext-property-emptyFn" rel="Ext-property-emptyFn" class="docClass">Ext.emptyFn</a>.</p> %}
    *)
  method overlapHeader : bool Js.t Js.prop
  (** {% <p>True to overlap the header in a panel over the framing of the panel itself. This is needed when frame:true (and
is done automatically for you). Otherwise it is undefined. If you manually add rounded corners to a panel header
which does not have frame:true, this will need to be set to true.</p> %}
    
    Defaults to: [true]
    *)
  method plain : bool Js.t Js.prop
  (** {% <p>True to render the window body with a transparent background so that it will blend into the framing elements,
false to add a lighter background color to visually highlight the body element and separate it more distinctly
from the surrounding frame.</p> %}
    
    Defaults to: [false]
    *)
  method resizable : _ Js.t Js.prop
  (** {% <p>Specify as <code>true</code> to allow user resizing at each edge and corner of the window, false to disable resizing.</p>

<p>This may also be specified as a config object to <a href="#!/api/Ext.resizer.Resizer" rel="Ext.resizer.Resizer" class="docClass">Ext.resizer.Resizer</a></p> %}
    
    Defaults to: [true]
    *)
  method x : Js.number Js.t Js.prop
  (** {% <p>The X position of the left edge of the window on initial showing. Defaults to centering the Window within the
width of the Window's container <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Element</a> (The Element that the Window is rendered to).</p> %}
    *)
  method y : Js.number Js.t Js.prop
  (** {% <p>The Y position of the top edge of the window on initial showing. Defaults to centering the Window within the
height of the Window's container <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Element</a> (The Element that the Window is rendered to).</p> %}
    *)
  method afterCollapse : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterCollapse] *)
  method afterExpand : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterExpand] *)
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onShow] *)
  
end

class type events =
object
  inherit Ext_panel_Panel.events
  
  method activate_window : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after the window has been visually activated via <a href="#!/api/Ext.window.Window-method-setActive" rel="Ext.window.Window-method-setActive" class="docClass">setActive</a>.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_window_Window.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method deactivate_window : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after the window has been visually deactivated via <a href="#!/api/Ext.window.Window-method-setActive" rel="Ext.window.Window-method-setActive" class="docClass">setActive</a>.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_window_Window.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method maximize : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the window has been maximized.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_window_Window.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method minimize : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the window has been minimized.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_window_Window.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method resize_window : (t Js.t -> Js.number Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the window has been resized.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_window_Window.t Js.t]
    }
    {- width: [Js.number Js.t]
    {% <p>The window's new width</p> %}
    }
    {- height: [Js.number Js.t]
    {% <p>The window's new height</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method restore : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the window has been restored to its original size after being maximized.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_window_Window.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_panel_Panel.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

