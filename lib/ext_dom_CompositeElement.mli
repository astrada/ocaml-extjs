(** This class encapsulates a collection of DOM elemen ...
  
  {% <p>This class encapsulates a <i>collection</i> of DOM elements, providing methods to filter
members, or to perform collective actions upon the whole set.</p>


<p>Although they are not listed, this class supports all of the methods of <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a> and
<a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a>. The methods from these classes will be performed on all the elements in this collection.</p>


<p>All methods return <i>this</i> and can be chained.</p>


<p>Usage:</p>

<pre><code> var els = <a href="#!/api/Ext-method-select" rel="Ext-method-select" class="docClass">Ext.select</a>("#some-el div.some-class", true);
 // or select directly from an existing element
 var el = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('some-el');
 el.select('div.some-class', true);

 els.setWidth(100); // all elements become 100 width
 els.hide(true); // all elements fade out and hide
 // or
 els.setWidth(100).hide(true);
 </code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_dom_CompositeElementLite.t
  
  
end

class type configs =
object('self)
  inherit Ext_dom_CompositeElementLite.configs
  
  
end

class type events =
object
  inherit Ext_dom_CompositeElementLite.events
  
  
end

class type statics =
object
  inherit Ext_dom_CompositeElementLite.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

