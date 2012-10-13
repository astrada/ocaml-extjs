(** A DragDrop implementation that does not move, but ...
  
  {% <p>A DragDrop implementation that does not move, but can be a drop
target.  You would get the same result by simply omitting implementation
for the event callbacks, but this way we reduce the processing cost of the
event listener and the callbacks.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dd_DragDrop.t
  
  method addInvalidHandleClass_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method addInvalidHandleId_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method addInvalidHandleType_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method clearConstraints_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method clearTicks_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method endDrag_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method getDragEl_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method isValidHandleChild_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method onDrag_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method onDragDrop_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method onDragEnter_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method onDragOut_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method onDragOver_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method onInvalidDrop_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method onMouseDown_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method onMouseUp_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method removeInvalidHandleClass_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method removeInvalidHandleId_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method removeInvalidHandleType_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method resetConstraints_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method setDragElId_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method setHandleElId_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method setInitPosition_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method setOuterHandleElId_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method setXConstraint_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method setYConstraint_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
    *)
  method startDrag_2 : unit Js.meth
  (** {% <p>Overridden and disabled. A DDTarget does not support being dragged.</p> %}
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

