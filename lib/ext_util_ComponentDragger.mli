(** A subclass of Ext.dd.DragTracker which handles dra ...
  
  {% <p>A subclass of <a href="#!/api/Ext.dd.DragTracker" rel="Ext.dd.DragTracker" class="docClass">Ext.dd.DragTracker</a> which handles dragging any Component.</p>

<p>This is configured with a Component to be made draggable, and a config object for the <a href="#!/api/Ext.dd.DragTracker" rel="Ext.dd.DragTracker" class="docClass">Ext.dd.DragTracker</a>
class.</p>

<p>A <a href="#!/api/Ext.util.ComponentDragger-cfg-delegate" rel="Ext.util.ComponentDragger-cfg-delegate" class="docClass">delegate</a> may be provided which may be either the element to use as the mousedown target or a <a href="#!/api/Ext.dom.Query" rel="Ext.dom.Query" class="docClass">Ext.DomQuery</a> selector to activate multiple mousedown targets.</p>

<p>When the Component begins to be dragged, its <code>beginDrag</code> method will be called if implemented.</p>

<p>When the drag ends, its <code>endDrag</code> method will be called if implemented.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dd_DragTracker.t
  
  method onDrag : Ext_EventObject.t Js.t -> unit Js.meth
  (** {% <p>Move either the ghost Component or the target Component to its new position on drag</p>

<p>Template method which should be overridden by each DragTracker instance. Called whenever a drag has been detected.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t] {% <p>The event object</p> %}
    }
    }
    *)
  method onEnd : Ext_EventObject.t Js.t -> unit Js.meth
  (** {% <p>Template method which should be overridden by each DragTracker instance. Called when a drag operation has been completed
(e.g. the user clicked and held the mouse down, dragged the element and then released the mouse button)</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t] {% <p>The event object</p> %}
    }
    }
    *)
  method onStart : Ext_EventObject.t Js.t -> unit Js.meth
  (** {% <p>Template method which should be overridden by each DragTracker instance. Called when a drag operation starts
(e.g. the user has moved the tracked element beyond the specified tolerance)</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t] {% <p>The event object</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_dd_DragTracker.configs
  
  method onDrag : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onDrag] *)
  method onEnd : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onEnd] *)
  method onStart : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onStart] *)
  method constrain : bool Js.t Js.prop
  (** {% <p>Specify as <code>true</code> to constrain the Component to within the bounds of the <a href="#!/api/Ext.util.ComponentDragger-cfg-constrainTo" rel="Ext.util.ComponentDragger-cfg-constrainTo" class="docClass">constrainTo</a> region.</p> %}
    *)
  method constrainDelegate : bool Js.t Js.prop
  (** {% <p>Specify as <code>true</code> to constrain the drag handles within the <a href="#!/api/Ext.util.ComponentDragger-cfg-constrainTo" rel="Ext.util.ComponentDragger-cfg-constrainTo" class="docClass">constrainTo</a> region.</p> %}
    *)
  method delegate_2 : 'a Js.t Js.prop
  (** {% <p>A <a href="#!/api/Ext.dom.Query" rel="Ext.dom.Query" class="docClass">DomQuery</a> selector which identifies child elements within the Component's encapsulating
Element which are the drag handles. This limits dragging to only begin when the matching elements are
mousedowned.</p>

<p>This may also be a specific child element within the Component's encapsulating element to use as the drag handle.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_dd_DragTracker.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_dd_DragTracker.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

