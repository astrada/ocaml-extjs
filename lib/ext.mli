(** The Ext namespace (global object) encapsulates all ...
  
  {% <p>The Ext namespace (global object) encapsulates all classes, singletons, and
utility methods provided by Sencha's libraries.</p>

<p>Most user interface Components are at a lower level of nesting in the namespace,
but many common utility functions are provided as direct properties of the Ext namespace.</p>

<p>Also many frequently used methods from other classes are provided as shortcuts
within the Ext namespace. For example <a href="#!/api/Ext-method-getCmp" rel="Ext-method-getCmp" class="docClass">Ext.getCmp</a> aliases
<a href="#!/api/Ext.ComponentManager-method-get" rel="Ext.ComponentManager-method-get" class="docClass">Ext.ComponentManager.get</a>.</p>

<p>Many applications are initiated with <a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a> which is
called once the DOM is ready. This ensures all scripts have been loaded,
preventing dependency issues. For example:</p>

<pre><code><a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function()\{
    new <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>(\{
        renderTo: document.body,
        html: 'DOM ready!'
    \});
\});
</code></pre>

<p>For more information about how to use the Ext classes, see:</p>

<ul>
<li><a href="http://www.sencha.com/learn/">The Learning Center</a></li>
<li><a href="http://www.sencha.com/learn/Ext_FAQ">The FAQ</a></li>
<li><a href="http://www.sencha.com/forum/">The forums</a></li>
</ul> %}
  *)

class type t =
object('self)
  
  method _BLANK_IMAGE_URL : Js.js_string Js.t Js.prop
  (** {% <p>URL to a 1x1 transparent gif image used by Ext to create inline icons with
CSS background images. In older versions of IE, this defaults to
"http://sencha.com/s.gif" and you should change this to a URL on your server.
For other browsers it uses an inline data URL.</p> %}
    *)
  method _SSL_SECURE_URL : Js.js_string Js.t Js.prop
  (** {% <p>URL to a blank file used by Ext when in secure mode for iframe src and onReady src
to prevent the IE insecure content warning (<code>'about:blank'</code>, except for IE
in secure mode, which is <code>'javascript:""'</code>).</p> %}
    *)
  method _USE_NATIVE_JSON : bool Js.t Js.prop
  (** {% <p>Indicates whether to use native browser parsing for JSON methods.
This option is ignored if the browser does not support native JSON methods.</p>

<p><strong>Note:</strong> Native JSON methods will not work with objects that have functions.
Also, property names must be quoted, otherwise the data will not parse.</p> %}
    
    Defaults to: [false]
    *)
  method chromeVersion : Js.number Js.t Js.prop
  (** {% <p>The current version of Chrome (0 if the browser is not Chrome).</p> %}
    *)
  method emptyFn : _ Js.callback Js.prop
  (** {% <p>A reusable empty function</p> %}
    *)
  method emptyString : _ Js.t Js.prop
  (** {% <p>A zero length string which will pass a truth test. Useful for passing to methods
which use a truth test to reject <i>falsy</i> values where a string value must be cleared.</p> %}
    *)
  method enableFx : bool Js.t Js.prop
  (** {% <p>True if the <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> Class is available.</p> %}
    *)
  method enableGarbageCollector : bool Js.t Js.prop
  (** {% <p>True to automatically uncache orphaned Ext.Elements periodically</p> %}
    
    Defaults to: [true]
    *)
  method enableListenerCollection : bool Js.t Js.prop
  (** {% <p>True to automatically purge event listeners during garbageCollection.</p> %}
    
    Defaults to: [true]
    *)
  method enableNestedListenerRemoval : bool Js.t Js.prop
  (** {% <p><strong>Experimental.</strong> True to cascade listener removal to child elements when an element
is removed. Currently not optimized for performance.</p> %}
    
    Defaults to: [false]
    *)
  method enumerables : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>An array containing extra enumerables for old browsers</p> %}
    *)
  method firefoxVersion : Js.number Js.t Js.prop
  (** {% <p>The current version of Firefox (0 if the browser is not Firefox).</p> %}
    *)
  method globalEvents : Ext_util_Observable.t Js.t Js.prop
  (** {% <p>An instance of <code><a href="#!/api/Ext.util.Observable" rel="Ext.util.Observable" class="docClass">Ext.util.Observable</a></code> through which Ext fires global events.</p>

<p>This Observable instance fires the following events:</p>

<ul>
<li><p><strong><code>idle</code></strong></p>

<p>Fires when an event handler finishes its run, just before returning to browser control.</p>

<p>This includes DOM event handlers, Ajax (including JSONP) event handlers, and <a href="#!/api/Ext.util.TaskRunner" rel="Ext.util.TaskRunner" class="docClass">TaskRunners</a></p>

<p>This can be useful for performing cleanup, or update tasks which need to happen only
after all code in an event handler has been run, but which should not be executed in a timer
due to the intervening browser reflow/repaint which would take place.</p></li>
<li><p><strong><code>ready</code></strong></p>

<p> Fires when the DOM is ready, and all required classes have been loaded. Functionally
 the same as <a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">onReady</a>, but must be called with the <code>single</code> option:</p>

<pre><code>  <a href="#!/api/Ext-method-on" rel="Ext-method-on" class="docClass">Ext.on</a>(\{
      ready: function() \{
          console.log('document is ready!');
      \},
      single: true
  \}); 
</code></pre></li>
<li><p><strong><code>resumelayouts</code></strong></p>

<p> Fires after global layout processing has been resumed in <a href="#!/api/Ext.AbstractComponent-method-resumeLayouts" rel="Ext.AbstractComponent-method-resumeLayouts" class="docClass">Ext.AbstractComponent.resumeLayouts</a>.</p></li>
</ul> %}
    *)
  method ieVersion : Js.number Js.t Js.prop
  (** {% <p>The current version of IE (0 if the browser is not IE). This does not account
for the documentMode of the current page, which is factored into <a href="#!/api/Ext-property-isIE7" rel="Ext-property-isIE7" class="docClass">isIE7</a>,
<a href="#!/api/Ext-property-isIE8" rel="Ext-property-isIE8" class="docClass">isIE8</a> and <a href="#!/api/Ext-property-isIE9" rel="Ext-property-isIE9" class="docClass">isIE9</a>. Thus this is not always true:</p>

<pre><code><a href="#!/api/Ext-property-isIE8" rel="Ext-property-isIE8" class="docClass">Ext.isIE8</a> == (<a href="#!/api/Ext-property-ieVersion" rel="Ext-property-ieVersion" class="docClass">Ext.ieVersion</a> == 8)
</code></pre> %}
    *)
  method isChrome : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Chrome.</p> %}
    *)
  method isFF10 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses FireFox 10</p> %}
    *)
  method isFF3_0 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses FireFox 3.0</p> %}
    *)
  method isFF3_5 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses FireFox 3.5</p> %}
    *)
  method isFF3_6 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses FireFox 3.6</p> %}
    *)
  method isFF4 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses FireFox 4</p> %}
    *)
  method isFF5 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses FireFox 5</p> %}
    *)
  method isGecko : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses the Gecko layout engine (e.g. Mozilla, Firefox).</p> %}
    *)
  method isGecko10 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses a Gecko 5.0+ layout engine (e.g. Firefox 5.x).</p> %}
    *)
  method isGecko3 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses a Gecko 1.9+ layout engine (e.g. Firefox 3.x).</p> %}
    *)
  method isGecko4 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses a Gecko 2.0+ layout engine (e.g. Firefox 4.x).</p> %}
    *)
  method isGecko5 : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses a Gecko 5.0+ layout engine (e.g. Firefox 5.x).</p> %}
    *)
  method isIE : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer.</p> %}
    *)
  method isIE10 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 10.x.</p> %}
    *)
  method isIE10m : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 10.x or lower.</p> %}
    *)
  method isIE10p : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 10.x or higher.</p> %}
    *)
  method isIE6 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 6.x.</p> %}
    *)
  method isIE7 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 7.x.</p> %}
    *)
  method isIE7m : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 7.x or lower.</p> %}
    *)
  method isIE7p : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 7.x or higher.</p> %}
    *)
  method isIE8 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 8.x.</p> %}
    *)
  method isIE8m : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 8.x or lower.</p> %}
    *)
  method isIE8p : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 8.x or higher.</p> %}
    *)
  method isIE9 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 9.x.</p> %}
    *)
  method isIE9m : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 9.x or lower.</p> %}
    *)
  method isIE9p : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Internet Explorer 9.x or higher.</p> %}
    *)
  method isLinux : bool Js.t Js.prop
  (** {% <p>True if the detected platform is Linux.</p> %}
    *)
  method isMac : bool Js.t Js.prop
  (** {% <p>True if the detected platform is Mac OS.</p> %}
    *)
  method isOpera : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Opera.</p> %}
    *)
  method isOpera10_5 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Opera 10.5x.</p> %}
    *)
  method isReady : bool Js.t Js.prop
  (** {% <p>True when the document is fully initialized and ready for action</p> %}
    
    Defaults to: [false]
    *)
  method isSafari : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Safari.</p> %}
    *)
  method isSafari2 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Safari 2.x.</p> %}
    *)
  method isSafari3 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Safari 3.x.</p> %}
    *)
  method isSafari4 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Safari 4.x.</p> %}
    *)
  method isSafari5 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Safari 5.x.</p> %}
    *)
  method isSafari5_0 : bool Js.t Js.prop
  (** {% <p>True if the detected browser is Safari 5.0.x.</p> %}
    *)
  method isSecure : bool Js.t Js.prop
  (** {% <p>True if the page is running over SSL</p> %}
    *)
  method isWebKit : bool Js.t Js.prop
  (** {% <p>True if the detected browser uses WebKit.</p> %}
    *)
  method isWindows : bool Js.t Js.prop
  (** {% <p>True if the detected platform is Windows.</p> %}
    *)
  method name : Js.js_string Js.t Js.prop
  (** {% <p>The name of the property in the global namespace (The <code>window</code> in browser environments) which refers to the current instance of Ext.</p>


<p>This is usually <code>"Ext"</code>, but if a sandboxed build of ExtJS is being used, this will be an alternative name.</p>


<p>If code is being generated for use by <code>eval</code> or to create a <code>new Function</code>, and the global instance
of Ext must be referenced, this is the name that should be built into the code.</p> %}
    
    Defaults to: ['Ext']
    *)
  method operaVersion : Js.number Js.t Js.prop
  (** {% <p>The current version of Opera (0 if the browser is not Opera).</p> %}
    *)
  method safariVersion : Js.number Js.t Js.prop
  (** {% <p>The current version of Safari (0 if the browser is not Safari).</p> %}
    *)
  method useShims : bool Js.t Js.prop
  (** {% <p>By default, Ext intelligently decides whether floating elements should be shimmed.
If you are using flash, you may want to set this to true.</p> %}
    *)
  method webKitVersion : Js.number Js.t Js.prop
  (** {% <p>The current version of WebKit (0 if the browser does not use WebKit).</p> %}
    *)
  method addBehaviors : _ Js.t -> unit Js.meth
  (** {% <p>Applies event listeners to elements by selectors when the document is ready.
The event name is specified with an <code>\@</code> suffix.</p>

<pre><code><a href="#!/api/Ext-method-addBehaviors" rel="Ext-method-addBehaviors" class="docClass">Ext.addBehaviors</a>(\{
    // add a listener for click on all anchors in element with id foo
    '#foo a\@click' : function(e, t)\{
        // do something
    \},

    // add the same listener to multiple selectors (separated by comma BEFORE the \@)
    '#foo a, #bar span.some-class\@mouseover' : function()\{
        // do something
    \}
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- obj: [_ Js.t] {% <p>The list of behaviors to apply</p> %}
    }
    }
    *)
  method addNamespaces : _ Js.t -> unit Js.meth
  (** {% <p>Adds namespace(s) to known list.</p> %}
    
    {b Parameters}:
    {ul {- namespace: [_ Js.t]
    }
    }
    *)
  method application : _ Js.t -> unit Js.meth
  (** {% <p>Loads <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a> class and starts it up with given configuration after the
page is ready.</p>

<p>See <code><a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a></code> for details.</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t]
    {% <p>Application config object or name of a class derived from <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a>.</p> %}
    }
    }
    *)
  method apply : _ Js.t -> _ Js.t -> _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Copies all the properties of config to the specified object.
