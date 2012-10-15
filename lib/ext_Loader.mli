(** Ext.Loader is the heart of the new dynamic depende ...
  
  {% <p><a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a> is the heart of the new dynamic dependency loading capability in Ext JS 4+. It is most commonly used
via the <a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a> shorthand. <a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a> supports both asynchronous and synchronous loading
approaches, and leverage their advantages for the best development flow. We'll discuss about the pros and cons of each approach:</p>

<h1>Asynchronous Loading</h1>

<ul>
<li><p>Advantages:</p>

<ul>
<li>Cross-domain</li>
<li>No web server needed: you can run the application via the file system protocol (i.e: <code>file://path/to/your/index
.html</code>)</li>
<li>Best possible debugging experience: error messages come with the exact file name and line number</li>
</ul>
</li>
<li><p>Disadvantages:</p>

<ul>
<li>Dependencies need to be specified before-hand</li>
</ul>
</li>
</ul>


<h3>Method 1: Explicitly include what you need:</h3>

<pre><code>// Syntax
<a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>({String/Array} expressions);

// Example: Single alias
<a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>('widget.window');

// Example: Single class name
<a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>');

// Example: Multiple aliases / class names mix
<a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>(['widget.window', 'layout.border', '<a href="#!/api/Ext.data.Connection" rel="Ext.data.Connection" class="docClass">Ext.data.Connection</a>']);

// Wildcards
<a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>(['widget.*', 'layout.*', 'Ext.data.*']);
</code></pre>

<h3>Method 2: Explicitly exclude what you don't need:</h3>

<pre><code>// Syntax: Note that it must be in this chaining format.
<a href="#!/api/Ext-method-exclude" rel="Ext-method-exclude" class="docClass">Ext.exclude</a>({String/Array} expressions)
   .require({String/Array} expressions);

// Include everything except Ext.data.*
<a href="#!/api/Ext-method-exclude" rel="Ext-method-exclude" class="docClass">Ext.exclude</a>('Ext.data.*').require('*');

// Include all widgets except widget.checkbox*,
// which will match widget.checkbox, widget.checkboxfield, widget.checkboxgroup, etc.
<a href="#!/api/Ext-method-exclude" rel="Ext-method-exclude" class="docClass">Ext.exclude</a>('widget.checkbox*').require('widget.*');
</code></pre>

<h1>Synchronous Loading on Demand</h1>

<ul>
<li><p>Advantages:</p>

<ul>
<li>There's no need to specify dependencies before-hand, which is always the convenience of including ext-all.js
before</li>
</ul>
</li>
<li><p>Disadvantages:</p>

<ul>
<li>Not as good debugging experience since file name won't be shown (except in Firebug at the moment)</li>
<li>Must be from the same domain due to XHR restriction</li>
<li>Need a web server, same reason as above</li>
</ul>
</li>
</ul>


<p>There's one simple rule to follow: Instantiate everything with <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a> instead of the <code>new</code> keyword</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('widget.window', { ... }); // Instead of new <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>({...});

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>', {}); // Same as above, using full class name instead of alias

<a href="#!/api/Ext-method-widget" rel="Ext-method-widget" class="docClass">Ext.widget</a>('window', {}); // Same as above, all you need is the traditional `xtype`
</code></pre>

<p>Behind the scene, <a href="#!/api/Ext.ClassManager" rel="Ext.ClassManager" class="docClass">Ext.ClassManager</a> will automatically check whether the given class name / alias has already
 existed on the page. If it's not, <a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a> will immediately switch itself to synchronous mode and automatic load the given
 class and all its dependencies.</p>

<h1>Hybrid Loading - The Best of Both Worlds</h1>

<p>It has all the advantages combined from asynchronous and synchronous loading. The development flow is simple:</p>

<h3>Step 1: Start writing your application using synchronous approach.</h3>

<p><a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a> will automatically fetch all dependencies on demand as they're needed during run-time. For example:</p>

<pre><code><a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function(){
    var window = <a href="#!/api/Ext-method-widget" rel="Ext-method-widget" class="docClass">Ext.widget</a>('window', {
        width: 500,
        height: 300,
        layout: {
            type: 'border',
            padding: 5
        },
        title: 'Hello Dialog',
        items: [{
            title: 'Navigation',
            collapsible: true,
            region: 'west',
            width: 200,
            html: 'Hello',
            split: true
        }, {
            title: 'TabPanel',
            region: 'center'
        }]
    });

    window.show();
})
</code></pre>

<h3>Step 2: Along the way, when you need better debugging ability, watch the console for warnings like these:</h3>

<pre><code>[<a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a>] Synchronously loading '<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>'; consider adding <a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>') before your application's code
ClassManager.js:432
[<a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a>] Synchronously loading '<a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">Ext.layout.container.Border</a>'; consider adding <a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>('<a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">Ext.layout.container.Border</a>') before your application's code
</code></pre>

<p>Simply copy and paste the suggested code above <code><a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a></code>, i.e:</p>

<pre><code><a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>');
<a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>('<a href="#!/api/Ext.layout.container.Border" rel="Ext.layout.container.Border" class="docClass">Ext.layout.container.Border</a>');

<a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(...);
</code></pre>

<p>Everything should now load via asynchronous mode.</p>

<h1>Deployment</h1>

<p>It's important to note that dynamic loading should only be used during development on your local machines.
During production, all dependencies should be combined into one single JavaScript file. <a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a> makes
the whole process of transitioning from / to between development / maintenance and production as easy as
possible. Internally <a href="#!/api/Ext.Loader-property-history" rel="Ext.Loader-property-history" class="docClass">Ext.Loader.history</a> maintains the list of all dependencies your application
needs in the exact loading sequence. It's as simple as concatenating all files in this array into one,
then include it on top of your application.</p>

<p>This process will be automated with Sencha Command, to be released and documented towards Ext JS 4 Final.</p> %}
  *)

