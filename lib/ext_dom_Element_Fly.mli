(** A non-persistent wrapper for a DOM element which m ...
  
  {% <p>A non-persistent wrapper for a DOM element which may be used to execute methods of <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>
upon a DOM element without creating an instance of <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>.</p>

<p>A <strong>singleton</strong> instance of this class is returned when you use <a href="#!/api/Ext-method-fly" rel="Ext-method-fly" class="docClass">Ext.fly</a></p>

<p>Because it is a singleton, this Flyweight does not have an ID, and must be used and discarded in a single line.
You should not keep and use the reference to this singleton over multiple lines because methods that you call
may themselves make use of <a href="#!/api/Ext-method-fly" rel="Ext-method-fly" class="docClass">Ext.fly</a> and may change the DOM element to which the instance refers.</p> %}
  *)

class type t =
object('self)
  inherit Ext_dom_Element.t
  
  method isFly : bool Js.t Js.prop
  (** {% <p>This is <code>true</code> to identify Element flyweights</p> %}
    
    Defaults to: [true]
    *)
  
end

class type configs =
object('self)
  inherit Ext_dom_Element.configs
  
  
end

class type events =
object
  inherit Ext_dom_Element.events
  
  
end

class type statics =
object
  inherit Ext_dom_Element.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

