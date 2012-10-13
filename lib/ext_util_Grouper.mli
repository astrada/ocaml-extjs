(** Represents a single grouper that can be applied to ...
  
  {% <p>Represents a single grouper that can be applied to a Store. The grouper works
in the same fashion as the <a href="#!/api/Ext.util.Sorter" rel="Ext.util.Sorter" class="docClass">Ext.util.Sorter</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Sorter.t
  
  method getGroupString : Ext_data_Model.t Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Returns the value for grouping to be used.</p> %}
    
    {b Parameters}:
    {ul {- instance: [Ext_data_Model.t Js.t]
    {% <p>The Model instance</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The group string for this model</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Sorter.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Sorter.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Sorter.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