class type t =
object('self)
  
  method history : 'a Js.js_array Js.t Js.prop
  (** {% <p>An array of class names to keep track of the dependency loading order.
This is not guaranteed to be the same everytime due to the asynchronous
nature of the Loader.</p> %}
    *)
  method addClassPathMappings : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets a batch of path entries</p> %}
    
    {b Parameters}:
    {ul {- paths: ['a Js.t]
    {% <p>a set of className: path mappings</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Loader.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method exclude : 'a Js.js_array Js.t -> 'b Js.t Js.meth
  (** {% <p>Explicitly exclude files from being loaded. Useful when used in conjunction with a broad include expression.
Can be chained with more <code>require</code> and <code>exclude</code> methods, eg:</p>

<pre><code><a href="#!/api/Ext-method-exclude" rel="Ext-method-exclude" class="docClass">Ext.exclude</a>('Ext.data.*').require('*');

<a href="#!/api/Ext-method-exclude" rel="Ext-method-exclude" class="docClass">Ext.exclude</a>('widget.button*').require('widget.*');
</code></pre> %}
    
    {b Parameters}:
    {ul {- excludes: ['a Js.js_array Js.t]
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>object contains <code>require</code> method for chaining</p> %}
    }
    }
    *)
  method getConfig : Js.js_string Js.t -> 'a Js.t Js.meth
  (** {% <p>Get the config value corresponding to the specified name. If no name is given, will return the config object</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    {% <p>The config property name</p> %}
    }
    }
    *)
  method getPath : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Translates a className to a file path by adding the
the proper prefix and converting the .'s to /'s. For example:</p>

<pre><code><a href="#!/api/Ext.Loader-method-setPath" rel="Ext.Loader-method-setPath" class="docClass">Ext.Loader.setPath</a>('My', '/path/to/My');

alert(<a href="#!/api/Ext.Loader-method-getPath" rel="Ext.Loader-method-getPath" class="docClass">Ext.Loader.getPath</a>('My.awesome.Class')); // alerts '/path/to/My/awesome/Class.js'
</code></pre>

<p>Note that the deeper namespace levels, if explicitly set, are always resolved first. For example:</p>

<pre><code><a href="#!/api/Ext.Loader-method-setPath" rel="Ext.Loader-method-setPath" class="docClass">Ext.Loader.setPath</a>({
    'My': '/path/to/lib',
    'My.awesome': '/other/path/for/awesome/stuff',
    'My.awesome.more': '/more/awesome/path'
});

alert(<a href="#!/api/Ext.Loader-method-getPath" rel="Ext.Loader-method-getPath" class="docClass">Ext.Loader.getPath</a>('My.awesome.Class')); // alerts '/other/path/for/awesome/stuff/Class.js'

alert(<a href="#!/api/Ext.Loader-method-getPath" rel="Ext.Loader-method-getPath" class="docClass">Ext.Loader.getPath</a>('My.awesome.more.Class')); // alerts '/more/awesome/path/Class.js'

alert(<a href="#!/api/Ext.Loader-method-getPath" rel="Ext.Loader-method-getPath" class="docClass">Ext.Loader.getPath</a>('My.cool.Class')); // alerts '/path/to/lib/cool/Class.js'

alert(<a href="#!/api/Ext.Loader-method-getPath" rel="Ext.Loader-method-getPath" class="docClass">Ext.Loader.getPath</a>('Unknown.strange.Stuff')); // alerts 'Unknown/strange/Stuff.js'
</code></pre> %}
    
    {b Parameters}:
    {ul {- className: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>path</p> %}
    }
    }
    *)
  method loadScript : 'a Js.t -> unit Js.meth
  (** {% <p>Loads the specified script URL and calls the supplied callbacks. If this method
is called before <a href="#!/api/Ext-property-isReady" rel="Ext-property-isReady" class="docClass">Ext.isReady</a>, the script's load will delay the transition
to ready. This can be used to load arbitrary scripts that may contain further
<a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a> calls.</p> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>The options object or simply the URL to load.</p> %}
    }
    }
    *)
  method onReady : 'a Js.callback -> 'b Js.t -> bool Js.t -> unit Js.meth
  (** {% <p>Add a new listener to be executed when all required scripts are fully loaded</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function callback to be executed</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The execution scope (<code>this</code>) of the callback function</p> %}
    }
    {- withDomReady: [bool Js.t]
    {% <p>Whether or not to wait for document dom ready as well</p> %}
    }
    }
    *)
  method require : 'a Js.t -> 'b Js.callback Js.optdef -> 'c Js.t Js.optdef
    -> 'd Js.t Js.optdef -> unit Js.meth
  (** {% <p>Loads all classes by the given names and all their direct dependencies; optionally executes the given callback function when
finishes, within the optional scope. This method is aliased by <a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a> for convenience</p> %}
    
    {b Parameters}:
    {ul {- expressions: ['a Js.t]
    {% <p>Can either be a string or an array of string</p> %}
    }
    {- fn: ['a Js.callback]
    {% <p>The callback function</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The execution scope (<code>this</code>) of the callback function</p> %}
    }
    {- excludes: ['a Js.t]
    {% <p>Classes to be excluded, useful when being used with expressions</p> %}
    }
    }
    *)
  method setConfig : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Set the configuration for the loader. This should be called right after ext-(debug).js
is included in the page, and before <a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>. i.e:</p>

<pre><code>&lt;script type="text/javascript" src="ext-core-debug.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript"&gt;
    <a href="#!/api/Ext.Loader-method-setConfig" rel="Ext.Loader-method-setConfig" class="docClass">Ext.Loader.setConfig</a>({
      enabled: true,
      paths: {
          'My': 'my_own_path'
      }
    });
&lt;/script&gt;
&lt;script type="text/javascript"&gt;
    <a href="#!/api/Ext-method-require" rel="Ext-method-require" class="docClass">Ext.require</a>(...);

    <a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function() {
      // application code here
    });
&lt;/script&gt;
</code></pre>

<p>Refer to config options of <a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a> for the list of possible properties</p> %}
    
    {b Parameters}:
    {ul {- config: ['a Js.t]
    {% <p>The config object to override the default values</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Loader.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setPath : 'a Js.t -> Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the path of a namespace.
For Example:</p>

<pre><code><a href="#!/api/Ext.Loader-method-setPath" rel="Ext.Loader-method-setPath" class="docClass">Ext.Loader.setPath</a>('Ext', '.');
</code></pre> %}
    
    {b Parameters}:
    {ul {- name: ['a Js.t]
    {% <p>See <a href="#!/api/Ext.Function-method-flexSetter" rel="Ext.Function-method-flexSetter" class="docClass">flexSetter</a></p> %}
    }
    {- path: [Js.js_string Js.t]
    {% <p>See <a href="#!/api/Ext.Function-method-flexSetter" rel="Ext.Function-method-flexSetter" class="docClass">flexSetter</a></p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Loader.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method syncRequire : 'a Js.t -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> 'd Js.t Js.optdef -> unit Js.meth
  (** {% <p>Synchronously loads all classes by the given names and all their direct dependencies; optionally executes the given callback function when finishes, within the optional scope. This method is aliased by <a href="#!/api/Ext-method-syncRequire" rel="Ext-method-syncRequire" class="docClass">Ext.syncRequire</a> for convenience</p> %}
    
    {b Parameters}:
    {ul {- expressions: ['a Js.t]
    {% <p>Can either be a string or an array of string</p> %}
    }
    {- fn: ['a Js.callback]
    {% <p>The callback function</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The execution scope (<code>this</code>) of the callback function</p> %}
    }
    {- excludes: ['a Js.t]
    {% <p>Classes to be excluded, useful when being used with expressions</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  
  method disableCaching : bool Js.t Js.prop
  (** {% <p>Appends current timestamp to script files to prevent caching.</p> %}
    
    Defaults to: [true]
    *)
  method disableCachingParam : Js.js_string Js.t Js.prop
  (** {% <p>The get parameter name for the cache buster's timestamp.</p> %}
    
    Defaults to: ['_dc']
    *)
  method enabled : bool Js.t Js.prop
  (** {% <p>Whether or not to enable the dynamic dependency loading feature.</p> %}
    
    Defaults to: [false]
    *)
  method garbageCollect : bool Js.t Js.prop
  (** {% <p>True to prepare an asynchronous script tag for garbage collection (effective only
if <a href="#!/api/Ext.Loader-cfg-preserveScripts" rel="Ext.Loader-cfg-preserveScripts" class="docClass">preserveScripts</a> is false)</p> %}
    
    Defaults to: [false]
    *)
  method paths : 'a Js.t Js.prop
  (** {% <p>The mapping from namespaces to file paths</p>

<pre><code>{
    'Ext': '.', // This is set by default, <a href="#!/api/Ext.layout.container.Container" rel="Ext.layout.container.Container" class="docClass">Ext.layout.container.Container</a> will be
                // loaded from ./layout/Container.js

    'My': './src/my_own_folder' // My.layout.Container will be loaded from
                                // ./src/my_own_folder/layout/Container.js
}
</code></pre>

<p>Note that all relative paths are relative to the current HTML document.
If not being specified, for example, <code>Other.awesome.Class</code>
will simply be loaded from <code>./Other/awesome/Class.js</code></p> %}
    
    Defaults to: [{'Ext': '.'}]
    *)
  method preserveScripts : bool Js.t Js.prop
  (** {% <p>False to remove and optionally <a href="#!/api/Ext.Loader-cfg-garbageCollect" rel="Ext.Loader-cfg-garbageCollect" class="docClass">garbage-collect</a> asynchronously loaded scripts,
True to retain script element for browser debugger compatibility and improved load performance.</p> %}
    
    Defaults to: [true]
    *)
  method scriptChainDelay : bool Js.t Js.prop
  (** {% <p>millisecond delay between asynchronous script injection (prevents stack overflow on some user agents)
'false' disables delay but potentially increases stack load.</p> %}
    
    Defaults to: [false]
    *)
  method scriptCharset : Js.js_string Js.t Js.prop
  (** {% <p>Optional charset to specify encoding of dynamic script content.</p> %}
    *)
  
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

