(** This mixin enables classes to declare relationship ...
  
  {% <p>This mixin enables classes to declare relationships to child elements and provides the
mechanics for acquiring the <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">elements</a> and storing them on an object
instance as properties.</p>

<p>This class is used by <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">components</a> and <a href="#!/api/Ext.layout.container.Container" rel="Ext.layout.container.Container" class="docClass">container layouts</a> to
manage their child elements.</p>

<p>A typical component that uses these features might look something like this:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Ext.ux.SomeComponent', {
     extend: '<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>',

     childEls: [
         'bodyEl'
     ],

     renderTpl: [
         '&lt;div id="{id}-bodyEl"&gt;&lt;/div&gt;'
     ],

     // ...
 });
</code></pre>

<p>The <code>childEls</code> array lists one or more relationships to child elements managed by the
component. The items in this array can be either of the following types:</p>

<ul>
<li>String: the id suffix and property name in one. For example, "bodyEl" in the above
example means a "bodyEl" property will be added to the instance with the result of
<a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a> given "componentId-bodyEl" where "componentId" is the component instance's
id.</li>
<li>Object: with a <code>name</code> property that names the instance property for the element, and
one of the following additional properties:

<ul>
<li> <code>id</code>: The full id of the child element.</li>
<li> <code>itemId</code>: The suffix part of the id to which "componentId-" is prepended.</li>
<li> <code>select</code>: A selector that will be passed to <a href="#!/api/Ext-method-select" rel="Ext-method-select" class="docClass">Ext.select</a>.</li>
<li> <code>selectNode</code>: A selector that will be passed to <a href="#!/api/Ext.dom.Query-method-selectNode" rel="Ext.dom.Query-method-selectNode" class="docClass">Ext.DomQuery.selectNode</a>.</li>
</ul>
</li>
</ul>


<p>The example above could have used this instead to achieve the same result:</p>

<pre><code> childEls: [
     { name: 'bodyEl', itemId: 'bodyEl' }
 ]
</code></pre>

<p>When using <code>select</code>, the property will be an instance of <a href="#!/api/Ext.dom.CompositeElement" rel="Ext.dom.CompositeElement" class="docClass">Ext.CompositeElement</a>. In
all other cases, the property will be an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> or <code>null</code> if not found.</p>

<p>Care should be taken when using <code>select</code> or <code>selectNode</code> to find child elements. The
following issues should be considered:</p>

<ul>
<li>Performance: using selectors can be slower than id lookup by a factor 10x or more.</li>
<li>Over-selecting: selectors are applied after the DOM elements for all children have
been rendered, so selectors can match elements from child components (including nested
versions of the same component) accidentally.</li>
</ul>


<p>This above issues are most important when using <code>select</code> since it returns multiple
elements.</p>

<p><strong>IMPORTANT</strong>
Unlike a <code>renderTpl</code> where there is a single value for an instance, <code>childEls</code> are aggregated
up the class hierarchy so that they are effectively inherited. In other words, if a
class where to derive from <code>Ext.ux.SomeComponent</code> in the example above, it could also
have a <code>childEls</code> property in the same way as <code>Ext.ux.SomeComponent</code>.</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Ext.ux.AnotherComponent', {
     extend: 'Ext.ux.SomeComponent',

     childEls: [
         // 'bodyEl' is inherited
         'innerEl'
     ],

     renderTpl: [
         '&lt;div id="{id}-bodyEl"&gt;'
             '&lt;div id="{id}-innerEl"&gt;&lt;/div&gt;'
         '&lt;/div&gt;'
     ],

     // ...
 });
</code></pre>

<p>The <code>renderTpl</code> contains both child elements and unites them in the desired markup, but
the <code>childEls</code> only contains the new child element. The <a href="#!/api/Ext.util.ElementContainer" rel="Ext.util.ElementContainer" class="docClass">applyChildEls</a> method
takes care of looking up all <code>childEls</code> for an instance and considers <code>childEls</code>
properties on all the super classes and mixins.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method addChildEls : unit Js.meth
  (** {% <p>Adds each argument passed to this method to the <a href="#!/api/Ext.AbstractComponent-cfg-childEls" rel="Ext.AbstractComponent-cfg-childEls" class="docClass">childEls</a> array.</p> %}
    *)
  method removeChildEls : _ Js.callback -> unit Js.meth
  (** {% <p>Removes items in the childEls array based on the return value of a supplied test
function. The function is called with a entry in childEls and if the test function
return true, that entry is removed. If false, that entry is kept.</p> %}
    
    {b Parameters}:
    {ul {- testFn: [_ Js.callback] {% <p>The test function.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

