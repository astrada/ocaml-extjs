(** Encapsulates a DOM element, adding simple DOM mani ...
  
  {% <p>Encapsulates a DOM element, adding simple DOM manipulation facilities, normalizing for browser differences.</p>

<p>All instances of this class inherit the methods of <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> making visual effects easily available to all
DOM elements.</p>

<p>Note that the events documented in this class are not Ext events, they encapsulate browser events. Some older browsers
may not support the full range of events. Which events are supported is beyond the control of Ext JS.</p>

<p>Usage:</p>

<pre><code>// by id
var el = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>("my-div");

// by DOM element reference
var el = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>(myDivElement);
</code></pre>

<h1>Animations</h1>

<p>When an element is manipulated, by default there is no animation.</p>

<pre><code>var el = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>("my-div");

// no animation
el.setWidth(100);
</code></pre>

<p>Many of the functions for manipulating an element have an optional "animate" parameter. This parameter can be
specified as boolean (true) for default animation effects.</p>

<pre><code>// default animation
el.setWidth(100, true);
</code></pre>

<p>To configure the effects, an object literal with animation options to use as the Element animation configuration
object can also be specified. Note that the supported Element animation configuration options are a subset of the
<a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> animation options specific to Fx effects. The supported Element animation configuration options
are:</p>

<pre><code>Option    Default   Description
--------- --------  ---------------------------------------------
<a href="#!/api/Ext.fx.Anim-cfg-duration" rel="Ext.fx.Anim-cfg-duration" class="docClass">duration</a>  350       The duration of the animation in milliseconds
<a href="#!/api/Ext.fx.Anim-cfg-easing" rel="Ext.fx.Anim-cfg-easing" class="docClass">easing</a>    easeOut   The easing method
<a href="#!/api/Ext.fx.Anim-cfg-callback" rel="Ext.fx.Anim-cfg-callback" class="docClass">callback</a>  none      A function to execute when the anim completes
<a href="#!/api/Ext.fx.Anim-cfg-scope" rel="Ext.fx.Anim-cfg-scope" class="docClass">scope</a>     this      The scope (this) of the callback function
</code></pre>

<p>Usage:</p>

<pre><code>// Element animation options object
var opt = \{
    <a href="#!/api/Ext.fx.Anim-cfg-duration" rel="Ext.fx.Anim-cfg-duration" class="docClass">duration</a>: 1000,
    <a href="#!/api/Ext.fx.Anim-cfg-easing" rel="Ext.fx.Anim-cfg-easing" class="docClass">easing</a>: 'elasticIn',
    <a href="#!/api/Ext.fx.Anim-cfg-callback" rel="Ext.fx.Anim-cfg-callback" class="docClass">callback</a>: this.foo,
    <a href="#!/api/Ext.fx.Anim-cfg-scope" rel="Ext.fx.Anim-cfg-scope" class="docClass">scope</a>: this
\};
// animation with some options set
el.setWidth(100, opt);
</code></pre>

<p>The Element animation object being used for the animation will be set on the options object as "anim", which allows
you to stop or manipulate the animation. Here is an example:</p>

<pre><code>// using the "anim" property to get the Anim object
if(opt.anim.isAnimated())\{
    opt.anim.stop();
\}
</code></pre>

<h1>Composite (Collections of) Elements</h1>

<p>For working with collections of Elements, see <a href="#!/api/Ext.dom.CompositeElement" rel="Ext.dom.CompositeElement" class="docClass">Ext.CompositeElement</a></p>

<p><strong>From override Ext.rtl.dom.Element_position:</strong> This override adds RTL positioning methods to <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_dom_AbstractElement.t
  
  method autoBoxAdjust : bool Js.t Js.prop
  (** {% <p>True to automatically adjust width and height settings for box-model issues.</p> %}
    
    Defaults to: [true]
    *)
  method originalDisplay : Js.js_string Js.t Js.prop
  (** {% <p>The element's default display mode.</p>

<p><strong>Defined in override Ext.dom.Element_fx.</strong></p> %}
    
    Defaults to: [""]
    *)
  method addClsOnClick : Js.js_string Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets up event handlers to add and remove a css class when the mouse is down and then up on this element (a click effect)</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Parameters}:
    {ul {- className: [Js.js_string Js.t]
    {% <p>The class to add</p> %}
    }
    {- testFn: [_ Js.callback] (optional)
    {% <p>A test function to execute before adding the class. The passed parameter
will be the Element instance. If this functions returns false, the class will not be added.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope to execute the testFn in.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method addClsOnFocus : Js.js_string Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets up event handlers to add and remove a css class when this element has the focus</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Parameters}:
    {ul {- className: [Js.js_string Js.t]
    {% <p>The class to add</p> %}
    }
    {- testFn: [_ Js.callback] (optional)
    {% <p>A test function to execute before adding the class. The passed parameter
will be the Element instance. If this functions returns false, the class will not be added.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope to execute the testFn in.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method addClsOnOver : Js.js_string Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets up event handlers to add and remove a css class when the mouse is over this element</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Parameters}:
    {ul {- className: [Js.js_string Js.t]
    {% <p>The class to add</p> %}
    }
    {- testFn: [_ Js.callback] (optional)
    {% <p>A test function to execute before adding the class. The passed parameter
will be the Element instance. If this functions returns false, the class will not be added.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope to execute the testFn in.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method addKeyListener : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef ->
    Ext_util_KeyMap.t Js.t Js.meth
  (** {% <p>Convenience method for constructing a KeyMap</p> %}
    
    {b Parameters}:
    {ul {- key: [_ Js.t]
    {% <p>Either a string with the keys to listen for, the numeric key code,
array of key codes or an object with the following options:</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The function to call</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the specified function is executed. Defaults to this Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_KeyMap.t Js.t] {% <p>The KeyMap created</p> %}
    }
    }
    *)
  method addKeyMap : _ Js.t -> Ext_util_KeyMap.t Js.t Js.meth
  (** {% <p>Creates a KeyMap for this element</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t]
    {% <p>The KeyMap config. See <a href="#!/api/Ext.util.KeyMap" rel="Ext.util.KeyMap" class="docClass">Ext.util.KeyMap</a> for more details</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_KeyMap.t Js.t] {% <p>The KeyMap created</p> %}
    }
    }
    *)
  method addListener : Js.js_string Js.t -> _ Js.callback -> _ Js.t Js.optdef
    -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Shorthand for <a href="#!/api/Ext.dom.Element-method-on" rel="Ext.dom.Element-method-on" class="docClass">on</a>.</p>

<p>Appends an event handler to this element.</p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The name of event to handle.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The handler function the event invokes. This function is passed the following parameters:</p>




<ul>
<li><p><strong>evt</strong> : EventObject</p>

<p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">EventObject</a> describing the event.</p></li>
<li><p><strong>el</strong> : HtmlElement</p>

<p>The DOM element which was the target of the event. Note that this may be filtered by using the delegate option.</p></li>
<li><p><strong>o</strong> : Object</p>

<p>The options object from the call that setup the listener.</p></li>
</ul> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<strong>this</strong> reference) in which the handler function is executed. <strong>If
omitted, defaults to this Element.</strong></p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>An object containing handler configuration properties. This may contain any of
the following properties:</p>




<ul>
<li><p><strong>scope</strong> Object :</p>

<p>The scope (<strong>this</strong> reference) in which the handler function is executed. <strong>If omitted, defaults to this
Element.</strong></p></li>
<li><p><strong>delegate</strong> String:</p>

<p>A simple selector to filter the target or look for a descendant of the target. See below for additional details.</p></li>
<li><p><strong>stopEvent</strong> Boolean:</p>

<p>True to stop the event. That is stop propagation, and prevent the default action.</p></li>
<li><p><strong>preventDefault</strong> Boolean:</p>

<p>True to prevent the default action</p></li>
<li><p><strong>stopPropagation</strong> Boolean:</p>

<p>True to prevent event propagation</p></li>
<li><p><strong>normalized</strong> Boolean:</p>

<p>False to pass a browser event to the handler function instead of an <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a></p></li>
<li><p><strong>target</strong> <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>:</p>

<p>Only call the handler if the event was fired on the target Element, <em>not</em> if the event was bubbled up from a
child node.</p></li>
<li><p><strong>delay</strong> Number:</p>

<p>The number of milliseconds to delay the invocation of the handler after the event fires.</p></li>
<li><p><strong>single</strong> Boolean:</p>

<p>True to add a handler to handle just the next firing of the event, and then remove itself.</p></li>
<li><p><strong>buffer</strong> Number:</p>

<p>Causes the handler to be scheduled to run in an <a href="#!/api/Ext.util.DelayedTask" rel="Ext.util.DelayedTask" class="docClass">Ext.util.DelayedTask</a> delayed by the specified number of
milliseconds. If the event fires again within that time, the original handler is <em>not</em> invoked, but the new
handler is scheduled in its place.</p></li>
</ul>




<p><strong>Combining Options</strong></p>




<p>Using the options argument, it is possible to combine different types of listeners:</p>




<p>A delayed, one-time listener that auto stops the event and adds a custom argument (forumId) to the options
object. The options object is available as the third parameter in the handler function.</p>




<p>Code:</p>




<pre><code>el.on('click', this.onClick, this, \{
    single: true,
    delay: 100,
    stopEvent : true,
    forumId: 4
\});
</code></pre>




<p><strong>Attaching multiple handlers in 1 call</strong></p>




<p>The method also allows for a single argument to be passed which is a config object containing properties which
specify multiple handlers.</p>




<p>Code:</p>




<pre><code>el.on(\{
    'click' : \{
        fn: this.onClick,
        scope: this,
        delay: 100
    \},
    'mouseover' : \{
        fn: this.onMouseOver,
        scope: this
    \},
    'mouseout' : \{
        fn: this.onMouseOut,
        scope: this
    \}
\});
</code></pre>




<p>Or a shorthand syntax:</p>




<p>Code:</p>




<pre><code>el.on(\{
    'click' : this.onClick,
    'mouseover' : this.onMouseOver,
    'mouseout' : this.onMouseOut,
    scope: this
\});
</code></pre>




<p><strong>delegate</strong></p>




<p>This is a configuration option that you can pass along when registering a handler for an event to assist with
event delegation. Event delegation is a technique that is used to reduce memory consumption and prevent exposure
to memory-leaks. By registering an event for a container element as opposed to each element within a container.
By setting this configuration option to a simple selector, the target element will be filtered to look for a
descendant of the target. For example:</p>




<pre><code>// using this markup:
&lt;div id='elId'&gt;
    &lt;p id='p1'&gt;paragraph one&lt;/p&gt;
    &lt;p id='p2' class='clickable'&gt;paragraph two&lt;/p&gt;
    &lt;p id='p3'&gt;paragraph three&lt;/p&gt;
&lt;/div&gt;

// utilize event delegation to registering just one handler on the container element:
el = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('elId');
el.on(
    'click',
    function(e,t) \{
        // handle click
        console.info(t.id); // 'p2'
    \},
    this,
    \{
        // filter the target element to be a descendant with the class 'clickable'
        delegate: '.clickable'
    \}
);
</code></pre> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method animate : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Performs custom animation on this Element.</p>

<p>The following properties may be specified in <code>from</code>, <code>to</code>, and <code>keyframe</code> objects:</p>

<ul>
<li><p><code>x</code> - The page X position in pixels.</p></li>
<li><p><code>y</code> - The page Y position in pixels</p></li>
<li><p><code>left</code> - The element's CSS <code>left</code> value. Units must be supplied.</p></li>
<li><p><code>top</code> - The element's CSS <code>top</code> value. Units must be supplied.</p></li>
<li><p><code>width</code> - The element's CSS <code>width</code> value. Units must be supplied.</p></li>
<li><p><code>height</code> - The element's CSS <code>height</code> value. Units must be supplied.</p></li>
<li><p><code>scrollLeft</code> - The element's <code>scrollLeft</code> value.</p></li>
<li><p><code>scrollTop</code> - The element's <code>scrollTop</code> value.</p></li>
<li><p><code>opacity</code> - The element's <code>opacity</code> value. This must be a value between <code>0</code> and <code>1</code>.</p></li>
</ul>


<p><strong>Be aware</strong> that animating an Element which is being used by an Ext Component without in some way informing the
Component about the changed element state will result in incorrect Component behaviour. This is because the
Component will be using the old state of the element. To avoid this problem, it is now possible to directly
animate certain properties of Components.</p>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t]
    {% <p>Configuration for <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a>.
Note that the <a href="#!/api/Ext.fx.Anim-cfg-to" rel="Ext.fx.Anim-cfg-to" class="docClass">to</a> config is required.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method blur : 'self Js.t Js.meth
  (** {% <p>Tries to blur the element. Any exceptions are caught and ignored.</p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method boxWrap : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Wraps the specified element with a special 9 element markup/CSS block that renders by default as
a gray container with a gradient background, rounded corners and a 4-way shadow.</p>

<p>This special markup is used throughout Ext when box wrapping elements (<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>,
<a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a> when <a href="#!/api/Ext.panel.Panel-cfg-frame" rel="Ext.panel.Panel-cfg-frame" class="docClass">frame=true</a>, <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>).
The markup is of this form:</p>

<pre><code>Ext.dom.Element.boxMarkup =
'&lt;div class="\{0\}-tl"&gt;&lt;div class="\{0\}-tr"&gt;&lt;div class="\{0\}-tc"&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;
&lt;div class="\{0\}-ml"&gt;&lt;div class="\{0\}-mr"&gt;&lt;div class="\{0\}-mc"&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;
&lt;div class="\{0\}-bl"&gt;&lt;div class="\{0\}-br"&gt;&lt;div class="\{0\}-bc"&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;';
</code></pre>

<p>Example usage:</p>

<pre><code>// Basic box wrap
<a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>("foo").boxWrap();

// You can also add a custom class and use CSS inheritance rules to customize the box look.
// 'x-box-blue' is a built-in alternative -- look at the related CSS definitions as an example
// for how to create a custom box wrap style.
<a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>("foo").boxWrap().addCls("x-box-blue");
</code></pre>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Parameters}:
    {ul {- class: [Js.js_string Js.t] (optional)
    {% <p>A base CSS class to apply to the containing wrapper element.
Note that there are a number of CSS rules that are dependent on this name to make the overall effect work,
so if you supply an alternate base class, make sure you also supply all of the necessary rules.</p> %}
     Defaults to: 'x-box'
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t]
    {% <p>The outermost wrapping element of the created box structure.</p> %}
    }
    }
    *)
  method cacheScrollValues : _ Js.callback Js.meth
  (** {% <p>When an element is moved around in the DOM, or is hidden using <code>display:none</code>, it loses layout, and therefore
all scroll positions of all descendant elements are lost.</p>

<p>This function caches them, and returns a function, which when run will restore the cached positions.
In the following example, the Panel is moved from one Container to another which will cause it to lose all scroll positions:</p>

<pre><code>var restoreScroll = myPanel.el.cacheScrollValues();
myOtherContainer.add(myPanel);
restoreScroll();
</code></pre> %}
    
    {b Returns}:
    {ul {- [_ Js.callback]
    {% <p>A function which will restore all descentant elements of this Element to their scroll
positions recorded when this function was executed. Be aware that the returned function is a closure which has
captured the scope of <code>cacheScrollValues</code>, so take care to derefence it as soon as not needed - if is it is a <code>var</code>
it will drop out of scope, and the reference will be freed.</p> %}
    }
    }
    *)
  method center : _ Js.t -> unit Js.meth
  (** {% <p>Centers the Element in either the viewport, or another Element.</p>

<p><strong>Defined in override Ext.dom.Element_position.</strong></p> %}
    
    {b Parameters}:
    {ul {- centerIn: [_ Js.t]
    {% <p>element in
which to center the element.</p> %}
    }
    }
    *)
  method clean : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Removes Empty, or whitespace filled text nodes. Combines adjacent text nodes.</p> %}
    
    {b Parameters}:
    {ul {- forceReclean: [bool Js.t] (optional)
    {% <p>By default the element keeps track if it has been cleaned already
so you can call this over and over. However, if you update the element and need to force a reclean, you
can pass true.</p> %}
     Defaults to: false
    }
    }
    *)
  method clearListeners : 'self Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.dom.Element-method-removeAllListeners" rel="Ext.dom.Element-method-removeAllListeners" class="docClass">removeAllListeners</a>.</p>

<p>Removes all previous added listeners from this element</p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method clearOpacity : 'self Js.t Js.meth
  (** {% <p>Clears any opacity settings from this element. Required in some cases for IE.</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method clearPositioning : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Clears positioning back to the default when the document was loaded.</p>

<p><strong>Defined in override Ext.dom.Element_position.</strong></p> %}
    
    {b Parameters}:
    {ul {- value: [Js.js_string Js.t] (optional)
    {% <p>The value to use for the left, right, top, bottom.
You could use 'auto'.</p> %}
     Defaults to: ''
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method clip : 'self Js.t Js.meth
  (** {% <p>Store the current overflow setting and clip overflow on the element - use <a href="#!/api/Ext.dom.Element-method-unclip" rel="Ext.dom.Element-method-unclip" class="docClass">unclip</a> to remove</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method createProxy : _ Js.t -> _ Js.t Js.optdef -> bool Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Creates a proxy element of this element</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t]
    {% <p>The class name of the proxy element or a DomHelper config object</p> %}
    }
    {- renderTo: [_ Js.t] (optional)
    {% <p>The element or element id to render the proxy to. Defaults to: document.body.</p> %}
    }
    {- matchBox: [bool Js.t] (optional)
    {% <p>True to align and size the proxy to this element now.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The new proxy element</p> %}
    }
    }
    *)
  method createShim : 'self Js.t Js.meth
  (** {% <p>Creates an iframe shim for this element to keep selects and other windowed objects from
showing through.</p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The new shim element</p> %}
    }
    }
    *)
  method enableDisplayMode : Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Convenience method for setVisibilityMode(Element.DISPLAY)</p> %}
    
    {b Parameters}:
    {ul {- display: [Js.js_string Js.t] (optional)
    {% <p>What to set display to when visible</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method fadeIn : _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Fade an element in (from transparent to opaque). The ending opacity can be specified using the <code>opacity</code>
config option. Usage:</p>

<pre><code>// default: fade in from opacity 0 to 100%
el.fadeIn();

// custom: fade in from opacity 0 to 75% over 2 seconds
el.fadeIn(\{ opacity: .75, duration: 2000\});

// common config options shown with default values
el.fadeIn(\{
    opacity: 1, //can be any value between 0 and 1 (e.g. .5)
    easing: 'easeOut',
    duration: 500
\});
</code></pre>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t] (optional)
    {% <p>Object literal with any of the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> config options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method fadeOut : _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Fade an element out (from opaque to transparent). The ending opacity can be specified using the <code>opacity</code>
config option. Note that IE may require <code>useDisplay:true</code> in order to redisplay correctly.
Usage:</p>

<pre><code>// default: fade out from the element's current opacity to 0
el.fadeOut();

// custom: fade out from the element's current opacity to 25% over 2 seconds
el.fadeOut(\{ opacity: .25, duration: 2000\});

// common config options shown with default values
el.fadeOut(\{
    opacity: 0, //can be any value between 0 and 1 (e.g. .5)
    easing: 'easeOut',
    duration: 500,
    remove: false,
    useDisplay: false
\});
</code></pre>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t] (optional)
    {% <p>Object literal with any of the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> config options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method focus : Js.number Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Tries to focus the element. Any exceptions are caught and ignored.</p> %}
    
    {b Parameters}:
    {ul {- defer: [Js.number Js.t] (optional)
    {% <p>Milliseconds to defer the focus</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method focusable : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.dom.Element-method-isFocusable" rel="Ext.dom.Element-method-isFocusable" class="docClass">isFocusable</a>.</p>

<p>Checks whether this element can be focused.</p> %}
    
    {b Parameters}:
    {ul {- asFocusEl: [_ Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the element is focusable</p> %}
    }
    }
    *)
  method frame : Js.js_string Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Shows a ripple of exploding, attenuating borders to draw attention to an Element. Usage:</p>

<pre><code>// default: a single light blue ripple
el.frame();

// custom: 3 red ripples lasting 3 seconds total
el.frame("#ff0000", 3, \{ duration: 3000 \});

// common config options shown with default values
el.frame("#C3DAF9", 1, \{
    duration: 1000 // duration of each individual ripple.
    // Note: Easing is not configurable and will be ignored if included
\});
</code></pre>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- color: [Js.js_string Js.t] (optional)
    {% <p>The hex color value for the border.</p> %}
     Defaults to: '#C3DAF9'
    }
    {- count: [Js.number Js.t] (optional)
    {% <p>The number of ripples to display.</p> %}
     Defaults to: 1
    }
    {- options: [_ Js.t] (optional)
    {% <p>Object literal with any of the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> config options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method getAttributeNS : Js.js_string Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.meth
  (** {% <p>Returns the value of a namespaced attribute from the element's underlying DOM node.</p> %}
    
    {b Parameters}:
    {ul {- namespace: [Js.js_string Js.t]
    {% <p>The namespace in which to look for the attribute</p> %}
    }
    {- name: [Js.js_string Js.t]
    {% <p>The attribute name</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The attribute value</p> %}
    }
    }
    *)
  method getColor : Js.js_string Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.optdef -> unit Js.meth
  (** {% <p>Return the CSS color for the specified CSS attribute. rgb, 3 digit (like <code>#fff</code>) and valid values
are convert to standard 6 digit hex color.</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Parameters}:
    {ul {- attr: [Js.js_string Js.t]
    {% <p>The css attribute</p> %}
    }
    {- defaultValue: [Js.js_string Js.t]
    {% <p>The default value to use when a valid color isn't found</p> %}
    }
    {- prefix: [Js.js_string Js.t] (optional)
    {% <p>defaults to #. Use an empty string when working with
color anims.</p> %}
    }
    }
    *)
  method getComputedHeight : Js.number Js.t Js.meth
  (** {% <p>Returns either the offsetHeight or the height of this element based on CSS height adjusted by padding or borders
when needed to simulate offsetHeight when offsets aren't available. This may not work on display:none elements
if a height has not been set using CSS.</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    *)
  method getComputedWidth : Js.number Js.t Js.meth
  (** {% <p>Returns either the offsetWidth or the width of this element based on CSS width adjusted by padding or borders
when needed to simulate offsetWidth when offsets aren't available. This may not work on display:none elements
if a width has not been set using CSS.</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    *)
  method getFrameWidth : Js.js_string Js.t -> Js.number Js.t Js.meth
  (** {% <p>Returns the sum width of the padding and borders for the passed "sides". See getBorderWidth()
for more information about the sides.</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Parameters}:
    {ul {- sides: [Js.js_string Js.t]
    }
    }
    *)
  method getLoader : Ext_ElementLoader.t Js.t Js.meth
  (** {% <p>Gets this element's <a href="#!/api/Ext.ElementLoader" rel="Ext.ElementLoader" class="docClass">ElementLoader</a></p> %}
    
    {b Returns}:
    {ul {- [Ext_ElementLoader.t Js.t] {% <p>The loader</p> %}
    }
    }
    *)
  method getLocalX : Js.number Js.t Js.meth
  (** {% <p>Gets the local CSS X position for the element</p>

<p><strong>Defined in override Ext.dom.Element_position.</strong></p> %}
    *)
  method getLocalXY : _ Js.js_array Js.t Js.meth
  (** {% <p>Gets the local CSS X and Y position for the element</p>

<p><strong>Defined in override Ext.dom.Element_position.</strong></p> %}
    
    {b Returns}:
    {ul {- [_ Js.js_array Js.t] {% <p>[x, y]</p> %}
    }
    }
    *)
  method getLocalY : Js.number Js.t Js.meth
  (** {% <p>Gets the local CSS Y position for the element</p>

<p><strong>Defined in override Ext.dom.Element_position.</strong></p> %}
    *)
  method getScroll : _ Js.t Js.meth
  (** {% <p>Returns the current scroll position of the element.</p>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>An object containing the scroll position in the format
<code>\{left: (scrollLeft), top: (scrollTop)\}</code></p> %}
    }
    }
    *)
  method getScrollLeft : Js.number Js.t Js.meth
  (** {% <p>Gets the left scroll position</p>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The left scroll position</p> %}
    }
    }
    *)
  method getScrollTop : Js.number Js.t Js.meth
  (** {% <p>Gets the top scroll position</p>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The top scroll position</p> %}
    }
    }
    *)
  method getStyleSize : _ Js.t Js.meth
  (** {% <p>Returns the dimensions of the element available to lay content out in.</p>

<p>getStyleSize utilizes prefers style sizing if present, otherwise it chooses the larger of offsetHeight/clientHeight and
offsetWidth/clientWidth. To obtain the size excluding scrollbars, use getViewSize.</p>

<p>Sizing of the document body is handled at the adapter level which handles special cases for IE and strict modes, etc.</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>Object describing width and height.</p> %}
    }
    }
    *)
  method getTextWidth : Js.js_string Js.t -> Js.number Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.meth
  (** {% <p>Returns the width in pixels of the passed text, or the width of the text in this Element.</p> %}
    
    {b Parameters}:
    {ul {- text: [Js.js_string Js.t]
    {% <p>The text to measure. Defaults to the innerHTML of the element.</p> %}
    }
    {- min: [Js.number Js.t] (optional)
    {% <p>The minumum value to return.</p> %}
    }
    {- max: [Js.number Js.t] (optional)
    {% <p>The maximum value to return.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The text width in pixels.</p> %}
    }
    }
    *)
  method getX : Js.number Js.t Js.meth
  (** {% <p>Gets element X position in page coordinates</p>

<p><strong>Defined in override Ext.dom.Element_position.</strong></p> %}
    *)
  method getY : Js.number Js.t Js.meth
  (** {% <p>Gets element Y position in page coordinates</p>

<p><strong>Defined in override Ext.dom.Element_position.</strong></p> %}
    *)
  method ghost : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Slides the element while fading it out of view. An anchor point can be optionally passed to set the ending point
of the effect. Usage:</p>

<pre><code>// default: slide the element downward while fading out
el.ghost();

// custom: slide the element out to the right with a 2-second duration
el.ghost('r', \{ duration: 2000 \});

// common config options shown with default values
el.ghost('b', \{
    easing: 'easeOut',
    duration: 500
\});
</code></pre>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- anchor: [Js.js_string Js.t] (optional)
    {% <p>One of the valid <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> anchor positions (defaults to bottom: 'b')</p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>Object literal with any of the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> config options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method hide : _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Hide this element - Uses display mode to determine whether to use "display" or "visibility". See <a href="#!/api/Ext.dom.Element-method-setVisible" rel="Ext.dom.Element-method-setVisible" class="docClass">setVisible</a>.</p>

<p><strong>Defined in override Ext.dom.Element_fx.</strong></p> %}
    
    {b Parameters}:
    {ul {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method highlight : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Highlights the Element by setting a color (applies to the background-color by default, but can be changed using
the "attr" config option) and then fading back to the original color. If no original color is available, you
should provide the "endColor" config option which will be cleared after the animation. Usage:</p>

<pre><code>// default: highlight background to yellow
el.highlight();

// custom: highlight foreground text to blue for 2 seconds
el.highlight("0000ff", \{ attr: 'color', duration: 2000 \});

// common config options shown with default values
el.highlight("ffff9c", \{
    attr: "backgroundColor", //can be any valid CSS property (attribute) that supports a color value
    endColor: (current color) or "ffffff",
    easing: 'easeIn',
    duration: 1000
\});
</code></pre>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- color: [Js.js_string Js.t] (optional)
    {% <p>The highlight color. Should be a 6 char hex color without the leading #
(defaults to yellow: 'ffff9c')</p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>Object literal with any of the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> config options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method hover : _ Js.callback -> _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets up event handlers to call the passed functions when the mouse is moved into and out of the Element.</p> %}
    
    {b Parameters}:
    {ul {- overFn: [_ Js.callback]
    {% <p>The function to call when the mouse enters the Element.</p> %}
    }
    {- outFn: [_ Js.callback]
    {% <p>The function to call when the mouse leaves the Element.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the functions are executed. Defaults
to the Element's DOM element.</p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>Options for the listener. See <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">the
options parameter</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method initDD : Js.js_string Js.t -> _ Js.t -> _ Js.t -> Ext_dd_DD.t Js.t
    Js.meth
  (** {% <p>Initializes a <a href="#!/api/Ext.dd.DD" rel="Ext.dd.DD" class="docClass">Ext.dd.DD</a> drag drop object for this element.</p>

<p><strong>Defined in override Ext.dom.Element_dd.</strong></p> %}
    
    {b Parameters}:
    {ul {- group: [Js.js_string Js.t]
    {% <p>The group the DD object is member of</p> %}
    }
    {- config: [_ Js.t]
    {% <p>The DD config object</p> %}
    }
    {- overrides: [_ Js.t]
    {% <p>An object containing methods to override/implement on the DD object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dd_DD.t Js.t] {% <p>The DD object</p> %}
    }
    }
    *)
  method initDDProxy : Js.js_string Js.t -> _ Js.t -> _ Js.t ->
    Ext_dd_DDProxy.t Js.t Js.meth
  (** {% <p>Initializes a <a href="#!/api/Ext.dd.DDProxy" rel="Ext.dd.DDProxy" class="docClass">Ext.dd.DDProxy</a> object for this element.</p>

<p><strong>Defined in override Ext.dom.Element_dd.</strong></p> %}
    
    {b Parameters}:
    {ul {- group: [Js.js_string Js.t]
    {% <p>The group the DDProxy object is member of</p> %}
    }
    {- config: [_ Js.t]
    {% <p>The DDProxy config object</p> %}
    }
    {- overrides: [_ Js.t]
    {% <p>An object containing methods to override/implement on the DDProxy object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dd_DDProxy.t Js.t] {% <p>The DDProxy object</p> %}
    }
    }
    *)
  method initDDTarget : Js.js_string Js.t -> _ Js.t -> _ Js.t ->
    Ext_dd_DDTarget.t Js.t Js.meth
  (** {% <p>Initializes a <a href="#!/api/Ext.dd.DDTarget" rel="Ext.dd.DDTarget" class="docClass">Ext.dd.DDTarget</a> object for this element.</p>

<p><strong>Defined in override Ext.dom.Element_dd.</strong></p> %}
    
    {b Parameters}:
    {ul {- group: [Js.js_string Js.t]
    {% <p>The group the DDTarget object is member of</p> %}
    }
    {- config: [_ Js.t]
    {% <p>The DDTarget config object</p> %}
    }
    {- overrides: [_ Js.t]
    {% <p>An object containing methods to override/implement on the DDTarget object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dd_DDTarget.t Js.t] {% <p>The DDTarget object</p> %}
    }
    }
    *)
  method isBorderBox : bool Js.t Js.meth
  (** {% <p>Tests various css rules/browsers to determine if this element uses a border box</p> %}
    *)
  method isDisplayed : bool Js.t Js.meth
  (** {% <p>Returns true if display is not "none"</p> %}
    *)
  method isFocusable : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Checks whether this element can be focused.</p> %}
    
    {b Parameters}:
    {ul {- asFocusEl: [_ Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the element is focusable</p> %}
    }
    }
    *)
  method isMasked : bool Js.t Js.meth
  (** {% <p>Returns true if this element is masked. Also re-centers any displayed message within the mask.</p> %}
    *)
  method isScrollable : bool Js.t Js.meth
  (** {% <p>Returns true if this element is scrollable.</p>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    *)
  method isVisible : bool Js.t Js.optdef -> bool Js.t Js.meth
  (** {% <p>Checks whether the element is currently visible using both visibility and display properties.</p> %}
    
    {b Parameters}:
    {ul {- deep: [bool Js.t] (optional)
    {% <p>True to walk the dom and see if parent elements are hidden.
If false, the function only checks the visibility of the element itself and it may return
<code>true</code> even though a parent is not visible.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p><code>true</code> if the element is currently visible, else <code>false</code></p> %}
    }
    }
    *)
  method load : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Direct access to the <a href="#!/api/Ext.ElementLoader" rel="Ext.ElementLoader" class="docClass">Ext.ElementLoader</a> <a href="#!/api/Ext.ElementLoader-method-load" rel="Ext.ElementLoader-method-load" class="docClass">Ext.ElementLoader.load</a> method. The method takes the same object
parameter as <a href="#!/api/Ext.ElementLoader-method-load" rel="Ext.ElementLoader-method-load" class="docClass">Ext.ElementLoader.load</a></p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method mask_element : Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Puts a mask over this element to disable user interaction. Requires core.css.
This method can only be applied to elements which accept child nodes.</p> %}
    
    {b Parameters}:
    {ul {- msg: [Js.js_string Js.t] (optional)
    {% <p>A message to display in the mask</p> %}
    }
    {- msgCls: [Js.js_string Js.t] (optional)
    {% <p>A css class to apply to the msg element</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The mask element</p> %}
    }
    }
    *)
  method monitorMouseLeave : Js.number Js.t -> _ Js.callback ->
    _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Monitors this Element for the mouse leaving. Calls the function after the specified delay only if
the mouse was not moved back into the Element within the delay. If the mouse <em>was</em> moved
back in, the function is not called.</p> %}
    
    {b Parameters}:
    {ul {- delay: [Js.number Js.t]
    {% <p>The delay <strong>in milliseconds</strong> to wait for possible mouse re-entry before calling the handler function.</p> %}
    }
    {- handler: [_ Js.callback]
    {% <p>The function to call if the mouse remains outside of this Element for the specified time.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the handler function executes. Defaults to this Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The listeners object which was added to this element so that monitoring can be stopped. Example usage:</p>

<pre><code>// Hide the menu if the mouse moves out for 250ms or more
this.mouseLeaveMonitor = this.menuEl.monitorMouseLeave(250, this.hideMenu, this);

...
// Remove mouseleave monitor on menu destroy
this.menuEl.un(this.mouseLeaveMonitor);
</code></pre> %}
    }
    }
    *)
  method needsTabIndex : unit Js.meth
  (** {% <p>Returns true if this element needs an explicit tabIndex to make it focusable. Input fields, text areas, buttons
anchors elements <strong>with an href</strong> etc do not need a tabIndex, but structural elements do.</p> %}
    *)
  method on : Js.js_string Js.t -> _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Appends an event handler to this element.</p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The name of event to handle.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The handler function the event invokes. This function is passed the following parameters:</p>




<ul>
<li><p><strong>evt</strong> : EventObject</p>

<p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">EventObject</a> describing the event.</p></li>
<li><p><strong>el</strong> : HtmlElement</p>

<p>The DOM element which was the target of the event. Note that this may be filtered by using the delegate option.</p></li>
<li><p><strong>o</strong> : Object</p>

<p>The options object from the call that setup the listener.</p></li>
</ul> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<strong>this</strong> reference) in which the handler function is executed. <strong>If
omitted, defaults to this Element.</strong></p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>An object containing handler configuration properties. This may contain any of
the following properties:</p>




<ul>
<li><p><strong>scope</strong> Object :</p>

<p>The scope (<strong>this</strong> reference) in which the handler function is executed. <strong>If omitted, defaults to this
Element.</strong></p></li>
<li><p><strong>delegate</strong> String:</p>

<p>A simple selector to filter the target or look for a descendant of the target. See below for additional details.</p></li>
<li><p><strong>stopEvent</strong> Boolean:</p>

<p>True to stop the event. That is stop propagation, and prevent the default action.</p></li>
<li><p><strong>preventDefault</strong> Boolean:</p>

<p>True to prevent the default action</p></li>
<li><p><strong>stopPropagation</strong> Boolean:</p>

<p>True to prevent event propagation</p></li>
<li><p><strong>normalized</strong> Boolean:</p>

<p>False to pass a browser event to the handler function instead of an <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a></p></li>
<li><p><strong>target</strong> <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>:</p>

<p>Only call the handler if the event was fired on the target Element, <em>not</em> if the event was bubbled up from a
child node.</p></li>
<li><p><strong>delay</strong> Number:</p>

<p>The number of milliseconds to delay the invocation of the handler after the event fires.</p></li>
<li><p><strong>single</strong> Boolean:</p>

<p>True to add a handler to handle just the next firing of the event, and then remove itself.</p></li>
<li><p><strong>buffer</strong> Number:</p>

<p>Causes the handler to be scheduled to run in an <a href="#!/api/Ext.util.DelayedTask" rel="Ext.util.DelayedTask" class="docClass">Ext.util.DelayedTask</a> delayed by the specified number of
milliseconds. If the event fires again within that time, the original handler is <em>not</em> invoked, but the new
handler is scheduled in its place.</p></li>
</ul>




<p><strong>Combining Options</strong></p>




<p>Using the options argument, it is possible to combine different types of listeners:</p>




<p>A delayed, one-time listener that auto stops the event and adds a custom argument (forumId) to the options
object. The options object is available as the third parameter in the handler function.</p>




<p>Code:</p>




<pre><code>el.on('click', this.onClick, this, \{
    single: true,
    delay: 100,
    stopEvent : true,
    forumId: 4
\});
</code></pre>




<p><strong>Attaching multiple handlers in 1 call</strong></p>




<p>The method also allows for a single argument to be passed which is a config object containing properties which
specify multiple handlers.</p>




<p>Code:</p>




<pre><code>el.on(\{
    'click' : \{
        fn: this.onClick,
        scope: this,
        delay: 100
    \},
    'mouseover' : \{
        fn: this.onMouseOver,
        scope: this
    \},
    'mouseout' : \{
        fn: this.onMouseOut,
        scope: this
    \}
\});
</code></pre>




<p>Or a shorthand syntax:</p>




<p>Code:</p>




<pre><code>el.on(\{
    'click' : this.onClick,
    'mouseover' : this.onMouseOver,
    'mouseout' : this.onMouseOut,
    scope: this
\});
</code></pre>




<p><strong>delegate</strong></p>




<p>This is a configuration option that you can pass along when registering a handler for an event to assist with
event delegation. Event delegation is a technique that is used to reduce memory consumption and prevent exposure
to memory-leaks. By registering an event for a container element as opposed to each element within a container.
By setting this configuration option to a simple selector, the target element will be filtered to look for a
descendant of the target. For example:</p>




<pre><code>// using this markup:
&lt;div id='elId'&gt;
    &lt;p id='p1'&gt;paragraph one&lt;/p&gt;
    &lt;p id='p2' class='clickable'&gt;paragraph two&lt;/p&gt;
    &lt;p id='p3'&gt;paragraph three&lt;/p&gt;
&lt;/div&gt;

// utilize event delegation to registering just one handler on the container element:
el = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('elId');
el.on(
    'click',
    function(e,t) \{
        // handle click
        console.info(t.id); // 'p2'
    \},
    this,
    \{
        // filter the target element to be a descendant with the class 'clickable'
        delegate: '.clickable'
    \}
);
</code></pre> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method position : Js.js_string Js.t Js.optdef -> Js.number Js.t Js.optdef
    -> Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef -> unit Js.meth
  (** {% <p>Initializes positioning on this element. If a desired position is not passed,
it will make the the element positioned relative IF it is not already positioned.</p>

<p><strong>Defined in override Ext.dom.Element_position.</strong></p> %}
    
    {b Parameters}:
    {ul {- pos: [Js.js_string Js.t] (optional)
    {% <p>Positioning to use "relative", "absolute" or "fixed"</p> %}
    }
    {- zIndex: [Js.number Js.t] (optional)
    {% <p>The zIndex to apply</p> %}
    }
    {- x: [Js.number Js.t] (optional)
    {% <p>Set the page X position</p> %}
    }
    {- y: [Js.number Js.t] (optional)
    {% <p>Set the page Y position</p> %}
    }
    }
    *)
  method puff : _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Fades the element out while slowly expanding it in all directions. When the effect is completed, the element will
be hidden (visibility = 'hidden') but block elements will still take up space in the document. Usage:</p>

<pre><code>// default
el.puff();

// common config options shown with default values
el.puff(\{
    easing: 'easeOut',
    duration: 500,
    useDisplay: false
\});
</code></pre>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t] (optional)
    {% <p>Object literal with any of the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> config options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method purgeAllListeners : 'self Js.t Js.meth
  (** {% <p>Recursively removes all previous added listeners from this element and its children</p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method relayEvent : Js.js_string Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Create an event handler on this element such that when the event fires and is handled by this element,
it will be relayed to another object (i.e., fired again as if it originated from that object instead).</p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The type of event to relay</p> %}
    }
    {- observable: [_ Js.t]
    {% <p>Any object that extends <a href="#!/api/Ext.util.Observable" rel="Ext.util.Observable" class="docClass">Ext.util.Observable</a> that will provide the context
for firing the relayed event</p> %}
    }
    }
    *)
  method removeAllListeners : 'self Js.t Js.meth
  (** {% <p>Removes all previous added listeners from this element</p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method removeListener : Js.js_string Js.t -> _ Js.callback -> _ Js.t ->
    'self Js.t Js.meth
  (** {% <p>Shorthand for <a href="#!/api/Ext.dom.Element-method-un" rel="Ext.dom.Element-method-un" class="docClass">un</a>.</p>

<p>Removes an event handler from this element.</p>

<p><strong>Note</strong>: if a <em>scope</em> was explicitly specified when <a href="#!/api/Ext.dom.Element-method-on" rel="Ext.dom.Element-method-on" class="docClass">adding</a> the listener,
the same scope must be specified here.</p>

<p>Example:</p>

<pre><code>el.un('click', this.handlerFn);
// or
el.removeListener('click', this.handlerFn);
</code></pre> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The name of the event from which to remove the handler.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The handler function to remove. <strong>This must be a reference to the function passed into the
<a href="#!/api/Ext.dom.Element-method-on" rel="Ext.dom.Element-method-on" class="docClass">on</a> call.</strong></p> %}
    }
    {- scope: [_ Js.t]
    {% <p>If a scope (<strong>this</strong> reference) was specified when the listener was added, then this must
refer to the same object.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method scroll : Js.js_string Js.t -> Js.number Js.t -> _ Js.t Js.optdef ->
    bool Js.t Js.meth
  (** {% <p>Scrolls this element the specified direction. Does bounds checking to make sure the scroll is
within this element's scrollable range.</p>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    
    {b Parameters}:
    {ul {- direction: [Js.js_string Js.t]
    {% <p>Possible values are:</p>

<ul>
<li><code>"l"</code> (or <code>"left"</code>)</li>
<li><code>"r"</code> (or <code>"right"</code>)</li>
<li><code>"t"</code> (or <code>"top"</code>, or <code>"up"</code>)</li>
<li><code>"b"</code> (or <code>"bottom"</code>, or <code>"down"</code>)</li>
</ul> %}
    }
    {- distance: [Js.number Js.t]
    {% <p>How far to scroll the element in pixels</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard Element
animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>Returns true if a scroll was triggered or false if the element
was scrolled as far as it could go.</p> %}
    }
    }
    *)
  method scrollBy : _ Js.t -> _ Js.t -> _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Scrolls this element by the passed delta values, optionally animating.</p>

<p>All of the following are equivalent:</p>

<pre><code> el.scrollBy(10, 10, true);
 el.scrollBy([10, 10], true);
 el.scrollBy(\{ x: 10, y: 10 \}, true);
</code></pre>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    
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
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method scrollIntoView : _ Js.t Js.optdef -> bool Js.t Js.optdef ->
    _ Js.t Js.optdef -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Scrolls this element into view within the passed container.</p>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    
    {b Parameters}:
    {ul {- container: [_ Js.t] (optional)
    {% <p>The container element
to scroll.  Should be a string (id), dom node, or <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
     Defaults to: document.body
    }
    {- hscroll: [bool Js.t] (optional)
    {% <p>False to disable horizontal scroll.</p> %}
     Defaults to: true
    }
    {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard Element</p> %}
    }
    {- highlight: [bool Js.t] (optional)
    {% <p>true to <a href="#!/api/Ext.dom.Element-method-highlight" rel="Ext.dom.Element-method-highlight" class="docClass">highlight</a> the element when it is in view.
animation config object</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method scrollTo : Js.js_string Js.t -> Js.number Js.t -> _ Js.t Js.optdef
    -> 'self Js.t Js.meth
  (** {% <p>Scrolls this element the specified scroll point. It does NOT do bounds checking so
if you scroll to a weird value it will try to do it. For auto bounds checking, use <a href="#!/api/Ext.dom.Element-event-scroll" rel="Ext.dom.Element-event-scroll" class="docClass">scroll</a>.</p>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    
    {b Parameters}:
    {ul {- side: [Js.js_string Js.t]
    {% <p>Either "left" for scrollLeft values or "top" for scrollTop values.</p> %}
    }
    {- value: [Js.number Js.t]
    {% <p>The new scroll value</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard Element
animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method selectable : 'self Js.t Js.meth
  (** {% <p>Enable text selection for this element (normalized across browsers)</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setDisplayed : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the CSS display property. Uses originalDisplay if the specified value is a boolean true.</p>

<p><strong>Defined in override Ext.dom.Element_fx.</strong></p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>Boolean value to display the element using its default display, or a string to set the display directly.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setOpacity : Js.number Js.t -> _ Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Set the opacity of the element</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Parameters}:
    {ul {- opacity: [Js.number Js.t]
    {% <p>The new opacity. 0 = transparent, .5 = 50% visibile, 1 = fully visible, etc</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>a standard Element animation config object or <code>true</code> for
the default animation (<code>\{duration: 350, easing: 'easeIn'\}</code>)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setPositioning : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Set positioning with an object returned by <a href="#!/api/Ext.dom.Element-method-getPositioning" rel="Ext.dom.Element-method-getPositioning" class="docClass">getPositioning</a>.</p>

<p><strong>Defined in override Ext.dom.Element_position.</strong></p> %}
    
    {b Parameters}:
    {ul {- posCfg: [_ Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setScrollLeft : Js.number Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the left scroll position</p>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    
    {b Parameters}:
    {ul {- left: [Js.number Js.t]
    {% <p>The left scroll position</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setScrollTop : Js.number Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the top scroll position</p>

<p><strong>Defined in override Ext.dom.Element_scroll.</strong></p> %}
    
    {b Parameters}:
    {ul {- top: [Js.number Js.t]
    {% <p>The top scroll position</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setVisible : bool Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the visibility of the element (see details). If the visibilityMode is set to Element.DISPLAY, it will use
the display property to hide the element, otherwise it uses visibility. The default is to hide and show using the visibility property.</p>

<p><strong>Defined in override Ext.dom.Element_fx.</strong></p> %}
    
    {b Parameters}:
    {ul {- visible: [bool Js.t]
    {% <p>Whether the element is visible</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>True for the default animation, or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method show : _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Show this element - Uses display mode to determine whether to use "display" or "visibility". See <a href="#!/api/Ext.dom.Element-method-setVisible" rel="Ext.dom.Element-method-setVisible" class="docClass">setVisible</a>.</p>

<p><strong>Defined in override Ext.dom.Element_fx.</strong></p> %}
    
    {b Parameters}:
    {ul {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method slideIn : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Slides the element into view. An anchor point can be optionally passed to set the point of origin for the slide
effect. This function automatically handles wrapping the element with a fixed-size container if needed. See the
<a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> class overview for valid anchor point options. Usage:</p>

<pre><code>// default: slide the element in from the top
el.slideIn();

// custom: slide the element in from the right with a 2-second duration
el.slideIn('r', \{ duration: 2000 \});

// common config options shown with default values
el.slideIn('t', \{
    easing: 'easeOut',
    duration: 500
\});
</code></pre>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- anchor: [Js.js_string Js.t] (optional)
    {% <p>One of the valid <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> anchor positions (defaults to top: 't')</p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>Object literal with any of the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> config options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method slideOut : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Slides the element out of view. An anchor point can be optionally passed to set the end point for the slide
effect. When the effect is completed, the element will be hidden (visibility = 'hidden') but block elements will
still take up space in the document. The element must be removed from the DOM using the 'remove' config option if
desired. This function automatically handles wrapping the element with a fixed-size container if needed. See the
<a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> class overview for valid anchor point options. Usage:</p>

<pre><code>// default: slide the element out to the top
el.slideOut();

// custom: slide the element out to the right with a 2-second duration
el.slideOut('r', \{ duration: 2000 \});

// common config options shown with default values
el.slideOut('t', \{
    easing: 'easeOut',
    duration: 500,
    remove: false,
    useDisplay: false
\});
</code></pre>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- anchor: [Js.js_string Js.t] (optional)
    {% <p>One of the valid <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> anchor positions (defaults to top: 't')</p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>Object literal with any of the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> config options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method swallowEvent : _ Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Stops the specified event(s) from bubbling and optionally prevents the default action</p> %}
    
    {b Parameters}:
    {ul {- eventName: [_ Js.t]
    {% <p>an event / array of events to stop from bubbling</p> %}
    }
    {- preventDefault: [bool Js.t] (optional)
    {% <p>true to prevent the default action too</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method switchOff : _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Blinks the element as if it was clicked and then collapses on its center (similar to switching off a television).
When the effect is completed, the element will be hidden (visibility = 'hidden') but block elements will still
take up space in the document. The element must be removed from the DOM using the 'remove' config option if
desired. Usage:</p>

<pre><code>// default
el.switchOff();

// all config options shown with default values
el.switchOff(\{
    easing: 'easeIn',
    duration: .3,
    remove: false,
    useDisplay: false
\});
</code></pre>

<p><strong>Defined in override Ext.dom.Element_anim.</strong></p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t] (optional)
    {% <p>Object literal with any of the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> config options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method toggle : _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Toggles the element's visibility or display, depending on visibility mode.</p>

<p><strong>Defined in override Ext.dom.Element_fx.</strong></p> %}
    
    {b Parameters}:
    {ul {- animate: [_ Js.t] (optional)
    {% <p>True for the default animation, or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method un : Js.js_string Js.t -> _ Js.callback -> _ Js.t -> 'self Js.t
    Js.meth
  (** {% <p>Removes an event handler from this element.</p>

<p><strong>Note</strong>: if a <em>scope</em> was explicitly specified when <a href="#!/api/Ext.dom.Element-method-on" rel="Ext.dom.Element-method-on" class="docClass">adding</a> the listener,
the same scope must be specified here.</p>

<p>Example:</p>

<pre><code>el.un('click', this.handlerFn);
// or
el.removeListener('click', this.handlerFn);
</code></pre> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The name of the event from which to remove the handler.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The handler function to remove. <strong>This must be a reference to the function passed into the
<a href="#!/api/Ext.dom.Element-method-on" rel="Ext.dom.Element-method-on" class="docClass">on</a> call.</strong></p> %}
    }
    {- scope: [_ Js.t]
    {% <p>If a scope (<strong>this</strong> reference) was specified when the listener was added, then this must
refer to the same object.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method unclip : 'self Js.t Js.meth
  (** {% <p>Return clipping (overflow) to original clipping before <a href="#!/api/Ext.dom.Element-method-clip" rel="Ext.dom.Element-method-clip" class="docClass">clip</a> was called</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method unmask : unit Js.meth
  (** {% <p>Hides a previously applied mask.</p> %}
    *)
  method unselectable : 'self Js.t Js.meth
  (** {% <p>Disables text selection for this element (normalized across browsers)</p>

<p><strong>Defined in override Ext.dom.Element_style.</strong></p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method update_html : Js.js_string Js.t -> bool Js.t Js.optdef ->
    _ Js.callback Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Updates the innerHTML of this element, optionally searching for and processing scripts.</p> %}
    
    {b Parameters}:
    {ul {- html: [Js.js_string Js.t]
    {% <p>The new HTML</p> %}
    }
    {- loadScripts: [bool Js.t] (optional)
    {% <p>True to look for and process scripts (defaults to false)</p> %}
    }
    {- callback: [_ Js.callback] (optional)
    {% <p>For async script loading you can be notified when the update completes</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_dom_AbstractElement.configs
  
  
end

class type events =
object
  inherit Ext_dom_AbstractElement.events
  
  method _DOMActivate : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Fires when an element is activated, for instance, through a mouse click or a keypress.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _DOMAttrModified : (Ext_EventObject.t Js.t -> Dom_html.element Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Fires when an attribute has been modified.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _DOMCharacterDataModified : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Fires when the character data has been modified.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _DOMFocusIn : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Similar to HTML focus event, but can be applied to any focusable element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _DOMFocusOut : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Similar to HTML blur event, but can be applied to any focusable element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _DOMNodeInserted : (Ext_EventObject.t Js.t -> Dom_html.element Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Fires when a node has been added as a child of another node.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _DOMNodeInsertedIntoDocument : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Fires when a node is being inserted into a document.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _DOMNodeRemoved : (Ext_EventObject.t Js.t -> Dom_html.element Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Fires when a descendant node of the element is removed.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _DOMNodeRemovedFromDocument : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Fires when a node is being removed from a document.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _DOMSubtreeModified : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Where supported. Fires when the subtree is modified.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method abort : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an object/image is stopped from loading before completely loaded.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method blur : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an element loses focus either via the pointing device or by tabbing navigation.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method change : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a control loses the input focus and its value has been modified since gaining focus.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method click : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mouse click is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method contextmenu : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a right click is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method dblclick : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mouse double click is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method error : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an object/image/frame cannot be loaded properly.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method focus : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an element receives focus either via the pointing device or by tab navigation.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method keydown : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a keydown is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method keypress : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a keypress is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method keyup : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a keyup is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method load : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the user agent finishes loading all content within the element. Only supported by window, frames,
objects and images.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mousedown : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mousedown is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseenter : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse enters the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseleave : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse leaves the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mousemove : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mousemove is detected with the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseout : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mouseout is detected with the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseover : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mouseover is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseup : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mouseup is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method reset : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a form is reset.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method resize : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a document view is resized.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method scroll : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a document view is scrolled.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method select : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a user selects some text in a text field, including input and textarea.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method submit : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a form is submitted.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method unload : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the user agent removes all content from a window or frame. For elements, it fires when the target
element or any of its content has been removed.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_dom_AbstractElement.statics
  
  method select : _ Js.t -> bool Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Selects elements based on the passed CSS selector to enable <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Element</a> methods
to be applied to many related elements in one statement through the returned <a href="#!/api/Ext.dom.CompositeElement" rel="Ext.dom.CompositeElement" class="docClass">CompositeElement</a> or
<a href="#!/api/Ext.dom.CompositeElementLite" rel="Ext.dom.CompositeElementLite" class="docClass">CompositeElementLite</a> object.</p> %}
    
    {b Parameters}:
    {ul {- selector: [_ Js.t]
    {% <p>The CSS selector or an array of elements</p> %}
    }
    {- unique: [bool Js.t] (optional)
    {% <p>true to create a unique <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> for each element (defaults to a shared flyweight object)</p> %}
    }
    {- root: [_ Js.t] (optional)
    {% <p>The root element of the query or id of the root</p> %}
    }
    }
    *)
  
end

val get_static : unit -> statics Js.t
(** Static instance for lazy-loaded modules. *)

val static : statics Js.t
(** Static instance. *)

val select : _ Js.t -> bool Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t
(** See method [statics.select] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

