(** This class provides an abstract grid editing plugi ...
  
  {% <p>This class provides an abstract grid editing plugin on selected <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">columns</a>.
The editable columns are specified by providing an <a href="#!/api/Ext.grid.column.Column-cfg-editor" rel="Ext.grid.column.Column-cfg-editor" class="docClass">editor</a>
in the <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">column configuration</a>.</p>

<p><strong>Note:</strong> This class should not be used directly. See <a href="#!/api/Ext.grid.plugin.CellEditing" rel="Ext.grid.plugin.CellEditing" class="docClass">Ext.grid.plugin.CellEditing</a> and
<a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">Ext.grid.plugin.RowEditing</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractPlugin.t
  inherit Ext_util_Observable.t
  
  method editing : bool Js.t Js.prop
  (** {% <p>Set to <code>true</code> while the editing plugin is active and an Editor is visible.</p> %}
    *)
  method cancelEdit : unit Js.meth
  (** {% <p>Cancels any active edit that is in progress.</p> %}
    *)
  method completeEdit : unit Js.meth
  (** {% <p>Completes the edit if there is an active edit in progress.</p> %}
    *)
  method init_component : #Ext_Component.t Js.t -> unit Js.meth
  (** {% <p>private</p>

<p>The init method is invoked after initComponent method has been run for the client Component.</p>

<p>The supplied implementation is empty. Subclasses should perform plugin initialization, and set up bidirectional
links between the plugin and its client Component in their own implementation of this method.</p> %}
    
    {b Parameters}:
    {ul {- client: [#Ext_Component.t Js.t]
    {% <p>The client Component which owns this plugin.</p> %}
    }
    }
    *)
  method startEdit : 'a Js.t -> 'b Js.t -> unit Js.meth
  (** {% <p>Starts editing the specified record, using the specified Column definition to define which field is being edited.</p> %}
    
    {b Parameters}:
    {ul {- record: ['a Js.t]
    {% <p>The Store data record which backs the row to be edited, or index of the record in Store.</p> %}
    }
    {- columnHeader: ['a Js.t]
    {% <p>The Column object defining the column to be edited, or index of the column.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractPlugin.configs
  inherit Ext_util_Observable.configs
  
  method clicksToEdit : Js.number Js.t Js.prop
  (** {% <p>The number of clicks on a grid required to display the editor.
The only accepted values are <strong>1</strong> and <strong>2</strong>.</p> %}
    
    Defaults to: [2]
    *)
  method triggerEvent : Js.js_string Js.t Js.prop
  (** {% <p>The event which triggers editing. Supercedes the <a href="#!/api/Ext.grid.plugin.Editing-cfg-clicksToEdit" rel="Ext.grid.plugin.Editing-cfg-clicksToEdit" class="docClass">clicksToEdit</a> configuration. Maybe one of:</p>

<ul>
<li>cellclick</li>
<li>celldblclick</li>
<li>cellfocus</li>
<li>rowfocus</li>
</ul> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractPlugin.events
  inherit Ext_util_Observable.events
  
  method beforeedit : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before editing is triggered. Return false from event handler to stop the editing.</p> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- e: ['a Js.t]
    {% <p>An edit event with the following properties:</p>

<ul>
<li>grid * The grid</li>
<li>record * The record being edited</li>
<li>field * The field name being edited</li>
<li>value * The value for the field being edited.</li>
<li>row * The grid table row</li>
<li>column * The grid <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">Column</a> defining the column that is being edited.</li>
<li>rowIdx * The row index that is being edited</li>
<li>colIdx * The column index that is being edited</li>
<li>cancel * Set this to true to cancel the edit or return false from your handler.</li>
<li>originalValue * Alias for value (only when using <a href="#!/api/Ext.grid.plugin.CellEditing" rel="Ext.grid.plugin.CellEditing" class="docClass">CellEditing</a>).</li>
</ul> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method canceledit : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the user started editing but then cancelled the edit.</p> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- e: ['a Js.t]
    {% <p>An edit event with the following properties:</p>

<ul>
<li>grid * The grid</li>
<li>record * The record that was edited</li>
<li>field * The field name that was edited</li>
<li>value * The value being set</li>
<li>row * The grid table row</li>
<li>column * The grid <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">Column</a> defining the column that was edited.</li>
<li>rowIdx * The row index that was edited</li>
<li>colIdx * The column index that was edited</li>
<li>view * The grid view</li>
<li>store * The grid store</li>
</ul> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method edit : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after a editing. Usage example:</p>

<pre><code>grid.on('edit', function(editor, e) {
    // commit the changes right after editing finished
    e.record.commit();
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- e: ['a Js.t]
    {% <p>An edit event with the following properties:</p>

<ul>
<li>grid * The grid</li>
<li>record * The record that was edited</li>
<li>field * The field name that was edited</li>
<li>value * The value being set</li>
<li>row * The grid table row</li>
<li>column * The grid <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">Column</a> defining the column that was edited.</li>
<li>rowIdx * The row index that was edited</li>
<li>colIdx * The column index that was edited</li>
<li>originalValue * The original value for the field, before the edit (only when using <a href="#!/api/Ext.grid.plugin.CellEditing" rel="Ext.grid.plugin.CellEditing" class="docClass">CellEditing</a>)</li>
<li>originalValues * The original values for the field, before the edit (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>newValues * The new values being set (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>view * The grid view (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>store * The grid store (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
</ul> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method validateedit : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after editing, but before the value is set in the record. Return false from event handler to
cancel the change.</p>

<p>Usage example showing how to remove the red triangle (dirty record indicator) from some records (not all). By
observing the grid's validateedit event, it can be cancelled if the edit occurs on a targeted row (for example)
and then setting the field's new value in the Record directly:</p>

<pre><code>grid.on('validateedit', function(editor, e) {
  var myTargetRow = 6;

  if (e.rowIdx == myTargetRow) {
    e.cancel = true;
    e.record.data[e.field] = e.value;
  }
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- e: ['a Js.t]
    {% <p>An edit event with the following properties:</p>

<ul>
<li>grid * The grid</li>
<li>record * The record being edited</li>
<li>field * The field name being edited</li>
<li>value * The value being set</li>
<li>row * The grid table row</li>
<li>column * The grid <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">Column</a> defining the column that is being edited.</li>
<li>rowIdx * The row index that is being edited</li>
<li>colIdx * The column index that is being edited</li>
<li>cancel * Set this to true to cancel the edit or return false from your handler.</li>
<li>originalValue * The original value for the field, before the edit (only when using <a href="#!/api/Ext.grid.plugin.CellEditing" rel="Ext.grid.plugin.CellEditing" class="docClass">CellEditing</a>)</li>
<li>originalValues * The original values for the field, before the edit (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>newValues * The new values being set (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>view * The grid view (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>store * The grid store (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
</ul> %}
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
  inherit Ext_AbstractPlugin.statics
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