Note that if recursive merging and cloning without referencing the original objects / arrays is needed, use
<a href="#!/api/Ext.Object-method-merge" rel="Ext.Object-method-merge" class="docClass">Ext.Object.merge</a> instead.</p> %}
    
    {b Parameters}:
    {ul {- _object: [_ Js.t]
    {% <p>The receiver of the properties</p> %}
    }
    {- config: [_ Js.t]
    {% <p>The source of the properties</p> %}
    }
    {- defaults: [_ Js.t] (optional)
    {% <p>A different object that will also be applied for default values</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>returns obj</p> %}
    }
    }
    *)
  method applyIf : _ Js.t -> _ Js.t -> _ Js.t Js.meth
  (** {% <p>Copies all the properties of config to object if they don't already exist.</p> %}
    
    {b Parameters}:
    {ul {- _object: [_ Js.t]
    {% <p>The receiver of the properties</p> %}
    }
    {- config: [_ Js.t]
    {% <p>The source of the properties</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>returns obj</p> %}
    }
    }
    *)
  method batchLayouts : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Utility wrapper that suspends layouts of all components for the duration of a given function.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to execute.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the specified function is executed.</p> %}
    }
    }
    *)
  method bind : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.callback Js.meth
  (** {% <p>Create a new function from the provided <code>fn</code>, change <code>this</code> to the provided scope, optionally
overrides arguments for the call. (Defaults to the arguments passed by the caller)</p>

<p><a href="#!/api/Ext-method-bind" rel="Ext-method-bind" class="docClass">Ext.bind</a> is alias for <a href="#!/api/Ext.Function-method-bind" rel="Ext.Function-method-bind" class="docClass">Ext.Function.bind</a></p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to delegate.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the function is executed.
<strong>If omitted, defaults to the default global environment object (usually the browser window).</strong></p> %}
    }
    {- args: [_ Js.js_array Js.t] (optional)
    {% <p>Overrides arguments for the call. (Defaults to the arguments passed by the caller)</p> %}
    }
    {- appendArgs: [_ Js.t] (optional)
    {% <p>if True args are appended to call args instead of overriding,
if a number the args are inserted at the specified position</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.callback] {% <p>The new function</p> %}
    }
    }
    *)
  method callback : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> Js.number Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Execute a callback function in a particular scope. If <code>callback</code> argument is a
function reference, that is called. If it is a string, the string is assumed to
be the name of a method on the given <code>scope</code>. If no function is passed the call
is ignored.</p>

<p>For example, these calls are equivalent:</p>

<pre><code> var myFunc = this.myFunc;

 <a href="#!/api/Ext-method-callback" rel="Ext-method-callback" class="docClass">Ext.callback</a>('myFunc', this, [arg1, arg2]);
 <a href="#!/api/Ext-method-callback" rel="Ext-method-callback" class="docClass">Ext.callback</a>(myFunc, this, [arg1, arg2]);

 <a href="#!/api/Ext-method-isFunction" rel="Ext-method-isFunction" class="docClass">Ext.isFunction</a>(myFunc) &amp;&amp; this.myFunc(arg1, arg2);
</code></pre> %}
    
    {b Parameters}:
    {ul {- callback: [_ Js.callback]
    {% <p>The callback to execute</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope to execute in</p> %}
    }
    {- args: [_ Js.js_array Js.t] (optional)
    {% <p>The arguments to pass to the function</p> %}
    }
    {- delay: [Js.number Js.t] (optional)
    {% <p>Pass a number to delay the call by a number of milliseconds.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The value returned by the callback or <code>undefined</code> (if there is a <code>delay</code>
or if the <code>callback</code> is not a function).</p> %}
    }
    }
    *)
  method clone : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Clone simple variables including array, \{\}-like objects, DOM nodes and Date without keeping the old reference.
A reference for the object itself is returned if it's not a direct decendant of Object. For model cloning,
see <a href="#!/api/Ext.data.Model-method-copy" rel="Ext.data.Model-method-copy" class="docClass">Model.copy</a>.</p> %}
    
    {b Parameters}:
    {ul {- item: [_ Js.t]
    {% <p>The variable to clone</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>clone</p> %}
    }
    }
    *)
  method coerce : _ Js.t -> _ Js.t -> _ Js.t Js.meth
  (** {% <p>Coerces the first value if possible so that it is comparable to the second value.</p>

<p>Coercion only works between the basic atomic data types String, Boolean, Number, Date, null and undefined.</p>

<p>Numbers and numeric strings are coerced to Dates using the value as the millisecond era value.</p>

<p>Strings are coerced to Dates by parsing using the <a href="#!/api/Ext.Date-property-defaultFormat" rel="Ext.Date-property-defaultFormat" class="docClass">defaultFormat</a>.</p>

<p>For example</p>

<pre><code><a href="#!/api/Ext-method-coerce" rel="Ext-method-coerce" class="docClass">Ext.coerce</a>('false', true);
</code></pre>

<p>returns the boolean value <code>false</code> because the second parameter is of type <code>Boolean</code>.</p> %}
    
    {b Parameters}:
    {ul {- from: [_ Js.t] {% <p>The value to coerce</p> %}
    }
    {- to: [_ Js.t]
    {% <p>The value it must be compared against</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The coerced value.</p> %}
    }
    }
    *)
  method copyTo : _ Js.t -> _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Copies a set of named properties fom the source object to the destination object.</p>

