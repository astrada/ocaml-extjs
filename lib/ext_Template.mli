(** Represents an HTML fragment template. Templates ma ...
  
  {% <p>Represents an HTML fragment template. Templates may be <a href="#!/api/Ext.Template-method-compile" rel="Ext.Template-method-compile" class="docClass">precompiled</a> for greater performance.</p>

<p>An instance of this class may be created by passing to the constructor either a single argument, or multiple
arguments:</p>

<h1>Single argument: String/Array</h1>

<p>The single argument may be either a String or an Array:</p>

<ul>
<li><p>String:</p>

<pre><code>var t = new <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template</a>("&lt;div&gt;Hello \{0\}.&lt;/div&gt;");
t.<a href="#!/api/Ext.Template-method-append" rel="Ext.Template-method-append" class="docClass">append</a>('some-element', ['foo']);
</code></pre></li>
<li><p>Array:</p>

<p>An Array will be combined with <code>join('')</code>.</p>

<pre><code>var t = new <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template</a>([
    '&lt;div name="\{id\}"&gt;',
        '&lt;span class="\{cls\}"&gt;\{name:trim\} \{value:ellipsis(10)\}&lt;/span&gt;',
    '&lt;/div&gt;',
]);
t.<a href="#!/api/Ext.Template-method-compile" rel="Ext.Template-method-compile" class="docClass">compile</a>();
t.<a href="#!/api/Ext.Template-method-append" rel="Ext.Template-method-append" class="docClass">append</a>('some-element', \{id: 'myid', cls: 'myclass', name: 'foo', value: 'bar'\});
</code></pre></li>
</ul>


<h1>Multiple arguments: String, Object, Array, ...</h1>

<p>Multiple arguments will be combined with <code>join('')</code>.</p>

<pre><code>var t = new <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template</a>(
    '&lt;div name="\{id\}"&gt;',
        '&lt;span class="\{cls\}"&gt;\{name\} \{value\}&lt;/span&gt;',
    '&lt;/div&gt;',
    // a configuration object:
    \{
        compiled: true,      // <a href="#!/api/Ext.Template-method-compile" rel="Ext.Template-method-compile" class="docClass">compile</a> immediately
    \}
);
</code></pre>

<h1>Notes</h1>

<ul>
<li>For a list of available format functions, see <a href="#!/api/Ext.util.Format" rel="Ext.util.Format" class="docClass">Ext.util.Format</a>.</li>
<li><code>disableFormats</code> reduces <code><a href="#!/api/Ext.Template-method-apply" rel="Ext.Template-method-apply" class="docClass">apply</a></code> time when no formatting is required.</li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method append : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Applies the supplied <code>values</code> to the template and appends the new node(s) to the specified <code>el</code>.</p>

<p>For example usage see <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template class docs</a>.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t] {% <p>The context element</p> %}
    }
    {- values: [_ Js.t]
    {% <p>The template values. See <a href="#!/api/Ext.Template-method-applyTemplate" rel="Ext.Template-method-applyTemplate" class="docClass">applyTemplate</a> for details.</p> %}
    }
    {- returnElement: [bool Js.t] (optional)
    {% <p>true to return an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The new node or Element</p> %}
    }
    }
    *)
  method apply : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Returns an HTML fragment of this template with the specified values applied.</p> %}
    
    {b Parameters}:
    {ul {- values: [_ Js.t]
    {% <p>The template values. Can be an array if your params are numeric:</p>




<pre><code>var tpl = new <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template</a>('Name: \{0\}, Age: \{1\}');
tpl.apply(['John', 25]);
</code></pre>




<p>or an object:</p>




<pre><code>var tpl = new <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template</a>('Name: \{name\}, Age: \{age\}');
tpl.apply(\{name: 'John', age: 25\});
</code></pre> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The HTML fragment</p> %}
    }
    }
    *)
  method applyOut : _ Js.t -> _ Js.js_array Js.t -> _ Js.js_array Js.t
    Js.meth
  (** {% <p>Appends the result of this template to the provided output array.</p> %}
    
    {b Parameters}:
    {ul {- values: [_ Js.t]
    {% <p>The template values. See <a href="#!/api/Ext.Template-method-apply" rel="Ext.Template-method-apply" class="docClass">apply</a>.</p> %}
    }
    {- out: [_ Js.js_array Js.t]
    {% <p>The array to which output is pushed.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.js_array Js.t] {% <p>The given out array.</p> %}
    }
    }
    *)
  method applyTemplate : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.Template-method-apply" rel="Ext.Template-method-apply" class="docClass">apply</a>.</p>

