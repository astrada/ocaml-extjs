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