<p>Example:</p>

<pre><code>ImageComponent = <a href="#!/api/Ext-method-extend" rel="Ext-method-extend" class="docClass">Ext.extend</a>(<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>, \{
    initComponent: function() \{
        this.autoEl = \{ tag: 'img' \};
        MyComponent.superclass.initComponent.apply(this, arguments);
        this.initialBox = <a href="#!/api/Ext-method-copyTo" rel="Ext-method-copyTo" class="docClass">Ext.copyTo</a>(\{\}, this.initialConfig, 'x,y,width,height');
    \}
\});
</code></pre>

<p>Important note: To borrow class prototype methods, use <a href="#!/api/Ext.Base-static-method-borrow" rel="Ext.Base-static-method-borrow" class="docClass">Ext.Base.borrow</a> instead.</p> %}
    
    {b Parameters}:
    {ul {- dest: [_ Js.t]
    {% <p>The destination object.</p> %}
    }
    {- source: [_ Js.t] {% <p>The source object.</p> %}
    }
    {- names: [_ Js.t]
    {% <p>Either an Array of property names, or a comma-delimited list
of property names to copy.</p> %}
    }
    {- usePrototypeKeys: [bool Js.t] (optional)
    {% <p>Defaults to false. Pass true to copy keys off of the
prototype as well as the instance.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The modified object.</p> %}
    }
    }
    *)
  method create : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Instantiate a class by either full name, alias or alternate name.</p>

<p>If <a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a> is <a href="#!/api/Ext.Loader-method-setConfig" rel="Ext.Loader-method-setConfig" class="docClass">enabled</a> and the class has
not been defined yet, it will attempt to load the class via synchronous loading.</p>

<p>For example, all these three lines return the same result:</p>

<pre><code> // alias
 var window = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('widget.window', \{
     width: 600,
     height: 800,
     ...
 \});

 // alternate name
 var window = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.Window</a>', \{
     width: 600,
     height: 800,
     ...
 \});

 // full class name
 var window = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>', \{
     width: 600,
     height: 800,
     ...
 \});

 // single object with xclass property:
 var window = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>(\{
     xclass: '<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>', // any valid value for 'name' (above)
     width: 600,
     height: 800,
     ...
 \});
</code></pre> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t] (optional)
    {% <p>The class name or alias. Can be specified as <code>xclass</code>
property if only one object parameter is specified.</p> %}
    }
    {- args: [_ Js.t] (optional)
    {% <p>Additional arguments after the name will be passed to
the class' constructor.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>instance</p> %}
    }
    }
    *)
  method createByAlias : Js.js_string Js.t -> _ Js.t -> _ Js.t Js.meth
  (** {% <p>Instantiate a class by its alias.</p>

<p><a href="#!/api/Ext.ClassManager-method-instantiateByAlias" rel="Ext.ClassManager-method-instantiateByAlias" class="docClass">Ext.ClassManager.instantiateByAlias</a> is usually invoked by the shorthand <a href="#!/api/Ext-method-createByAlias" rel="Ext-method-createByAlias" class="docClass">createByAlias</a>.</p>

<p>If <a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a> is <a href="#!/api/Ext.Loader-method-setConfig" rel="Ext.Loader-method-setConfig" class="docClass">enabled</a> and the class has not been defined yet, it will
attempt to load the class via synchronous loading.</p>

<pre><code>var window = <a href="#!/api/Ext-method-createByAlias" rel="Ext-method-createByAlias" class="docClass">Ext.createByAlias</a>('widget.window', \{ width: 600, height: 800, ... \});
</code></pre> %}
    
    {b Parameters}:
    {ul {- alias: [Js.js_string Js.t]
    }
    {- args: [_ Js.t]
    }
    }
    *)
  method decode : Js.js_string Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Shorthand for <a href="#!/api/Ext.JSON-method-decode" rel="Ext.JSON-method-decode" class="docClass">Ext.JSON.decode</a></p>

<p>Decodes (parses) a JSON string to an object. If the JSON is invalid, this function throws
a SyntaxError unless the safe option is set.</p> %}
    
    {b Parameters}:
    {ul {- json: [Js.js_string Js.t]
    {% <p>The JSON string</p> %}
    }
    {- safe: [bool Js.t] (optional)
    {% <p>True to return null, false to throw an exception if the JSON is invalid.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The resulting object</p> %}
    }
    }
    *)
  method defer : _ Js.callback -> Js.number Js.t -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> _ Js.t Js.optdef -> Js.number Js.t
    Js.meth
  (** {% <p>Calls this function after the number of millseconds specified, optionally in a specific scope. Example usage:</p>

<pre><code>var sayHi = function(name)\{
    alert('Hi, ' + name);
\}

// executes immediately:
sayHi('Fred');

// executes after 2 seconds:
<a href="#!/api/Ext.Function-method-defer" rel="Ext.Function-method-defer" class="docClass">Ext.Function.defer</a>(sayHi, 2000, this, ['Fred']);

// this syntax is sometimes useful for deferring
// execution of an anonymous function:
<a href="#!/api/Ext.Function-method-defer" rel="Ext.Function-method-defer" class="docClass">Ext.Function.defer</a>(function()\{
    alert('Anonymous');
\}, 100);
</code></pre>

<p><a href="#!/api/Ext-method-defer" rel="Ext-method-defer" class="docClass">Ext.defer</a> is alias for <a href="#!/api/Ext.Function-method-defer" rel="Ext.Function-method-defer" class="docClass">Ext.Function.defer</a></p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to defer.</p> %}
    }
    {- millis: [Js.number Js.t]
    {% <p>The number of milliseconds for the setTimeout call
(if less than or equal to 0 the function is executed immediately)</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the function is executed.
<strong>If omitted, defaults to the browser window.</strong></p> %}
    }
    {- args: [_ Js.js_array Js.t] (optional)
    {% <p>Overrides arguments for the call. (Defaults to the arguments passed by the caller)</p> %}
    }
    {- appendArgs: [_ Js.t] (optional)
    {% <p>if True args are appended to call args instead of overriding,
if a number the args are inserted at the specified position</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The timeout id that can be used with clearTimeout</p> %}
    }
    }
    *)
  method define : Js.js_string Js.t -> _ Js.t -> _ Js.callback ->
    #Ext_Base.t Js.t Js.meth
  (** {% <p>Defines a class or override. A basic class is defined like this:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.awesome.Class', \{
     someProperty: 'something',

     someMethod: function(s) \{
         alert(s + this.someProperty);
     \}

     ...
 \});

 var obj = new My.awesome.Class();

 obj.someMethod('Say '); // alerts 'Say something'
</code></pre>

<p>To create an anonymous class, pass <code>null</code> for the <code>className</code>:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>(null, \{
     constructor: function () \{
         // ...
     \}
 \});
</code></pre>

<p>In some cases, it is helpful to create a nested scope to contain some private
properties. The best way to do this is to pass a function instead of an object
as the second parameter. This function will be called to produce the class
body:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.foo.Bar', function () \{
     var id = 0;

     return \{
         nextId: function () \{
             return ++id;
         \}
     \};
 \});
</code></pre>

<p><em>Note</em> that when using override, the above syntax will not override successfully, because
the passed function would need to be executed first to determine whether or not the result
is an override or defining a new object. As such, an alternative syntax that immediately
invokes the function can be used:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.override.BaseOverride', function () \{
     var counter = 0;

     return \{
         override: '<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>',
         logId: function () \{
             console.log(++counter, this.id);
         \}
     \};
 \}());
</code></pre>

<p>When using this form of <code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a></code>, the function is passed a reference to its
class. This can be used as an efficient way to access any static properties you
may have:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.foo.Bar', function (Bar) \{
     return \{
         statics: \{
             staticMethod: function () \{
                 // ...
             \}
         \},

         method: function () \{
             return Bar.staticMethod();
         \}
     \};
 \});
</code></pre>

<p>To define an override, include the <code>override</code> property. The content of an
override is aggregated with the specified class in order to extend or modify
that class. This can be as simple as setting default property values or it can
extend and/or replace methods. This can also extend the statics of the class.</p>

<p>One use for an override is to break a large class into manageable pieces.</p>

<pre><code> // File: /src/app/Panel.js

 <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.app.Panel', \{
     extend: '<a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>',
     requires: [
         'My.app.PanelPart2',
         'My.app.PanelPart3'
     ]

     constructor: function (config) \{
         this.callParent(arguments); // calls <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>'s constructor
         //...
     \},

     statics: \{
         method: function () \{
             return 'abc';
         \}
     \}
 \});

 // File: /src/app/PanelPart2.js
 <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.app.PanelPart2', \{
     override: 'My.app.Panel',

     constructor: function (config) \{
         this.callParent(arguments); // calls My.app.Panel's constructor
         //...
     \}
 \});
</code></pre>

