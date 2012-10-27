(** This class represents a rectangular region in X,Y ...
  
  {% <p>This class represents a rectangular region in X,Y space, and performs geometric
transformations or tests upon the region.</p>

<p>This class may be used to compare the document regions occupied by elements.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method adjust : Js.number Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> 'self Js.t Js.meth
  (** {% <p>Modifies the current region to be adjusted by offsets.</p> %}
    
    {b Parameters}:
    {ul {- top: [Js.number Js.t]
    {% <p>top offset</p> %}
    }
    {- right: [Js.number Js.t]
    {% <p>right offset</p> %}
    }
    {- bottom: [Js.number Js.t]
    {% <p>bottom offset</p> %}
    }
    {- left: [Js.number Js.t]
    {% <p>left offset</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method constrainTo : 'self Js.t -> 'self Js.t Js.meth
  (** {% <p>Modifies the current region to be constrained to the targetRegion.</p> %}
    
    {b Parameters}:
    {ul {- targetRegion: [Ext_util_Region.t Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method contains : 'self Js.t -> bool Js.t Js.meth
  (** {% <p>Checks if this region completely contains the region that is passed in.</p> %}
    
    {b Parameters}:
    {ul {- region: [Ext_util_Region.t Js.t]
    }
    }
    *)
  method copy : 'self Js.t Js.meth
  (** {% <p>Create a copy of this Region.</p> %}
    *)
  method copyFrom : 'self Js.t -> 'self Js.t Js.meth
  (** {% <p>Copy the values of another Region to this Region</p> %}
    
    {b Parameters}:
    {ul {- p: [Ext_util_Region.t Js.t]
    {% <p>The region to copy from.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t] {% <p>This Region</p> %}
    }
    }
    *)
  method equals : 'self Js.t -> bool Js.t Js.meth
  (** {% <p>Check whether this region is equivalent to the given region</p> %}
    
    {b Parameters}:
    {ul {- region: [Ext_util_Region.t Js.t]
    {% <p>The region to compare with</p> %}
    }
    }
    *)
  method getOutOfBoundOffset : Js.js_string Js.t Js.optdef ->
    _ Js.t Js.optdef -> Ext_util_Offset.t Js.t Js.meth
  (** {% <p>Get the offset amount of a point outside the region</p> %}
    
    {b Parameters}:
    {ul {- axis: [Js.js_string Js.t] (optional)
    }
    {- p: [Ext_util_Point.t Js.t] (optional) {% <p>the point</p> %}
    }
    }
    *)
  method getOutOfBoundOffsetX : Js.number Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the offset amount on the x-axis</p> %}
    
    {b Parameters}:
    {ul {- p: [Js.number Js.t] {% <p>the offset</p> %}
    }
    }
    *)
  method getOutOfBoundOffsetY : Js.number Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the offset amount on the y-axis</p> %}
    
    {b Parameters}:
    {ul {- p: [Js.number Js.t] {% <p>the offset</p> %}
    }
    }
    *)
  method intersect : 'self Js.t -> _ Js.t Js.meth
  (** {% <p>Checks if this region intersects the region passed in.</p> %}
    
    {b Parameters}:
    {ul {- region: [Ext_util_Region.t Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>Returns the intersected region or false if there is no intersection.</p> %}
    }
    }
    *)
  method isOutOfBound : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    bool Js.t Js.meth
  (** {% <p>Check whether the point / offset is out of bound</p> %}
    
    {b Parameters}:
    {ul {- axis: [Js.js_string Js.t] (optional)
    }
    {- p: [_ Js.t] (optional) {% <p>the point / offset</p> %}
    }
    }
    *)
  method isOutOfBoundX : Js.number Js.t -> bool Js.t Js.meth
  (** {% <p>Check whether the offset is out of bound in the x-axis</p> %}
    
    {b Parameters}:
    {ul {- p: [Js.number Js.t] {% <p>the offset</p> %}
    }
    }
    *)
  method isOutOfBoundY : Js.number Js.t -> bool Js.t Js.meth
  (** {% <p>Check whether the offset is out of bound in the y-axis</p> %}
    
    {b Parameters}:
    {ul {- p: [Js.number Js.t] {% <p>the offset</p> %}
    }
    }
    *)
  method round : 'self Js.t Js.meth
  (** {% <p>Round all the properties of this region</p> %}
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t] {% <p>this This Region</p> %}
    }
    }
    *)
  method translateBy : _ Js.t -> Js.number Js.t -> 'self Js.t Js.meth
  (** {% <p>Translate this region by the given offset amount</p> %}
    
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
  method union : 'self Js.t -> 'self Js.t Js.meth
  (** {% <p>Returns the smallest region that contains the current AND targetRegion.</p> %}
    
    {b Parameters}:
    {ul {- region: [Ext_util_Region.t Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t] {% <p>a new region</p> %}
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
  
  method from : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Creates a Region from a "box" Object which contains four numeric properties <code>top</code>, <code>right</code>, <code>bottom</code> and <code>left</code>.</p> %}
    
    {b Parameters}:
    {ul {- o: [_ Js.t]
    {% <p>An object with <code>top</code>, <code>right</code>, <code>bottom</code> and <code>left</code> properties.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t]
    {% <p>region The Region constructed based on the passed object</p> %}
    }
    }
    *)
  method getRegion : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Retrieves an <a href="#!/api/Ext.util.Region" rel="Ext.util.Region" class="docClass">Ext.util.Region</a> for a particular element.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>An element ID, htmlElement or <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> representing an element in the document.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t] {% <p>region</p> %}
    }
    }
    *)
  
end

val get_static : unit -> statics Js.t
(** Static instance for lazy-loaded modules. *)

val static : statics Js.t
(** Static instance. *)

val from : _ Js.t -> 'self Js.t
(** See method [statics.from] *)

val getRegion : _ Js.t -> 'self Js.t
(** See method [statics.getRegion] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

