(** Tracks what records are currently selected in a da ...
  
  {% <p>Tracks what records are currently selected in a databound component.</p>

<p>This is an abstract class and is not meant to be directly used. Databound UI widgets such as
<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Grid</a> and <a href="#!/api/Ext.tree.Panel" rel="Ext.tree.Panel" class="docClass">Tree</a> should subclass <a href="#!/api/Ext.selection.Model" rel="Ext.selection.Model" class="docClass">Ext.selection.Model</a>
and provide a way to binding to the component.</p>

<p>The abstract methods <code>onSelectChange</code> and <code>onLastFocusChanged</code> should be implemented in these
subclasses to update the UI widget.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  inherit Ext_util_Bindable.t
  
  method selected : Ext_util_MixedCollection.t Js.t Js.readonly_prop
  (** {% <p>A MixedCollection that maintains all of the currently selected records.</p> %}
    
    Defaults to: [undefined]
    *)
  method bindStore : 'a Js.t Js.optdef -> bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>binds the store to the selModel.</p>

<p>Binds a store to this instance.</p> %}
    
    {b Parameters}:
    {ul {- store: ['a Js.t]
    {% <p>The store to bind or ID of the store.
When no store given (or when <code>null</code> or <code>undefined</code> passed), unbinds the existing store.</p> %}
    }
    {- initial: [bool Js.t]
    {% <p>True to not remove listeners from existing store.</p> %}
     Defaults to: false
    }
    }
    *)
  method deselect : 'a Js.t -> bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Deselects a record instance by record instance or index.</p> %}
    
    {b Parameters}:
    {ul {- records: ['a Js.t]
    {% <p>An array of records or an index</p> %}
    }
    {- suppressEvent: [bool Js.t]
    {% <p>True to not fire a deselect event</p> %}
     Defaults to: false
    }
    }
    *)
  method deselectAll : bool Js.t -> unit Js.meth
  (** {% <p>Deselects all records in the view.</p> %}
    
    {b Parameters}:
    {ul {- suppressEvent: [bool Js.t]
    {% <p>True to suppress any deselect events</p> %}
    }
    }
    *)
  method getCount : Js.number Js.t Js.meth
  (** {% <p>Returns the count of selected records.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The number of selected records</p> %}
    }
    }
    *)
  method getLastSelected : unit Js.meth
  (** {% <p>Returns the last selected record.</p> %}
    *)
  method getSelection : Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>Returns an array of the currently selected records.</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The selected records</p> %}
    }
    }
    *)
  method getSelectionMode : Js.js_string Js.t Js.meth
  (** {% <p>Returns the current selectionMode.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The selectionMode: 'SINGLE', 'MULTI' or 'SIMPLE'.</p> %}
    }
    }
    *)
  method getStoreListeners : 'a Js.t Js.meth
  (** {% <p>Gets the listeners to bind to a new store.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The listeners to be bound to the store in object literal form. The scope
may be omitted, it is assumed to be the current instance.</p> %}
    }
    }
    *)
  method hasSelection : bool Js.t Js.meth
  (** {% <p>Returns true if there are any a selected records.</p> %}
    *)
  method isFocused : Ext_data_Model.t Js.t -> unit Js.meth
  (** {% <p>Determines if this record is currently focused.</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    }
    }
    *)
  method isLocked : bool Js.t Js.meth
  (** {% <p>Returns true if the selections are locked.</p> %}
    *)
  method isSelected : 'a Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the specified row is selected.</p> %}
    
    {b Parameters}:
    {ul {- record: ['a Js.t]
    {% <p>The record or index of the record to check</p> %}
    }
    }
    *)
  method select : 'a Js.t -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    unit Js.meth
  (** {% <p>Selects a record instance by record instance or index.</p> %}
    
    {b Parameters}:
    {ul {- records: ['a Js.t]
    {% <p>An array of records or an index</p> %}
    }
    {- keepExisting: [bool Js.t]
    {% <p>True to retain existing selections</p> %}
     Defaults to: false
    }
    {- suppressEvent: [bool Js.t]
    {% <p>True to not fire a select event</p> %}
     Defaults to: false
    }
    }
    *)
  method selectAll : bool Js.t -> unit Js.meth
  (** {% <p>Selects all records in the view.</p> %}
    
    {b Parameters}:
    {ul {- suppressEvent: [bool Js.t]
    {% <p>True to suppress any select events</p> %}
    }
    }
    *)
  method selectRange : 'a Js.t -> 'b Js.t -> bool Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Selects a range of rows if the selection model <a href="#!/api/Ext.selection.Model-method-isLocked" rel="Ext.selection.Model-method-isLocked" class="docClass">is not locked</a>.
All rows in between startRow and endRow are also selected.</p> %}
    
    {b Parameters}:
    {ul {- startRow: ['a Js.t]
    {% <p>The record or index of the first row in the range</p> %}
    }
    {- endRow: ['a Js.t]
    {% <p>The record or index of the last row in the range</p> %}
    }
    {- keepExisting: [bool Js.t]
    {% <p>True to retain existing selections</p> %}
    }
    }
    *)
  method setLastFocused : Ext_data_Model.t Js.t -> unit Js.meth
  (** {% <p>Sets a record as the last focused record. This does NOT mean
that the record has been selected.</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    }
    }
    *)
  method setLocked : bool Js.t -> unit Js.meth
  (** {% <p>Locks the current selection and disables any changes from happening to the selection.</p> %}
    
    {b Parameters}:
    {ul {- locked: [bool Js.t]
    {% <p>True to lock, false to unlock.</p> %}
    }
    }
    *)
  method setSelectionMode : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Sets the current selectionMode.</p> %}
    
    {b Parameters}:
    {ul {- selMode: [Js.js_string Js.t]
    {% <p>'SINGLE', 'MULTI' or 'SIMPLE'.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  inherit Ext_util_Bindable.configs
  
  method allowDeselect : bool Js.t Js.prop
  (** {% <p>Allow users to deselect a record in a DataView, List or Grid.
Only applicable when the <a href="#!/api/Ext.selection.Model-cfg-mode" rel="Ext.selection.Model-cfg-mode" class="docClass">mode</a> is 'SINGLE'.</p> %}
    
    Defaults to: [false]
    *)
  method mode : Js.js_string Js.t Js.prop
  (** {% <p>Mode of selection.  Valid values are:</p>

<ul>
<li><strong>SINGLE</strong> - Only allows selecting one item at a time.  Use <a href="#!/api/Ext.selection.Model-cfg-allowDeselect" rel="Ext.selection.Model-cfg-allowDeselect" class="docClass">allowDeselect</a> to allow
deselecting that item.  This is the default.</li>
<li><strong>SIMPLE</strong> - Allows simple selection of multiple items one-by-one. Each click in grid will either
select or deselect an item.</li>
<li><strong>MULTI</strong> - Allows complex selection of multiple items using Ctrl and Shift keys.</li>
</ul> %}
    *)
  method pruneRemoved : bool Js.t Js.prop
  (** {% <p>Prune records when they are removed from the store from the selection.
This is a private flag. For an example of its usage, take a look at
<a href="#!/api/Ext.selection.TreeModel" rel="Ext.selection.TreeModel" class="docClass">Ext.selection.TreeModel</a>.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  inherit Ext_util_Bindable.events
  
  method focuschange : (t Js.t -> Ext_data_Model.t Js.t ->
    Ext_data_Model.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired when a row is focused</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_selection_Model.t Js.t]
    }
    {- oldFocused: [Ext_data_Model.t Js.t]
    {% <p>The previously focused record</p> %}
    }
    {- newFocused: [Ext_data_Model.t Js.t]
    {% <p>The newly focused record</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method selectionchange : (t Js.t -> Ext_data_Model.t Js.js_array Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after a selection change has occurred</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_selection_Model.t Js.t]
    }
    {- selected: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The selected records</p> %}
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
  inherit Ext_util_Bindable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

