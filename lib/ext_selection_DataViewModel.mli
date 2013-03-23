(**  ...
  
  {%  %} *)

class type t =
object('self)
  inherit Ext_selection_Model.t
  
  
end

class type configs =
object('self)
  inherit Ext_selection_Model.configs
  
  method enableKeyNav : bool Js.t Js.prop
  (** {% <p>Turns on/off keyboard navigation within the DataView.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_selection_Model.events
  
  method beforedeselect : (t Js.t -> Ext_data_Model.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fired before a record is deselected. If any listener returns false, the
deselection is cancelled.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_DataViewModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The deselected record</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeselect : (t Js.t -> Ext_data_Model.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fired before a record is selected. If any listener returns false, the
selection is cancelled.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_DataViewModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The selected record</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method deselect : (t Js.t -> Ext_data_Model.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fired after a record is deselected</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_DataViewModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The deselected record</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method select : (t Js.t -> Ext_data_Model.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fired after a record is selected</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_DataViewModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The selected record</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_selection_Model.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

