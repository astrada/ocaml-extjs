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
  inherit Ext_util_Bindable.t
  inherit Ext_util_Observable.t
  
  method bindStore : _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>binds the store to the selModel.</p>

<p>Binds a store to this instance.</p> %}
    
    {b Parameters}:
    {ul {- store: [_ Js.t] (optional)
    {% <p>The store to bind or ID of the store.
When no store given (or when <code>null</code> or <code>undefined</code> passed), unbinds the existing store.</p> %}
    }
    }
    *)
  method deselect : _ Js.t -> bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Deselects a record instance by record instance or index.</p> %}
    
    {b Parameters}:
    {ul {- records: [_ Js.t]
    {% <p>An array of records or an index</p> %}
    }
    {- suppressEvent: [bool Js.t] (optional)
    {% <p>True to not fire a deselect event</p> %}
     Defaults to: false
    }
    }
    *)
  method deselectAll : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Deselects all records in the view.</p> %}
    
    {b Parameters}:
    {ul {- suppressEvent: [bool Js.t] (optional)
    {% <p>True to suppress any deselect events</p> %}
    }
    }
    *)
  method deselectRange : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Deselects a range of rows if the selection model <a href="#!/api/Ext.selection.Model-method-isLocked" rel="Ext.selection.Model-method-isLocked" class="docClass">is not locked</a>.</p> %}
    
    {b Parameters}:
    {ul {- startRow: [_ Js.t]
    {% <p>The record or index of the first row in the range</p> %}
    }
    {- endRow: [_ Js.t]
    {% <p>The record or index of the last row in the range</p> %}
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
  method getLastSelected : Ext_data_Model.t Js.t Js.meth
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
  method getStoreListeners : Ext_data_Store.t Js.t -> _ Js.t Js.meth
  (** {% <p>Gets the listeners to bind to a new store.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The Store which is being bound to for which a listeners object should be returned.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
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
  method isRangeSelected : _ Js.t -> _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the specified row is selected.</p> %}
    
    {b Parameters}:
    {ul {- from: [_ Js.t]
    {% <p>The start of the range to check.</p> %}
    }
    {- to: [_ Js.t] {% <p>The end of the range to check.</p> %}
    }
    }
    *)
  method isSelected : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the specified row is selected.</p> %}
    
    {b Parameters}:
    {ul {- record: [_ Js.t]
    {% <p>The record or index of the record to check</p> %}
    }
    }
    *)
  method select : _ Js.t -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    unit Js.meth
  (** {% <p>Selects a record instance by record instance or index.</p> %}
    
    {b Parameters}:
    {ul {- records: [_ Js.t]
    {% <p>An array of records or an index</p> %}
    }
    {- keepExisting: [bool Js.t] (optional)
    {% <p>True to retain existing selections</p> %}
     Defaults to: false
    }
    {- suppressEvent: [bool Js.t] (optional)
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
  method selectRange : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Selects a range of rows if the selection model <a href="#!/api/Ext.selection.Model-method-isLocked" rel="Ext.selection.Model-method-isLocked" class="docClass">is not locked</a>.
All rows in between startRow and endRow are also selected.</p> %}
    
    {b Parameters}:
    {ul {- startRow: [_ Js.t]
    {% <p>The record or index of the first row in the range</p> %}
    }
    {- endRow: [_ Js.t]
    {% <p>The record or index of the last row in the range</p> %}
    }
    {- keepExisting: [bool Js.t] (optional)
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
  method selected : Ext_util_MixedCollection.t Js.t Js.readonly_prop
  (** {% <p>A MixedCollection that maintains all of the currently selected records.</p> %}
    
    Defaults to: [undefined]
    *)
  
end

class type configs =
object('self)
  inherit Ext_util_Bindable.configs
  inherit Ext_util_Observable.configs
  
  method allowDeselect : bool Js.t Js.prop
  (** {% <p>Allow users to deselect a record in a DataView, List or Grid.
Only applicable when the <a href="#!/api/Ext.selection.Model-cfg-mode" rel="Ext.selection.Model-cfg-mode" class="docClass">mode</a> is 'SINGLE'.</p> %}
    
    Defaults to: [false]
    *)
  method mode : _ Js.t Js.prop
  (** {% <p>Mode of selection.  Valid values are:</p>

<ul>
<li><strong>"SINGLE"</strong> - Only allows selecting one item at a time.  Use <a href="#!/api/Ext.selection.Model-cfg-allowDeselect" rel="Ext.selection.Model-cfg-allowDeselect" class="docClass">allowDeselect</a> to allow
deselecting that item.  This is the default.</li>
<li><strong>"SIMPLE"</strong> - Allows simple selection of multiple items one-by-one. Each click in grid will either
select or deselect an item.</li>
<li><strong>"MULTI"</strong> - Allows complex selection of multiple items using Ctrl and Shift keys.</li>
</ul> %}
    *)
  method pruneRemoved : bool Js.t Js.prop
  (** {% <p>Remove records from the selection when they are removed from the store.</p>

<p><strong>Important:</strong> When using <a href="#!/api/Ext.toolbar.Paging" rel="Ext.toolbar.Paging" class="docClass">paging</a> or a <a href="#!/api/Ext.data.Store-cfg-buffered" rel="Ext.data.Store-cfg-buffered" class="docClass">sparsely populated (buffered) Store</a>,
records which are cached in the Store's <a href="#!/api/Ext.data.Store-property-data" rel="Ext.data.Store-property-data" class="docClass">data collection</a> may be removed from the Store when pages change,
or when rows are scrolled out of view. For this reason <code>pruneRemoved</code> should be set to <code>false</code> when using a buffered Store.</p>

<p>Also, when previously pruned pages are returned to the cache, the records objects in the page will be
<em>new instances</em>, and will not match the instances in the selection model's collection. For this reason,
you MUST ensure that the Model definition's <a href="#!/api/Ext.data.Model-cfg-idProperty" rel="Ext.data.Model-cfg-idProperty" class="docClass">idProperty</a> references a unique
key because in this situation, records in the Store have their <strong>IDs</strong> compared to records in the SelectionModel
in order to re-select a record which is scrolled back into view.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_util_Bindable.events
  inherit Ext_util_Observable.events
  
  method focuschange : (t Js.t -> Ext_data_Model.t Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method selectionchange : (t Js.t -> Ext_data_Model.t Js.js_array Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after a selection change has occurred</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_selection_Model.t Js.t]
    }
    {- selected: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The selected records</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_util_Observable.statics
  inherit Ext_util_Bindable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