<p>Another use of overrides is to provide optional parts of classes that can be
independently required. In this case, the class may even be unaware of the
override altogether.</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.ux.CoolTip', \{
     override: '<a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">Ext.tip.ToolTip</a>',

     constructor: function (config) \{
         this.callParent(arguments); // calls <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">Ext.tip.ToolTip</a>'s constructor
         //...
     \}
 \});
</code></pre>

<p>The above override can now be required as normal.</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.app.App', \{
     requires: [
         'My.ux.CoolTip'
     ]
 \});
</code></pre>

<p>Overrides can also contain statics:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.app.BarMod', \{
     override: 'Ext.foo.Bar',

     statics: \{
         method: function (x) \{
             return this.callParent([x * 2]); // call Ext.foo.Bar.method
         \}
     \}
 \});
</code></pre>

<p>IMPORTANT: An override is only included in a build if the class it overrides is
required. Otherwise, the override, like the target class, is not included.</p> %}
    
    {b Parameters}:
    {ul {- className: [Js.js_string Js.t]
    {% <p>The class name to create in string dot-namespaced format, for example:
'My.very.awesome.Class', 'FeedViewer.plugin.CoolPager'
It is highly recommended to follow this simple convention:
 * The root and the class name are 'CamelCased'
 * Everything else is lower-cased
Pass <code>null</code> to create an anonymous class.</p> %}
    }
    {- data: [_ Js.t]
    {% <p>The key * value pairs of properties to apply to this class. Property names can be of any valid
strings, except those in the reserved listed below:
 * <code>mixins</code>
 * <code>statics</code>
 * <code>config</code>
 * <code>alias</code>
 * <code>self</code>
 * <code>singleton</code>
 * <code>alternateClassName</code>
 * <code>override</code></p> %}
    }
    {- createdFn: [_ Js.callback]
    {% <p>Optional callback to execute after the class is created, the execution scope of which
(<code>this</code>) will be the newly created class itself.</p> %}
    }
    }
    *)
  method deprecate : Js.js_string Js.t -> Js.js_string Js.t -> _ Js.callback
    -> _ Js.t -> unit Js.meth
  (** {% <p>Create a closure for deprecated code.</p>

<pre><code>// This means Ext.oldMethod is only supported in 4.0.0beta and older.
// If <a href="#!/api/Ext-method-getVersion" rel="Ext-method-getVersion" class="docClass">Ext.getVersion</a>('extjs') returns a version that is later than '4.0.0beta', for example '4.0.0RC',
// the closure will not be invoked
<a href="#!/api/Ext-method-deprecate" rel="Ext-method-deprecate" class="docClass">Ext.deprecate</a>('extjs', '4.0.0beta', function() \{
    Ext.oldMethod = Ext.newMethod;

    ...
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- packageName: [Js.js_string Js.t]
    {% <p>The package name</p> %}
    }
    {- since: [Js.js_string Js.t]
    {% <p>The last version before it's deprecated</p> %}
    }
    {- closure: [_ Js.callback]
    {% <p>The callback function to be executed with the specified version is less than the current version</p> %}
    }
    {- scope: [_ Js.t]
    {% <p>The execution scope (<code>this</code>) if the closure</p> %}
    }
    }
    *)
  method destroy : _ Js.t -> unit Js.meth
  (** {% <p>Attempts to destroy any objects passed to it by removing all event listeners, removing them from the
DOM (if applicable) and calling their destroy functions (if available).  This method is primarily
intended for arguments of type <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> and <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>, but any subclass of
<a href="#!/api/Ext.util.Observable" rel="Ext.util.Observable" class="docClass">Ext.util.Observable</a> can be passed in.  Any number of elements and/or components can be
passed into this function in a single call as separate arguments.</p> %}
    
    {b Parameters}:
    {ul {- args: [_ Js.t]
    {% <p>Any number of elements or components, or an Array of either of these to destroy.</p> %}
    }
    }
    *)
  method destroyMembers : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  (** {% <p>Attempts to destroy and then remove a set of named properties of the passed object.</p> %}
    
    {b Parameters}:
    {ul {- o: [_ Js.t]
    {% <p>The object (most likely a Component) who's properties you wish to destroy.</p> %}
    }
    {- args: [Js.js_string Js.t]
    {% <p>One or more names of the properties to destroy and remove from the object.</p> %}
    }
    }
    *)
  method each : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.meth
  (** {% <p>Iterates an array or an iterable value and invoke the given callback function for each item.</p>

<pre><code>var countries = ['Vietnam', 'Singapore', 'United States', 'Russia'];

<a href="#!/api/Ext.Array-method-each" rel="Ext.Array-method-each" class="docClass">Ext.Array.each</a>(countries, function(name, index, countriesItSelf) \{
    console.log(name);
\});

var sum = function() \{
    var sum = 0;

    <a href="#!/api/Ext.Array-method-each" rel="Ext.Array-method-each" class="docClass">Ext.Array.each</a>(arguments, function(value) \{
        sum += value;
    \});

    return sum;
\};

sum(1, 2, 3); // returns 6
</code></pre>

<p>The iteration can be stopped by returning false in the function callback.</p>

<pre><code><a href="#!/api/Ext.Array-method-each" rel="Ext.Array-method-each" class="docClass">Ext.Array.each</a>(countries, function(name, index, countriesItSelf) \{
    if (name === 'Singapore') \{
        return false; // break here
    \}
\});
</code></pre>

<p><a href="#!/api/Ext-method-each" rel="Ext-method-each" class="docClass">Ext.each</a> is alias for <a href="#!/api/Ext.Array-method-each" rel="Ext.Array-method-each" class="docClass">Ext.Array.each</a></p> %}
    
    {b Parameters}:
    {ul {- iterable: [_ Js.t]
    {% <p>The value to be iterated. If this
argument is not iterable, the callback function is called once.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The callback function. If it returns false, the iteration stops and this method returns
the current <code>index</code>.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the specified function is executed.</p> %}
    }
    {- reverse: [bool Js.t] (optional)
    {% <p>Reverse the iteration order (loop from the end to the beginning)
Defaults false</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>See description for the <code>fn</code> parameter.</p> %}
    }
    }
    *)
  method encode : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Shorthand for <a href="#!/api/Ext.JSON-method-encode" rel="Ext.JSON-method-encode" class="docClass">Ext.JSON.encode</a></p>

<p>Encodes an Object, Array or other value.</p>

<p>If the environment's native JSON encoding is not being used (<a href="#!/api/Ext-property-USE_NATIVE_JSON" rel="Ext-property-USE_NATIVE_JSON" class="docClass">USE_NATIVE_JSON</a> is not set,
or the environment does not support it), then ExtJS's encoding will be used. This allows the developer
to add a <code>toJSON</code> method to their classes which need serializing to return a valid JSON representation
of the object.</p> %}
    
    {b Parameters}:
    {ul {- o: [_ Js.t]
    {% <p>The variable to encode</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The JSON string</p> %}
    }
    }
    *)
  method exclude : _ Js.js_array Js.t -> _ Js.t Js.meth
  (** {% <p>Convenient shortcut to <a href="#!/api/Ext.Loader-method-exclude" rel="Ext.Loader-method-exclude" class="docClass">Ext.Loader.exclude</a></p>

<p>Explicitly exclude files from being loaded. Useful when used in conjunction with a broad include expression.
Can be chained with more <code>require</code> and <code>exclude</code> methods, eg:</p>

<pre><code><a href="#!/api/Ext-method-exclude" rel="Ext-method-exclude" class="docClass">Ext.exclude</a>('Ext.data.*').require('*');

<a href="#!/api/Ext-method-exclude" rel="Ext-method-exclude" class="docClass">Ext.exclude</a>('widget.button*').require('widget.*');
</code></pre>

<p><a href="#!/api/Ext-method-exclude" rel="Ext-method-exclude" class="docClass">exclude</a> is alias for <a href="#!/api/Ext.Loader-method-exclude" rel="Ext.Loader-method-exclude" class="docClass">Ext.Loader.exclude</a>.</p> %}
    
    {b Parameters}:
    {ul {- excludes: [_ Js.js_array Js.t]
    }
    }
    *)
  method fly : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Ext_dom_Element_Fly.t Js.t Js.meth
  (** {% <p>Gets the singleton <a href="#!/api/Ext.dom.Element.Fly" rel="Ext.dom.Element.Fly" class="docClass">flyweight</a> element, with the passed node as the active element.</p>

<p>Because it is a singleton, this Flyweight does not have an ID, and must be used and discarded in a single line.
You may not keep and use the reference to this singleton over multiple lines because methods that you call
may themselves make use of <a href="#!/api/Ext-method-fly" rel="Ext-method-fly" class="docClass">fly</a> and may change the DOM element to which the instance refers.</p>

<p><a href="#!/api/Ext-method-fly" rel="Ext-method-fly" class="docClass">fly</a> is alias for <a href="#!/api/Ext.dom.AbstractElement-static-method-fly" rel="Ext.dom.AbstractElement-static-method-fly" class="docClass">Ext.dom.AbstractElement.fly</a>.</p>

<p>Use this to make one-time references to DOM elements which are not going to be accessed again either by
application code, or by Ext's classes. If accessing an element which will be processed regularly, then <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a> will be more appropriate to take advantage of the caching provided by the <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>
class.</p> %}
    
    {b Parameters}:
    {ul {- dom: [_ Js.t]
    {% <p>The dom node or id</p> %}
    }
    {- named: [Js.js_string Js.t] (optional)
    {% <p>Allows for creation of named reusable flyweights to prevent conflicts (e.g.
internally Ext uses "_global")</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element_Fly.t Js.t]
    {% <p>The singleton flyweight object (or null if no matching element was found)</p> %}
    }
    }
    *)
  method get : _ Js.t -> Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Retrieves <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a> objects. <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">get</a> is alias for <a href="#!/api/Ext.dom.Element-static-method-get" rel="Ext.dom.Element-static-method-get" class="docClass">Ext.dom.Element.get</a>.</p>