<p>Returns an HTML fragment of this template with the specified values applied.</p> %}
    
    {b Parameters}:
    {ul {- values: [_ Js.t]
    {% <p>The template values. Can be an array if your params are numeric:</p>




<pre><code>var tpl = new <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template</a>('Name: \{0\}, Age: \{1\}');
tpl.apply(['John', 25]);
</code></pre>




<p>or an object:</p>




<pre><code>var tpl = new <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template</a>('Name: \{name\}, Age: \{age\}');
tpl.apply(\{name: 'John', age: 25\});
</code></pre> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The HTML fragment</p> %}
    }
    }
    *)
  method compile : 'self Js.t Js.meth
  (** {% <p>Compiles the template into an internal function, eliminating the RegEx overhead.</p> %}
    
    {b Returns}:
    {ul {- [Ext_Template.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method insertAfter : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Applies the supplied values to the template and inserts the new node(s) after el.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t] {% <p>The context element</p> %}
    }
    {- values: [_ Js.t]
    {% <p>The template values. See <a href="#!/api/Ext.Template-method-applyTemplate" rel="Ext.Template-method-applyTemplate" class="docClass">applyTemplate</a> for details.</p> %}
    }
    {- returnElement: [bool Js.t] (optional)
    {% <p>true to return a <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The new node or Element</p> %}
    }
    }
    *)
  method insertBefore : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Applies the supplied values to the template and inserts the new node(s) before el.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t] {% <p>The context element</p> %}
    }
    {- values: [_ Js.t]
    {% <p>The template values. See <a href="#!/api/Ext.Template-method-applyTemplate" rel="Ext.Template-method-applyTemplate" class="docClass">applyTemplate</a> for details.</p> %}
    }
    {- returnElement: [bool Js.t] (optional)
    {% <p>true to return a <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The new node or Element</p> %}
    }
    }
    *)
  method insertFirst : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Applies the supplied values to the template and inserts the new node(s) as the first child of el.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t] {% <p>The context element</p> %}
    }
    {- values: [_ Js.t]
    {% <p>The template values. See <a href="#!/api/Ext.Template-method-applyTemplate" rel="Ext.Template-method-applyTemplate" class="docClass">applyTemplate</a> for details.</p> %}
    }
    {- returnElement: [bool Js.t] (optional)
    {% <p>true to return a <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The new node or Element</p> %}
    }
    }
    *)
  method overwrite : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Applies the supplied values to the template and overwrites the content of el with the new node(s).</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t] {% <p>The context element</p> %}
    }
    {- values: [_ Js.t]
    {% <p>The template values. See <a href="#!/api/Ext.Template-method-applyTemplate" rel="Ext.Template-method-applyTemplate" class="docClass">applyTemplate</a> for details.</p> %}
    }
    {- returnElement: [bool Js.t] (optional)
    {% <p>true to return a <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The new node or Element</p> %}
    }
    }
    *)
  method set : Js.js_string Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the HTML used as the template and optionally compiles it.</p> %}
    
    {b Parameters}:
    {ul {- html: [Js.js_string Js.t]
    }
    {- compile: [bool Js.t] (optional)
    {% <p>True to compile the template.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Template.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method isTemplate : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Template, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method compiled : bool Js.t Js.prop
  (** {% <p>True to immediately compile the template. Defaults to false.</p> %}
    *)
  method disableFormats : bool Js.t Js.prop
  (** {% <p>True to disable format functions in the template. If the template doesn't contain
format functions, setting disableFormats to true will reduce apply time. Defaults to false.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method from : _ Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Creates a template from the passed element's value (<em>display:none</em> textarea, preferred) or innerHTML.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>A DOM element or its id</p> %}
    }
    {- config: [_ Js.t] (optional)
    {% <p>Config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Template.t Js.t] {% <p>The created template</p> %}
    }
    }
    *)
  
end

val get_static : unit -> statics Js.t
(** Static instance for lazy-loaded modules. *)

val static : statics Js.t
(** Static instance. *)

val from : _ Js.t -> _ Js.t Js.optdef -> 'self Js.t
(** See method [statics.from] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

