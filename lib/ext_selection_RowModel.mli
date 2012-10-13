(** Implements row based navigation via keyboard.Must ...
  
  {% <p>Implements row based navigation via keyboard.</p>

<p>Must synchronize across grid sections.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  inherit Ext_selection_Model.t
  
  method getCurrentPosition : unit Js.meth
  (** {% <p>Returns position of the first selected cell in the selection in the format {row: row, column: column}</p> %}
    *)
  method selectNext : bool Js.t Js.optdef -> bool Js.t Js.optdef -> bool Js.t
    Js.meth
  (** {% <p>Selects the record immediately following the currently selected record.</p> %}
    
    {b Parameters}:
    {ul {- keepExisting: [bool Js.t]
    {% <p>True to retain existing selections</p> %}
    }
    {- suppressEvent: [bool Js.t]
    {% <p>Set to false to not fire a select event</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p><code>true</code> if there is a next record, else <code>false</code></p> %}
    }
    }
    *)
  method selectPrevious : bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.meth
  (** {% <p>Selects the record that precedes the currently selected record.</p> %}
    
    {b Parameters}:
    {ul {- keepExisting: [bool Js.t]
    {% <p>True to retain existing selections</p> %}
    }
    {- suppressEvent: [bool Js.t]
    {% <p>Set to false to not fire a select event</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p><code>true</code> if there is a previous record, else <code>false</code></p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  inherit Ext_selection_Model.configs
  
  method enableKeyNav : bool Js.t Js.prop
  (** {% <p>Turns on/off keyboard navigation within the grid.</p> %}
    
    Defaults to: [true]
    *)
  method ignoreRightMouseSelection : bool Js.t Js.prop
  (** {% <p>True to ignore selections that are made when using the right mouse button if there are
records that are already selected. If no records are selected, selection will continue
as normal</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  inherit Ext_selection_Model.events
  
  method beforedeselect : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired before a record is deselected. If any listener returns false, the
deselection is cancelled.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_RowModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The deselected record</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The row index deselected</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeselect : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired before a record is selected. If any listener returns false, the
selection is cancelled.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_RowModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The selected record</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The row index selected</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method deselect : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after a record is deselected</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_RowModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The deselected record</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The row index deselected</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method select : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after a record is selected</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_RowModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The selected record</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The row index selected</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  inherit Ext_selection_Model.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

