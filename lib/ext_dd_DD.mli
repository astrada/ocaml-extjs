(** A DragDrop implementation where the linked element ...
  
  {% <p>A DragDrop implementation where the linked element follows the
mouse cursor during a drag.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dd_DragDrop.t
  
  method scroll : bool Js.t Js.prop
  (** {% <p>When set to true, the utility automatically tries to scroll the browser
window when a drag and drop element is dragged near the viewport boundary.</p> %}
    
    Defaults to: [true]
    *)
  method alignElWithMouse : Dom_html.element Js.t -> Js.number Js.t ->
    Js.number Js.t -> unit Js.meth
  (** {% <p>Sets the element to the location of the mousedown or click event,
maintaining the cursor location relative to the location on the element
that was clicked.  Override this if you want to place the element in a
location other than where the cursor is.</p> %}
    
    {b Parameters}:
    {ul {- el: [Dom_html.element Js.t]
    {% <p>the element to move</p> %}
    }
    {- iPageX: [Js.number Js.t]
    {% <p>the X coordinate of the mousedown or drag event</p> %}
    }
    {- iPageY: [Js.number Js.t]
    {% <p>the Y coordinate of the mousedown or drag event</p> %}
    }
    }
    *)
  method applyConfig : unit Js.meth
  (** {% <p>Sets up config options specific to this class. Overrides
<a href="#!/api/Ext.dd.DragDrop" rel="Ext.dd.DragDrop" class="docClass">Ext.dd.DragDrop</a>, but all versions of this method through the
inheritance chain are called</p> %}
    *)
  method autoOffset : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Sets the pointer offset to the distance between the linked element's top
left corner and the location the element was clicked.</p> %}
    
    {b Parameters}:
    {ul {- iPageX: [Js.number Js.t]
    {% <p>the X coordinate of the click</p> %}
    }
    {- iPageY: [Js.number Js.t]
    {% <p>the Y coordinate of the click</p> %}
    }
    }
    *)
  method b4Drag : _ Js.t -> unit Js.meth
  (** {% <p>Event that fires prior to the onDrag event.  Overrides
<a href="#!/api/Ext.dd.DragDrop" rel="Ext.dd.DragDrop" class="docClass">Ext.dd.DragDrop</a>.</p> %}
    
    {b Parameters}:
    {ul {- e: [_ Js.t]
    }
    }
    *)
  method b4MouseDown : _ Js.t -> unit Js.meth
  (** {% <p>Event that fires prior to the onMouseDown event.  Overrides
<a href="#!/api/Ext.dd.DragDrop" rel="Ext.dd.DragDrop" class="docClass">Ext.dd.DragDrop</a>.</p> %}
    
    {b Parameters}:
    {ul {- e: [_ Js.t]
    }
    }
    *)
  method cachePosition : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef
    -> unit Js.meth
  (** {% <p>Saves the most recent position so that we can reset the constraints and
tick marks on-demand.  We need to know this so that we can calculate the
number of pixels the element is offset from its original position.</p> %}
    
    {b Parameters}:
    {ul {- iPageX: [Js.number Js.t] (optional)
    {% <p>the current x position (this just makes it so we
don't have to look it up again)</p> %}
    }
    {- iPageY: [Js.number Js.t] (optional)
    {% <p>the current y position (this just makes it so we
don't have to look it up again)</p> %}
    }
    }
    *)
  method setDelta : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Sets the pointer offset.  You can call this directly to force the
offset to be in a particular location (e.g., pass in 0,0 to set it
to the center of the object)</p> %}
    
    {b Parameters}:
    {ul {- iDeltaX: [Js.number Js.t]
    {% <p>the distance from the left</p> %}
    }
    {- iDeltaY: [Js.number Js.t] {% <p>the distance from the top</p> %}
    }
    }
    *)
  method setDragElPos : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Sets the drag element to the location of the mousedown or click event,
maintaining the cursor location relative to the location on the element
that was clicked.  Override this if you want to place the element in a
location other than where the cursor is.</p> %}
    
    {b Parameters}:
    {ul {- iPageX: [Js.number Js.t]
    {% <p>the X coordinate of the mousedown or drag event</p> %}
    }
    {- iPageY: [Js.number Js.t]
    {% <p>the Y coordinate of the mousedown or drag event</p> %}
    }
    }
    *)
  method toString : Js.js_string Js.t Js.meth
  (** {% <p>toString method</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>string representation of the dd obj</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_dd_DragDrop.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_dd_DragDrop.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_dd_DragDrop.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

