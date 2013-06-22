(** This class encapsulates a collection of DOM elemen ...
  
  {% <p>This class encapsulates a <em>collection</em> of DOM elements, providing methods to filter members, or to perform collective
actions upon the whole set.</p>

<p>Although they are not listed, this class supports all of the methods of <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a> and
<a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a>. The methods from these classes will be performed on all the elements in this collection.</p>

<p>Example:</p>

<pre><code>var els = <a href="#!/api/Ext-method-select" rel="Ext-method-select" class="docClass">Ext.select</a>("#some-el div.some-class");
// or select directly from an existing element
var el = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('some-el');
el.select('div.some-class');

els.setWidth(100); // all elements become 100 width
els.hide(true); // all elements fade out and hide
// or
els.setWidth(100).hide(true);
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method elements : Dom_html.element Js.t Js.js_array Js.t Js.readonly_prop
  (** {% <p>The Array of DOM elements which this CompositeElement encapsulates.</p>

<p>This will not <em>usually</em> be accessed in developers' code, but developers wishing to augment the capabilities
of the CompositeElementLite class may use it when adding methods to the class.</p>

<p>For example to add the <code>nextAll</code> method to the class to <strong>add</strong> all following siblings of selected elements,
the code would be</p>

<pre><code><a href="#!/api/Ext-method-override" rel="Ext-method-override" class="docClass">Ext.override</a>(<a href="#!/api/Ext.dom.CompositeElementLite" rel="Ext.dom.CompositeElementLite" class="docClass">Ext.dom.CompositeElementLite</a>, \{
    nextAll: function() \{
        var elements = this.elements, i, l = elements.length, n, r = [], ri = -1;

        // Loop through all elements in this Composite, accumulating
        // an Array of all siblings.
        for (i = 0; i &lt; l; i++) \{
            for (n = elements[i].nextSibling; n; n = n.nextSibling) \{
                r[++ri] = n;
            \}
        \}

        // Add all found siblings to this Composite
        return this.add(r);
    \}
\});
</code></pre> %}
    *)
  method isComposite : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated CompositeElement, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method add : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Adds elements to this Composite object.</p> %}
    
    {b Parameters}:
    {ul {- els: [_ Js.t]
    {% <p>Either an Array of DOM elements to add, or another Composite
object who's elements should be added.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_CompositeElement.t Js.t]
    {% <p>This Composite object.</p> %}
    }
    }
    *)
  method clear : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Removes all elements from this Composite.</p> %}
    
    {b Parameters}:
    {ul {- removeDom: [bool Js.t] (optional)
    {% <p>True to also remove the elements from the document.</p> %}
    }
    }
    *)
  method contains : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if this composite contains the passed element.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>The id of an element, or an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>, or an HtmlElement to
find within the composite collection.</p> %}
    }
    }
    *)
  method each : _ Js.callback -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Calls the passed function for each element in this composite.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to call.</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (this reference) in which the function is executed.
Defaults to the Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_CompositeElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method fill : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Clears this Composite and adds the elements passed.</p> %}
    
    {b Parameters}:
    {ul {- els: [_ Js.t]
    {% <p>Either an array of DOM elements, or another Composite from which
to fill this Composite.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_CompositeElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method filter : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Filters this composite to only elements that match the passed selector.</p> %}
    
    {b Parameters}:
    {ul {- selector: [_ Js.t]
    {% <p>A string CSS selector or a comparison function. The comparison function will be
called with the following arguments:</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_CompositeElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method first : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the first Element</p> %}
    *)
  method getCount : Js.number Js.t Js.meth
  (** {% <p>Returns the number of elements in this Composite.</p> %}
    *)
  method indexOf : _ Js.t -> Js.number Js.t Js.meth
  (** {% <p>Find the index of the passed element within the composite collection.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>The id of an element, or an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>, or an HtmlElement
to find within the composite collection.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The index of the passed <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a> in the composite collection, or -1 if not found.</p> %}
    }
    }
    *)
  method item : Js.number Js.t -> Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns a flyweight Element of the dom element object at the specified index</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    }
    }
    *)
  method last : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the last Element</p> %}
    *)
  method removeElement : _ Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Removes the specified element(s).</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>The id of an element, the Element itself, the index of the
element in this composite or an array of any of those.</p> %}
    }
    {- removeDom: [bool Js.t] (optional)
    {% <p>True to also remove the element from the document.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_CompositeElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method replaceElement : _ Js.t -> _ Js.t -> bool Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Replaces the specified element with the passed element.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>The id of an element, the Element itself, the index of the
element in this composite to replace.</p> %}
    }
    {- replacement: [_ Js.t]
    {% <p>The id of an element or the Element itself.</p> %}
    }
    {- domReplace: [bool Js.t] (optional)
    {% <p>True to remove and replace the element in the document too.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_CompositeElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method slice : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    Dom_html.element Js.t Js.js_array Js.t Js.meth
  (** {% <p>Gets a range nodes.</p> %}
    
    {b Parameters}:
    {ul {- start: [Js.number Js.t] (optional)
    {% <p>The index of the first node in the range</p> %}
    }
    {- _end: [Js.number Js.t] (optional)
    {% <p>The index of the last node in the range</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t Js.js_array Js.t]
    {% <p>An array of nodes</p> %}
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

