(** Labels is a mixin to the Series class. Labels meth ...
  
  {% <p>Labels is a mixin to the Series class. Labels methods are implemented
in each of the Series (Pie, Bar, etc) for label creation and placement.</p>

<p>The methods implemented by the Series are:</p>

<ul>
<li><a href="#!/api/Ext.chart.Label-method-onCreateLabel" rel="Ext.chart.Label-method-onCreateLabel" class="docClass">onCreateLabel</a></li>
<li><a href="#!/api/Ext.chart.Label-method-onPlaceLabel" rel="Ext.chart.Label-method-onPlaceLabel" class="docClass">onPlaceLabel</a></li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method onCreateLabel : Ext_data_Model.t Js.t -> _ Js.t -> Js.number Js.t ->
    bool Js.t -> Ext_draw_Sprite.t Js.t Js.meth
  (** {% <p>Called each time a new label is created.</p>

<p><strong>Note:</strong> This method must be implemented in Series that mixes
in this Label mixin.</p> %}
    
    {b Parameters}:
    {ul {- storeItem: [Ext_data_Model.t Js.t]
    {% <p>The element of the store that is
related to the label sprite.</p> %}
    }
    {- item: [_ Js.t]
    {% <p>The item related to the label sprite.
An item is an object containing the position of the shape
used to describe the visualization and also pointing to the
actual shape (circle, rectangle, path, etc).</p> %}
    }
    {- i: [Js.number Js.t]
    {% <p>The index of the element created
(i.e the first created label, second created label, etc).</p> %}
    }
    {- display: [bool Js.t]
    {% <p>The display type.
May be <code>false</code> if the label is hidden</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_draw_Sprite.t Js.t] {% <p>The created label.</p> %}
    }
    }
    *)
  method onPlaceLabel : Ext_draw_Sprite.t Js.t -> Ext_data_Model.t Js.t ->
    _ Js.t -> Js.number Js.t -> bool Js.t -> bool Js.t -> Js.number Js.t ->
    unit Js.meth
  (** {% <p>Called for updating the position of the label.</p>

<p><strong>Note:</strong> This method must be implemented in Series that mixes
in this Label mixin.</p> %}
    
    {b Parameters}:
    {ul {- label: [Ext_draw_Sprite.t Js.t]
    {% <p>The sprite label.</p> %}
    }
    {- storeItem: [Ext_data_Model.t Js.t]
    {% <p>The element of the store
that is related to the label sprite.</p> %}
    }
    {- item: [_ Js.t]
    {% <p>The item related to the label
sprite. An item is an object containing the position of
the shape used to describe the visualization and also
pointing to the actual shape (circle, rectangle, path, etc).</p> %}
    }
    {- i: [Js.number Js.t]
    {% <p>The index of the element to be updated
(i.e. whether it is the first, second, third from the
labelGroup)</p> %}
    }
    {- display: [bool Js.t]
    {% <p>The display type.
May be <code>false</code> if the label is hidden</p> %}
    }
    {- animate: [bool Js.t]
    {% <p>A boolean value to set or unset
animations for the labels.</p> %}
    }
    {- index: [Js.number Js.t] {% <p>The series index.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method onCreateLabel : ('self Js.t, Ext_data_Model.t Js.t -> _ Js.t ->
    Js.number Js.t -> bool Js.t -> Ext_draw_Sprite.t Js.t) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onCreateLabel] *)
  method onPlaceLabel : ('self Js.t, Ext_draw_Sprite.t Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> Js.number Js.t -> bool Js.t ->
    bool Js.t -> Js.number Js.t -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onPlaceLabel] *)
  method label : _ Js.t Js.prop
  (** {% <p>Object with the following properties:</p> %}
    *)
  
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