<p><strong>This method does not retrieve <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a>s.</strong> This method retrieves <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>
objects which encapsulate DOM elements. To retrieve a Component by its ID, use <a href="#!/api/Ext.ComponentManager-method-get" rel="Ext.ComponentManager-method-get" class="docClass">Ext.ComponentManager.get</a>.</p>

<p>When passing an id, it should not include the <code>#</code> character that is used for a css selector.</p>

<pre><code>// For an element with id 'foo'
<a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('foo'); // Correct
<a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('#foo'); // Incorrect
</code></pre>

<p>Uses simple caching to consistently return the same object. Automatically fixes if an object was recreated with
the same id via AJAX or DOM.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>The id of the node, a DOM Node or an existing Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t]
    {% <p>The Element object (or null if no matching element was found)</p> %}
    }
    }
    *)
  method getBody : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the current document body as an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
    *)
  method getClass : _ Js.t -> Ext_Class.t Js.t Js.meth
  (** {% <p>Get the class of the provided object; returns null if it's not an instance
of any class created with <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>.</p>

<p><a href="#!/api/Ext.ClassManager-method-getClass" rel="Ext.ClassManager-method-getClass" class="docClass">Ext.ClassManager.getClass</a> is usually invoked by the shorthand <a href="#!/api/Ext-method-getClass" rel="Ext-method-getClass" class="docClass">getClass</a>.</p>

<pre><code>var component = new <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>();

<a href="#!/api/Ext-method-getClass" rel="Ext-method-getClass" class="docClass">Ext.getClass</a>(component); // returns <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>
</code></pre> %}
    
    {b Parameters}:
    {ul {- object: [_ Js.t]
    }
    }
    *)
  method getClassName : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Get the name of the class by its reference or its instance;</p>

<p><a href="#!/api/Ext.ClassManager-method-getName" rel="Ext.ClassManager-method-getName" class="docClass">Ext.ClassManager.getName</a> is usually invoked by the shorthand <a href="#!/api/Ext-method-getClassName" rel="Ext-method-getClassName" class="docClass">getClassName</a>.</p>

<pre><code>Ext.getName(<a href="#!/api/Ext.Action" rel="Ext.Action" class="docClass">Ext.Action</a>); // returns "<a href="#!/api/Ext.Action" rel="Ext.Action" class="docClass">Ext.Action</a>"
</code></pre> %}
    
    {b Parameters}:
    {ul {- object: [_ Js.t]
    }
    }
    *)
  method getCmp : Js.js_string Js.t -> _ Js.t Js.meth
  (** {% <p>This is shorthand reference to <a href="#!/api/Ext.ComponentManager-method-get" rel="Ext.ComponentManager-method-get" class="docClass">Ext.ComponentManager.get</a>.
Looks up an existing <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a> by <a href="#!/api/Ext.Component-cfg-id" rel="Ext.Component-cfg-id" class="docClass">id</a></p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>The component <a href="#!/api/Ext.Component-cfg-id" rel="Ext.Component-cfg-id" class="docClass">id</a></p> %}
    }
    }
    *)
  method getDoc : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the current HTML document object as an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
    *)
  method getDom : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Returns the dom node for the passed String (id), dom node, or <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.
Optional 'strict' flag is needed for IE since it can return 'name' and
'id' elements by using getElementById.</p>

<p>Here are some examples:</p>

<pre><code>// gets dom node based on id
var elDom = <a href="#!/api/Ext-method-getDom" rel="Ext-method-getDom" class="docClass">Ext.getDom</a>('elId');
// gets dom node based on the dom node
var elDom1 = <a href="#!/api/Ext-method-getDom" rel="Ext-method-getDom" class="docClass">Ext.getDom</a>(elDom);

// If we don&amp;#39;t know if we are working with an
// <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> or a dom node use <a href="#!/api/Ext-method-getDom" rel="Ext-method-getDom" class="docClass">Ext.getDom</a>
function(el)\{
    var dom = <a href="#!/api/Ext-method-getDom" rel="Ext-method-getDom" class="docClass">Ext.getDom</a>(el);
    // do something with the dom node
\}
</code></pre>

<p><strong>Note:</strong> the dom node to be found actually needs to exist (be rendered, etc)
when this method is called to be successful.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>HTMLElement</p> %}
    }
    }
    *)
  method getHead : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the current document head as an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
    *)
  method getNamespace : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Get namespace prefix for a class name.</p> %}
    
    {b Parameters}:
    {ul {- className: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>Namespace prefix if it's known, otherwise undefined</p> %}
    }
    }
    *)
  method getOrientation : Js.js_string Js.t Js.meth
  (** {% <p>Returns the current orientation of the mobile device</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>Either 'portrait' or 'landscape'</p> %}
    }
    }
    *)
  method getScrollbarSize : bool Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Returns the size of the browser scrollbars. This can differ depending on
operating system settings, such as the theme or font size.</p> %}
    
    {b Parameters}:
    {ul {- force: [bool Js.t] (optional)
    {% <p>true to force a recalculation of the value.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>An object containing scrollbar sizes.</p> %}
    }
    }
    *)
  method getStore : _ Js.t -> Ext_data_Store.t Js.t Js.meth
  (** {% <p>Shortcut to <a href="#!/api/Ext.data.StoreManager-method-lookup" rel="Ext.data.StoreManager-method-lookup" class="docClass">Ext.data.StoreManager.lookup</a>.</p>

<p>Gets a registered Store by id</p> %}
    
    {b Parameters}:
    {ul {- store: [_ Js.t]
    {% <p>The id of the Store, or a Store instance, or a store configuration</p> %}
    }
    }
    *)
  method getVersion : Js.js_string Js.t Js.optdef -> Ext_Version.t Js.t
    Js.meth
  (** {% <p>Get the version number of the supplied package name; will return the last registered version
(last <a href="#!/api/Ext-method-setVersion" rel="Ext-method-setVersion" class="docClass">Ext.setVersion</a> call) if there's no package name given.</p> %}
    
    {b Parameters}:
    {ul {- packageName: [Js.js_string Js.t] (optional)
    {% <p>The package name, for example: 'core', 'touch', 'extjs'</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Version.t Js.t] {% <p>The version</p> %}
    }
    }
    *)
  method id : _ Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  (** {% <p>Generates unique ids. If the element already has an id, it is unchanged</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t] (optional)
    {% <p>The element to generate an id for</p> %}
    }
    {- prefix: [Js.js_string Js.t] (optional)
    {% <p>Id prefix (defaults "ext-gen")</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The generated Id.</p> %}
    }
    }
    *)
  method identityFn : _ Js.t -> unit Js.meth
  (** {% <p>A reusable identity function. The function will always return the first argument, unchanged.</p> %}
    
    {b Parameters}:
    {ul {- o: [_ Js.t]
    }
    }
    *)
  method isArray : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is a JavaScript Array, false otherwise.</p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t] {% <p>The target to test</p> %}
    }
    }
    *)
  method isBoolean : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is a boolean.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method isDate : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is a JavaScript Date object, false otherwise.</p> %}
    
    {b Parameters}:
    {ul {- _object: [_ Js.t] {% <p>The object to test</p> %}
    }
    }
    *)
  method isDefined : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is defined.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method isElement : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is an HTMLElement</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method isEmpty : _ Js.t -> bool Js.t Js.optdef -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is empty, false otherwise. The value is deemed to be empty if it is either:</p>

<ul>
<li><code>null</code></li>
<li><code>undefined</code></li>
<li>a zero-length array</li>
<li>a zero-length string (Unless the <code>allowEmptyString</code> parameter is set to <code>true</code>)</li>
</ul> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The value to test</p> %}
    }
    {- allowEmptyString: [bool Js.t] (optional)
    {% <p>true to allow empty strings (defaults to false)</p> %}
    }
    }
    *)
  method isFunction : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is a JavaScript Function, false otherwise.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method isIterable : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns <code>true</code> if the passed value is iterable, that is, if elements of it are addressable using array
