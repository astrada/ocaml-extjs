(** Represents a 2D point with x and y properties, use ...
  
  {% <p>Represents a 2D point with x and y properties, useful for comparison and instantiation
from an event:</p>

<pre><code>var point = <a href="#!/api/Ext.util.Point-static-method-fromEvent" rel="Ext.util.Point-static-method-fromEvent" class="docClass">Ext.util.Point.fromEvent</a>(e);
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Region.t
  
  method equals_point : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Compare this point and another point</p> %}
    
    {b Parameters}:
    {ul {- the: [_ Js.t]
    {% <p>point to compare with, either an instance
of <a href="#!/api/Ext.util.Point" rel="Ext.util.Point" class="docClass">Ext.util.Point</a> or an object with left and top properties</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>Returns whether they are equivalent</p> %}
    }
    }
    *)
  method isWithin : _ Js.t -> _ Js.t -> bool Js.t Js.meth
  (** {% <p>Whether the given point is not away from this point within the given threshold amount.</p> %}
    
    {b Parameters}:
    {ul {- p: [_ Js.t]
    {% <p>The point to check with, either an instance
of <a href="#!/api/Ext.util.Point" rel="Ext.util.Point" class="docClass">Ext.util.Point</a> or an object with left and top properties</p> %}
    }
    {- threshold: [_ Js.t]
    {% <p>Can be either an object with x and y properties or a number</p> %}
    }
    }
    *)
  method roundedEquals : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Compare this point with another point when the x and y values of both points are rounded. E.g:
[100.3,199.8] will equals to [100, 200]</p> %}
    
    {b Parameters}:
    {ul {- p: [_ Js.t]
    {% <p>The point to compare with, either an instance
of <a href="#!/api/Ext.util.Point" rel="Ext.util.Point" class="docClass">Ext.util.Point</a> or an object with x and y properties</p> %}
    }
    }
    *)
  method toString : Js.js_string Js.t Js.meth
  (** {% <p>Returns a human-eye-friendly string that represents this point,
useful for debugging</p> %}
    *)
  method translate : _ Js.t -> Js.number Js.t -> Ext_util_Region.t Js.t
    Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.util.Point-method-translateBy" rel="Ext.util.Point-method-translateBy" class="docClass">translateBy</a></p>

<p>Translate this region by the given offset amount</p> %}
    
    {b Parameters}:
    {ul {- x: [_ Js.t]
    {% <p>Object containing the <code>x</code> and <code>y</code> properties.
Or the x value is using the two argument form.</p> %}
    }
    {- y: [Js.number Js.t]
    {% <p>The y value unless using an Offset object.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t] {% <p>this This Region</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Region.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Region.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Region.statics
  
  method fromEvent : Dom_html.event Js.t -> 'self Js.t Js.meth
  (** {% <p>Returns a new instance of <a href="#!/api/Ext.util.Point" rel="Ext.util.Point" class="docClass">Ext.util.Point</a> base on the pageX / pageY values of the given event</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t] {% <p>The event</p> %}
    }
    }
    *)
  
end

val get_static : unit -> statics Js.t
(** Static instance for lazy-loaded modules. *)

val static : statics Js.t
(** Static instance. *)

val fromEvent : Dom_html.event Js.t -> 'self Js.t
(** See method [statics.fromEvent] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