notation with numeric indices, <code>false</code> otherwise.</p>

<p>Arrays and function <code>arguments</code> objects are iterable. Also HTML collections such as <code>NodeList</code> and `HTMLCollection'
are iterable.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method isNumber : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is a number. Returns false for non-finite numbers.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method isNumeric : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Validates that a value is numeric.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>Examples: 1, '1', '2.34'</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if numeric, false otherwise</p> %}
    }
    }
    *)
  method isObject : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is a JavaScript Object, false otherwise.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method isPrimitive : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is a JavaScript 'primitive', a string, number or boolean.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method isString : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is a string.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method isTextNode : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed value is a TextNode</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to test</p> %}
    }
    }
    *)
  method iterate : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Iterates either an array or an object. This method delegates to
<a href="#!/api/Ext.Array-method-each" rel="Ext.Array-method-each" class="docClass">Ext.Array.each</a> if the given value is iterable, and <a href="#!/api/Ext.Object-method-each" rel="Ext.Object-method-each" class="docClass">Ext.Object.each</a> otherwise.</p> %}
    
    {b Parameters}:
    {ul {- _object: [_ Js.t]
    {% <p>The object or array to be iterated.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The function to be called for each iteration. See and <a href="#!/api/Ext.Array-method-each" rel="Ext.Array-method-each" class="docClass">Ext.Array.each</a> and
<a href="#!/api/Ext.Object-method-each" rel="Ext.Object-method-each" class="docClass">Ext.Object.each</a> for detailed lists of arguments passed to this function depending on the given object
type that is being iterated.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the specified function is executed.
Defaults to the object being iterated itself.</p> %}
    }
    }
    *)
  method log : _ Js.t Js.optdef -> Js.js_string Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Logs a message. If a console is present it will be used. On Opera, the method
"opera.postError" is called. In other cases, the message is logged to an array
"Ext.log.out". An attached debugger can watch this array and view the log. The
log buffer is limited to a maximum of "Ext.log.max" entries (defaults to 250).
The <code>Ext.log.out</code> array can also be written to a popup window by entering the
following in the URL bar (a "bookmarklet"):</p>

<pre><code>javascript:void(Ext.log.show());
</code></pre>

<p>If additional parameters are passed, they are joined and appended to the message.
A technique for tracing entry and exit of a function is this:</p>

<pre><code>function foo () \{
    <a href="#!/api/Ext-method-log" rel="Ext-method-log" class="docClass">Ext.log</a>(\{ indent: 1 \}, '&gt;&gt; foo');

    // log statements in here or methods called from here will be indented
    // by one step

    <a href="#!/api/Ext-method-log" rel="Ext-method-log" class="docClass">Ext.log</a>(\{ outdent: 1 \}, '&lt;&lt; foo');
\}
</code></pre>

<p>This method does nothing in a release build.</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t] (optional)
    {% <p>The message to log or an options object with any
of the following properties:</p>

<ul>
<li><code>msg</code>: The message to log (required).</li>
<li><code>level</code>: One of: "error", "warn", "info" or "log" (the default is "log").</li>
<li><code>dump</code>: An object to dump to the log as part of the message.</li>
<li><code>stack</code>: True to include a stack trace in the log.</li>
<li><code>indent</code>: Cause subsequent log statements to be indented one step.</li>
<li><code>outdent</code>: Cause this and following statements to be one step less indented.</li>
</ul> %}
    }
    {- message: [Js.js_string Js.t] (optional)
    {% <p>The message to log (required unless specified in
options object).</p> %}
    }
    }
    *)
  method merge : _ Js.t -> _ Js.t -> _ Js.t Js.meth
  (** {% <p>A convenient alias method for <a href="#!/api/Ext.Object-method-merge" rel="Ext.Object-method-merge" class="docClass">Ext.Object.merge</a>.</p>

<p>Merges any number of objects recursively without referencing them or their children.</p>

<pre><code>var extjs = \{
    companyName: 'Ext JS',
    products: ['Ext JS', 'Ext GWT', 'Ext Designer'],
    isSuperCool: true,
    office: \{
        size: 2000,
        location: 'Palo Alto',
        isFun: true
    \}
\};

var newStuff = \{
    companyName: 'Sencha Inc.',
    products: ['Ext JS', 'Ext GWT', 'Ext Designer', 'Sencha Touch', 'Sencha Animator'],
    office: \{
        size: 40000,
        location: 'Redwood City'
    \}
\};

var sencha = <a href="#!/api/Ext.Object-method-merge" rel="Ext.Object-method-merge" class="docClass">Ext.Object.merge</a>(extjs, newStuff);

// extjs and sencha then equals to
\{
    companyName: 'Sencha Inc.',
    products: ['Ext JS', 'Ext GWT', 'Ext Designer', 'Sencha Touch', 'Sencha Animator'],
    isSuperCool: true,
    office: \{
        size: 40000,
        location: 'Redwood City',
        isFun: true
    \}
\}
</code></pre> %}
    
    {b Parameters}:
    {ul {- destination: [_ Js.t]
    {% <p>The object into which all subsequent objects are merged.</p> %}
    }
    {- _object: [_ Js.t]
    {% <p>Any number of objects to merge into the destination.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>merged The destination object with all passed objects merged in.</p> %}
    }
    }
    *)
  method namespace : Js.js_string Js.t -> _ Js.t Js.meth
  (** {% <p>Creates namespaces to be used for scoping variables and classes so that they are not global.
Specifying the last node of a namespace implicitly creates all other nodes. Usage:</p>

<pre><code><a href="#!/api/Ext-method-namespace" rel="Ext-method-namespace" class="docClass">Ext.namespace</a>('Company', 'Company.data');

// equivalent and preferable to the above syntax
<a href="#!/api/Ext-method-ns" rel="Ext-method-ns" class="docClass">Ext.ns</a>('Company.data');

Company.Widget = function() \{ ... \};

Company.data.CustomStore = function(config) \{ ... \};
</code></pre> %}
    
    {b Parameters}:
    {ul {- namespaces: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The namespace object.
(If multiple arguments are passed, this will be the last namespace created)</p> %}
    }
    }
    *)
  method ns : Js.js_string Js.t -> _ Js.t Js.meth
  (** {% <p>Convenient alias for <a href="#!/api/Ext-method-namespace" rel="Ext-method-namespace" class="docClass">Ext.namespace</a>.</p>

<p>Creates namespaces to be used for scoping variables and classes so that they are not global.
Specifying the last node of a namespace implicitly creates all other nodes. Usage:</p>

<pre><code><a href="#!/api/Ext-method-namespace" rel="Ext-method-namespace" class="docClass">Ext.namespace</a>('Company', 'Company.data');

// equivalent and preferable to the above syntax
<a href="#!/api/Ext-method-ns" rel="Ext-method-ns" class="docClass">Ext.ns</a>('Company.data');

Company.Widget = function() \{ ... \};

Company.data.CustomStore = function(config) \{ ... \};
</code></pre> %}
    
    {b Parameters}:
    {ul {- namespaces: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The namespace object.
(If multiple arguments are passed, this will be the last namespace created)</p> %}
    }
    }
    *)
  method on : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Shorthand for the <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a> method of the
<a href="#!/api/Ext-property-globalEvents" rel="Ext-property-globalEvents" class="docClass">globalEvents</a> Observable instance.</p>

<p>Appends an event handler to this object.  For example:</p>

<pre><code>myGridPanel.on("mouseover", this.onMouseOver, this);
</code></pre>

<p>The method also allows for a single argument to be passed which is a config object
containing properties which specify multiple events. For example:</p>

<pre><code>myGridPanel.on(\{
    cellClick: this.onCellClick,
    mouseover: this.onMouseOver,
    mouseout: this.onMouseOut,
    scope: this // Important. Ensure "this" is correct during handler execution
\});
</code></pre>

<p>One can also specify options for each event handler separately:</p>

<pre><code>myGridPanel.on(\{
    cellClick: \{fn: this.onCellClick, scope: this, single: true\},
    mouseover: \{fn: panel.onMouseOver, scope: panel\}
\});
</code></pre>

<p><em>Names</em> of methods in a specified scope may also be used. Note that
<code>scope</code> MUST be specified to use this option:</p>

<pre><code>myGridPanel.on(\{
    cellClick: \{fn: 'onCellClick', scope: this, single: true\},
    mouseover: \{fn: 'onMouseOver', scope: panel\}
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- eventName: [_ Js.t]
    {% <p>The name of the event to listen for.
May also be an object who's property names are event names.</p> %}
    }
    {- fn: [_ Js.callback] (optional)
    {% <p>The method the event invokes, or <em>if <code>scope</code> is specified, the </em>name* of the method within
the specified <code>scope</code>.  Will be called with arguments
given to <a href="#!/api/Ext.util.Observable-method-fireEvent" rel="Ext.util.Observable-method-fireEvent" class="docClass">fireEvent</a> plus the <code>options</code> parameter described below.</p> %}
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
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p><strong>Only when the <code>destroyable</code> option is specified. </strong></p>




<p> A <code>Destroyable</code> object. An object which implements the <code>destroy</code> method which removes all listeners added in this call. For example:</p>




<pre><code>this.btnListeners =  = myButton.on(\{
    destroyable: true
    mouseover:   function() \{ console.log('mouseover'); \},
    mouseout:    function() \{ console.log('mouseout'); \},
    click:       function() \{ console.log('click'); \}
\});
</code></pre>




<p>And when those listeners need to be removed:</p>




<pre><code><a href="#!/api/Ext-method-destroy" rel="Ext-method-destroy" class="docClass">Ext.destroy</a>(this.btnListeners);
</code></pre>




<p>or</p>




<pre><code>this.btnListeners.destroy();
</code></pre> %}
    }
    }
    *)
  method onDocumentReady : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Adds a listener to be notified when the document is ready (before onload and before images are loaded).</p>

<p><a href="#!/api/Ext-method-onDocumentReady" rel="Ext-method-onDocumentReady" class="docClass">onDocumentReady</a> is an alias for <a href="#!/api/Ext.EventManager-method-onDocumentReady" rel="Ext.EventManager-method-onDocumentReady" class="docClass">Ext.EventManager.onDocumentReady</a>.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    }
    {- scope: [_ Js.t] (optional)
    }
    {- options: [_ Js.t] (optional)
    }
    }
    *)
  method onReady : _ Js.callback -> _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Adds a function to be called when the DOM is ready, and all required classes have been loaded.</p>

<p>If the DOM is ready and all classes are loaded, the passed function is executed immediately.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    }
    {- scope: [_ Js.t]
    }
    {- options: [_ Js.t]
    }
    }
    *)
  method override : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Overrides members of the specified <code>target</code> with the given values.</p>

<p>If the <code>target</code> is a class declared using <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>, the
<code>override</code> method of that class is called (see <a href="#!/api/Ext.Base-static-method-override" rel="Ext.Base-static-method-override" class="docClass">Ext.Base.override</a>) given
the <code>overrides</code>.</p>

<p>If the <code>target</code> is a function, it is assumed to be a constructor and the contents
of <code>overrides</code> are applied to its <code>prototype</code> using <a href="#!/api/Ext-method-apply" rel="Ext-method-apply" class="docClass">Ext.apply</a>.</p>

<p>If the <code>target</code> is an instance of a class declared using <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>,
the <code>overrides</code> are applied to only that instance. In this case, methods are
specially processed to allow them to use <a href="#!/api/Ext.Base-method-callParent" rel="Ext.Base-method-callParent" class="docClass">Ext.Base.callParent</a>.</p>

<pre><code> var panel = new <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.Panel</a>(\{ ... \});

 <a href="#!/api/Ext-method-override" rel="Ext-method-override" class="docClass">Ext.override</a>(panel, \{
     initComponent: function () \{
         // extra processing...

         this.callParent();
     \}
 \});
</code></pre>

<p>If the <code>target</code> is none of these, the <code>overrides</code> are applied to the <code>target</code>
using <a href="#!/api/Ext-method-apply" rel="Ext-method-apply" class="docClass">Ext.apply</a>.</p>

<p>Please refer to <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a> and <a href="#!/api/Ext.Base-static-method-override" rel="Ext.Base-static-method-override" class="docClass">Ext.Base.override</a> for
further details.</p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    {% <p>The target to override.</p> %}
    }
    {- overrides: [_ Js.t]
    {% <p>The properties to add or replace on <code>target</code>.</p> %}
    }
    }
    *)
  method pass : _ Js.callback -> _ Js.js_array Js.t -> _ Js.t Js.optdef ->
    _ Js.callback Js.meth
  (** {% <p>Create a new function from the provided <code>fn</code>, the arguments of which are pre-set to <code>args</code>.
New arguments passed to the newly created callback when it's invoked are appended after the pre-set ones.
This is especially useful when creating callbacks.</p>

<p>For example:</p>

<pre><code>var originalFunction = function()\{
    alert(<a href="#!/api/Ext.Array-method-from" rel="Ext.Array-method-from" class="docClass">Ext.Array.from</a>(arguments).join(' '));
\};

var callback = <a href="#!/api/Ext.Function-method-pass" rel="Ext.Function-method-pass" class="docClass">Ext.Function.pass</a>(originalFunction, ['Hello', 'World']);

callback(); // alerts 'Hello World'
callback('by Me'); // alerts 'Hello World by Me'
</code></pre>

<p><a href="#!/api/Ext-method-pass" rel="Ext-method-pass" class="docClass">Ext.pass</a> is alias for <a href="#!/api/Ext.Function-method-pass" rel="Ext.Function-method-pass" class="docClass">Ext.Function.pass</a></p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The original function</p> %}
    }
    {- args: [_ Js.js_array Js.t]
    {% <p>The arguments to pass to new callback</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the function is executed.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.callback] {% <p>The new callback function</p> %}
    }
    }
    *)
  method preg : Js.js_string Js.t -> _ Js.callback -> unit Js.meth
  (** {% <p>Shorthand for <a href="#!/api/Ext.PluginManager-method-registerType" rel="Ext.PluginManager-method-registerType" class="docClass">Ext.PluginManager.registerType</a></p> %}
    
    {b Parameters}:
    {ul {- ptype: [Js.js_string Js.t]
    {% <p>The ptype mnemonic string by which the Plugin class
may be looked up.</p> %}
    }
    {- cls: [_ Js.callback] {% <p>The new Plugin class.</p> %}
    }
    }
    *)
  method query : Js.js_string Js.t -> Dom_html.element Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    Dom_html.element Js.t Js.js_array Js.t Js.meth
  (** {% <p>Shorthand of <a href="#!/api/Ext.dom.Query-method-select" rel="Ext.dom.Query-method-select" class="docClass">Ext.dom.Query.select</a></p>

<p>Selects an array of DOM nodes by CSS/XPath selector.</p>

<p>Uses <a href="https://developer.mozilla.org/en/DOM/document.querySelectorAll">document.querySelectorAll</a> if browser supports that, otherwise falls back to
<a href="#!/api/Ext.dom.Query-method-jsSelect" rel="Ext.dom.Query-method-jsSelect" class="docClass">Ext.dom.Query.jsSelect</a> to do the work.</p>

<p>Aliased as <a href="#!/api/Ext-method-query" rel="Ext-method-query" class="docClass">query</a>.</p> %}
    
    {b Parameters}:
    {ul {- path: [Js.js_string Js.t]
    {% <p>The selector/xpath query</p> %}
    }
    {- root: [Dom_html.element Js.t] (optional)
    {% <p>The start of the query.</p> %}
     Defaults to: document
    }
    {- _type: [Js.js_string Js.t] (optional)
    {% <p>Either "select" or "simple" for a simple selector match (only valid when
used when the call is deferred to the jsSelect method)</p> %}
     Defaults to: "select"
    }
    {- single: [bool Js.t] (optional)
    {% <p>Pass <code>true</code> to select only the first matching node using <code>document.querySelector</code> (where available)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t Js.js_array Js.t]
    {% <p>An array of DOM elements (not a NodeList as returned by <code>querySelectorAll</code>).</p> %}
    }
    }
    *)
  method regStore : Js.js_string Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Creates a new store for the given id and config, then registers it with the <a href="#!/api/Ext.data.StoreManager" rel="Ext.data.StoreManager" class="docClass">Store Manager</a>.
Sample usage:</p>

<pre><code><a href="#!/api/Ext-method-regStore" rel="Ext-method-regStore" class="docClass">Ext.regStore</a>('AllUsers', \{
    model: 'User'
\});

// the store can now easily be used throughout the application
new Ext.List(\{
    store: 'AllUsers',
    ... other config
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>The id to set on the new store</p> %}
    }
    {- config: [_ Js.t] {% <p>The store config</p> %}
    }
    }
    *)
  method removeNode : Dom_html.element Js.t -> unit Js.meth
  (** {% <p>Removes a DOM node from the document.</p>

<p>Removes this element from the document, removes all DOM event listeners, and
deletes the cache reference. All DOM event listeners are removed from this element.
If <a href="#!/api/Ext-property-enableNestedListenerRemoval" rel="Ext-property-enableNestedListenerRemoval" class="docClass">Ext.enableNestedListenerRemoval</a> is
<code>true</code>, then DOM event listeners are also removed from all child nodes.
The body node will be ignored if passed in.</p> %}
    
    {b Parameters}:
    {ul {- node: [Dom_html.element Js.t] {% <p>The node to remove</p> %}
    }
    }
    *)
  method require : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Loads all classes by the given names and all their direct dependencies; optionally executes
the given callback function when finishes, within the optional scope.</p>

<p><a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">require</a> is alias for <a href="#!/api/Ext.Loader-method-require" rel="Ext.Loader-method-require" class="docClass">Ext.Loader.require</a>.</p> %}
    
    {b Parameters}:
    {ul {- expressions: [_ Js.t]
    }
    {- fn: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    {- excludes: [_ Js.t] (optional)
    }
    }
    *)
  method resumeLayouts : _ Js.t -> unit Js.meth
  method select : Js.js_string Js.t -> bool Js.t Js.optdef ->
    Ext_dom_CompositeElement.t Js.t Js.meth
  (** {% <p>Shorthand of <a href="#!/api/Ext.dom.Element-method-select" rel="Ext.dom.Element-method-select" class="docClass">Ext.Element.select</a>.</p>

<p>Creates a <a href="#!/api/Ext.dom.CompositeElement" rel="Ext.dom.CompositeElement" class="docClass">Ext.CompositeElement</a> for child nodes based on the passed CSS selector (the selector should not contain an id).</p>

<p><strong>Defined in override Ext.dom.AbstractElement_traversal.</strong></p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The CSS selector</p> %}
    }
    {- unique: [bool Js.t] (optional)
    {% <p>True to create a unique <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> for each element. Defaults to a shared flyweight object.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_CompositeElement.t Js.t]
    {% <p>The composite element</p> %}
    }
    }
    *)
  method setGlyphFontFamily : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Sets the default font-family to use for components that support a <code>glyph</code> config.</p> %}
    
    {b Parameters}:
    {ul {- fontFamily: [Js.js_string Js.t]
    {% <p>The name of the font-family</p> %}
    }
    }
    *)
  method setVersion : Js.js_string Js.t -> _ Js.t -> _ Js.t Js.meth
  (** {% <p>Set version number for the given package name.</p> %}
    
    {b Parameters}:
    {ul {- packageName: [Js.js_string Js.t]
    {% <p>The package name, for example: 'core', 'touch', 'extjs'</p> %}
    }
    {- version: [_ Js.t]
    {% <p>The version, for example: '1.2.3alpha', '2.4.0-dev'</p> %}
    }
    }
    *)
  method suspendLayouts : unit Js.meth
  method syncRequire : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef
    -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Synchronously loads all classes by the given names and all their direct dependencies; optionally
executes the given callback function when finishes, within the optional scope.</p>

<p><a href="#!/api/Ext-method-syncRequire" rel="Ext-method-syncRequire" class="docClass">syncRequire</a> is alias for <a href="#!/api/Ext.Loader-method-syncRequire" rel="Ext.Loader-method-syncRequire" class="docClass">Ext.Loader.syncRequire</a>.</p> %}
    
    {b Parameters}:
    {ul {- expressions: [_ Js.t]
    }
    {- fn: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    {- excludes: [_ Js.t] (optional)
    }
    }
    *)
  method toArray : _ Js.t -> Js.number Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> _ Js.js_array Js.t Js.meth
  (** {% <p>Converts any iterable (numeric indices and a length property) into a true array.</p>

<pre><code>function test() \{
    var args = <a href="#!/api/Ext.Array-method-toArray" rel="Ext.Array-method-toArray" class="docClass">Ext.Array.toArray</a>(arguments),
        fromSecondToLastArgs = <a href="#!/api/Ext.Array-method-toArray" rel="Ext.Array-method-toArray" class="docClass">Ext.Array.toArray</a>(arguments, 1);

    alert(args.join(' '));
    alert(fromSecondToLastArgs.join(' '));
\}

test('just', 'testing', 'here'); // alerts 'just testing here';
                                 // alerts 'testing here';

<a href="#!/api/Ext.Array-method-toArray" rel="Ext.Array-method-toArray" class="docClass">Ext.Array.toArray</a>(document.getElementsByTagName('div')); // will convert the NodeList into an array
<a href="#!/api/Ext.Array-method-toArray" rel="Ext.Array-method-toArray" class="docClass">Ext.Array.toArray</a>('splitted'); // returns ['s', 'p', 'l', 'i', 't', 't', 'e', 'd']
<a href="#!/api/Ext.Array-method-toArray" rel="Ext.Array-method-toArray" class="docClass">Ext.Array.toArray</a>('splitted', 0, 3); // returns ['s', 'p', 'l']
</code></pre>

<p><a href="#!/api/Ext-method-toArray" rel="Ext-method-toArray" class="docClass">Ext.toArray</a> is alias for <a href="#!/api/Ext.Array-method-toArray" rel="Ext.Array-method-toArray" class="docClass">Ext.Array.toArray</a></p> %}
    
    {b Parameters}:
    {ul {- iterable: [_ Js.t]
    {% <p>the iterable object to be turned into a true Array.</p> %}
    }
    {- start: [Js.number Js.t] (optional)
    {% <p>a zero-based index that specifies the start of extraction. Defaults to 0</p> %}
    }
    {- _end: [Js.number Js.t] (optional)
    {% <p>a 1-based index that specifies the end of extraction. Defaults to the last
index of the iterable value</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.js_array Js.t] {% <p>array</p> %}
    }
    }
    *)
  method typeOf : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Returns the type of the given variable in string format. List of possible values are:</p>

<ul>
<li><code>undefined</code>: If the given value is <code>undefined</code></li>
<li><code>null</code>: If the given value is <code>null</code></li>
<li><code>string</code>: If the given value is a string</li>
<li><code>number</code>: If the given value is a number</li>
<li><code>boolean</code>: If the given value is a boolean value</li>
<li><code>date</code>: If the given value is a <code>Date</code> object</li>
<li><code>function</code>: If the given value is a function reference</li>
<li><code>object</code>: If the given value is an object</li>
<li><code>array</code>: If the given value is an array</li>
<li><code>regexp</code>: If the given value is a regular expression</li>
<li><code>element</code>: If the given value is a DOM Element</li>
<li><code>textnode</code>: If the given value is a DOM text node and contains something other than whitespace</li>
<li><code>whitespace</code>: If the given value is a DOM text node and contains only whitespace</li>
</ul> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    }
    }
    *)
  method un : Js.js_string Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Shorthand for the <a href="#!/api/Ext.util.Observable-method-removeListener" rel="Ext.util.Observable-method-removeListener" class="docClass">Ext.util.Observable.removeListener</a> method of the
<a href="#!/api/Ext-property-globalEvents" rel="Ext-property-globalEvents" class="docClass">globalEvents</a> Observable instance.</p>

<p>Removes an event handler.</p> %}
    
    {b Parameters}:
    {ul {- eventName: [Js.js_string Js.t]
    {% <p>The type of event the handler was associated with.</p> %}
    }
    {- fn: [_ Js.callback]
    {% <p>The handler to remove. <strong>This must be a reference to the function passed into the
<a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a> call.</strong></p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope originally specified for the handler. It must be the same as the
scope argument specified in the original call to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">addListener</a> or the listener will not be removed.</p> %}
    }
    }
    *)
  method valueFrom : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Returns the given value itself if it's not empty, as described in <a href="#!/api/Ext-method-isEmpty" rel="Ext-method-isEmpty" class="docClass">isEmpty</a>; returns the default
value (second argument) otherwise.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The value to test</p> %}
    }
    {- defaultValue: [_ Js.t]
    {% <p>The value to return if the original value is empty</p> %}
    }
    {- allowBlank: [bool Js.t] (optional)
    {% <p>true to allow zero length strings to qualify as non-empty (defaults to false)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>value, if non-empty, else defaultValue</p> %}
    }
    }
    *)
  method widget : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Convenient shorthand to create a widget by its xtype or a config object.
See also <a href="#!/api/Ext.ClassManager-method-instantiateByAlias" rel="Ext.ClassManager-method-instantiateByAlias" class="docClass">Ext.ClassManager.instantiateByAlias</a>.</p>

<pre><code> var button = <a href="#!/api/Ext-method-widget" rel="Ext-method-widget" class="docClass">Ext.widget</a>('button'); // Equivalent to <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('widget.button');

 var panel = <a href="#!/api/Ext-method-widget" rel="Ext-method-widget" class="docClass">Ext.widget</a>('panel', \{ // Equivalent to <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('widget.panel')
     title: 'Panel'
 \});

 var grid = <a href="#!/api/Ext-method-widget" rel="Ext-method-widget" class="docClass">Ext.widget</a>(\{
     xtype: 'grid',
     ...
 \});
</code></pre>

<p>If a <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">component</a> instance is passed, it is simply returned.</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t] (optional)
    {% <p>The xtype of the widget to create.</p> %}
    }
    {- config: [_ Js.t] (optional)
    {% <p>The configuration object for the widget constructor.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The widget instance</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  
  
end

class type events =
object
  
  
end

class type statics =
object
  
  
end

val get_instance : unit -> t Js.t
(** Singleton instance for lazy-loaded modules. *)

val instance : t Js.t
(** Singleton instance. *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

